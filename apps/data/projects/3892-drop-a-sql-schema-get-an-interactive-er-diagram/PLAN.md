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

## Tech Stack

- **SQL parser:** the foundation; libpg_query for PostgreSQL-family DDL with a fallback dialect layer.
- **React Flow:** the interactive canvas — nodes, edges, zoom and selection.
- **WebGL rendering:** for very large diagrams.
- **Monaco editor:** the paste surface, with syntax highlighting.
- **Pure-client pipeline:** schemas never leave the browser.
- **Static site:** hosting for the public tool.

## Architecture

- A paste/drop surface feeds the parser.
- The parser emits a normalized schema model: tables, columns, keys.
- A layout pass assigns node positions, seeded from a graph layout algorithm.
- The canvas renders the model and handles drag, zoom and relationship highlighting.
- Export serializes the current view to image or link.

## Milestones

1. **M0 — Scaffold:** editor, parser stub, canvas with a hardcoded schema, static deploy.
2. **M1 — Real parsing:** one dialect parsed end to end into the normalized model.
3. **M2 — Interactivity:** layout, drag, zoom, click-to-highlight, image export.
4. **M3 — Dialect breadth:** additional dialects, error surfacing for unparseable schemas, shareable links.

## Risks

- Parser depth: every new dialect multiplies edge cases.
- Rendering budgets for very large schemas.
- No revenue story in the capture; costs are hosting only, but value capture is unknown.
- The interactive canvas is table stakes — a mediocre UX loses to existing ERD tools.
