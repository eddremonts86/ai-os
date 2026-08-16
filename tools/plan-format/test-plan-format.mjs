#!/usr/bin/env node
/**
 * Tests for the plan formatter. Run: node tools/plan-format/test-plan-format.mjs
 *
 * These cover the two things that would silently corrupt 552 plans if wrong:
 * frontmatter round-tripping, and the normalisation pipeline. Everything asserts on
 * real corpus shapes, not invented ones.
 */

import { parseFrontmatter, stringifyFrontmatter, parseSections, loadSchema, missingSourceFields } from './lib/plan.mjs';
import { htmlToText, markdownToText, linkifyLongUrls, unnestLinks, hasEntities, hasMarkup, hasZeroWidth } from './lib/normalize.mjs';
import { renameHeadings, stripMetadataBlock, extractCountry, extractProblem, extractTech } from './lib/legacy.mjs';

const schema = loadSchema();
let pass = 0;
const fails = [];

function ok(name, cond, got) {
  if (cond) { pass++; console.log(`  ✅ ${name}`); }
  else { fails.push(name); console.log(`  ❌ ${name}${got !== undefined ? `  got: ${JSON.stringify(got)}` : ''}`); }
}

/** Deep equality that ignores key order — frontmatter is emitted in schema order. */
function sameShape(a, b) {
  if (a === b) return true;
  if (typeof a !== typeof b || a === null || b === null) return false;
  if (Array.isArray(a) !== Array.isArray(b)) return false;
  if (Array.isArray(a)) return a.length === b.length && a.every((x, i) => sameShape(x, b[i]));
  if (typeof a !== 'object') return false;
  const ka = Object.keys(a).sort(); const kb = Object.keys(b).sort();
  return ka.length === kb.length && ka.every((k, i) => k === kb[i] && sameShape(a[k], b[k]));
}

console.log('\n[frontmatter round-trip]');
{
  const cases = [
    ['plain', { id: '001', slug: 'a-b', title: 'Simple title', status: 'draft', source: { name: 'ProblemHunt', url: 'https://x.dev/a' }, category: 'marketing', date: '2026-07-20' }],
    ['colon and quotes in title', { id: '002', slug: 'a-b', title: 'She is "willing" to pay: really', status: 'draft', source: { name: 'Reddit', url: 'https://reddit.com/r/x/1' }, category: 'dev', date: '2026-01-02' }],
    ['arrays and nested numbers', { id: '003', slug: 'c-d', title: 'Has tags', status: 'enriched', source: { name: 'manual', url: 'https://x.dev/b' }, category: 'ai', date: '2026-03-04', tags: ['Marketing', 'Productivity'], scores: { money: 8, learn: 7, fun: 6 } }],
    ['parens in array values', { id: '004', slug: 'e-f', title: 'Stack', status: 'draft', source: { name: 'manual', url: 'https://x.dev/c' }, category: 'dev', date: '2026-03-04', tech: ['React', 'Node.js API (TanStack Start)'] }],
    ['currency and hyphen range', { id: '005', slug: 'g-h', title: 'Pays', status: 'draft', source: { name: 'manual', url: 'https://x.dev/d' }, category: 'dev', date: '2026-03-04', wtp: { raw: '$100-300/month', currency: '$', min: 100, max: 300, period: 'month' } }],
    ['country with a space', { id: '006', slug: 'i-j', title: 'Where', status: 'draft', source: { name: 'manual', url: 'https://x.dev/e' }, category: 'dev', date: '2026-03-04', country: 'United Arab Emirates' }],
  ];
  for (const [name, fm] of cases) {
    const text = stringifyFrontmatter(fm, schema) + '# Title\n\n## Problem\n\nbody\n';
    const back = parseFrontmatter(text);
    ok(`round-trips: ${name}`, sameShape(back.data, fm), back.data);
    ok(`body survives: ${name}`, back.body.includes('## Problem'), back.body.slice(0, 30));
  }
}

console.log('\n[frontmatter tolerance]');
{
  // DESIGN.md ships a deep design-token block. It must not crash, and must not be
  // silently reinterpreted as schema frontmatter.
  const design = `---
name: "404-x"
source: "Linear"

colors:
 primary:   "#FFFFFF"
 secondary: "#8A8F98"

typography:
 heading:
   fontFamily: "Inter, system-ui, sans-serif"
---

## Linear — Design System

### Typography
`;
  const r = parseFrontmatter(design);
  ok('deep block does not throw', true);
  ok('deep block reports raw', typeof r.raw === 'string' && r.raw.includes('typography'));
  ok('deep block is NOT interpreted', r.data === null, r.data);
  ok('deep block body preserved', r.body.startsWith('## Linear'), r.body.slice(0, 20));

  const none = parseFrontmatter('# Just a doc\n\n## Problem\n\ntext\n');
  ok('no frontmatter → raw null', none.raw === null && none.data === null);
  ok('no frontmatter → body untouched', none.body.startsWith('# Just a doc'));
}

