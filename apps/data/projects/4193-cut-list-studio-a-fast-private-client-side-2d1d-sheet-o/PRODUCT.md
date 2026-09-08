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

## Value Proposition

Run a real 2D bin-packing and 1D cutting-stock optimizer in your browser, with kerf, grain, edge-banding, and batch sawing handled correctly, so a 4×8 sheet turns into a 1-click printable cut plan instead of a hand-sketched guess.

## Target Users

- Weekend DIYers building cabinets, shelving, or shop furniture
- One- and two-person cabinet shops quoting multi-sheet client jobs
- Architectural millwork contractors working with melamine and plywood
- 3D printer and CNC builders cutting T-slot aluminum extrusion

## Jobs To Be Done

- When I have a parts list and a sheet size, I want the optimizer to compute kerf-correct cuts and tell me exactly how many sheets to buy so I do not run short mid-project
- When I am building face frames and drawer fronts, I want grain direction locked on visible parts and free on hidden parts so I get the cleanest visible match without wasting stock
- When I cut five sheets of identical strips, I want one fence setup for all five sheets so I finish in a quarter of the time
- When I quote a client, I want a one-page PDF with parts, edge banding, and labor so the number holds up in an email

## Success Metrics

- Reported yield efficiency of 85% to 95% on standard cabinet projects
- Time from parts list to printable PDF cut plan under 2 minutes for a 6-door kitchen
- 100% of project data stays in the browser — measurable by absence of network calls during a session

## Pricing & Monetization

_TODO:_ source did not state a price. Page is presented as a free online tool with no account; print/export functionality suggests a future Pro tier.

## Competitive Landscape

- Sketchup + Cutlist plugin — manual sheet layout, no automatic nesting
- Mozaik, Cabinet Vision — paid shop-floor software; desktop installs, no client-side privacy
- Open-source 2D bin packers (e.g. SVGNest) — no saw-aware constraints, no batch sequencing
- Spreadsheet cut-list templates — kerf and grain easy to forget

## Risks & Open Questions

- Browser-only compute limits how large a part list can run without lag
- Material pricing inputs are workshop-specific; default rates may mislead casual users
- Edge-banding premill allowances vary by edgebander brand; need documentation