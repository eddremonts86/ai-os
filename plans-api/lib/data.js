// plans-api/lib/data.js
//
// Loads plans.json + rankings.json + meta.json from the plans-explorer indexer
// output into in-memory snapshots. Filtering and sorting are pure functions
// of the snapshot, so the route handlers stay thin.

import { readFileSync, statSync, existsSync } from 'node:fs';
import { join, resolve } from 'node:path';

const DEFAULT_DATA_DIR = resolve(
  import.meta.dirname, '..', '..',
  'plans-explorer', 'app', 'public', 'data'
);

export function dataDir() {
  return process.env.PLANS_DATA_DIR
    ? resolve(process.env.PLANS_DATA_DIR)
    : DEFAULT_DATA_DIR;
}

function safeRead(path) {
  try {
    return JSON.parse(readFileSync(path, 'utf8'));
  } catch (e) {
    return null;
  }
}

// Read all 3 base files. Returns { plans, rankings, meta, mtime }.
//   plans    : Plan[]   (one per id)
//   rankings : { money: [{id,score,title}], learn: [...], fun: [...] }
//   meta     : { generatedAt, total, source }
//   mtime    : Date     (last refresh, used by /api/stats)
export function loadAll() {
  const dir = dataDir();
  const plans = safeRead(join(dir, 'plans.json')) ?? [];
  const rankings = safeRead(join(dir, 'rankings.json')) ?? { money: [], learn: [], fun: [] };
  const meta = safeRead(join(dir, 'meta.json')) ?? {};
  let mtime = null;
  try {
    mtime = statSync(join(dir, 'plans.json')).mtime;
  } catch {}
  return { plans, rankings, meta, mtime, dataDir: dir };
}

// Lazy-load per-plan documents (SPEC/PRODUCT/PLAN/DESIGN/TASKS) from
// plans-explorer/app/public/data/documents/<id>.json. The plans-explorer
// indexer writes one JSON per plan containing all 5 doc bodies.
export function loadPlanDocs(id) {
  const dir = dataDir();
  const path = join(dir, 'documents', `${id}.json`);
  if (!existsSync(path)) return null;
  return safeRead(path);
}

// ── Filter / sort ────────────────────────────────────────────────────────────

function lower(s) { return typeof s === 'string' ? s.toLowerCase() : s; }

function matchesQ(plan, q) {
  if (!q) return true;
  const needle = q.toLowerCase();
  const haystack = [
    plan.title, plan.excerpt,
    ...(plan.tags ?? []), ...(plan.tech ?? [])
  ].filter(Boolean).join(' ').toLowerCase();
  return haystack.includes(needle);
}

function matchesArray(planField, csv) {
  if (!csv) return true;
  const wanted = csv.split(',').map(s => s.trim().toLowerCase()).filter(Boolean);
  if (wanted.length === 0) return true;
  const have = (planField ?? []).map(lower);
  return wanted.some(w => have.includes(w));
}

function matchesWtp(plan, min, max) {
  const mrr = plan?.wtp?.mrrMid;
  if (min != null) {
    if (mrr == null || mrr < min) return false;
  }
  if (max != null) {
    if (mrr == null || mrr > max) return false;
  }
  return true;
}

const SORTERS = {
  'date-desc':  (a, b) => (b.date || '').localeCompare(a.date || ''),
  'date-asc':   (a, b) => (a.date || '').localeCompare(b.date || ''),
  'money-desc': (a, b) => (b?.scores?.money ?? -1) - (a?.scores?.money ?? -1),
  'mrr-desc':   (a, b) => (b?.wtp?.mrrMid ?? -1) - (a?.wtp?.mrrMid ?? -1),
  'title-asc':  (a, b) => (a.title || '').localeCompare(b.title || ''),
};

export function filterPlans(plans, query) {
  const {
    q, tech, category, tag, country, wtp_min, wtp_max, sort = 'date-desc',
    limit = 50, offset = 0
  } = query;
  const lim = Math.min(Math.max(parseInt(limit, 10) || 50, 1), 200);
  const off = Math.max(parseInt(offset, 10) || 0, 0);
  const wtpMin = wtp_min != null ? parseFloat(wtp_min) : null;
  const wtpMax = wtp_max != null ? parseFloat(wtp_max) : null;

  const matched = plans.filter(p =>
    matchesQ(p, q) &&
    matchesArray(p.tech, tech) &&
    (category ? lower(p.category) === lower(category) : true) &&
    matchesArray(p.tags, tag) &&
    (country ? lower(p.country) === lower(country) : true) &&
    matchesWtp(p, wtpMin, wtpMax)
  );

  const sorter = SORTERS[sort] ?? SORTERS['date-desc'];
  matched.sort(sorter);

  return {
    total: matched.length,
    limit: lim,
    offset: off,
    results: matched.slice(off, off + lim)
  };
}

// Aggregate counts for facets. Returns a stable shape for UI consumption.
export function buildFacets(plans) {
  const tech = new Map();
  const tag = new Map();
  const category = new Map();
  const country = new Map();
  for (const p of plans) {
    for (const t of (p.tech ?? [])) tech.set(t, (tech.get(t) ?? 0) + 1);
    for (const t of (p.tags ?? [])) tag.set(t, (tag.get(t) ?? 0) + 1);
    if (p.category) category.set(p.category, (category.get(p.category) ?? 0) + 1);
    if (p.country) country.set(p.country, (country.get(p.country) ?? 0) + 1);
  }
  const toSorted = (m) => [...m.entries()]
    .map(([value, count]) => ({ value, count }))
    .sort((a, b) => b.count - a.count || a.value.localeCompare(b.value));
  return {
    tech: toSorted(tech),
    tag: toSorted(tag),
    category: toSorted(category),
    country: toSorted(country)
  };
}
