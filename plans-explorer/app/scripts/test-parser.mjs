#!/usr/bin/env node
/**
 * Fixture-based regression tests for the indexer.
 *
 * Run via `npm run test:parser`.
 *
 * Exits 0 on pass, 1 on fail. Prints a small report.
 */

import { execSync } from 'node:child_process';
import { readFileSync, readdirSync, existsSync } from 'node:fs';
import { dirname, resolve, join } from 'node:path';
import { fileURLToPath } from 'node:url';

const __dirname = dirname(fileURLToPath(import.meta.url));
const ROOT = resolve(__dirname, '..', '..');
const APP = resolve(ROOT, 'app');
const DATA = join(APP, 'public', 'data');

// ---------- Run the indexer ----------

console.log('[test] running indexer...');
execSync('node scripts/build-index.mjs', { cwd: APP, stdio: 'inherit' });

const plans = JSON.parse(readFileSync(join(DATA, 'plans.json'), 'utf8'));
const rankings = JSON.parse(readFileSync(join(DATA, 'rankings.json'), 'utf8'));

const planById = (id) => plans.find((p) => p.id === id);

// ---------- Fixtures ----------
// Each fixture declares a list of CHECKS. Each check has:
//   - kind: the assertion type (eq, includes, startsWith, ...)
//   - path: dotted path into the plan object (e.g. 'wtp.raw', 'sourceUrl')
//   - want: expected value (literal, not computed)

const fixtures = [
  // Rewritten 2026-08-13. The previous fixtures asserted against plans 001/016/236/419/441
  // from the 552-plan corpus; the corpus reset to 10 plans deleted four of them, so the
  // suite had been failing 5/5 on every run and was no longer guarding anything.
  //
  // Expectations come from each plan's frontmatter — the source of truth the indexer is
  // supposed to read. That is not tautological: reading it at all is exactly the plumbing
  // that silently broke when the corpus was migrated, taking category, date, sourceUrl,
  // country and wtp to 0/10 while the build stayed green.
  {
    id: '001',
    checks: [
      { kind: 'eq', path: 'status', want: 'enriched' },
      { kind: 'eq', path: 'country', want: 'Serbia' },
      { kind: 'eq', path: 'date', want: '2026-07-17' },
      { kind: 'eq', path: 'wtp.mrrMid', want: 200 },
      { kind: 'includes', path: 'tags', want: 'Immigration' },
      { kind: 'includes', path: 'tech', want: 'Next.js' },
      { kind: 'startsWith', path: 'sourceUrl', want: 'https://problemhunt.pro/en/' },
    ],
  },
  {
    id: '002',
    checks: [
      { kind: 'eq', path: 'category', want: 'ai' },
      { kind: 'eq', path: 'country', want: 'USA' },
      { kind: 'eq', path: 'wtp.period', want: 'month' },
      { kind: 'startsWith', path: 'sourceUrl', want: 'https://problemhunt.pro/en/ai/' },
    ],
  },
  {
    id: '003',
    checks: [
      { kind: 'eq', path: 'category', want: 'marketing' },
      { kind: 'eq', path: 'country', want: 'Georgia' },
      // No price in the source, so none invented. Absence is the assertion.
      { kind: 'eq', path: 'wtp', want: null },
      { kind: 'startsWith', path: 'sourceUrl', want: 'https://problemhunt.pro/en/marketing/' },
    ],
  },
];

function getPath(obj, path) {
  return path.split('.').reduce((o, k) => (o == null ? o : o[k]), obj);
}

function checkOne(p, c) {
  const got = getPath(p, c.path);
  switch (c.kind) {
    case 'eq': return got === c.want;
    case 'includes': return Array.isArray(got) && got.includes(c.want);
    case 'startsWith': return typeof got === 'string' && got.startsWith(c.want);
    default: return false;
  }
}

// ---------- Runner ----------

const results = [];
let pass = 0;
let fail = 0;

for (const fx of fixtures) {
  const p = planById(fx.id);
  if (!p) {
    results.push(`❌ ${fx.id}: plan not found in index`);
    fail++;
    continue;
  }
  const checks = fx.checks.map((c) => {
    const got = getPath(p, c.path);
    const ok = checkOne(p, c);
    return { k: `${c.kind} ${c.path}`, want: c.want, got, ok };
  });
  const allOk = checks.every((c) => c.ok);
  if (allOk) pass++;
  else fail++;
  const failMsgs = checks.filter((c) => !c.ok).map((c) => `     ${c.k}: want=${JSON.stringify(c.want)} got=${JSON.stringify(c.got)}`).join('\n');
  results.push(`${allOk ? '✅' : '❌'} ${fx.id} ${p.title.slice(0, 50)}${allOk ? '' : '\n' + failMsgs}`);
}

