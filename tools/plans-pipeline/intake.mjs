#!/usr/bin/env node
/**
 * Materialise approved community submissions into the corpus.
 *
 * Reads issues labelled `approved` and not yet `ingested`, writes each one as a plan
 * directory in the shape the scraper produces, then comments the assigned id on the issue and
 * relabels it. From that point the plan is a `draft` capture like any other and the rest of
 * the pipeline cannot tell where it came from, which is the entire design.
 *
 * ## This script is the write side of the trust boundary
 *
 * A submission is text written by a stranger. Classification may involve a model; turning it
 * into files must not. Everything below is mechanical: fields come from the issue form's
 * headings, the id comes from the shared allocator, the slug is derived, and every section
 * that needs prose gets the same "not written yet" marker the scraper writes. No value from
 * the issue ever becomes a path, an id, a status, or a command.
 *
 * Usage:
 *   node intake.mjs [--dry-run] [--limit N] [--repo owner/name]
 */

import { mkdirSync, writeFileSync, existsSync } from 'node:fs';
import { join, dirname, resolve } from 'node:path';
import { fileURLToPath } from 'node:url';
import { execFileSync } from 'node:child_process';
import { createRequire } from 'node:module';

import { loadSchema, stringifyFrontmatter } from '../plan-format/lib/plan.mjs';

const require = createRequire(import.meta.url);
const { allocatePlanIds, saveHighWater } = require('../lib/plan-ids.cjs');
const { generateDesignMD } = require('../problemhunt-scraper/design-dna.js');

const HERE = dirname(fileURLToPath(import.meta.url));
const AI_OS_ROOT = resolve(HERE, '..', '..');
const PROJECTS_DIR = join(AI_OS_ROOT, 'apps', 'data', 'projects');
const STATE_FILE = join(AI_OS_ROOT, 'tools', 'problemhunt-scraper', 'state.json');

const argv = process.argv.slice(2);
const has = (f) => argv.includes(f);
const val = (f, d) => { const i = argv.indexOf(f); return i === -1 ? d : argv[i + 1]; };

const DRY_RUN = has('--dry-run');
const LIMIT = parseInt(val('--limit', '25'), 10);
const REPO = val('--repo', null);

const schema = loadSchema();
const MIN_PROBLEM = schema.gate.rules.find((r) => r.id === 'problem-substantive').minProblemChars;
const MARKER = schema.gate.rules.find((r) => r.id === 'sections-written').marker;
const UNWRITTEN = `${MARKER} yet — \`ai-os plans enrich\` fills this section._`;

const log = (m) => console.log(`[intake] ${m}`);

function gh(args, { json = false } = {}) {
  const full = REPO ? [...args, '--repo', REPO] : args;
  const out = execFileSync('gh', full, { encoding: 'utf8', maxBuffer: 32 * 1024 * 1024 });
  return json ? JSON.parse(out) : out;
}

/**
 * Split a GitHub issue-form body into `{ heading: value }`.
 *
 * Issue forms render as `### Label` followed by the value, and unfilled optional fields render
 * the literal `_No response_`, which is treated as absent rather than as content.
 */
export function parseIssueForm(body) {
  const out = {};
  const parts = String(body ?? '').split(/^### +/m).slice(1);
  for (const part of parts) {
    const nl = part.indexOf('\n');
    const heading = (nl === -1 ? part : part.slice(0, nl)).trim();
    const value = (nl === -1 ? '' : part.slice(nl + 1)).trim();
    out[heading] = value === '_No response_' ? '' : value;
  }
  return out;
}

/** Field label in the template -> the name this script uses. Labels are the contract. */
export const FIELDS = {
  'The problem in one sentence': 'title',
  'The problem in full': 'problem',
  Category: 'category',
  Country: 'country',
  'What they said they would pay': 'wtp',
  'Where you saw it': 'source',
  'What you would build': 'solution',
  'Credit this to': 'submittedBy',
  'Before you send': 'consent',
};

export function slugify(s) {
  return String(s).toLowerCase()
    .normalize('NFD').replace(/[̀-ͯ]/g, '')
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/^-+|-+$/g, '')
    .slice(0, 54)
    .replace(/-+$/g, '');
}

/**
 * Everything that must be true before a submission becomes a directory.
 *
 * An approved issue can still fail here: approval is a human saying "publish this", not a
 * check that the form was filled correctly. Failures are reported and skipped rather than
 * declined, because declining is also a human's call.
 */
