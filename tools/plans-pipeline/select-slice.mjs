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

/**
 * How long a selected plan stays claimed.
 *
 * The pipeline's critical section spans four separate processes — prepare, the agent's
 * authoring, verify, ship — so a lock held by one invocation cannot protect it: it is
 * released the moment `prepare` exits, while authoring still has hours to run. The next
 * tick would then select the very same plans, because plans being written are still
 * unauthored, and two agents would write the same 25 and race each other's commits.
 *
 * Claims fix that without a long-lived lock: a selected plan is off the table for a while,
 * so overlapping runs get disjoint slices instead of mutual exclusion. The TTL only needs
 * to outlast authoring; an abandoned claim expires on its own, and a plan that was claimed
 * but never written simply comes back into the queue.
 */
const CLAIM_TTL_HOURS = Math.max(1, parseInt(val('--claim-ttl') ?? '8', 10));

// A plan is a candidate while its prose is not authored yet. `legacy` means no frontmatter
// at all (raw scraper output); `draft` means the formatter has shaped it but nobody has
// written it. Anything further along is already published and must not be rewritten.
const UNAUTHORED = new Set(['legacy', 'draft']);

function readState() {
  const empty = { lastSeenId: '000', lastRunAt: null, runs: 0, claims: {} };
  if (!existsSync(STATE_PATH)) return empty;
  try {
    return { ...empty, ...JSON.parse(readFileSync(STATE_PATH, 'utf8')) };
  } catch {
    // A corrupt state file must not wedge the pipeline: treat it as a first run. The worst
    // case is that everything looks new once, which the cap still bounds.
    return empty;
  }
}

const state = readState();
const lastSeen = parseInt(state.lastSeenId ?? '000', 10);

const now = Date.now();
const ttlMs = CLAIM_TTL_HOURS * 3600 * 1000;
const liveClaims = Object.fromEntries(
  Object.entries(state.claims ?? {}).filter(([, at]) => {
    const t = Date.parse(at);
    return Number.isFinite(t) && now - t < ttlMs;
  }),
);

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

const unauthored = all.filter((p) => UNAUTHORED.has(p.status));
const candidates = unauthored.filter((p) => !liveClaims[p.id]);
const claimedOut = unauthored.length - candidates.length;

const fresh = candidates.filter((p) => p.num > lastSeen).sort((a, b) => a.num - b.num);
const backlog = candidates.filter((p) => p.num <= lastSeen).sort((a, b) => a.num - b.num);

const slice = [...fresh, ...backlog].slice(0, CAP);
const highest = all.reduce((max, p) => Math.max(max, p.num), lastSeen);

const manifest = {
  generatedAt: new Date().toISOString(),
  cap: CAP,
  claimTtlHours: CLAIM_TTL_HOURS,
  corpusTotal: all.length,
  published: all.filter((p) => !UNAUTHORED.has(p.status)).length,
  unauthored: unauthored.length,
  claimedByAnotherRun: claimedOut,
  freshThisRun: fresh.length,
  backlogRemaining: Math.max(0, candidates.length - slice.length),
  ids: slice.map((p) => p.id),
  plans: slice.map((p) => ({ id: p.id, slug: p.slug, status: p.status })),
};

if (!DRY_RUN) {
  mkdirSync(OUT_DIR, { recursive: true });
  writeFileSync(SLICE_PATH, `${JSON.stringify(manifest, null, 2)}\n`);

  // Claim what this run took, and carry forward the claims that are still live. Expired
  // ones are dropped here rather than accumulating forever.
  const claims = { ...liveClaims };
  for (const p of slice) claims[p.id] = manifest.generatedAt;

  writeFileSync(STATE_PATH, `${JSON.stringify({
    lastSeenId: String(highest).padStart(3, '0'),
    lastRunAt: manifest.generatedAt,
    runs: (state.runs ?? 0) + 1,
    claims,
  }, null, 2)}\n`);
}

if (AS_JSON) {
  console.log(JSON.stringify(manifest, null, 2));
} else {
  console.log(`[slice] corpus ${manifest.corpusTotal} · published ${manifest.published} · unauthored ${manifest.unauthored}`);
  if (claimedOut) console.log(`[slice] ${claimedOut} held by another run's claim (ttl ${CLAIM_TTL_HOURS}h)`);
  console.log(`[slice] fresh this run ${manifest.freshThisRun} · cap ${CAP} · backlog left after this run ${manifest.backlogRemaining}`);
  console.log(`[slice] selected ${slice.length}: ${manifest.ids.join(' ') || '(none)'}`);
  if (!DRY_RUN) console.log(`[slice] manifest → ${SLICE_PATH}`);
}

// Exit 3 when there is nothing to enrich, so the caller can skip the agent step entirely
// instead of burning a model call to discover the queue is empty.
process.exit(slice.length === 0 ? 3 : 0);
