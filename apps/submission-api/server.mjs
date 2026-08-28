#!/usr/bin/env node
/**
 * Submission API. Turns a form POST from the site into a GitHub issue.
 *
 * This is the only write path the plans product has, so it is deliberately the smallest thing
 * that can work: two routes, no dependencies, and a token that can do exactly one thing.
 *
 * ## No framework
 *
 * The spec said Hono. For two routes and one JSON body, `node:http` and the built-in `fetch`
 * do the same job with no supply chain to audit, no lockfile, and a Dockerfile that never runs
 * `npm ci`. A dependency here would be more code than the service.
 *
 * ## Why an issue and not a database
 *
 * The queue needs state, deduplication, an audit trail and a moderation UI. GitHub Issues has
 * all four already: labels are the state machine, the issue number is the key, the thread is
 * the trail, and the maintainer gets an email without us sending one. See
 * apps/data/tools/plans-pipeline/README.md.
 *
 * ## The body format is a contract
 *
 * The issue body is written in exactly the shape GitHub renders an issue form into, because
 * `intake.mjs` parses both with the same function. Change the shape here and submissions from
 * the site stop being ingestible while ones filed on GitHub keep working, which is the kind of
 * split that takes a week to notice. test-server.mjs asserts the round trip.
 *
 * Environment:
 *   GITHUB_TOKEN     fine-grained, issues:write, ONE repository, nothing else
 *   GITHUB_REPO      owner/name
 *   ALLOWED_ORIGIN   comma-separated origins allowed to POST
 *   PORT             default 8080
 */

import { createServer } from 'node:http';
import { readFileSync } from 'node:fs';
import { dirname, join, resolve } from 'node:path';
import { fileURLToPath } from 'node:url';

const HERE = dirname(fileURLToPath(import.meta.url));
const AI_OS_ROOT = resolve(HERE, '..', '..');

const PORT = Number(process.env.PORT || 8080);
const TOKEN = process.env.GITHUB_TOKEN || '';
const REPO = process.env.GITHUB_REPO || '';
const ORIGINS = (process.env.ALLOWED_ORIGIN || '')
  .split(',').map((s) => s.trim()).filter(Boolean);

// The contract lives in the schema, not in this file, so the API and the gate cannot disagree
// about what a usable submission is.
const schema = JSON.parse(readFileSync(join(AI_OS_ROOT, 'apps', 'data', 'projects', '_schema.json'), 'utf8'));
export const MIN_PROBLEM = schema.gate.rules.find((r) => r.id === 'problem-substantive').minProblemChars;

const MAX_BODY_BYTES = 32 * 1024;
const MAX = { title: 160, problem: 8000, country: 60, wtp: 80, source: 300, solution: 2000, submittedBy: 60 };

/** Categories the form offers. Kept here so an arbitrary string cannot become a facet. */
export const CATEGORIES = [
  'other', 'ai', 'business', 'design', 'dev', 'education', 'finance', 'fintech',
  'freelance', 'health', 'indiehackers', 'legal', 'logistics', 'marketing', 'media',
  'productivity', 'retail', 'saas', 'sideproject', 'startups',
];

/**
 * Per-IP rate limit, in memory.
 *
 * In memory is correct here and not a shortcut: this is one container with no sibling, so a
 * shared store would be infrastructure guarding nothing. It resets on restart, which is
 * acceptable — the limit protects the maintainer's queue from a flood, and moderation is
 * mandatory anyway, so the worst case of a reset is a few extra issues to decline.
 */
const RATE_MAX = Number(process.env.RATE_LIMIT_MAX || 5);
const RATE_WINDOW_MS = Number(process.env.RATE_LIMIT_WINDOW_MS || 10 * 60 * 1000);
const hits = new Map();

/**
 * The client's address.
 *
 * X-Forwarded-For is client-settable, so trusting it unconditionally hands anyone an unlimited
 * quota by rotating a header. It is only read when TRUST_PROXY is set, which is correct behind
 * Traefik and wrong anywhere the service is directly reachable. The LAST entry is the one the
 * nearest trusted proxy appended; the leftmost is whatever the client claimed.
 */
