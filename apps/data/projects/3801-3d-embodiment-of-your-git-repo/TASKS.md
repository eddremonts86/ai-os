---
id: "3801"
slug: "3d-embodiment-of-your-git-repo"
title: "3D Embodiment of your Git repo"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49491794"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
tech: [React Three Fiber, instanced WebGL rendering, squarified treemap layout, GitHub REST API, Greptile API, Vercel functions]
---
# 3D Embodiment of your Git repo

## Phase 0: Scaffold

- [x] Read the repository README to confirm the pipeline stages, determinism and read-only guarantees
- [x] Write SPEC.md (this document)
- [x] Implement repo URL → tree/issues/PRs fetch (GET only) with the fetch instrumentation proving no writes
- [x] Implement the squarified-treemap city layout seeded from file paths

## Phase 1: Core

- [ ] Implement the R3F city scene within the performance budget (instancing, shared geometry, top-only tiles)
- [ ] Implement dependency edges, hazards and the Greptile risk layer streaming in progressively
- [ ] Implement the chase simulation and the review panel fed by kill events
- [ ] Deploy on Vercel with server-side credential injection via api/ functions

## Phase 2: Deploy

- [ ] Harden large-repo behavior, GitHub rate-limit handling and error states
- [ ] Publish the read-only verification results (deploy-and-kill fetch instrumentation)
- [ ] Validate whether the city metaphor aids real onboarding work beyond the demo

---

_Generated automatically by Lúa on 2026-08-29_
