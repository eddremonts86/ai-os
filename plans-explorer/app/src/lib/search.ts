/**
 * Search + facet filters.
 *
 * Strategy: apply facet filters first (cheap, exact-match), then run Fuse.js
 * only on the remaining plans. Returns the same Plan[] shape Fuse would.
 */

import Fuse from 'fuse.js';
import type { Plan, SortKey } from '@/types';

export interface SearchFilters {
  query: string;
  categories: string[];
  tags: string[];
  tech: string[];
  countries: string[];
  wtpRange: [number, number] | null; // inclusive [min, max] in USD/mo
  hasWtpOnly: boolean;
}

export const EMPTY_FILTERS: SearchFilters = {
  query: '',
  categories: [],
  tags: [],
  tech: [],
  countries: [],
  wtpRange: null,
  hasWtpOnly: false,
};

function matchesFacets(p: Plan, f: SearchFilters): boolean {
  if (f.categories.length && !f.categories.includes(p.category)) return false;
  if (f.tags.length && !p.tags.some((t) => f.tags.includes(t))) return false;
  if (f.tech.length && !p.tech.some((t) => f.tech.includes(t))) return false;
  if (f.countries.length && (!p.country || !f.countries.includes(p.country))) return false;

  if (f.hasWtpOnly && (p.wtp == null || p.wtp.mrrMid == null)) return false;

  if (f.wtpRange) {
    const [lo, hi] = f.wtpRange;
    const mrr = p.wtp?.mrrMid;
    // Include plans with no wtp at the edges only if the range covers 0.
    if (mrr == null) {
      if (lo > 0) return false;
    } else {
      if (mrr < lo || mrr > hi) return false;
    }
  }

  return true;
}

const FUSE_KEYS = [
  { name: 'title', weight: 2 },
  { name: 'excerpt', weight: 1 },
  { name: 'tags', weight: 1 },
  { name: 'tech', weight: 1 },
  { name: 'category', weight: 0.5 },
];

export function searchAndFilter(plans: Plan[], f: SearchFilters): Plan[] {
  const filtered = plans.filter((p) => matchesFacets(p, f));

  if (!f.query.trim()) return filtered;

  const fuse = new Fuse(filtered, {
    keys: FUSE_KEYS,
    threshold: 0.35,
    ignoreLocation: true,
    includeScore: false,
  });
  return fuse.search(f.query.trim()).map((r) => r.item);
}

export function sortPlans(plans: Plan[], key: SortKey): Plan[] {
  const out = [...plans];
  switch (key) {
    case 'money-desc':
      return out.sort((a, b) => (b.scores.money ?? -1) - (a.scores.money ?? -1));
    case 'learn-desc':
      return out.sort((a, b) => (b.scores.learn ?? -1) - (a.scores.learn ?? -1));
    case 'fun-desc':
      return out.sort((a, b) => (b.scores.fun ?? -1) - (a.scores.fun ?? -1));
    case 'mrrMid-desc':
      return out.sort((a, b) => (b.wtp?.mrrMid ?? -1) - (a.wtp?.mrrMid ?? -1));
    case 'date-desc':
      return out.sort((a, b) => (b.date ?? '').localeCompare(a.date ?? ''));
    case 'title-asc':
      return out.sort((a, b) => a.title.localeCompare(b.title));
    default:
      return out;
  }
}

// ---------- Facet counting ----------

export function countByCategory(plans: Plan[]): Map<string, number> {
  const m = new Map<string, number>();
  for (const p of plans) m.set(p.category, (m.get(p.category) ?? 0) + 1);
  return m;
}

export function countByTags(plans: Plan[]): Map<string, number> {
  const m = new Map<string, number>();
  for (const p of plans) for (const t of p.tags) m.set(t, (m.get(t) ?? 0) + 1);
  return m;
}

export function countByTech(plans: Plan[]): Map<string, number> {
  const m = new Map<string, number>();
  for (const p of plans) for (const t of p.tech) m.set(t, (m.get(t) ?? 0) + 1);
  return m;
}

export function countByCountry(plans: Plan[]): Map<string, number> {
  const m = new Map<string, number>();
  for (const p of plans) if (p.country) m.set(p.country, (m.get(p.country) ?? 0) + 1);
  return m;
}
