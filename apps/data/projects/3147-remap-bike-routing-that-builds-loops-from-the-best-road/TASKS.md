---
id: "3147"
slug: remap-bike-routing-that-builds-loops-from-the-best-road
title: "Remap – bike routing that builds loops from the best roads, on-device"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49448085"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
---
# Remap – bike routing that builds loops from the best roads, on-device

## Phase 0: Scaffold

- [ ] Create the repo and mobile app scaffold
- [ ] Build the road-data import and graph pack format
- [ ] Implement pack download and on-device storage
- [ ] Write SPEC.md, PRODUCT.md, PLAN.md, TASKS.md, DESIGN.md

## Phase 1: Core

- [ ] Derive per-segment road-quality attributes from the open data
- [ ] Implement loop generation for a start point and target distance
- [ ] Weight the search toward higher-quality segments
- [ ] Render the loop with elevation and distance and allow regeneration
- [ ] Verify the whole flow works with networking disabled

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify (or chosen host)
- [ ] Verify in production
