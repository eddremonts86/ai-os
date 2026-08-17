/**
 * plans.json loader + cache.
 *
 * Loads the build-time generated plans.json once per session and exposes
 * typed accessors. The SPA uses fetch() so we get HTTP caching + lazy subdocs.
 */

import type { Plan, Rankings, PlanDocument } from '@/types';

const PLANS_URL = './data/plans.json';
const RANKINGS_URL = './data/rankings.json';
const META_URL = './data/meta.json';

let plansCache: Plan[] | null = null;
let rankingsCache: Rankings | null = null;
let indexedAtCache: string | null = null;
let docsCache = new Map<string, Promise<PlanDocument | null>>();

export async function loadPlans(): Promise<Plan[]> {
  if (plansCache) return plansCache;
  const res = await fetch(PLANS_URL);
  if (!res.ok) throw new Error(`failed to load plans.json: ${res.status}`);
  const data = (await res.json()) as Plan[];
  plansCache = data;
  return data;
}

export async function loadRankings(): Promise<Rankings> {
  if (rankingsCache) return rankingsCache;
  const res = await fetch(RANKINGS_URL);
  if (!res.ok) throw new Error(`failed to load rankings.json: ${res.status}`);
  const data = (await res.json()) as Rankings;
  rankingsCache = data;
  return data;
}

/**
 * Build date from the indexer. Returns null instead of throwing: the footer that
 * consumes this is decorative, and a missing meta.json must not blank the page.
 */
export async function loadIndexedAt(): Promise<string | null> {
  if (indexedAtCache) return indexedAtCache;
  try {
    const res = await fetch(META_URL);
    if (!res.ok) return null;
    const data = (await res.json()) as { indexedAt?: string };
    indexedAtCache = data.indexedAt ?? null;
    return indexedAtCache;
  } catch {
    return null;
  }
}

export async function loadPlanDocument(id: string): Promise<PlanDocument | null> {
  const cached = docsCache.get(id);
  if (cached) return cached;
  const p = fetch(`./data/documents/${id}.json`).then(async (res) => {
    if (!res.ok) return null;
    return (await res.json()) as PlanDocument;
  });
  docsCache.set(id, p);
  return p;
}

export function getPlanById(plans: Plan[], id: string): Plan | undefined {
  return plans.find((p) => p.id === id);
}
