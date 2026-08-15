#!/usr/bin/env node
/**
 * ai-os plans check — the web-readiness gate.
 *
 * Reports, per plan, every rule in projects/_schema.json#gate that fails. Read-only:
 * it never writes a plan. It is the only thing allowed to certify `status: web-ready`,
 * and it refuses to certify anything it did not verify.
 *
 * Usage:
 *   ai-os plans check [--json] [--verbose] [--id 001] [--rule no-template-clone]
 *   ai-os plans check --summary        # counts only, no per-plan detail
 */

import { createHash } from 'node:crypto';
import {
  loadSchema, listPlanDirs, planIdSlug, readDoc, DOC_NAMES, missingSourceFields,
} from './lib/plan.mjs';
import { hasMarkup, hasEntities, hasZeroWidth } from './lib/normalize.mjs';
import { stripMetadataBlock } from './lib/legacy.mjs';

const argv = process.argv.slice(2);
const has = (f) => argv.includes(f);
const val = (f) => { const i = argv.indexOf(f); return i === -1 ? null : argv[i + 1]; };

const AS_JSON = has('--json');
const VERBOSE = has('--verbose');
const SUMMARY_ONLY = has('--summary');
const ONLY_ID = val('--id');
const ONLY_RULE = val('--rule');
const PUBLISHABLE_ONLY = has('--publishable');

const schema = loadSchema();
const RULES = new Map(schema.gate.rules.map((r) => [r.id, r]));
const rule = (id) => RULES.get(id);

let dirs = listPlanDirs();
if (ONLY_ID) dirs = dirs.filter((d) => planIdSlug(d)?.id === ONLY_ID);

/**
 * `--publishable` narrows the gate to the plans the explorer actually ships — the same
 * status set the indexer publishes. Without it the gate answers "is the whole corpus
 * finished?", which is never true while capture keeps arriving, so it can never be a
 * deploy gate. With it the question becomes "is everything about to go on the web
 * sound?", which is the one a pipeline needs to ask.
 *
 * Filtering happens BEFORE clone detection, and that is load-bearing rather than
 * incidental: unauthored plans are template filler by definition and all share the same
 * section bodies, so leaving them in the corpus makes every authored plan look like a
 * clone of them.
 */
const PUBLISHABLE = new Set(['enriched', 'humanized', 'web-ready']);
if (PUBLISHABLE_ONLY) {
  dirs = dirs.filter((d) => {
    const spec = readDoc(d, 'SPEC.md');
    return PUBLISHABLE.has(spec?.frontmatter?.status ?? 'legacy');
  });
}

if (dirs.length === 0) {
  console.error(ONLY_ID ? `no plan with id ${ONLY_ID}` : 'no plans found');
  process.exit(2);
}

// ---------- Pass 1: fingerprint every varying section to detect template clones ----------
// A section is a clone when the same body text repeats across more plans than the
// rule allows. This needs the whole corpus, so it runs before per-plan checks.
const sectionCounts = new Map(); // `${doc}::${heading}::${hash}` -> count
const planSections = new Map(); // dir -> [{doc, heading, hash, empty}]

for (const dir of dirs) {
  const rows = [];
  for (const name of DOC_NAMES) {
    const doc = readDoc(dir, name);
    if (!doc) continue;
    const varying = schema.documents[name]?.varyingSections ?? [];
    for (const s of doc.sections) {
      if (!varying.includes(s.heading)) continue;
      if (s.body.trimStart().startsWith('_Not written yet')) {
        rows.push({ doc: name, heading: s.heading, unwritten: true });
        continue;
      }
      const hash = createHash('sha256').update(s.body).digest('hex').slice(0, 12);
      const key = `${name}::${s.heading}::${hash}`;
      sectionCounts.set(key, (sectionCounts.get(key) ?? 0) + 1);
      rows.push({ doc: name, heading: s.heading, hash, key });
    }
  }
  planSections.set(dir, rows);
}

// ---------- Pass 2: per-plan rules ----------
const PLACEHOLDERS = rule('no-placeholder-text').patterns.map((p) => new RegExp(p, 'i'));
const cloneRule = rule('no-template-clone');
const maxClones = Math.max(1, Math.floor(dirs.length * cloneRule.maxIdenticalRatio));
const minProblem = rule('problem-substantive').minProblemChars;
const maxUrl = rule('no-bare-long-url').maxBareUrlChars;
const legacyStack = new Set(rule('tech-not-default').legacyDefault.map((s) => s.toLowerCase()));

