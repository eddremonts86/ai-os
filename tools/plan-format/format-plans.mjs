#!/usr/bin/env node
/**
 * ai-os plans format — migrate plan documents to the schema shape.
 *
 * DRY RUN BY DEFAULT. Nothing is written without --write.
 *
 * What it does, per plan:
 *   1. Lifts metadata out of prose into YAML frontmatter (id, slug, title, source,
 *      category, tags, date, country, tech) — the couplings that made the web index
 *      depend on Spanish literals and on a country sitting where the problem belonged.
 *   2. Renames Spanish headings to the schema's English ones.
 *   3. Normalises text: decodes entities, strips revealed markup, drops zero-width
 *      characters, wraps over-long bare URLs as markdown links.
 *   4. Removes template sections whose body is identical across the corpus, leaving
 *      the heading with an explicit TODO marker. An absent section is honest; filler
 *      that reads as authored content is not.
 *   5. Sets `status: draft` — never higher. Only enrichment advances status, and only
 *      `ai-os plans check` may certify web-ready.
 *
 * What it never does: invent prose. It restructures and cleans what exists.
 *
 * Usage:
 *   ai-os plans format                     # dry run over every plan
 *   ai-os plans format --id 001 --diff     # dry run, show the rewritten SPEC.md
 *   ai-os plans format --write             # apply
 *   ai-os plans format --write --id 001    # apply to one plan
 *   ai-os plans format --keep-filler       # migrate structure, leave template bodies
 */

import { createHash } from 'node:crypto';
import {
  loadSchema, listPlanDirs, planIdSlug, readDoc, writeDocText,
  stringifyFrontmatter, DOC_NAMES,
} from './lib/plan.mjs';
import { markdownToText, linkifyLongUrls, unnestLinks } from './lib/normalize.mjs';
import {
  extractTitle, extractCategory, extractTags, extractDate, extractSource,
  extractCountry, extractProblem, extractTech, stripMetadataBlock, renameHeadings,
  HEADING_MAP,
} from './lib/legacy.mjs';

const argv = process.argv.slice(2);
const has = (f) => argv.includes(f);
const val = (f) => { const i = argv.indexOf(f); return i === -1 ? null : argv[i + 1]; };

const WRITE = has('--write');
const SHOW_DIFF = has('--diff');
const KEEP_FILLER = has('--keep-filler');
const ONLY_ID = val('--id');
const LIMIT = val('--limit') ? parseInt(val('--limit'), 10) : null;

const schema = loadSchema();
const maxUrl = schema.gate.rules.find((r) => r.id === 'no-bare-long-url').maxBareUrlChars;
/**
 * Visible on purpose.
 *
 * This was an HTML comment, which failed two ways: it tripped this tool's own
 * `no-html-in-prose` gate rule, and it hid the gap from anyone reading the plan. The
 * whole contract argues that an honest gap beats filler — a gap nobody can see is
 * filler by omission. The plan's `status: draft` and this line agree with each other.
 */
const TODO = '_Not written yet — `ai-os plans enrich` fills this section._';

/**
 * Fixed boilerplate strings, translated mechanically.
 *
 * These are byte-identical across all 552 plans and carry no per-plan meaning — they
 * are cross-references, not content — so translating them is the same class of change
 * as renaming a heading. The formatter still does not touch authored prose: Spanish
 * task lists and footers are enrichment's business, because translating those changes
 * meaning and needs judgement.
 */
const FIXED_STRINGS = [
  ['Ver `DESIGN.md` para tokens específicos del proyecto.', 'See `DESIGN.md` for this project\'s design tokens.'],
];

function translateFixedStrings(body) {
  let out = body;
  for (const [from, to] of FIXED_STRINGS) out = out.split(from).join(to);
  return out;
}

let dirs = listPlanDirs();
if (ONLY_ID) dirs = dirs.filter((d) => planIdSlug(d)?.id === ONLY_ID);
if (LIMIT) dirs = dirs.slice(0, LIMIT);

if (dirs.length === 0) {
  console.error(ONLY_ID ? `no plan with id ${ONLY_ID}` : 'no plans found');
  process.exit(2);
}

