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

## Tech Stack

- **Distribution:** a single static HTML file with embedded CSS and JavaScript. The deliverable is one file the user can save to disk and double-click to open.
- **Runtime:** vanilla browser — no build step required for the user. Build tooling is allowed during development; the artifact is one file.
- **CSV parsing:** a small client-side CSV parser (vendored or hand-written) that operates on `File` objects from a file picker or drag-and-drop, never via `fetch`.
- **Portfolio model:** in-memory positions + cost basis (whatever the CSV carries), aggregated for allocation, P/L, and concentration views.
- **Persistence:** IndexedDB or localStorage for the parsed portfolio so reopening the same browser retains state.
- **Visualization:** lightweight client-side charts (vanilla SVG or a small vendored library loaded from the same file) for allocation and P/L.

## Architecture

```
┌────────────┐    ┌────────────┐    ┌────────────┐    ┌────────────┐
│ User       │───▶│ CSV        │───▶│ Portfolio  │───▶│ Summary    │
│ picks file │    │ parser     │    │ model      │    │ view       │
│ (browser)  │    │ (browser)  │    │ (memory)   │    │ (browser)  │
└────────────┘    └────────────┘    └────────────┘    └────────────┘
                                              │
                                              ▼
                                       ┌────────────┐
                                       │ IndexedDB  │
                                       │ (browser)  │
                                       └────────────┘
```

Every stage runs in the browser. There is no server, no API call, no remote font, and no analytics endpoint. The README must document how a reader can verify this in devtools.

## Milestones

1. **M0 — Format agreement.** Document the broker CSV formats the MVP handles, the cost-basis convention, and the "no network" invariant as a tested contract.
2. **M1 — Single-file MVP.** HTML file with CSV ingest, portfolio model, summary view, and IndexedDB persistence.
3. **M2 — Privacy verification.** A "verify no network" section in the README with a recorded devtools Network panel showing zero outbound requests after the file loads.
4. **M3 — Export / import.** A user-facing "export my state as JSON" button so users can move state across browsers without a backend.

## Risks

- **CSV format drift.** Brokers change their export formats; the parser must fail visibly with a clear message rather than silently misclassifying columns.
- **Cost-basis ambiguity.** FIFO / LIFO / average-cost produce different P/L; the MVP must state its convention and let the user override it.
- **Persistence loss.** Browser storage is per-browser and can be cleared; users need an explicit export so they do not lose state silently.
- **"No network" pressure.** Future features (live prices, remote broker sync, analytics) would all break the headline promise. The MVP must treat the constraint as a contract, not a roadmap item.
- **Trust verification.** A user cannot easily confirm that the file they downloaded is the file they read in source. A published SHA-256 per release helps; without it, "open source" is asserted, not proven.