const COUNTRY_ONLY_RE = /^[A-Z][a-zA-Z\s]{2,30}$/;
const UNWRITTEN_MARKER = rule('sections-written').marker;
const isUnwritten = (body) => body.trimStart().startsWith(UNWRITTEN_MARKER);

const results = [];

for (const dir of dirs) {
  const { id, slug } = planIdSlug(dir) ?? {};
  const failures = [];
  const add = (ruleId, detail) => {
    const r = rule(ruleId);
    failures.push({ rule: ruleId, severity: r?.severity ?? 'error', detail });
  };

  const spec = readDoc(dir, 'SPEC.md');
  const fm = spec?.frontmatter ?? null;

  // frontmatter-present
  if (!spec?.hasFrontmatter) {
    add('frontmatter-present', 'SPEC.md has no YAML frontmatter (legacy shape)');
  } else if (!fm) {
    add('frontmatter-present', 'SPEC.md frontmatter is not schema-shaped (nested beyond one level?)');
  } else {
    const missing = schema.frontmatter.required.filter((k) => fm[k] === undefined || fm[k] === null || fm[k] === '');
    if (missing.length) add('frontmatter-present', `missing required: ${missing.join(', ')}`);

    // source.url used to be required unconditionally, by a hardcoded check rather than by the
    // schema. That is right for a scraped capture, which always has an upstream page, and
    // wrong for a web submission, which has none: it would either block submissions or invite
    // a fabricated URL, and a fabricated source is worse than an absent one. The condition now
    // comes from the schema so the contract and the gate cannot drift apart.
    if (fm.source) {
      for (const field of missingSourceFields(fm.source, schema)) {
        add('frontmatter-present', `source.${field} missing`);
      }
      if (!schema.frontmatter.fields.source.fields.name.enum.includes(fm.source.name)) {
        add('frontmatter-present', `unknown source.name: ${fm.source.name}`);
      }
    }

    if (fm.status && !schema.statusLifecycle.order.includes(fm.status)) {
      add('frontmatter-present', `unknown status: ${fm.status}`);
    }
  }

  for (const name of DOC_NAMES) {
    const doc = readDoc(dir, name);
    if (!doc) { add('frontmatter-present', `${name} missing`); continue; }
    // DESIGN.md ships a design-token frontmatter block that predates this schema and
    // is preserved verbatim, not interpreted. Its fields are not this gate's business.
    const where = (extra) => `${name}${extra ? ` ${extra}` : ''}`;

    // text hygiene
    if (hasEntities(doc.body)) add('no-html-in-prose', where('has HTML entities'));
    if (hasMarkup(doc.body)) add('no-html-in-prose', where('has HTML tags or comments'));
    if (hasZeroWidth(doc.body)) add('no-zero-width', where());

    // placeholders
    for (const re of PLACEHOLDERS) {
      if (re.test(doc.body)) { add('no-placeholder-text', where(`matches /${re.source}/`)); break; }
    }

    // required sections, English headings
    const spec2 = schema.documents[name];
    if (spec2?.required?.length) {
      const present = new Set(doc.sections.map((s) => s.heading));
      const missing = spec2.required.filter((h) => !present.has(h));
      if (missing.length) add('english-headings', where(`missing sections: ${missing.join(' · ')}`));
    }

    // heading depth
    const levels = doc.sections.map((s) => s.level);
    for (let i = 1; i < levels.length; i++) {
      if (levels[i] > levels[i - 1] + 1) { add('heading-depth', where(`h${levels[i - 1]} → h${levels[i]}`)); break; }
    }

    // bare long URLs
    const longUrl = doc.body.match(/(?<!\]\()https?:\/\/\S{100,}/);
    if (longUrl) add('no-bare-long-url', where(`${longUrl[0].length} chars`));
  }

  // template clones
  for (const row of planSections.get(dir) ?? []) {
    if (row.unwritten) {
      add('sections-written', `${row.doc} "${row.heading}" awaiting enrichment`);
      continue;
    }
    const n = sectionCounts.get(row.key) ?? 0;
    if (n > maxClones) {
      add('no-template-clone', `${row.doc} "${row.heading}" identical across ${n} plans`);
    }
  }

  // problem substance
  //
  // Measure the PROSE, not the raw section. In the legacy shape the metadata block
  // (`**Fuente:**`, `**Categoría primaria:**`, `**Tags:**`, `**Fecha:**`) lives inside
  // the problem section, so plan 001 — whose entire problem statement is the word
  // "Russia" — measured 228 characters and passed this rule. The gate reported 0
  // failures on a defect present in 29% of the corpus. Strip what frontmatter absorbs
  // before measuring, or the rule certifies the exact thing it exists to catch.
  const problemSection = spec?.sections.find((s) => s.heading === 'Problem' || s.heading === 'Problema Detectado');
  const problemText = stripMetadataBlock(problemSection?.body ?? '')
    .replace(/^---$/gm, '')
    .trim();
  if (!problemText) {
    add('problem-substantive', 'no Problem section');
  } else if (isUnwritten(problemText)) {
    // Already reported by sections-written; do not double-count.
  } else if (problemText.length < minProblem) {
    const looksLikeCountry = COUNTRY_ONLY_RE.test(problemText);
    add('problem-substantive', looksLikeCountry
      ? `only a country name: "${problemText}"`
      : `${problemText.length} chars, needs ${minProblem}`);
  }

  // tech is not the legacy global default
  const tech = fm?.tech ?? [];
  if (Array.isArray(tech) && tech.length) {
    const allLegacy = tech.every((t) => legacyStack.has(String(t).toLowerCase()));
    if (allLegacy) add('tech-not-default', `stack is the legacy global default (${tech.length} entries)`);
  }

  const errors = failures.filter((f) => f.severity === 'error');
  const warns = failures.filter((f) => f.severity === 'warn');
  results.push({
    id, slug,
    status: fm?.status ?? 'legacy',
    webReady: errors.length === 0,
    errors: errors.length,
    warns: warns.length,
    failures,
  });
}