// ---------- Pass 1: find the template bodies ----------
// A section body repeated across most of the corpus is template filler, not content.
// Identifying it needs the whole corpus, so it happens before any rewrite.
const cloneRule = schema.gate.rules.find((r) => r.id === 'no-template-clone');
const allDirs = listPlanDirs();
const bodyCounts = new Map();
// Fingerprint the NORMALISED body under BOTH its legacy and schema heading. The rewrite
// normalises before testing, so indexing raw text made the first pass miss every clone
// and the second pass catch it — the command needed two runs to reach a fixed point.
for (const dir of allDirs) {
  for (const name of DOC_NAMES) {
    const doc = readDoc(dir, name);
    if (!doc) continue;
    for (const s of doc.sections) {
      const norm = markdownToText(s.body);
      const digest = createHash('sha256').update(norm).digest('hex').slice(0, 12);
      for (const heading of new Set([s.heading, HEADING_MAP[s.heading] ?? s.heading])) {
        const key = `${name}::${heading}::${digest}`;
        bodyCounts.set(key, (bodyCounts.get(key) ?? 0) + 1);
      }
    }
  }
}
const cloneThreshold = Math.max(2, Math.floor(allDirs.length * cloneRule.maxIdenticalRatio));
const isFiller = (name, heading, body) => {
  const key = `${name}::${heading}::${createHash('sha256').update(markdownToText(body)).digest('hex').slice(0, 12)}`;
  return (bodyCounts.get(key) ?? 0) > cloneThreshold;
};

// ---------- Per-plan migration ----------

function buildFrontmatter(dir, specText, planText, productText, existing) {
  const { id, slug } = planIdSlug(dir);

  // Already migrated: frontmatter is the source of truth. Re-extracting from prose
  // here silently emptied `date` and `source.url` on every re-run, because the first
  // run had removed the block those values came from. A formatter that loses data when
  // run twice is worse than one that refuses to run.
  if (existing) {
    const { problem, problemWasOnlyCountry } = extractProblem(specText);
    return {
      fm: { ...existing, id, slug },
      problem,
      problemWasOnlyCountry: false,   // already handled on the migrating run
      droppedLegacyStack: false,
    };
  }
  const source = extractSource(specText);
  const { problem, problemWasOnlyCountry } = extractProblem(specText);
  const country = extractCountry(specText);
  const tech = extractTech(planText);

  const fm = {
    id, slug,
    title: extractTitle(specText, slug.replace(/-/g, ' ')),
    status: 'draft',
    source: source ?? { name: 'manual', url: '' },
    category: extractCategory(specText),
    date: extractDate(specText) ?? '',
    tags: extractTags(specText, productText),
  };
  if (country) fm.country = country;
  // Do NOT migrate the legacy global stack. All 552 plans carried the same six
  // entries, which is what made the web's Tech facet filter nothing (React 552,
  // TypeScript 552). The schema says an empty array is honest and a copied default
  // is not, so carrying it forward would migrate a known-false value into the new
  // shape and hand the gate 552 guaranteed failures. Enrichment picks a stack per
  // problem; absence until then is the truthful state.
  const legacy = new Set(
    schema.gate.rules.find((r) => r.id === 'tech-not-default').legacyDefault.map((s) => s.toLowerCase()),
  );
  const isLegacyStack = tech.length > 0 && tech.every((x) => legacy.has(String(x).toLowerCase()));
  if (tech.length && !isLegacyStack) fm.tech = tech;
  return { fm, problem, problemWasOnlyCountry, droppedLegacyStack: isLegacyStack };
}

