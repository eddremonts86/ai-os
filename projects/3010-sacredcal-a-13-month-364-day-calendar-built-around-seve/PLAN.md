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

## Tech Stack

- **Frontend:** Svelte. The whole interface is a grid; Svelte's compiled output keeps the bundle small and the year/month render fast.
- **Date math:** A small custom TypeScript module, no date library. The 13 × 28 structure is simple enough that pulling in Moment, Luxon, or date-fns would obscure the rules. Conversion to/from Gregorian uses a documented algorithm pinned in code comments.
- **Storage:** IndexedDB in the browser for personal events. No server, no account.
- **PDF export:** `pdf-lib` for client-side PDF generation of a printable year.
- **Hosting:** Any static host (Netlify, personal VM). No backend, no database, no auth.

## Architecture

The browser loads the static bundle, renders the year view (13 columns of 28 days), and reads/writes events to IndexedDB on the same origin. The date-conversion utility is pure TypeScript and runs in both client and (optionally) a tiny Node script for batch exports. There is no API.

```
Browser (Svelte)
   |
   |--- year/month view (pure render)
   |
   |--- IndexedDB (events)
   |
   |--- pdf-lib (print export)
   ^
Date math module (TS, pure)
```

No server, no API, no queue. The whole product is a static bundle plus IndexedDB.

## Milestones

1. **M0 — Scaffold:** Svelte project, design tokens, the 13 × 28 grid as a static render.
2. **M1 — Date math module:** Gregorian-to-SacredCal and back, with a regression test suite covering a 200-year span.
3. **M2 — Month and year views:** Month view with "today" highlighted; year view with 13 months in a grid.
4. **M3 — Personal events:** IndexedDB schema, add/edit/delete, recurring rules by date (every month on day N, every year).
5. **M4 — PDF export:** Printable year view via `pdf-lib`, designed to print on a single A3 or two A4 sheets.
6. **M5 — Polish and dogfood:** Keyboard navigation, accessibility pass on the grid, two weeks of personal use before declaring v1.

## Risks

- **Date math bugs at year boundaries.** Mitigation: pinned regression suite, including the Year Day slot.
- **IndexedDB quota on heavy users.** Mitigation: warn at 80% of estimated quota, export-to-JSON button.
- **Print export formatting.** Mitigation: iterate against a real printer and a real wall; A3 vs A4 vs letter sized.
- **Niche audience.** Mitigation: lean on the recurring-event-by-date property as the headline value; do not assume broad demand.
