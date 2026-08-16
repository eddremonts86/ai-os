#!/usr/bin/env node
/**
 * Tests for submission intake. Run: node tools/plans-pipeline/test-intake.mjs
 *
 * The riskiest part of intake is parsing a GitHub issue-form body, because its shape is
 * GitHub's to change and nothing warns us when it does. Second riskiest is producing a
 * directory the gate then rejects, which would strand approved submissions with no obvious
 * cause. Both are covered here against a body copied from the real template's field labels.
 */

import { parseIssueForm, validate, buildDocs, slugify, FIELDS } from './intake.mjs';
import { parseFrontmatter, parseSections, loadSchema } from '../plan-format/lib/plan.mjs';

const schema = loadSchema();
let pass = 0;
const fails = [];
const ok = (name, cond, got) => {
  if (cond) { pass++; console.log(`  ✅ ${name}`); }
  else { fails.push(name); console.log(`  ❌ ${name}${got !== undefined ? `  got: ${JSON.stringify(got)}` : ''}`); }
};

const PROBLEM = 'A photographer relocating from Serbia to the US has no local client history '
  + 'and no reviews, so the platforms rank them invisibly. Agencies want 30% and exclusivity. '
  + 'They cold-email wedding venues, which converts at roughly nothing.';

/** A body in exactly the shape GitHub renders an issue form into. */
const body = (over = {}) => {
  const v = {
    'The problem in one sentence': 'A photographer moving to the US cannot get local clients',
    'The problem in full': PROBLEM,
    Category: 'marketing',
    Country: 'Serbia',
    'What they said they would pay': '$100-300/month',
    'Where you saw it': 'https://www.reddit.com/r/photography/comments/abc',
    'What you would build': 'A booking site with review seeding.',
    'Credit this to': 'anon-hunter',
    'Before you send': '- [X] This can be published publicly under the repository\'s MIT licence, and I have the right to submit it.\n- [X] It contains no confidential information and no personal details of anyone who has not agreed to this.',
    ...over,
  };
  return Object.entries(v).map(([k, val]) => `### ${k}\n\n${val}\n`).join('\n');
};

const fieldsFrom = (b) => {
  const raw = parseIssueForm(b);
  return Object.fromEntries(Object.entries(FIELDS).map(([label, key]) => [key, raw[label] ?? '']));
};

console.log('\n[test] submission intake\n');

// ---------- parsing ----------
{
  const f = fieldsFrom(body());
  ok('reads every template field', Object.values(f).every((v) => v !== ''), f);
  ok('reads the full problem intact', f.problem === PROBLEM);
  ok('reads the category', f.category === 'marketing', f.category);

  // Unfilled optional fields render this literal, and treating it as content would put the
  // string "_No response_" into a published plan.
  const blank = fieldsFrom(body({ Country: '_No response_', 'Credit this to': '_No response_' }));
  ok('treats _No response_ as absent', blank.country === '' && blank.submittedBy === '', blank.country);

  // Every label in FIELDS must exist in the real template, or intake silently reads nothing.
  const template = (await import('node:fs')).readFileSync(
    new URL('../../.github/ISSUE_TEMPLATE/submit-plan.yml', import.meta.url), 'utf8');
  const missing = Object.keys(FIELDS).filter((label) => !template.includes(label));
  ok('every field label intake expects exists in the template', missing.length === 0, missing);

  const multiline = fieldsFrom(body({ 'The problem in full': 'line one\n\nline two\n\nline three' }));
  ok('keeps paragraph breaks in the problem', multiline.problem.split('\n\n').length === 3, multiline.problem);
}

