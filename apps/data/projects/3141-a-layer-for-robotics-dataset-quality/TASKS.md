---
id: "3141"
slug: a-layer-for-robotics-dataset-quality
title: A Layer for robotics dataset quality
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49448788"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
---
# A Layer for robotics dataset quality

## Phase 0: Scaffold

- [ ] Create the repo and Python package layout
- [ ] Implement a reader for one episodic robotics dataset format
- [ ] Define the per-episode signal and manifest schemas
- [ ] Write SPEC.md, PRODUCT.md, PLAN.md, TASKS.md, DESIGN.md

## Phase 1: Core

- [ ] Compute per-episode statistics over a full dataset
- [ ] Implement the first quality signals with per-episode reasons
- [ ] Implement subset selection emitting a manifest, not a copy
- [ ] Add a review view so a human can override any exclusion
- [ ] Run the audit on a design partner's dataset and compare training outcomes

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify (or chosen host)
- [ ] Verify in production
