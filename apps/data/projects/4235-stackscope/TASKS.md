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

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/4235-stackscope/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Build the weekly launch-ingestion pipeline with the documented launch-list source, the weekly cadence, and the freshness check that rejects a stale launch list.
- [ ] Implement the stack-detection engine with the documented methodology, the deterministic pass for a given launch, and the per-launch detection result.
- [ ] Implement the per-launch stack store with the launch schema, the canonical entry per launch, and the stable result that both views read from.
- [ ] Build the weekly view that surfaces the launches and their stacks for the current week and rejects launches older than one week.
- [ ] Build the per-launch detail view that shows the full stack of a single launch and serves as the source of truth for that launch.
- [ ] Add the filter layer that lets the user filter the weekly and history views by stack component (front-end, back-end, CDN, analytics, payments, etc.) with exact-match by default and a documented partial-match opt-in.
- [ ] Implement the history store with the past-weeks view, the bounded retention policy, and the long-tail browse surface.
- [ ] Document the detection methodology on a public docs page that exposes the methodology and the actual stack surface the pass covers.
- [ ] Enforce the view-layer consistency: the weekly view and the per-launch detail view both read from the same per-launch stack store; a divergence is a sync failure and is corrected on the next sync.
- [ ] Write the README that documents the launch-list source, the weekly cadence, the detection methodology, the stack surface, the filter, and the history retention policy.
- [ ] Run an end-to-end test on a representative week: the pipeline picks up new launches, the detection pass returns deterministic stacks, the per-launch store holds canonical results, the weekly view shows launches from the same week only, the detail view shows the full stack of a single launch, the filter narrows the result set by component, the history shows past weeks, and the docs page documents the methodology and the actual surface coverage.

## Phase 2: Deploy

- [ ] Ship the system as a hosted service with the weekly cadence
- [ ] Document the launch-list source, the methodology, and the stack surface in the launch material so users understand what the system covers and how fresh the view is
- [ ] Verify in production