/** Rewrite one document body: headings, hygiene, filler. */
function rewriteBody(name, doc, problemOverride) {
  let body = doc.body;

  // The H1 is the plan title; frontmatter carries it now, so the heading stays but
  // loses the `SPEC.md — ` file prefix that only made sense in a file listing.
  body = body.replace(/^#\s+(?:SPEC|PRODUCT|PLAN|DESIGN|TASKS)\.md\s*[-—–]\s*/m, '# ');

  body = stripMetadataBlock(body);
  body = renameHeadings(body);
  body = translateFixedStrings(body);
  body = markdownToText(body);
  // Heal before wrapping. Plans already carrying nested links from the runs that predate the
  // idempotency fix collapse back to one link here, so the corpus repairs itself as it is formatted.
  body = unnestLinks(body);
  body = linkifyLongUrls(body, maxUrl);

  // Re-parse after renaming so section headings are the schema's.
  const sections = [];
  const re = /^(#{2,6})\s+(.+?)\s*$/gm;
  const marks = [];
  let m;
  while ((m = re.exec(body)) !== null) {
    marks.push({ level: m[1].length, heading: m[2].trim(), start: m.index, contentStart: m.index + m[0].length });
  }
  for (let i = 0; i < marks.length; i++) {
    const end = i + 1 < marks.length ? marks[i + 1].start : body.length;
    sections.push({ ...marks[i], body: body.slice(marks[i].contentStart, end).trim(), end });
  }

  const removed = [];
  // Rebuild back-to-front so indices stay valid.
  for (let i = sections.length - 1; i >= 0; i--) {
    const s = sections[i];
    let replacement = null;

    if (name === 'SPEC.md' && s.heading === 'Problem' && problemOverride !== undefined) {
      replacement = problemOverride;
    }

    // The legacy heading is what the corpus repeats under, so test the pre-rename
    // name too when deciding whether a body is filler.
    const legacyHeading = Object.entries(HEADING_MAP).find(([, v]) => v === s.heading)?.[0];
    // Only sections the schema marks as varying can be filler. DESIGN.md declares
    // none: each plan references one of 14 design systems, so its token subsections
    // repeat by design and stripping them would delete the one document that already
    // has real per-plan content.
    const varying = schema.documents[name]?.varyingSections ?? [];
    const canBeFiller = varying.includes(s.heading) || (legacyHeading && varying.includes(HEADING_MAP[legacyHeading]));
    const filler = !KEEP_FILLER && canBeFiller && (
      isFiller(name, s.heading, s.body) ||
      (legacyHeading && isFiller(name, legacyHeading, s.body))
    );
    if (filler && replacement === null) {
      replacement = TODO;
      removed.push(s.heading);
    }

    if (replacement !== null) {
      body = body.slice(0, s.contentStart) + '\n\n' + replacement + '\n\n' + body.slice(s.end);
    }
  }

  // Exactly one blank line after every heading. Some sections kept their body on the
  // line directly below the heading, which renders fine but reads as two different
  // documents when half the file is spaced and half is not.
  body = body.replace(/^(#{1,6} .+)\n(?!\n)(?=\S)/gm, '$1\n\n');
  body = body.replace(/\n{3,}/g, '\n\n').replace(/\s+$/, '');
  return { body, removed };
}

// ---------- Run ----------
let changed = 0;
let legacyStackDropped = 0;
const removedTally = new Map();
const problemFixups = [];
const samples = [];

for (const dir of dirs) {
  const spec = readDoc(dir, 'SPEC.md');
  if (!spec) continue;
  const plan = readDoc(dir, 'PLAN.md');
  const product = readDoc(dir, 'PRODUCT.md');

  const { fm, problem, problemWasOnlyCountry, droppedLegacyStack } = buildFrontmatter(
    dir, spec.text, plan?.text ?? '', product?.text ?? '', spec.frontmatter,
  );
  if (droppedLegacyStack) legacyStackDropped++;

  // A problem statement that is only the country is not a problem statement. Leave the
  // country in frontmatter where it belongs and mark the section for enrichment
  // instead of migrating a known-wrong value into the new shape.
  const problemOverride = problemWasOnlyCountry ? TODO : undefined;
  if (problemWasOnlyCountry) problemFixups.push(fm.id);

  for (const name of DOC_NAMES) {
    const doc = readDoc(dir, name);
    if (!doc) continue;

    const { body, removed } = rewriteBody(name, doc, name === 'SPEC.md' ? problemOverride : undefined);
    for (const h of removed) {
      const k = `${name} › ${h}`;
      removedTally.set(k, (removedTally.get(k) ?? 0) + 1);
    }

    // DESIGN.md already carries an authored design-token block. Preserve it verbatim
    // rather than replacing it with schema frontmatter it was never meant to hold.
    const out = name === 'DESIGN.md' && doc.hasFrontmatter
      ? `---\n${doc.frontmatterRaw}\n---\n\n${body}\n`
      : stringifyFrontmatter(fm, schema) + body + '\n';

    if (out !== doc.text) {
      changed++;
      if (SHOW_DIFF && samples.length < (ONLY_ID ? 5 : 1)) samples.push({ name, id: fm.id, out });
      if (WRITE) writeDocText(dir, name, out);
    }
  }
}

// ---------- Report ----------
console.log(`\nai-os plans format — ${WRITE ? 'APPLIED' : 'dry run'}  (${dirs.length} plan${dirs.length === 1 ? '' : 's'})\n`);
console.log(`  documents that would change: ${changed}`);
console.log(`  problem statements that were only a country: ${problemFixups.length}`);
if (problemFixups.length && !ONLY_ID) {
  console.log(`    → marked for enrichment, country kept in frontmatter`);
}

if (removedTally.size) {
  console.log(`\n  template filler replaced with a TODO marker (identical across >${cloneThreshold} plans):\n`);
  for (const [k, n] of [...removedTally.entries()].sort((a, b) => b[1] - a[1])) {
    console.log(`    ${String(n).padStart(4)} × ${k}`);
  }
}

if (KEEP_FILLER) console.log('\n  --keep-filler: template bodies migrated as-is.');

for (const s of samples) {
  console.log(`\n${'─'.repeat(72)}\n  ${s.id} ${s.name} after formatting:\n${'─'.repeat(72)}`);
  console.log(s.out.split('\n').slice(0, 40).map((l) => `  ${l}`).join('\n'));
}

if (!WRITE) {
  console.log(`\n  Nothing was written. Re-run with --write to apply.`);
  console.log(`  Then: ai-os plans check\n`);
} else {
  console.log(`\n  Wrote ${changed} document${changed === 1 ? '' : 's'}. Next: ai-os plans check\n`);
}