console.log('\n[normalisation]');
{
  ok('decodes single-encoded', htmlToText('I&#39;ve been') === "I've been", htmlToText('I&#39;ve been'));
  ok('decodes double-encoded', htmlToText('I&amp;#39;ve') === "I've", htmlToText('I&amp;#39;ve'));
  ok('strips revealed markup', htmlToText('&lt;div class="md"&gt;hi&lt;/div&gt;').trim() === 'hi', htmlToText('&lt;div class="md"&gt;hi&lt;/div&gt;'));
  ok('strips SC_OFF comment', htmlToText('&lt;!-- SC_OFF --&gt;&lt;p&gt;text&lt;/p&gt;').trim() === 'text', htmlToText('&lt;!-- SC_OFF --&gt;&lt;p&gt;text&lt;/p&gt;'));
  ok('block ends become a space', htmlToText('<p>a</p><p>b</p>') === 'a b', htmlToText('<p>a</p><p>b</p>'));
  ok('drops zero-width', !hasZeroWidth(htmlToText('a​b')));
  ok('decodes &#32; to a space', htmlToText('a&#32;b') === 'a b', htmlToText('a&#32;b'));
  ok('leaves unknown entities alone', htmlToText('&notanentity;') === '&notanentity;', htmlToText('&notanentity;'));

  const md = '# H1\n\n## Section\n\n- item one\n- item two\n\n```\ncode\n```\n';
  const out = markdownToText(md);
  ok('markdown keeps newlines', out.includes('\n'));
  ok('markdown keeps headings', /^## Section$/m.test(out));
  ok('markdown keeps list items', out.includes('- item one') && out.includes('- item two'));
  ok('markdown collapses 3+ blank lines', !/\n{3,}/.test(markdownToText('a\n\n\n\n\nb')));
}

console.log('\n[long URLs]');
{
  const long = 'https://preview.redd.it/' + 'a'.repeat(200) + '.jpg';
  const res = linkifyLongUrls(`See ${long} here`, 100);
  ok('wraps an over-long bare URL', res.includes('](' + long + ')'), res.slice(0, 60));
  ok('label is readable', /\[preview\.redd\.it/.test(res), res.slice(0, 60));
  const short = 'https://x.dev/a';
  ok('leaves a short URL bare', linkifyLongUrls(`See ${short}`, 100) === `See ${short}`);
  const trailing = `(${long}).`;
  ok('keeps trailing punctuation outside the link', linkifyLongUrls(trailing, 100).endsWith(').'), linkifyLongUrls(trailing, 100).slice(-12));

  /**
   * The formatter runs over the corpus repeatedly, so wrapping has to be a fixed point. It was not:
   * the lead class accepts `(`, which is also the character opening an href, so every run wrapped the
   * link the previous run wrote. 253 links across 43 plans ended up nested, the worst eight deep.
   */
  const once = linkifyLongUrls(`Source: ${long}`, 100);
  ok('wrapping is idempotent', linkifyLongUrls(linkifyLongUrls(once, 100), 100) === once, once.slice(0, 70));
  ok('leaves an existing markdown link alone', linkifyLongUrls(`[label](${long})`, 100) === `[label](${long})`);
  ok('leaves an existing image alone', linkifyLongUrls(`![alt](${long})`, 100) === `![alt](${long})`);
}

console.log('\n[repairing nested links]');
{
  const url = 'https://preview.redd.it/' + 'a'.repeat(200) + '.jpg';
  const nested = `Source: ${'[preview.redd.it/aaa…]('.repeat(7)}${url}${')'.repeat(7)}`;
  const repaired = unnestLinks(nested);

  ok('collapses seven levels to one', (repaired.match(/\]\(/g) ?? []).length === 1, repaired.slice(0, 70));
  ok('keeps the url intact', repaired.includes(`](${url})`));

  const healthy = 'see [ex](https://example.com/x) and (a [second](https://example.com/y)) end';
  ok('leaves healthy links untouched', unnestLinks(healthy) === healthy);

  // The last paren belongs to the sentence, not to the link. Counting openers is what protects it.
  const inParens = '(see [x](https://example.com/a))';
  ok('keeps a paren that belongs to the sentence', unnestLinks(inParens) === inParens, unnestLinks(inParens));

  ok('is itself idempotent', unnestLinks(repaired) === repaired);
}

console.log('\n[legacy extraction]');
{
  const spec = `# SPEC.md — A psychologist needs a bot

## Problema Detectado

Russia

**Fuente:** [ProblemHunt](https://problemhunt.pro/en/marketing/abc)
**Categoría primaria:** marketing
**Tags:** Marketing,Productivity
**Fecha:** 2026-07-20 23:11

---

## Objetivo Principal

Crear una solución.
`;
  ok('country extracted', extractCountry(spec) === 'Russia', extractCountry(spec));
  const { problem, problemWasOnlyCountry } = extractProblem(spec);
  ok('problem-was-only-country detected', problemWasOnlyCountry === true, { problem, problemWasOnlyCountry });

  const stripped = stripMetadataBlock(spec);
  ok('metadata block removed', !/\*\*(Fuente|Categoría primaria|Tags|Fecha):/.test(stripped));
  ok('prose survives stripping', stripped.includes('Crear una solución'));

  const renamed = renameHeadings(stripped);
  ok('Spanish headings renamed', /^## Problem$/m.test(renamed) && /^## Objective$/m.test(renamed), renamed.match(/^## .*$/gm));
  ok('no Spanish heading left', !/^## (Problema Detectado|Objetivo Principal)$/m.test(renamed));

  const plan = '## Tech Stack Propuesta\n\n- **Frontend:** React + TypeScript\n- **DB:** SQLite con Drizzle ORM\n';
  ok('tech extracted and split', extractTech(plan).includes('React') && extractTech(plan).includes('TypeScript'), extractTech(plan));
}

console.log('\n[sections]');
{
  const body = '# T\n\n## One\n\na\n\n## Two\n\nb\n\n### Nested\n\nc\n';
  const s = parseSections(body);
  ok('parses H2 and H3', s.map((x) => x.heading).join(',') === 'One,Two,Nested', s.map((x) => x.heading));
  ok('H2 body excludes the nested H3', s[0].body === 'a', s[0].body);
  ok('nested body captured', s[2].body === 'c', s[2].body);
  ok('levels recorded', s.map((x) => x.level).join(',') === '2,2,3', s.map((x) => x.level));
}

console.log('\n[schema integrity]');
{
  ok('every document declares required sections', Object.values(schema.documents).every((d) => Array.isArray(d.required)));
  ok('varyingSections are a subset of required+optional', Object.entries(schema.documents).every(([, d]) => {
    const all = new Set([...(d.required ?? []), ...(d.optional ?? [])]);
    return (d.varyingSections ?? []).every((v) => all.has(v));
  }));
  ok('every gate rule has an id, severity and why-or-rule', schema.gate.rules.every((r) => r.id && r.severity && (r.why || r.rule)));
  ok('status order matches the documented lifecycle', schema.statusLifecycle.order.join(',') === 'draft,enriched,humanized,web-ready');
}

// ---------- source.* conditional requirements ----------
// A condition that never fires is worse than no condition, so each direction is asserted
// rather than inferred from the corpus passing.
{
  const scraped = { name: 'ProblemHunt', url: 'https://problemhunt.pro/en/x/y' };
  const scrapedNoUrl = { name: 'Reddit' };
  const web = { name: 'web', consent: true };
  const webNoConsent = { name: 'web' };
  const webWithUrl = { name: 'web', consent: true, url: 'https://news.ycombinator.com/item?id=1' };

  ok('scraped source with a url is complete',
    missingSourceFields(scraped, schema).length === 0, missingSourceFields(scraped, schema));
  ok('scraped source without a url still fails',
    missingSourceFields(scrapedNoUrl, schema).includes('url'), missingSourceFields(scrapedNoUrl, schema));
  ok('web submission does not need a url',
    !missingSourceFields(web, schema).includes('url'), missingSourceFields(web, schema));
  ok('web submission without consent fails',
    missingSourceFields(webNoConsent, schema).includes('consent'), missingSourceFields(webNoConsent, schema));
  ok('scraped source is not asked for consent',
    !missingSourceFields(scraped, schema).includes('consent'), missingSourceFields(scraped, schema));
  ok('web submission may still carry a url',
    missingSourceFields(webWithUrl, schema).length === 0, missingSourceFields(webWithUrl, schema));
  ok('web is a legal source name',
    schema.frontmatter.fields.source.fields.name.enum.includes('web'));
  ok('draft meaning is no longer scraper-specific',
    !/scraper\.$/.test(schema.statusLifecycle.meaning.draft), schema.statusLifecycle.meaning.draft.slice(0, 40));
}

console.log(`\n[test] ${pass} pass, ${fails.length} fail`);
if (fails.length) {
  console.log('[test] FAILED:\n  - ' + fails.join('\n  - '));
  process.exit(1);
}

console.log('[test] OK\n');
