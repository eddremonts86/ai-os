---
id: "4193"
slug: cut-list-studio-a-fast-private-client-side-2d1d-sheet-o
title: "Cut List Studio – A fast, private, client-side 2D/1D sheet optimizer"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49509619"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Cut List Studio – A fast, private, client-side 2D/1D sheet optimizer

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/4193-cut-list-studio-a-fast-private-client-side-2d1d-sheet-o/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] React + TypeScript app shell with Simple Mode (2-step) and Advanced Studio Mode (3-step)
- [ ] Inputs for raw sheet dimensions, saw kerf, edge-banding thickness, premill allowance, and factory-edge trim
- [ ] 2D bin-packing algorithm with kerf, grain, and edge-banding constraints
- [ ] 1D cutting-stock algorithm for dimensional lumber and aluminum extrusion
- [ ] Guillotine constraint checker (no internal plunge cuts)
- [ ] Topological DAG batch planner grouping identical cuts across sheets into unified setups
- [ ] Interactive nesting diagram with numbered cut badges, edge-banding stripes, and hatched waste
- [ ] Saw step sequence panel with All Cuts and per-setup views
- [ ] PDF export with diagram, saw sequence, BOM, Sawyer Checklist, and quotation breakdown
- [ ] Browser-local persistence in IndexedDB or localStorage; no network calls during a session

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy marketing and docs site to Coolify
- [ ] Verify in production
- [ ] Optional self-hosted instance with Docker for users who want a local-network tool page