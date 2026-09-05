---
id: "4206"
slug: our-glm-53-flash-switchless-recipe-is-now-out-for-4x-dg
title: "Our GLM-5.3 Flash Switchless recipe is now out for 4x DGX Sparks"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49508834"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Our GLM-5.3 Flash Switchless recipe is now out for 4x DGX Sparks

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/4206-our-glm-53-flash-switchless-recipe-is-now-out-for-4x-dg/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Document the five user-supplied values (4 node IPs + fabric scheme) at the top of `docs/recipe.md`
- [ ] Wire the ring fabric via `scripts/fabric-setup.sh` on every boot
- [ ] Stage GLM-5.3-Flash NVFP4 weights, DFlash2 drafter, patched NCCL, and the vLLM image on every node
- [ ] Launch workers in rank order 3→2→1 headless
- [ ] Launch head (rank 0) and watch weight load + compile + warmup
- [ ] Run `gate.sh` (needle + tool-call + warm decode) and gate serving on it passing
- [ ] Expose OpenAI-compatible endpoint on `:8000` with model id `glm-5.3-flash`
- [ ] Write runbook for the gotchas in `docs/gotchas.md`

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Document the supply-chain reality (cheapest box sold out UK-wide; 400G part pre-sold into October) in `docs/switches.md`
- [ ] Optional: add a fifth-node path with a switched topology (recipe explicitly excludes switchless-ring scaling past four)