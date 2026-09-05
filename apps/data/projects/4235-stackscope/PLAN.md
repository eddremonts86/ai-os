---
id: "4235"
slug: stackscope
title: StackScope
status: enriched
source:
  name: ProductHunt
  url: "https://www.producthunt.com/products/stackscope-dev"
category: product-launch
date: "2026-08-08"
tags: [ProductHunt, Product Launch]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# StackScope

## Tech Stack

- **A weekly launch-ingestion pipeline** that picks up new site launches on a documented cadence (the source of the launch list is the system's claim).
- **A stack-detection engine** that runs a pass on each new launch (the source names no specific methodology; the methodology is the system's claim).
- **A per-launch stack store** that holds the detection result for each launch.
- **A weekly view** that surfaces the launches and their stacks for the current week.
- **A per-launch detail view** that shows the full stack of a single launch.
- **A filter layer** that lets the user filter by stack component (front-end, back-end, CDN, analytics, payments, etc.).
- **A history store** of past weeks the user can browse.
- **A methodology documentation surface** that exposes the detection methodology to the user.

## Architecture

The system is a hosted service backed by four components: a launch-ingestion pipeline, a stack-detection engine, a per-launch stack store, and a view layer. The launch-ingestion pipeline picks up new site launches weekly; the detection engine runs a stack-detection pass on each launch; the store holds the per-launch result; the view layer exposes the weekly view, the per-launch detail view, the filter, and the history.

The launch-ingestion pipeline is the system's source of new launches. The source of the launch list is the system's claim (a registry, a feed, a curated list, or a crawl). The cadence is weekly; a launch the pipeline misses is a coverage gap.

The stack-detection engine reads the public surface of each launch and applies the documented methodology. The methodology is the system's claim; the source names no specific methodology. The pass is deterministic for a given launch so the per-launch store stays stable.

The per-launch stack store holds the detection result. Each launch has a single canonical entry; the weekly view and the detail view read from the same store. A divergence is a sync failure.

The view layer exposes the weekly view, the per-launch detail view, the filter, and the history. The weekly view is per-week; a view that aggregates across weeks is a UX regression. The detail view is the source of truth for a single launch; the filter is configurable per stack component.

The history store is bounded by a documented retention policy. The user can browse past weeks; a history that grows unbounded is a coverage gap, not a feature. The retention is the system's claim.

The methodology documentation surface exposes the detection methodology in the docs. An undocumented methodology is a coverage gap; the surface is a docs page, not a hidden config.

## Milestones

1. **M1 — Launch-ingestion pipeline** — the documented source of launches, the weekly cadence, the launch-list freshness check.
2. **M2 — Stack-detection engine** — the documented methodology, the deterministic pass, the per-launch result.
3. **M3 — Per-launch stack store** — the launch schema, the canonical entry, the stable result.
4. **M4 — Weekly view** — the per-week surface, the launches and their stacks, the freshness check.
5. **M5 — Per-launch detail view** — the full stack of a single launch, the source-of-truth contract.
6. **M6 — Filter layer** — the stack-component filter, the per-component match, the filter UX.
7. **M7 — History store** — the past-weeks view, the bounded retention, the long-tail browse.
8. **M8 — Methodology documentation** — the docs page, the public methodology, the coverage of the documented surface.

## Risks

- **Launch-ingestion drifts** — the launch list is from a stale source. Mitigation: the launch-list freshness check runs every cycle; a stale source is a logged failure and is replaced.
- **Detection pass is non-deterministic** — the same launch returns different stacks on different cycles. Mitigation: the pass is deterministic for a given launch; a non-deterministic result is a test failure.
- **Stack surface undocumented** — the docs say the system covers a surface the pass does not actually cover. Mitigation: the methodology documentation is updated with the pass's actual coverage; a documentation gap is a milestone, not a silent regression.
- **Weekly view drifts past launch week** — the user sees a launch from three weeks ago in the current weekly view. Mitigation: the freshness check rejects launches older than one week; the view is per-week by construction.
- **Detail view diverges from the weekly view** — the same launch shows different stacks. Mitigation: both views read from the same per-launch store; a divergence is a sync failure and is corrected on the next sync.
- **Filter UX hides launches** — the user filters by a component and the result set drops a launch they wanted to see. Mitigation: the filter is exact-match by default; a partial-match mode is a deliberate opt-in.
- **History grows unbounded** — the user can browse past weeks but the storage cost balloons. Mitigation: the retention policy is documented; the history is bounded; a storage hit is a coverage gap, not a silent failure.