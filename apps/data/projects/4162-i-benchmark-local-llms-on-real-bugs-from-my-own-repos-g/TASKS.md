---
id: "4162"
slug: i-benchmark-local-llms-on-real-bugs-from-my-own-repos-g
title: "I benchmark local LLMs on real bugs from my own repo's Git history"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49511401"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# I benchmark local LLMs on real bugs from my own repo's Git history

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/4162-i-benchmark-local-llms-on-real-bugs-from-my-own-repos-g/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Build the sealed-criteria verdict engine: the machine-computed verdict, the sealed criteria the operator never writes, the per-arena criterion table.
- [ ] Implement the TEXT arena: the "write the news" task surface, the verdict, the per-arena standings.
- [ ] Implement the VISION arena: the "read the screen" task surface, the verdict, the per-arena standings.
- [ ] Implement the CODE arena: the real-shipped-fix task surface, the regression test that caught the bug kept, the throwaway-worktree runner that never merges the model's answer, the verdict.
- [ ] Implement the YARD arena (no runs at launch): the "read real photos" task surface, the verdict surface ready for the first run.
- [ ] Build the per-arena standings and episode tables: model / runs / held / crowned / split columns, date / contender / champion / verdict / per-task metrics / episode link rows.
- [ ] Wire the single-RTX-3090 reproducibility claim: the hardware spec on every episode, the verification that the verdict is reproducible on the same hardware, the "hardware mismatch" warning on a different GPU.
- [ ] Run an end-to-end test: a local-LLM operator runs the model on the TEXT, VISION, and CODE arenas on a single RTX 3090, sees the per-arena standings update with the model's runs / held / crowned / split, sees the per-arena episode tables populate, verifies the CODE-arena answer ran in a throwaway worktree and was never merged, and confirms the verdict is reproducible on the same hardware.

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy the benchmark at informant.reiners.io/gauntlet with the four-arena surface, the standings, and the episode tables
- [ ] Document the sealed-criteria guarantee, the real-shipped-fix coverage, the throwaway-worktree isolation, and the single-RTX-3090 reproducibility claim in the README
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-31_