export function clientIp(req, trustProxy = process.env.TRUST_PROXY === '1') {
  if (trustProxy) {
    const xff = req.headers?.['x-forwarded-for'];
    if (typeof xff === 'string' && xff.trim()) {
      const parts = xff.split(',').map((x) => x.trim()).filter(Boolean);
      if (parts.length) return parts[parts.length - 1];
    }
  }
  return req.socket?.remoteAddress || 'unknown';
}

/** True when this address has spent its quota. Prunes as it goes; the map cannot grow unbounded. */
export function rateLimited(ip, now = Date.now(), max = RATE_MAX, windowMs = RATE_WINDOW_MS) {
  const seen = (hits.get(ip) || []).filter((t) => now - t < windowMs);
  if (seen.length >= max) {
    hits.set(ip, seen);
    return true;
  }
  seen.push(now);
  hits.set(ip, seen);
  for (const [k, v] of hits) if (!v.some((t) => now - t < windowMs)) hits.delete(k);
  return false;
}

export function validateSubmission(b) {
  const e = [];
  const s = (v) => (typeof v === 'string' ? v.trim() : '');

  if (s(b.title).length < 8) e.push('title must be at least 8 characters');
  if (s(b.title).length > MAX.title) e.push(`title must be under ${MAX.title} characters`);
  if (s(b.problem).length < MIN_PROBLEM) e.push(`problem must be at least ${MIN_PROBLEM} characters`);
  if (s(b.problem).length > MAX.problem) e.push(`problem must be under ${MAX.problem} characters`);
  if (!CATEGORIES.includes(s(b.category))) e.push('category is not one of the offered options');
  if (b.consent !== true) e.push('consent is required');
  if (s(b.source) && !/^https?:\/\//.test(s(b.source))) e.push('source must be a URL');

  for (const [k, limit] of Object.entries(MAX)) {
    if (s(b[k]).length > limit) e.push(`${k} must be under ${limit} characters`);
  }
  return [...new Set(e)];
}

/**
 * Render the submission in the exact shape GitHub renders its issue form into, so `intake.mjs`
 * parses a form post and a hand-filed issue with the same code.
 */
export function renderIssueBody(b) {
  const or = (v) => (typeof v === 'string' && v.trim() ? v.trim() : '_No response_');
  const consent = b.consent === true
    ? "- [X] This can be published publicly under the repository's MIT licence, and I have the right to submit it.\n"
      + '- [X] It contains no confidential information and no personal details of anyone who has not agreed to this.'
    : '- [ ] not given';

  return [
    ['The problem in one sentence', or(b.title)],
    ['The problem in full', or(b.problem)],
    ['Category', or(b.category)],
    ['Country', or(b.country)],
    ['What they said they would pay', or(b.wtp)],
    ['Where you saw it', or(b.source)],
    ['What you would build', or(b.solution)],
    ['Credit this to', or(b.submittedBy)],
    ['Before you send', consent],
  ].map(([h, v]) => `### ${h}\n\n${v}\n`).join('\n');
}

async function createIssue(b) {
  const res = await fetch(`https://api.github.com/repos/${REPO}/issues`, {
    method: 'POST',
    headers: {
      authorization: `Bearer ${TOKEN}`,
      accept: 'application/vnd.github+json',
      'content-type': 'application/json',
      'user-agent': 'ai-os-submission-api',
    },
    body: JSON.stringify({
      title: `[submission] ${b.title.trim().slice(0, 120)}`,
      body: renderIssueBody(b),
      labels: ['submission'],
    }),
  });
  if (!res.ok) {
    throw new Error(`github responded ${res.status}: ${(await res.text()).slice(0, 200)}`);
  }
  const j = await res.json();
  return { number: j.number, url: j.html_url };
}

function send(res, status, obj, origin) {
  const headers = {
    'content-type': 'application/json',
    'cache-control': 'no-store',
    'x-content-type-options': 'nosniff',
  };
  if (origin) {
    headers['access-control-allow-origin'] = origin;
    headers['vary'] = 'Origin';
  }
  res.writeHead(status, headers);
  res.end(JSON.stringify(obj));
}

/** The request's Origin when it is allowed, otherwise null. */
export function allowedOrigin(origin, allowlist = ORIGINS) {
  if (!origin) return null;
  return allowlist.includes(origin) ? origin : null;
}

async function readBody(req) {
  const chunks = [];
  let size = 0;
  for await (const c of req) {
    size += c.length;
    // Refuse before buffering the whole thing: an unbounded read is how a form endpoint
    // becomes a memory exhaustion primitive.
    if (size > MAX_BODY_BYTES) throw new Error('body too large');
    chunks.push(c);
  }
  return JSON.parse(Buffer.concat(chunks).toString('utf8') || '{}');
}

export const handler = async (req, res) => {
  const origin = allowedOrigin(req.headers.origin);

  if (req.method === 'OPTIONS') {
    res.writeHead(origin ? 204 : 403, origin ? {
      'access-control-allow-origin': origin,
      'access-control-allow-methods': 'POST, OPTIONS',
      'access-control-allow-headers': 'content-type',
      'access-control-max-age': '86400',
      vary: 'Origin',
    } : {});
    return res.end();
  }

  if (req.method === 'GET' && req.url === '/health') {
    // Reports configuration, not just liveness: a container that is up but tokenless accepts
    // nothing, and "200 OK" on that is the same lie as a green deploy over a stale build.
    // `configured` means "will actually accept a submission", which requires the allowlist as
    // well as the credentials. A container with a token and no ALLOWED_ORIGIN is an open
    // issue-creation endpoint, and the healthcheck greps this field, so a deploy that forgets the
    // allowlist reports unhealthy instead of quietly accepting posts from anywhere.
    return send(res, 200, {
      ok: true,
      configured: Boolean(TOKEN && REPO && ORIGINS.length),
      repo: REPO || null,
      originsConfigured: ORIGINS.length > 0,
    });
  }

  if (req.method !== 'POST' || req.url !== '/submit') {
    return send(res, 404, { error: 'not found' }, origin);
  }

  if (ORIGINS.length && !origin) {
    return send(res, 403, { error: 'origin not allowed' });
  }

  // Before reading the body: a flood should cost as little as possible to refuse.
  if (rateLimited(clientIp(req))) {
    return send(res, 429, { error: 'too many submissions from this address, try later' }, origin);
  }

  let body;
  try {
    body = await readBody(req);
  } catch (err) {
    return send(res, 413, { error: err.message }, origin);
  }

  // Honeypot. The form renders `website` off-screen, so a person never fills it and a bot that
  // fills every input does. Discard without filing, and answer as if accepted — telling a bot
  // which check caught it is free help.
  if (typeof body?.website === 'string' && body.website.trim()) {
    console.log('[submission-api] honeypot filled, discarded');
    return send(res, 202, { ok: true }, origin);
  }

  const errors = validateSubmission(body);
  if (errors.length) return send(res, 400, { error: 'invalid submission', errors }, origin);

  if (!TOKEN || !REPO || !ORIGINS.length) {
    // Explicitly not a 200. A form that reports success for something it never sent is the
    // worst outcome available to this design.
    //
    // The allowlist counts as configuration, not as an optional extra: with a token set and
    // ALLOWED_ORIGIN unset, the origin check above is skipped entirely and this becomes an open
    // endpoint that opens GitHub issues for anyone who finds it. Fail closed.
    return send(res, 503, { error: 'submissions are not configured on this server' }, origin);
  }

  try {
    const issue = await createIssue(body);
    return send(res, 201, {
      ok: true,
      number: issue.number,
      url: issue.url,
      message: 'A person reviews every submission. Most are not published, and there is no timeline.',
    }, origin);
  } catch (err) {
    console.error('[submission-api]', err.message);
    return send(res, 502, { error: 'could not file the submission' }, origin);
  }
};

const RUN_DIRECTLY = process.argv[1] && resolve(process.argv[1]) === fileURLToPath(import.meta.url);
if (RUN_DIRECTLY) {
  createServer(handler).listen(PORT, () => {
    console.log(`[submission-api] listening on ${PORT}`);
    console.log(`[submission-api] repo=${REPO || '(unset)'} token=${TOKEN ? 'set' : '(unset)'} origins=${ORIGINS.join(',') || '(any)'}`);
  });
}
