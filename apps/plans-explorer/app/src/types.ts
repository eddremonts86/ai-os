/**
 * Shared types — mirror the shape produced by scripts/build-index.mjs.
 */

export interface Wtp {
  raw: string;
  currency: string | null;
  min: number | null;
  max: number | null;
  period: 'month' | 'year' | 'one-shot' | 'week' | null;
  mrrMid: number | null;
}

export interface Scores {
  money: number | null;
  learn: number | null;
  fun: number | null;
}

export interface Plan {
  id: string;
  slug: string;
  title: string;
  category: string;
  categories: string[];
  tags: string[];
  date: string | null;
  country: string | null;
  tech: string[];
  sourceUrl: string | null;
  sourceName: string | null;
  wtp: Wtp | null;
  excerpt: string;
  originalExcerpt?: string;
  scores: Scores;
  assets: string[];
}

export interface RankEntry {
  id: string;
  score: number;
  hook: string;
}

export interface Rankings {
  money: RankEntry[];
  learn: RankEntry[];
  fun: RankEntry[];
}

export interface PlanDocument {
  SPEC?: string;
  PRODUCT?: string;
  PLAN?: string;
  DESIGN?: string;
  TASKS?: string;
}

export type SortKey =
  | 'money-desc'
  | 'learn-desc'
  | 'fun-desc'
  | 'mrrMid-desc'
  | 'date-desc'
  | 'title-asc';
