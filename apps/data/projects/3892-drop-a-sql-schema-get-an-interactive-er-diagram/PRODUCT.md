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

## Value Proposition

See a database you have never met in thirty seconds. Dropping SQL into a box and getting a living ER diagram beats reading a schema file line by line, and interactivity is the point: drag tables apart, zoom into a neighborhood, click a foreign key and watch its twin light up. The capture's whole promise is that transformation — schema text in, diagram out — with zero install.

**One-liner:** Drop a SQL schema, get an interactive ER diagram.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Onboarding developers | A diagram is faster than reading DDL when joining a new team. |
| Data teams | Schemas drift faster than documentation; regenerating a diagram from SQL keeps it true. |
| Educators | An interactive canvas makes relationships tangible for students. |
| Consultants | Importing a client schema into a browser tab beats installing a desktop ERD tool. |

## Jobs To Be Done

1. Understand the tables and relationships in an unfamiliar schema without reading every CREATE statement.
2. Regenerate an up-to-date diagram whenever the schema changes.
3. Explore neighborhoods of related tables by clicking, not by squinting at a static image.
4. Export the diagram into documentation or a slide.

## Success Metrics

- Schemas parsed per week and the share that parse without manual fixes.
- Parse success rate across a seeded set of real-world SQL dialects, the tool's hardest guarantee.
- Interactions per diagram session (drags, zooms, clicks), measuring whether interactivity is actually used.
- Export count, the signal that diagrams leave the tool and enter docs.

## Pricing & Monetization

None stated. The capture contains no pricing information.

## Competitive Landscape

The capture names no competitors. The category is database diagramming and ERD generation — a crowded space of desktop and SaaS tools — where the title's positioning is two verbs: drop and get, i.e. zero-friction, browser-only conversion of schema text into an interactive diagram.

## Risks & Open Questions

- [ ] Dialect coverage is the classic killer of schema parsers; over-promising will drown the MVP in edge cases.
- [ ] The source gives no hint of the author's actual scope, so the MVP may miss it.
- [ ] Very large schemas can freeze the canvas if layout and rendering are unplanned.
- [ ] No monetization is stated; a free parser tool has no proven revenue path.
- [ ] Static captures like this one age fast if the live product diverges from the plan.