// ---------- Display-text guards ----------

// Every (docName, body) pair across all generated document files.
const DOCS_DIR = join(DATA, 'documents');
const docBodies = existsSync(DOCS_DIR)
  ? readdirSync(DOCS_DIR).flatMap((f) =>
      Object.entries(JSON.parse(readFileSync(join(DOCS_DIR, f), 'utf8')))
        .filter(([, v]) => typeof v === 'string'))
  : [];


const DISPLAY_FIELDS = ['title', 'excerpt', 'originalExcerpt'];
// Fresh RegExp per test: /g literals carry lastIndex across .test() calls.
const ENTITY_RE = { test: (s) => /&#\d+;|&#x[0-9a-fA-F]+;|&[a-zA-Z]{2,8};/.test(s) };
const MARKUP_RE = { test: (s) => /<!--|<\/?[a-zA-Z][a-zA-Z0-9]*(?:\s|>|\/)/.test(s) };
const ZERO_WIDTH_RE = { test: (s) => /[\u200b-\u200d\u2060\ufeff]/.test(s) };

// ---------- Aggregate invariants ----------

console.log('\n[test] fixture checks:');
for (const r of results) console.log(r);

console.log('\n[test] aggregate invariants:');
const totalPlans = plans.length;
const PROJECTS_DIR = join(ROOT, '..', 'projects');
const TOP_PROJECTS = join(PROJECTS_DIR, 'TOP_PROJECTS.md');
const planDirs = readdirSync(PROJECTS_DIR).filter((n) => /^\d{3,}-/.test(n)
  && existsSync(join(PROJECTS_DIR, n, 'SPEC.md')));

// The indexer publishes only authored plans, so the corpus size is the wrong yardstick —
// it counts captures still waiting to be written. Count the ones that claim a published
// status, read straight from the frontmatter rather than from the index being tested.
const PUBLISHABLE = new Set(['enriched', 'humanized', 'web-ready']);
const publishableDirCount = planDirs.filter((n) => {
  const spec = readFileSync(join(PROJECTS_DIR, n, 'SPEC.md'), 'utf8');
  if (!spec.startsWith('---\n')) return false;                 // no frontmatter → legacy
  const end = spec.indexOf('\n---', 4);
  const status = spec.slice(4, end === -1 ? 4 : end).match(/^status:\s*(\S+)/m)?.[1];
  return PUBLISHABLE.has(status);
}).length;

const inv = [
  // Relational, not a hardcoded corpus size: this read `>= 500` and went red the moment
  // the corpus was reset to 10 clean plans. What matters is that every plan the contract
  // considers publishable made it into the index — no more, and crucially no fewer.
  { name: 'plans.json has one entry per publishable plan', ok: totalPlans === publishableDirCount, got: `${totalPlans} indexed / ${publishableDirCount} publishable of ${planDirs.length} dirs` },
  // Relational against the heading rather than a hardcoded 5. A "## Top 5" section that
  // contains six items is a real defect in TOP_PROJECTS.md, not a number this test should be
  // taught to accept, and hardcoding the 5 would also go red the day the file becomes a Top 10.
  // This catches both, and names which section drifted.
  ...(() => {
    const md = existsSync(TOP_PROJECTS) ? readFileSync(TOP_PROJECTS, 'utf8') : '';
    const KEY = { revenue: 'money', money: 'money', learning: 'learn', fun: 'fun' };
    const secs = [...md.matchAll(/^##\s+Top\s+(\d+)\s+[-—–]\s+(.+)$/gm)];
    return secs.map((m, i) => {
      const want = parseInt(m[1], 10);
      const label = m[2].toLowerCase();
      const key = Object.entries(KEY).find(([word]) => label.includes(word))?.[1];
      const body = md.slice(m.index + m[0].length, i + 1 < secs.length ? secs[i + 1].index : md.length);
      const written = (body.match(/^\d+\.\s+\*\*\d{3,}-/gm) || []).length;
      const parsed = key ? rankings[key].length : null;
      return {
        name: `"${m[2].trim()}" holds the ${want} its heading promises, and all ${want} parse`,
        ok: key !== null && written === want && parsed === want,
        got: `heading says ${want}, file has ${written}, rankings.${key} has ${parsed}`,
      };
    });
  })(),
  { name: 'rankings.money ids are at least 3 digits', ok: rankings.money.every((r) => /^\d{3,}$/.test(r.id)), got: rankings.money.map((r) => r.id) },
  { name: 'rankings scores are 1..10', ok: rankings.money.every((r) => r.score >= 1 && r.score <= 10), got: rankings.money.map((r) => r.score) },
  { name: 'no plan is missing title', ok: plans.every((p) => typeof p.title === 'string' && p.title.length > 0), got: plans.filter((p) => !p.title || p.title.length === 0).length },
  { name: 'no plan is missing id', ok: plans.every((p) => /^\d{3,}$/.test(p.id)), got: plans.filter((p) => !/^\d{3,}$/.test(p.id)).length },
  { name: 'no plan has wtp.mrrMid negative', ok: plans.every((p) => !p.wtp || p.wtp.mrrMid == null || p.wtp.mrrMid >= 0), got: plans.filter((p) => p.wtp?.mrrMid < 0).length },
  { name: 'plans.json plans with sourceUrl have an excerpt', ok: plans.every((p) => !p.sourceUrl || (typeof p.excerpt === 'string' && p.excerpt.length > 0)), got: plans.filter((p) => p.sourceUrl && (!p.excerpt || p.excerpt.length === 0)).length },
  // Regression guards for the HTML→text pipeline. 178 of the then-525 plans once
  // shipped raw `&#39;` to the UI, and a naive decode-without-strip fix pushed 326
  // to showing `<!-- SC_OFF --><div class="md">` instead. Both are now invariants.
  { name: 'no display field contains an HTML entity', ok: plans.every((p) => !DISPLAY_FIELDS.some((f) => ENTITY_RE.test(p[f] || ''))), got: plans.filter((p) => DISPLAY_FIELDS.some((f) => ENTITY_RE.test(p[f] || ''))).length },
  { name: 'no display field contains an HTML tag or comment', ok: plans.every((p) => !DISPLAY_FIELDS.some((f) => MARKUP_RE.test(p[f] || ''))), got: plans.filter((p) => DISPLAY_FIELDS.some((f) => MARKUP_RE.test(p[f] || ''))).length },
  { name: 'no display field contains a zero-width character', ok: plans.every((p) => !DISPLAY_FIELDS.some((f) => ZERO_WIDTH_RE.test(p[f] || ''))), got: plans.filter((p) => DISPLAY_FIELDS.some((f) => ZERO_WIDTH_RE.test(p[f] || ''))).length },
  // Relational, not a hardcoded corpus size. This asserted `=== 525` and started
  // failing the moment the corpus grew to 552 — the same brittleness as the
  // hardcoded "525 plans" the UI used to print. What matters is one zip per plan.
  // Documents get the same guard. The excerpt fix covered plans.json only, so 351
  // of 552 detail pages still rendered `<table> <tr><td>` as literal text —
  // markdown-it runs with html:false, correctly, so escaped HTML shows verbatim.
  { name: 'no document body contains HTML tags or entities', ok: docBodies.every(([, body]) => !ENTITY_RE.test(body) && !MARKUP_RE.test(body)), got: docBodies.filter(([, body]) => ENTITY_RE.test(body) || MARKUP_RE.test(body)).length },
  { name: 'document markdown keeps its line structure', ok: docBodies.every(([name, body]) => name !== 'SPEC' || (body.includes('\n') && /^#{1,3} /m.test(body))), got: docBodies.filter(([name, body]) => name === 'SPEC' && !(body.includes('\n') && /^#{1,3} /m.test(body))).length },
  { name: 'zips directory has exactly one entry per plan', ok: existsSync(join(DATA, 'zips')) && readdirSync(join(DATA, 'zips')).length === plans.length, got: existsSync(join(DATA, 'zips')) ? `${readdirSync(join(DATA, 'zips')).length} zips / ${plans.length} plans` : 'missing' },
];

let invPass = 0;
let invFail = 0;
for (const i of inv) {
  console.log(`  ${i.ok ? '✅' : '❌'} ${i.name} (${JSON.stringify(i.got)})`);
  if (i.ok) invPass++; else invFail++;
}

// ---------- Final ----------

console.log(`\n[test] fixtures: ${pass} pass, ${fail} fail`);
console.log(`[test] invariants: ${invPass} pass, ${invFail} fail`);

if (fail > 0 || invFail > 0) {
  console.error('\n[test] FAILED');
  process.exit(1);
}
console.log('\n[test] OK');
