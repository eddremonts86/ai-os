---
id: "3724"
slug: airtight-single-file-portfolio-tracker-zero-servers-wor
title: "Airtight – single-file portfolio tracker, zero servers, works offline"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49487783"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
tech: [Single-file HTML, JavaScript, IndexedDB, CSV parsing, no backend]
---
# Airtight – single-file portfolio tracker, zero servers, works offline

## Phase 0: Scaffold

- [x] Create the project folder under `apps/`
- [x] Initialise the git repo
- [x] Copiar `edd-app-template` → `apps/3724-airtight-single-file-portfolio-tracker-zero-servers-wor/`
- [x] Write SPEC.md (this document)
- [x] Write DESIGN.md (tokens + visual direction)
- [x] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [x] Set up the development environment
- [x] Decide the cost-basis convention (FIFO / LIFO / average) and document it in the README

## Phase 1: Core

- [ ] Lock the broker CSV formats the MVP supports; build a parser-per-format with a clear failure mode for unknown columns
- [ ] Implement the portfolio model (positions, cost basis, current value, P/L)
- [ ] Implement the summary view (allocation, concentration, gainers/losers)
- [ ] Implement IndexedDB persistence and a manual export-state-as-JSON button
- [ ] Write a "verify no network" section for the README with a recorded devtools Network trace

## Phase 2: Deploy

- [ ] Publish a single HTML file as the deliverable, with a SHA-256 per release
- [ ] Document supported CSV formats, cost-basis convention, and offline behavior
- [ ] Verify the no-network invariant on the published file (Network tab = empty after load)

---

_Generated automatically by Lúa on 2026-08-29_
