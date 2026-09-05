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

## Tech Stack

- React + TypeScript single-page app
- TanStack Start for any future server-side endpoints (current product is entirely client-side)
- SQLite with Drizzle ORM for any optional local persistence layer
- Coolify + Docker for self-hosting the marketing page and optional telemetry proxy
- WebAssembly or pure-TS implementation of the 2D bin-packing and 1D cutting-stock algorithms
- PDF generation in the browser (e.g. pdf-lib) for printable cut plans and BOMs
- SVG or Canvas rendering for the interactive nesting diagram

## Architecture

The optimizer runs entirely in the browser. The page collects raw stock dimensions, saw kerf, edge-banding rules, and a parts list, then a 2D bin-packer or 1D cutting-stock solver produces a layout. The guillotine constraint checker validates that every cut runs edge to edge, and the topological batch planner builds a DAG of unified setups. An interactive diagram component renders the layout with numbered cut badges, edge-banding stripes, and waste hatching. A PDF builder packages the diagram, the saw step sequence, the BOM, and the workshop cost summary into one printable file. All persistence is browser-local (IndexedDB or localStorage); no telemetry, no upload.

## Milestones

1. 2D bin-packer with kerf, grain, and edge-banding constraints for a single sheet
2. Interactive nesting diagram with cut badges and waste hatching
3. 1D cutting-stock solver for dimensional lumber and aluminum
4. Topological batch sawing with DAG-based setup grouping
5. Saw step sequence panel with all-cuts and per-setup views
6. PDF export combining diagram, sequence, BOM, and quotation
7. Advanced Studio Mode with multi-material workspace, fullscreen workshop mode, and Sawyer Checklist
8. Optional self-hosted Coolify deployment for the marketing page and documentation

## Risks

- 2D bin-packing is NP-hard; must guarantee acceptable runtime on a 50-part kitchen job
- Browser memory pressure on very large part lists; need paging or Web Worker offload
- Print-quality PDFs depend on correct DPI handling on the user's printer
- Edge-banding premill allowances are brand-specific; defaulting incorrectly can throw off cuts by 1–2 mm