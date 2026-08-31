---
id: "3892"
slug: drop-a-sql-schema-get-an-interactive-er-diagram
title: "Drop a SQL schema, get an interactive ER diagram"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49497500"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [SQL parser, libpg_query, WebGL rendering, React Flow, Monaco editor, static site]
---
# Drop a SQL schema, get an interactive ER diagram

## Phase 0: Scaffold

- [x] Read the Show HN capture and confirm it is URL-only
- [x] Write SPEC.md, PRODUCT.md, PLAN.md and TASKS.md
- [x] Scaffold the static site, editor and canvas
- [x] Decide the first supported SQL dialect and document it

## Phase 1: Core

- [ ] Parse CREATE TABLE statements into tables and columns
- [ ] Extract foreign-key relationships into edges
- [ ] Layout the graph and render it on the interactive canvas
- [ ] Add click-to-highlight for related tables

## Phase 2: Deploy

- [ ] Add export to image and shareable link
- [ ] Surface parse errors honestly for unsupported constructs
- [ ] Expand dialect coverage with a seeded schema test set
- [ ] Deploy the public tool and measure parse success rate