// ---------- Report ----------
const ready = results.filter((r) => r.webReady);
const byRule = new Map();
for (const r of results) {
  for (const f of r.failures) {
    if (!byRule.has(f.rule)) byRule.set(f.rule, { severity: f.severity, plans: new Set() });
    byRule.get(f.rule).plans.add(r.id);
  }
}

if (AS_JSON) {
  console.log(JSON.stringify({
    total: results.length,
    webReady: ready.length,
    byRule: [...byRule.entries()].map(([id, v]) => ({ rule: id, severity: v.severity, plans: v.plans.size })),
    plans: results,
  }, null, 2));
  process.exit(ready.length === results.length ? 0 : 1);
}

const pct = (n) => `${Math.round((n / results.length) * 100)}%`;
console.log(`\nai-os plans check — ${results.length} plan${results.length === 1 ? '' : 's'}\n`);
console.log(`  web-ready: ${ready.length}/${results.length} (${pct(ready.length)})\n`);

if (byRule.size) {
  console.log('  failing rules, most plans first:\n');
  const rows = [...byRule.entries()].sort((a, b) => b[1].plans.size - a[1].plans.size);
  for (const [id, v] of rows) {
    const mark = v.severity === 'error' ? '✗' : '!';
    const r = rule(id);
    console.log(`  ${mark} ${id.padEnd(22)} ${String(v.plans.size).padStart(4)} plans  ${pct(v.plans.size).padStart(4)}`);
    if (VERBOSE && r?.why) console.log(`      why: ${r.why}`);
  }
  console.log('');
}

const byStatus = new Map();
for (const r of results) byStatus.set(r.status, (byStatus.get(r.status) ?? 0) + 1);
console.log('  status:', [...byStatus.entries()].map(([s, n]) => `${s}=${n}`).join(' · '), '\n');

if (!SUMMARY_ONLY) {
  const broken = results.filter((r) => !r.webReady);
  const show = ONLY_ID || VERBOSE ? broken : broken.slice(0, 5);
  if (show.length) {
    console.log('  per plan:\n');
    for (const r of show) {
      console.log(`  ${r.id}-${r.slug.slice(0, 42)}  [${r.status}]  ${r.errors} error${r.errors === 1 ? '' : 's'}, ${r.warns} warn${r.warns === 1 ? '' : 's'}`);
      const seen = new Set();
      for (const f of r.failures) {
        const k = `${f.rule}:${f.detail}`;
        if (seen.has(k)) continue;
        seen.add(k);
        console.log(`      ${f.severity === 'error' ? '✗' : '!'} ${f.rule}: ${f.detail}`);
      }
      console.log('');
    }
    if (broken.length > show.length) {
      console.log(`  … and ${broken.length - show.length} more. Add --verbose for all, or --id <id> for one.\n`);
    }
  }
}

if (ONLY_RULE) {
  const hit = results.filter((r) => r.failures.some((f) => f.rule === ONLY_RULE));
  console.log(`  plans failing ${ONLY_RULE}: ${hit.length}`);
  console.log('  ' + hit.map((r) => r.id).join(' ') + '\n');
}

process.exit(ready.length === results.length ? 0 : 1);
