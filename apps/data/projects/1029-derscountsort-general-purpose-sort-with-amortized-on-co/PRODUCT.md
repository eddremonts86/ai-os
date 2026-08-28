---
id: "1029"
slug: derscountsort-general-purpose-sort-with-amortized-on-co
title: "DersCountsort: General-purpose sort with amortized O(N) complexity"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49314420"
category: ask-hn
date: "2026-08-15"
tags: [Ask HN, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# DersCountsort: General-purpose sort with amortized O(N) complexity

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hi All!If you are interested in sorting algorithms, you will learn something new:
1. It's commonly believed that, on average, comparison sorting can't perform better than O(Nlog(N)). But this is incorrect! The sorting is bounded by O(Clog(C)) where C is the number of unique elements (i.e., Cardinality).
2. In general, sorting has amortized O(N) complexity.My DersCountsort is a sorting algorithm divided into three independent stages:
1. Creating a sorting sequence: O(C*log(C)).
2. Counting the number of unique elements: O(N).
3. Sorting: O(N).For example, you can create a sorting sequence once and then use it many times. This achieves amortized O(N) complexity.In essence, the sorting sequence is what distinguishes DersCountsort from other сounting sorts. Creating the sorting sequence is the hardest part of sorting. However, the sorting sequence once created can be used many times and is even relatively easy to modify when adding several new elements: O(C).Here is my post on LinkedIn: https://www.linkedin.com/pulse/derscountsort-general-purpose-sort-amortized-sergey-derevyago-jzyrf/
The source code: https://ders.by/alg/derscountsort/code.zip
The detailed description of the algorithm: https://ders.by/alg/derscountsort/derscountsort.htmlP.S. To make life more challenging and interesting, I write my articles in Russian. Let me know if you prefer Japanese.

**One-liner:** _[Define the single sentence that explains why this product exists.]_

## Target Users

_Not written yet — `ai-os plans enrich` fills this section._

## Jobs To Be Done

_Not written yet — `ai-os plans enrich` fills this section._

## Success Metrics

_Not written yet — `ai-os plans enrich` fills this section._

## Pricing & Monetization

_TODO:_ define model (freemium / subscription / one-time / marketplace fee).

## Competitive Landscape

_Not written yet — `ai-os plans enrich` fills this section._

## Risks & Open Questions

- [ ] Validate problem with 5 user interviews before MVP
- [ ] Confirm willingness to pay
- [ ] Define compliance scope (GDPR, payments, etc.)

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49314420) · **Category:** ask-hn · **Tags:** Ask HN,Problem