export function validate(f) {
  const problems = [];
  if (!f.title || f.title.length < 8) problems.push('title is missing or shorter than 8 characters');
  if (!f.problem || f.problem.length < MIN_PROBLEM) {
    problems.push(`problem is ${f.problem?.length ?? 0} chars, the gate needs ${MIN_PROBLEM}`);
  }
  if (!f.category) problems.push('category is missing');
  // Both consent boxes are required by the form, so an unticked one means the body was
  // hand-edited or the template changed. Either way it is not consent.
  const ticked = (f.consent.match(/^- \[[xX]\]/gm) || []).length;
  if (ticked < 2) problems.push(`only ${ticked} of 2 consent boxes ticked`);
  if (f.source && !/^https?:\/\//.test(f.source)) problems.push('source is not a URL');
  return problems;
}

export function buildDocs({ id, slug, title, fields, today }) {
  const fm = stringifyFrontmatter({
    id,
    slug,
    title,
    status: 'draft',
    source: {
      name: 'web',
      // Only carried when the submitter actually pointed at something. The schema makes url
      // optional for `web` precisely so this can be absent instead of invented.
      ...(fields.source ? { url: fields.source } : {}),
      ...(fields.submittedBy ? { submittedBy: fields.submittedBy.slice(0, 60) } : {}),
      consent: true,
      captured: today,
    },
    category: fields.category,
    date: today,
    ...(fields.country ? { country: fields.country } : {}),
  }, schema);

  const head = `${fm}# ${title}\n\n`;
  const section = (h) => `## ${h}\n\n${UNWRITTEN}\n\n`;

  // The Objective is the one section a submission can legitimately seed, because the form
  // asked for it. Everything else waits for the authoring agent.
  const objective = fields.solution
    ? `## Objective\n\n${fields.solution}\n\n`
    : section('Objective');

  const spec = `${head}## Problem\n\n${fields.problem}\n\n---\n\n${objective}${section('Target Users')}${section('MVP Scope')}## Design Direction\n\nSee \`DESIGN.md\` for this project's design tokens.\n\n${section('Constraints')}`;

  const product = head
    + section('Value Proposition') + section('Target Users')
    + section('Jobs To Be Done') + section('Success Metrics');

  const plan = head
    + section('Tech Stack') + section('Architecture')
    + section('Milestones') + section('Risks');

  const tasks = head
    + section('Phase 0: Scaffold') + section('Phase 1: Core') + section('Phase 2: Deploy');

  // Reuses the scraper's own generator rather than reimplementing it, so a submission's
  // DESIGN.md is byte-for-byte the kind of file the rest of the corpus already has.
  const design = generateDesignMD(`${id}-${slug}`, {
    title,
    rawTitle: title,
    description: fields.problem.slice(0, 300),
    tags: [],
    category: fields.category,
    url: fields.source || '',
  });

  return { 'SPEC.md': spec, 'PRODUCT.md': product, 'PLAN.md': plan, 'TASKS.md': tasks, 'DESIGN.md': design };
}

// ---------- main ----------
// Guarded so the pure functions above can be imported by the test suite without this
// file reaching for `gh` on import.
const RUN_DIRECTLY = process.argv[1]
  && resolve(process.argv[1]) === fileURLToPath(import.meta.url);
if (!RUN_DIRECTLY) { /* imported for tests */ } else {

let issues;
try {
  issues = gh(['issue', 'list', '--label', 'approved', '--state', 'open',
    '--limit', String(LIMIT), '--json', 'number,title,body,labels'], { json: true });
} catch (err) {
  console.error(`[intake] could not list issues: ${err.message}`);
  process.exit(1);
}

const pending = issues.filter((i) => !i.labels.some((l) => l.name === 'ingested'));

if (pending.length === 0) {
  log(`nothing to ingest (${issues.length} approved, all already ingested)`);
  process.exit(0);
}

log(`${pending.length} approved submission${pending.length === 1 ? '' : 's'} to ingest`);

const today = new Date().toISOString().slice(0, 10);
let written = 0;
const skipped = [];

for (const issue of pending) {
  const raw = parseIssueForm(issue.body);
  const fields = Object.fromEntries(
    Object.entries(FIELDS).map(([label, key]) => [key, raw[label] ?? '']),
  );

  const problems = validate(fields);
  if (problems.length) {
    skipped.push({ number: issue.number, problems });
    log(`#${issue.number} SKIPPED: ${problems.join('; ')}`);
    if (!DRY_RUN) {
      gh(['issue', 'comment', String(issue.number), '--body',
        `Intake could not materialise this submission:\n\n${problems.map((p) => `- ${p}`).join('\n')}\n\nIt stays approved and will be retried on the next run once the body is corrected.`]);
    }
    continue;
  }

  const slug = slugify(fields.title);
  const { ids, nextNumber } = allocatePlanIds(PROJECTS_DIR, 1, STATE_FILE);
  const id = ids[0];
  const dir = join(PROJECTS_DIR, `${id}-${slug}`);

  if (existsSync(dir)) {
    skipped.push({ number: issue.number, problems: [`${id}-${slug} already exists`] });
    log(`#${issue.number} SKIPPED: ${id}-${slug} already exists`);
    continue;
  }

  const docs = buildDocs({ id, slug, title: fields.title, fields, today });

  if (DRY_RUN) {
    log(`#${issue.number} would become ${id}-${slug} (${Object.keys(docs).length} documents, problem ${fields.problem.length} chars)`);
    continue;
  }

  mkdirSync(dir, { recursive: true });
  for (const [name, text] of Object.entries(docs)) writeFileSync(join(dir, name), text);
  // Persist the high-water mark only after the directory exists. A crash between the two
  // loses an id, which costs nothing; the reverse order would reuse one, which repoints a
  // published URL at a different plan.
  saveHighWater(STATE_FILE, nextNumber);

  gh(['issue', 'comment', String(issue.number), '--body',
    `Ingested as \`${id}-${slug}\`.\n\nIt is now a \`draft\` capture in the corpus. An agent writes the plan on the next pipeline run, the gate decides whether it is fit to publish, and it appears on the site only if it passes. That usually takes a day or two.`]);
  gh(['issue', 'edit', String(issue.number), '--add-label', 'ingested']);

  log(`#${issue.number} → ${id}-${slug}`);
  written++;
}

log(`${written} ingested, ${skipped.length} skipped`);
if (skipped.length) {
  // Loud on purpose: an approved submission that never becomes a plan is invisible otherwise,
  // and a queue that silently stops draining looks identical to an empty one.
  console.log(`[intake] WARNING: ${skipped.length} approved submission(s) could not be ingested and are still waiting`);
}
process.exit(0);

}
