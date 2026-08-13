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
  {
    id: '001',
    checks: [
      { kind: 'eq', path: 'category', want: 'marketing' },
      { kind: 'eq', path: 'country', want: 'Russia' },
      { kind: 'eq', path: 'wtp.raw', want: 'negotiable' },
      { kind: 'eq', path: 'wtp.mrrMid', want: null },
      { kind: 'includes', path: 'tags', want: 'Marketing' },
      { kind: 'startsWith', path: 'sourceUrl', want: 'https://problemhunt.pro/en/marketing/' },
    ],
  },
  {
    id: '016',
    checks: [
      { kind: 'eq', path: 'category', want: 'validated' },
      { kind: 'eq', path: 'country', want: null }, // 'Validated' is a category, not a country
      { kind: 'eq', path: 'wtp', want: null },
      { kind: 'startsWith', path: 'sourceUrl', want: 'https://problemhunt.pro/en/validated/' },
    ],
  },
  {
    id: '236',
    checks: [
      { kind: 'eq', path: 'category', want: 'other' },
      { kind: 'eq', path: 'country', want: null },
      { kind: 'eq', path: 'wtp', want: null },
      { kind: 'eq', path: 'sourceUrl', want: null },
    ],
  },
  {
    id: '419',
    checks: [
      { kind: 'eq', path: 'category', want: 'other' },
      { kind: 'eq', path: 'country', want: null },
      { kind: 'eq', path: 'wtp', want: null },
      { kind: 'eq', path: 'sourceUrl', want: null },
    ],
  },
  {
    id: '441',
    checks: [
      { kind: 'eq', path: 'category', want: 'other' },
      { kind: 'eq', path: 'country', want: null },
      // Critical: the text says "charging $20/mo" (competitor) — must NOT be picked up.
      { kind: 'eq', path: 'wtp', want: null },
      { kind: 'eq', path: 'sourceUrl', want: null },
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
const inv = [
  { name: 'plans.json has at least 500 entries', ok: totalPlans >= 500, got: totalPlans },
  { name: 'rankings.money has 5 entries', ok: rankings.money.length === 5, got: rankings.money.length },
  { name: 'rankings.learn has 5 entries', ok: rankings.learn.length === 5, got: rankings.learn.length },
  { name: 'rankings.fun has 5 entries', ok: rankings.fun.length === 5, got: rankings.fun.length },
  { name: 'rankings.money ids are 3-digit strings', ok: rankings.money.every((r) => /^\d{3}$/.test(r.id)), got: rankings.money.map((r) => r.id) },
  { name: 'rankings scores are 1..10', ok: rankings.money.every((r) => r.score >= 1 && r.score <= 10), got: rankings.money.map((r) => r.score) },
  { name: 'no plan is missing title', ok: plans.every((p) => typeof p.title === 'string' && p.title.length > 0), got: plans.filter((p) => !p.title || p.title.length === 0).length },
  { name: 'no plan is missing id', ok: plans.every((p) => /^\d{3}$/.test(p.id)), got: plans.filter((p) => !/^\d{3}$/.test(p.id)).length },
  { name: 'no plan has wtp.mrrMid negative', ok: plans.every((p) => !p.wtp || p.wtp.mrrMid == null || p.wtp.mrrMid >= 0), got: plans.filter((p) => p.wtp?.mrrMid < 0).length },
  { name: 'plans.json plans with sourceUrl have an excerpt', ok: plans.every((p) => !p.sourceUrl || (typeof p.excerpt === 'string' && p.excerpt.length > 0)), got: plans.filter((p) => p.sourceUrl && (!p.excerpt || p.excerpt.length === 0)).length },
  // Regression guards for the HTML→text pipeline. 178/525 plans once shipped raw
  // `&#39;` to the UI, and a naive decode-without-strip fix pushed 326/525 to
  // showing `<!-- SC_OFF --><div class="md">` instead. Both are now invariants.
  { name: 'no display field contains an HTML entity', ok: plans.every((p) => !DISPLAY_FIELDS.some((f) => ENTITY_RE.test(p[f] || ''))), got: plans.filter((p) => DISPLAY_FIELDS.some((f) => ENTITY_RE.test(p[f] || ''))).length },
  { name: 'no display field contains an HTML tag or comment', ok: plans.every((p) => !DISPLAY_FIELDS.some((f) => MARKUP_RE.test(p[f] || ''))), got: plans.filter((p) => DISPLAY_FIELDS.some((f) => MARKUP_RE.test(p[f] || ''))).length },
  { name: 'no display field contains a zero-width character', ok: plans.every((p) => !DISPLAY_FIELDS.some((f) => ZERO_WIDTH_RE.test(p[f] || ''))), got: plans.filter((p) => DISPLAY_FIELDS.some((f) => ZERO_WIDTH_RE.test(p[f] || ''))).length },
  { name: 'zips directory exists and has 525 entries', ok: existsSync(join(DATA, 'zips')) && readdirSync(join(DATA, 'zips')).length === 525, got: existsSync(join(DATA, 'zips')) ? readdirSync(join(DATA, 'zips')).length : 'missing' },
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
