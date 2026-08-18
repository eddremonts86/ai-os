/**
 * Plan id allocation, shared by every writer of the corpus.
 *
 * CommonJS on purpose: the scraper is `.cjs` and cannot `require()` an ESM module
 * synchronously, while the ESM tooling can import CommonJS without ceremony. One
 * implementation both sides call beats two that agree until they do not.
 *
 * ## Why the filesystem is the source of truth
 *
 * Allocation used to live in the scraper's `state.json` as `nextNumber`, which was correct
 * only while the scraper was the sole writer. Submission intake makes a second writer, and a
 * counter owned by one of two writers is a race. The directory listing is the one thing both
 * already agree on, because it is the thing they both produce.
 *
 * ## Why the counter is still consulted
 *
 * The filesystem alone would reuse an id when the highest-numbered plan is deleted, and a
 * reused id silently points an already-published URL at a different plan. So the stored
 * counter is kept as a high-water mark: allocation takes whichever is greater. It is a hint
 * that survives deletion, not the source of truth.
 *
 * ## Width
 *
 * Ids are zero-padded to at least three digits and may be longer. At the observed intake rate
 * the corpus passes 999 within days, and every consumer that hardcoded exactly three digits
 * would have started skipping plans silently rather than failing. Padding to a minimum rather
 * than a fixed width means 001..999 keep the names they already have on disk and in every
 * published URL: nothing is renamed, four-digit ids simply start working.
 */

const { readdirSync, existsSync, readFileSync, writeFileSync } = require('node:fs');
const { join } = require('node:path');

/** A plan directory: three or more digits, a hyphen, a slug. */
const PLAN_DIR_RE = /^(\d{3,})-(.+)$/;

const MIN_WIDTH = 3;

/** `{ id, num, slug }` for a plan directory name, or null when it is not one. */
function parsePlanDir(name) {
  const m = String(name).match(PLAN_DIR_RE);
  if (!m) return null;
  return { id: m[1], num: parseInt(m[1], 10), slug: m[2] };
}

/** Format a number as a plan id: zero-padded to MIN_WIDTH, wider when the number needs it. */
function formatPlanId(num) {
  return String(num).padStart(MIN_WIDTH, '0');
}

/** Highest id currently on disk, or 0 for an empty corpus. */
function highestOnDisk(projectsDir) {
  if (!existsSync(projectsDir)) return 0;
  return readdirSync(projectsDir).reduce((max, name) => {
    const p = parsePlanDir(name);
    return p && p.num > max ? p.num : max;
  }, 0);
}

/** The stored high-water mark, or 0 when there is no usable state file. */
function storedHighWater(statePath) {
  if (!statePath || !existsSync(statePath)) return 0;
  try {
    const n = JSON.parse(readFileSync(statePath, 'utf8')).nextNumber;
    return Number.isInteger(n) && n > 0 ? n - 1 : 0;
  } catch {
    // A corrupt state file must not wedge allocation. The filesystem still bounds it, and the
    // only thing lost is protection against reusing a deleted top id.
    return 0;
  }
}

/**
 * Allocate `count` consecutive ids without touching disk.
 *
 * Returns `{ ids, nextNumber }`. Callers persist `nextNumber` via `saveHighWater` once their
 * directories exist, so a crash between allocating and writing loses ids rather than
 * duplicating them. Losing an id costs nothing; reusing one corrupts a published URL.
 */
function allocatePlanIds(projectsDir, count = 1, statePath = null) {
  const start = Math.max(highestOnDisk(projectsDir), storedHighWater(statePath)) + 1;
  const ids = [];
  for (let i = 0; i < count; i++) ids.push(formatPlanId(start + i));
  return { ids, nextNumber: start + count };
}

/** Persist the high-water mark, preserving everything else in the state file. */
function saveHighWater(statePath, nextNumber) {
  let state = {};
  if (existsSync(statePath)) {
    try { state = JSON.parse(readFileSync(statePath, 'utf8')); } catch { state = {}; }
  }
  // Never move the mark backwards: a stale caller must not hand out ids a newer one took.
  state.nextNumber = Math.max(state.nextNumber ?? 0, nextNumber);
  writeFileSync(statePath, `${JSON.stringify(state, null, 2)}\n`);
  return state.nextNumber;
}

/** Plan directory names, sorted by id numerically rather than lexicographically. */
function listPlanDirNames(projectsDir) {
  if (!existsSync(projectsDir)) return [];
  return readdirSync(projectsDir)
    .map((name) => ({ name, p: parsePlanDir(name) }))
    .filter((x) => x.p && existsSync(join(projectsDir, x.name, 'SPEC.md')))
    .sort((a, b) => a.p.num - b.p.num)
    .map((x) => x.name);
}

module.exports = {
  PLAN_DIR_RE,
  MIN_WIDTH,
  parsePlanDir,
  formatPlanId,
  highestOnDisk,
  storedHighWater,
  allocatePlanIds,
  saveHighWater,
  listPlanDirNames,
};