// ---------- validation ----------
{
  ok('a complete submission validates', validate(fieldsFrom(body())).length === 0,
    validate(fieldsFrom(body())));

  const short = validate(fieldsFrom(body({ 'The problem in full': 'too short' })));
  ok('rejects a problem under the gate floor', short.some((p) => p.includes('the gate needs')), short);

  const unticked = validate(fieldsFrom(body({
    'Before you send': '- [ ] This can be published\n- [X] No confidential information',
  })));
  ok('rejects unticked consent', unticked.some((p) => p.includes('consent')), unticked);

  const noConsent = validate(fieldsFrom(body({ 'Before you send': '_No response_' })));
  ok('rejects missing consent entirely', noConsent.some((p) => p.includes('consent')), noConsent);

  const badSource = validate(fieldsFrom(body({ 'Where you saw it': 'not a url' })));
  ok('rejects a source that is not a URL', badSource.some((p) => p.includes('source')), badSource);

  const noSource = validate(fieldsFrom(body({ 'Where you saw it': '_No response_' })));
  ok('accepts an absent source', noSource.length === 0, noSource);
}

// ---------- slugs ----------
{
  ok('slugifies a title', slugify('A photographer moving to the US!') === 'a-photographer-moving-to-the-us');
  ok('strips accents', slugify('Diseño rápido') === 'diseno-rapido', slugify('Diseño rápido'));
  ok('never ends in a hyphen', !slugify('x'.repeat(60) + ' tail').endsWith('-'));
  ok('bounds the length', slugify('word '.repeat(40)).length <= 54);
  ok('survives a title that is all punctuation', slugify('!!! ???') === '', slugify('!!! ???'));
}

// ---------- the produced documents ----------
{
  const f = fieldsFrom(body());
  const docs = buildDocs({ id: '999', slug: 'a-slug', title: f.title, fields: f, today: '2026-08-15' });

  ok('writes all five documents',
    ['SPEC.md', 'PRODUCT.md', 'PLAN.md', 'TASKS.md', 'DESIGN.md'].every((n) => docs[n]), Object.keys(docs));

  const spec = parseFrontmatter(docs['SPEC.md']);
  ok('SPEC frontmatter parses', spec.data !== null);
  ok('enters as draft', spec.data.status === 'draft', spec.data.status);
  ok('records source.name web', spec.data.source.name === 'web', spec.data.source);
  ok('records consent', spec.data.source.consent === true, spec.data.source);
  ok('carries the credit', spec.data.source.submittedBy === 'anon-hunter', spec.data.source);

  // Every section the gate demands must exist, or an approved submission strands as a plan
  // that can never pass.
  for (const [name, spec2] of Object.entries(schema.documents)) {
    if (!spec2.required?.length) continue;
    const present = new Set(parseSections(parseFrontmatter(docs[name]).body).map((s) => s.heading));
    const missing = spec2.required.filter((h) => !present.has(h));
    ok(`${name} has every required section`, missing.length === 0, missing);
  }

  ok('the problem text reaches the Problem section', docs['SPEC.md'].includes(PROBLEM));
  ok('the submitted solution seeds the Objective', docs['SPEC.md'].includes('A booking site with review seeding.'));
  ok('unwritten sections carry the marker the gate looks for',
    docs['PRODUCT.md'].includes(schema.gate.rules.find((r) => r.id === 'sections-written').marker));

  // A submission with no source must not invent one; the schema allows its absence for `web`.
  const noSrc = fieldsFrom(body({ 'Where you saw it': '_No response_' }));
  const d2 = buildDocs({ id: '998', slug: 's', title: noSrc.title, fields: noSrc, today: '2026-08-15' });
  const fm2 = parseFrontmatter(d2['SPEC.md']).data;
  ok('omits source.url rather than inventing one', fm2.source.url === undefined, fm2.source);

  const noSol = fieldsFrom(body({ 'What you would build': '_No response_' }));
  const d3 = buildDocs({ id: '997', slug: 's', title: noSol.title, fields: noSol, today: '2026-08-15' });
  ok('leaves the Objective unwritten when none was offered',
    d3['SPEC.md'].includes(`## Objective\n\n${schema.gate.rules.find((r) => r.id === 'sections-written').marker}`));
}

console.log(`\n[test] ${pass} pass, ${fails.length} fail`);
if (fails.length) {
  for (const f of fails) console.log(`  - ${f}`);
  process.exit(1);
}
console.log('[test] OK\n');
