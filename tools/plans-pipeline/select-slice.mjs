#!/usr/bin/env node
/**
 * Pick which plans this run should enrich.
 *
 * Enrichment needs an agent, so it is the expensive step and the only one that cannot be
 * batched without bound. This picks an adaptive slice:
 *
 *   1. every plan that arrived since the last run  — so the site is never stale
 *   2. then the oldest unauthored plans            — so the backlog actually drains
 *
 * capped at --cap. Newest-first-then-oldest matters: fresh capture is what a reader came
 * for, but a pure newest-first queue starves the backlog forever, and a pure oldest-first
 * queue means today's capture waits weeks. The cap is what keeps a run's cost predictable
 * whether the backlog is 239 plans or zero.
 *
 * Writes the slice to a manifest the agent reads, and advances `lastSeenId` so plans that
 * arrived but did not fit stop counting as new and join the oldest-first queue instead.
 *
 * Usage: select-slice.mjs [--cap N] [--json] [--dry-run]
 */

import { readFileSync, writeFileSync, mkdirSync, existsSync } from 'node:fs';
import { join, dirname } from 'node:path';
import { fileURLToPath } from 'node:url';
import { listPlanDirs, planIdSlug, readDoc, AI_OS_ROOT } from '../plan-format/lib/plan.mjs';

const HERE = dirname(fileURLToPath(import.meta.url));
const STATE_PATH = join(HERE, 'state.json');
const OUT_DIR = join(AI_OS_ROOT, 'outputs', 'plans-pipeline');
const SLICE_PATH = join(OUT_DIR, 'slice.json');

const argv = process.argv.slice(2);
const has = (f) => argv.includes(f);
const val = (f) => { const i = argv.indexOf(f); return i === -1 ? null : argv[i + 1]; };

const CAP = Math.max(1, parseInt(val('--cap') ?? '25', 10));
const AS_JSON = has('--json');
const DRY_RUN = has('--dry-run');

// A plan is a candidate while its prose is not authored yet. `legacy` means no frontmatter
// at all (raw scraper output); `draft` means the formatter has shaped it but nobody has
// written it. Anything further along is already published and must not be rewritten.
const UNAUTHORED = new Set(['legacy', 'draft']);

function readState() {
  if (!existsSync(STATE_PATH)) return { lastSeenId: '000', lastRunAt: null, runs: 0 };
  try {
    return JSON.parse(readFileSync(STATE_PATH, 'utf8'));
  } catch {
    // A corrupt state file must not wedge the pipeline: treat it as a first run. The worst
    // case is that everything looks new once, which the cap still bounds.
    return { lastSeenId: '000', lastRunAt: null, runs: 0 };
  }
}

const state = readState();
const lastSeen = parseInt(state.lastSeenId ?? '000', 10);

const all = [];
for (const dir of listPlanDirs()) {
  const parsed = planIdSlug(dir);
  if (!parsed) continue;
  const spec = readDoc(dir, 'SPEC.md');
  all.push({
    id: parsed.id,
    num: parseInt(parsed.id, 10),
    slug: parsed.slug,
    status: spec?.frontmatter?.status ?? 'legacy',
  });
}

const candidates = all.filter((p) => UNAUTHORED.has(p.status));
const fresh = candidates.filter((p) => p.num > lastSeen).sort((a, b) => a.num - b.num);
const backlog = candidates.filter((p) => p.num <= lastSeen).sort((a, b) => a.num - b.num);

const slice = [...fresh, ...backlog].slice(0, CAP);
const highest = all.reduce((max, p) => Math.max(max, p.num), lastSeen);

const manifest = {
  generatedAt: new Date().toISOString(),
  cap: CAP,
  corpusTotal: all.length,
  published: all.filter((p) => !UNAUTHORED.has(p.status)).length,
  unauthored: candidates.length,
  freshThisRun: fresh.length,
  backlogRemaining: Math.max(0, candidates.length - slice.length),
  ids: slice.map((p) => p.id),
  plans: slice.map((p) => ({ id: p.id, slug: p.slug, status: p.status })),
};

if (!DRY_RUN) {
  mkdirSync(OUT_DIR, { recursive: true });
  writeFileSync(SLICE_PATH, `${JSON.stringify(manifest, null, 2)}\n`);
  writeFileSync(STATE_PATH, `${JSON.stringify({
    lastSeenId: String(highest).padStart(3, '0'),
    lastRunAt: manifest.generatedAt,
    runs: (state.runs ?? 0) + 1,
  }, null, 2)}\n`);
}

if (AS_JSON) {
  console.log(JSON.stringify(manifest, null, 2));
} else {
  console.log(`[slice] corpus ${manifest.corpusTotal} · published ${manifest.published} · unauthored ${manifest.unauthored}`);
  console.log(`[slice] fresh this run ${manifest.freshThisRun} · cap ${CAP} · backlog left after this run ${manifest.backlogRemaining}`);
  console.log(`[slice] selected ${slice.length}: ${manifest.ids.join(' ') || '(none)'}`);
  if (!DRY_RUN) console.log(`[slice] manifest → ${SLICE_PATH}`);
}

// Exit 3 when there is nothing to enrich, so the caller can skip the agent step entirely
// instead of burning a model call to discover the queue is empty.
process.exit(slice.length === 0 ? 3 : 0);
