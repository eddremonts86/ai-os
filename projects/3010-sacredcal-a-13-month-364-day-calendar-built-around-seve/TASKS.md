---
id: "3010"
slug: sacredcal-a-13-month-364-day-calendar-built-around-seve
title: "SacredCal – A 13-month, 364-day calendar built around seven-day cycles"
status: enriched
source:
  name: manual
  url: "https://news.ycombinator.com/item?id=49340221"
category: show-hn
date: "2026-08-18"
tags: [Show HN, Product, Problem]
---
# SacredCal – A 13-month, 364-day calendar built around seven-day cycles

## Phase 0: Scaffold

- [ ] Create project folder `apps/3010-sacredcal/`
- [ ] Initialize Svelte with TypeScript via Vite
- [ ] Wire design tokens from DESIGN.md into the global stylesheet
- [ ] Build the static 13 × 28 grid as a single render so the structure is visible immediately
- [ ] Add a minimal README documenting the 13-month model and the Year Day slot

## Phase 1: Core

- [ ] Implement the pure-TypeScript date math module: Gregorian to SacredCal, SacredCal to Gregorian, and arithmetic on SacredCal dates
- [ ] Author a regression test suite covering a 200-year Gregorian span with known conversion anchors
- [ ] Build the month view: 4 rows × 7 columns, today highlighted, weekday names across the top
- [ ] Build the year view: 13 month columns, each a compact 4 × 7 grid, with a separate slot for the Year Day
- [ ] Add an IndexedDB wrapper (open, put, getAll, delete) for personal events
- [ ] Implement event creation: title, date picker in SacredCal dates, recurring rule (every month on day N, every year)
- [ ] Implement event editing and deletion
- [ ] Add the Gregorian-to-SacredCal converter screen: input a Gregorian date, see the SacredCal date and back
- [ ] Add `pdf-lib` integration for printable year PDF export
- [ ] Run an accessibility pass on the grid (keyboard navigation, ARIA roles)
- [ ] Dogfood for two weeks before declaring v1

## Phase 2: Deploy

- [ ] Create GitHub repo
- [ ] Deploy to a static host (Netlify or personal VM)
- [ ] Wire CI: type-check + regression test suite on every push
- [ ] Verify the print-export PDF renders correctly on at least one A3 and one A4 paper size
