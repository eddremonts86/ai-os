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

## Problem

The capture for this plan is a URL-only Show HN submission pointing at https://mcdview.dev/. The product claim carried by the title is a tool where a user drops a SQL schema definition and gets back an interactive entity-relationship diagram — one they can move, zoom and inspect rather than a static image. The capture states nothing further: no supported SQL dialects, no documentation notes, no named users and no pricing.

## Objective

Build the MVP matching the title's verb: accept a pasted or dropped SQL schema, parse its tables, columns and relationships, and render an interactive ER diagram that responds to dragging, zooming and selection. Because the source specifies no dialect, the MVP must commit to a concrete, documented subset and grow from there.

## Target Users

- Developers onboarding onto an unfamiliar codebase who need to see the data model at a glance.
- Data analysts and data engineers documenting schemas that outgrew their READMEs.
- Educators teaching relational modeling with a tool students can poke at.
- Consultants reviewing client schemas without installing desktop tooling.

## MVP Scope

- A paste/drop input for SQL DDL text.
- A parser that extracts tables, columns and foreign-key relationships.
- An interactive canvas: draggable tables, zoom, click-to-highlight related tables.
- Export of the rendered diagram as an image or shareable link.

## Constraints

- The source is a bare URL plus title; dialect coverage, UX and export choices are ours to define.
- Parsing is the hard, honest problem: real-world schemas break toy parsers, and the MVP must say what it can and cannot parse.
- Large schemas must stay interactive; the canvas needs a layout and rendering budget.
- No claims about users, accuracy or pricing exist in the capture and none may be invented.

## Design Direction

See `DESIGN.md` for this project's design tokens.
