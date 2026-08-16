#!/usr/bin/env node
/**
 * Tests for the submission API. Run: node tools/submission-api/test-server.mjs
 *
 * The load-bearing test here is the round trip: what this service writes into an issue must
 * parse with the same function that reads a hand-filed one. If those drift, submissions from
 * the site silently stop being ingestible while GitHub-filed ones keep working, and the queue
 * fills with issues nobody can materialise.
 *
 * Nothing here talks to GitHub. Issue creation is exercised against a local server.
 */

import { createServer } from 'node:http';
import { validateSubmission, renderIssueBody, allowedOrigin, handler, CATEGORIES, MIN_PROBLEM } from './server.mjs';
import { parseIssueForm, validate as validateParsed, FIELDS } from '../plans-pipeline/intake.mjs';

let pass = 0;
const fails = [];
const ok = (name, cond, got) => {
  if (cond) { pass++; console.log(`  ✅ ${name}`); }
  else { fails.push(name); console.log(`  ❌ ${name}${got !== undefined ? `  got: ${JSON.stringify(got)}` : ''}`); }
};

const PROBLEM = 'A translation agency in Porto works with about 40 freelancers and cannot check '
  + 'the word counts they invoice against what was actually delivered, so it spot-checks by hand '
  + 'in Trados for an afternoon a week and still misses most of it.';

const good = () => ({
  title: 'Small agencies cannot verify freelancer word counts',
  problem: PROBLEM,
  category: 'saas',
  country: 'Portugal',
  wtp: '',
  source: '',
  solution: 'A checker that diffs the delivery against the supplied memory.',
  submittedBy: 'someone',
  consent: true,
});

console.log('\n[test] submission api\n');

// ---------- validation ----------
{
  ok('a good submission validates', validateSubmission(good()).length === 0, validateSubmission(good()));
  ok('rejects a short problem',
    validateSubmission({ ...good(), problem: 'nope' }).some((e) => e.includes(String(MIN_PROBLEM))));
  ok('rejects a short title', validateSubmission({ ...good(), title: 'hi' }).some((e) => e.includes('title')));
  ok('rejects an unknown category',
    validateSubmission({ ...good(), category: 'crypto' }).some((e) => e.includes('category')));
  ok('rejects missing consent', validateSubmission({ ...good(), consent: false }).some((e) => e.includes('consent')));
  ok('rejects consent that is merely truthy',
    validateSubmission({ ...good(), consent: 'yes' }).some((e) => e.includes('consent')),
    validateSubmission({ ...good(), consent: 'yes' }));
  ok('rejects a non-URL source', validateSubmission({ ...good(), source: 'ha' }).some((e) => e.includes('source')));
  ok('accepts an empty source', validateSubmission({ ...good(), source: '' }).length === 0);
  ok('rejects an oversized field',
    validateSubmission({ ...good(), submittedBy: 'x'.repeat(200) }).some((e) => e.includes('submittedBy')));
  ok('survives a body with no fields at all', validateSubmission({}).length > 0);
  ok('survives non-string fields', validateSubmission({ title: 42, problem: null, consent: true }).length > 0);

  // The gate's floor and the API's floor are the same number because both read the schema.
  ok('the floor comes from the schema', MIN_PROBLEM === 120, MIN_PROBLEM);
  ok('every offered category is a plain slug', CATEGORIES.every((c) => /^[a-z][a-z-]*$/.test(c)));
}

// ---------- the round trip, which is the point ----------
{
  const b = renderIssueBody(good());
  const raw = parseIssueForm(b);
  const fields = Object.fromEntries(Object.entries(FIELDS).map(([label, key]) => [key, raw[label] ?? '']));

  ok('intake parses every field this service writes',
    Object.entries(FIELDS).every(([label]) => label in raw),
    Object.keys(raw));
  ok('the problem survives the round trip', fields.problem === PROBLEM);
  ok('the category survives', fields.category === 'saas');
  ok('intake accepts what this service produces', validateParsed(fields).length === 0, validateParsed(fields));

  // Absent optional fields must render as the literal GitHub uses, or intake would store the
  // placeholder as content.
  const sparse = renderIssueBody({ ...good(), country: '', solution: '', submittedBy: '' });
  const sparseFields = Object.fromEntries(
    Object.entries(FIELDS).map(([label, key]) => [key, parseIssueForm(sparse)[label] ?? '']),
  );
  ok('empty optional fields round-trip to empty', sparseFields.country === '' && sparseFields.submittedBy === '');
  ok('a sparse submission still satisfies intake', validateParsed(sparseFields).length === 0, validateParsed(sparseFields));

  ok('consent renders as two ticked boxes',
    (renderIssueBody(good()).match(/^- \[X\]/gm) || []).length === 2);
}

// ---------- origin handling ----------
{
  ok('allows a listed origin', allowedOrigin('https://plans.example', ['https://plans.example']) === 'https://plans.example');
  ok('refuses an unlisted origin', allowedOrigin('https://evil.example', ['https://plans.example']) === null);
  ok('refuses a missing origin', allowedOrigin(undefined, ['https://plans.example']) === null);
}

// ---------- the running server ----------
{
  const srv = createServer(handler);
  await new Promise((r) => srv.listen(0, r));
  const base = `http://127.0.0.1:${srv.address().port}`;
  const post = (body, headers = {}) => fetch(`${base}/submit`, {
    method: 'POST', headers: { 'content-type': 'application/json', ...headers }, body: JSON.stringify(body),
  });

  const health = await fetch(`${base}/health`).then((r) => r.json());
  ok('health reports configuration, not just liveness', health.configured === false, health);

  const bad = await post({ title: 'x' });
  ok('an invalid submission is a 400', bad.status === 400, bad.status);
  ok('and says what was wrong', (await bad.json()).errors.length > 0);

  // No token in this environment, so a valid submission must fail loudly rather than pretend.
  const valid = await post(good());
  ok('a valid submission on an unconfigured server is 503, never 200', valid.status === 503, valid.status);

  const notFound = await fetch(`${base}/nope`);
  ok('unknown routes are 404', notFound.status === 404);

  const huge = await post({ ...good(), problem: 'x'.repeat(64 * 1024) });
  ok('an oversized body is refused', huge.status === 413, huge.status);

  await new Promise((r) => srv.close(r));
}

console.log(`\n[test] ${pass} pass, ${fails.length} fail`);
if (fails.length) {
  for (const f of fails) console.log(`  - ${f}`);
  process.exit(1);
}
console.log('[test] OK\n');
