---
id: "3631"
slug: a-retirement-planner-in-one-html-file-works-offline-not
title: "A retirement planner in one HTML file, works offline, nothing uploaded"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49481776"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [Single HTML file, Vanilla JavaScript, CSS (no framework), LocalStorage (optional, same file)]
---
# A retirement planner in one HTML file, works offline, nothing uploaded

## Tech Stack

- **Single HTML file** — the title's first constraint; everything lives in one file with no external assets.
- **Vanilla JavaScript** — no framework, because a single file with offline support does not need a build step or a runtime larger than what the browser already has.
- **Plain CSS** inside the same file — no preprocessor and no separate stylesheet, so the offline constraint survives a `file://` open.
- **LocalStorage** as the persistence layer for the entered scenario, since it is built into the browser and does not require a network or a backend.
- **A small seeded PRNG inside the file** for the Monte Carlo runs, so the offline constraint holds even for the advanced features.
- **JSON export/import** as the user's "save the file" path, with the file extension being a re-importable copy of the same HTML+JSON bundle.

## Architecture

The application is one HTML document. The head element carries the inline CSS, the body element carries the table, the controls, the results panel and one script element holding all the planner logic. There are no remote resources of any kind, which means no Google Fonts, no CDN-hosted icons and no analytics snippet; a network-disabled reload must work, and that is verified by the build.

The state model is a single JavaScript object representing the user's scenario: an array of holdings, each with ticker or label, account type, price, share count, cost basis and growth rate, plus a sell schedule the user picks. The render path reads the state, runs the unwind calculation, and writes the after-tax result into the result panel. The tax pass applies the user-entered capital-gains rate to the realised portion of each holding, with basis recovered proportionally as the position sells; Roth and pre-tax holdings skip the gain calculation but still respect the schedule.

Persistence is localStorage with a single key per scenario. The user can also export the scenario as JSON for backup or sharing, and can re-import the same JSON to restore it. The file's "owned" path is the user opening the HTML file directly on disk; the planner still works because everything required is inside the file.

The advanced features sit on top of the same engine. The crash test is a stress scenario the user picks — for example, a percentage drawdown at a specific year — that re-runs the unwind against the stressed balance. Monte Carlo runs N trials by sampling each holding's growth rate inside a user-set band, then summarises the distribution of the after-tax result. Both features use the PRNG defined inside the file so the offline constraint is preserved.

## Milestones

1. **M1 — Single-file skeleton** — HTML with inline CSS and JS, the holdings table, and a working gross-proceeds calculation.
2. **M2 — Tax and basis recovery** — apply the user-set capital-gains rate with proportional basis recovery, account-type aware.
3. **M3 — Sell schedule** — let the user pick a multi-year unwind (for example, 60% over 5 years from 2026 to 2031) and re-run the calculation per year.
4. **M4 — Per-holding growth** — high-stage-then-low-stage growth model per holding, plus the price-target mode that derives a rate.
5. **M5 — Persistence** — localStorage save and load, plus JSON export and import for the same data.
6. **M6 — Crash test and Monte Carlo** — implemented inside the same file, using an inline PRNG, with results summarisable.
7. **M7 — Offline guarantee** — automated check that the running file makes zero network requests after the initial load.
8. **M8 — File ownership path** — the same HTML loads correctly when opened via `file://`, with no broken paths and no missing assets.

## Risks

- **Single-file constraint** — every feature has to fit in one document; the discipline is to keep the markup, CSS and JS small enough that the file is still an artefact someone wants to own.
- **Network requests slipping in** — a single web-font link or analytics snippet breaks the offline promise; CI must check the file's outbound request list.
- **Browser support drift** — a vanilla-JS file is portable today, but new browser features have to be tested at the floor, not just at the latest version.
- **Tax-model honesty** — a single capital-gains rate is a simplification; the planner must not present itself as jurisdiction-complete.
- **Monte Carlo variance** — without enough trials, the distribution is noisy and can mislead; the trial count has to be a real number, not a vanity one.
- **Persistence churn** — localStorage is small and per-origin; a large scenario can hit the quota, and the planner has to surface that gracefully.
- **File ownership semantics** — a $99 one-time purchase has to define what "updates" means, since the source mentions a free in-browser version and a paid file.
