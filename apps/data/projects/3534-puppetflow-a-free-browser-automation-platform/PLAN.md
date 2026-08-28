---
id: "3534"
slug: puppetflow-a-free-browser-automation-platform
title: Puppetflow a free browser automation platform
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49476246"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [TypeScript, Node.js, Puppeteer, React, InertiaJS, Laravel, SQLite, Docker]
---

# Puppetflow a free browser automation platform

## Tech Stack

The stack is named in the post and reproduced here: Puppeteer for the browser layer, Laravel for the backend, vanilla React + InertiaJS for the frontend, SQLite for storage, all in TypeScript / Node.js where applicable and shipped via Docker. The choice is deliberate — the author says "I like boring technologies and I think it's fine enough" — and matches the source-available, single-developer-built positioning.

## Architecture

```
   Browser workflow (authored in app)
                │
                ▼
   ┌──────────────────────────┐
   │  React + InertiaJS UI    │  build · live view · replay · logs
   └─────────────┬────────────┘
                 │
                 ▼
   ┌──────────────────────────┐
   │  Laravel backend         │  workflows · runs · history · blueprints
   │  (PHP, SQLite)           │
   └─────────────┬────────────┘
                 │
                 ▼
   ┌──────────────────────────┐
   │  Node.js runner          │  Puppeteer · trace · replay · AI hook
   │  (TypeScript, Docker)    │
   └─────────────┬────────────┘
                 │
                 ▼
         Chromium browser
```

The two open risks the author named are first-class subsystems: a live-view sync layer that keeps the UI consistent with the running Puppeteer session, and an anti-bot layer where fingerprint-chromium is the current experiment. Blueprints are versioned artefacts in github.com/puppetflow/library, surfaced in-app through Inertia.

## Milestones

- **M1 — Workflow authoring + runner.** Laravel-backed workflow store, Node.js runner that executes Puppeteer scripts, basic execution history.
- **M2 — Live runner view.** Real-time UI that mirrors a running workflow with mouse/keyboard interaction; this is the engineering risk the author flagged as painful.
- **M3 — Per-run replay and trace.** Persistent trace (DOM, console, network) per step, with replay that reproduces the original state at each step.
- **M4 — Blueprint library.** Versioned Blueprint format, in-app browser, PR-based publishing flow to github.com/puppetflow/library.
- **M5 — AI hook.** Opt-in model surface: talk to the model directly, or hand it control of the browser, with step-level logging that matches the deterministic-trace format.
- **M6 — Anti-bot layer.** Integrate fingerprint-chromium (or successor) and document the supported detection surfaces honestly, without overpromising.

## Risks

- **Live-view sync.** The author has called this out as a stated engineering challenge. If the UI drifts from the running workflow, debugging gets harder, not better. Mitigation: a single source of truth for runner state and a fallback to step-pause when live sync is ambiguous.
- **Anti-bot arms race.** Detection is escalating and the author has named this as outside one person's scope. Mitigation: experiment with fingerprint-chromium, document supported surfaces honestly, and design the platform so the anti-bot layer can be swapped without rewriting the runner.
- **Single-maintainer bus factor.** The project is one developer over a year; the source-available license reduces the worst-case risk but not the velocity risk. Mitigation: explicit "good first issue" surface and a contributing guide so external PRs can land.
- **AI-hook debuggability.** Letting a model drive the browser makes debugging harder again. The opt-in must come with the same trace surface as deterministic runs, or the product's core promise erodes for any user who flips the switch.
- **Blueprint cold start.** github.com/puppetflow/library is empty until it isn't. The risk is the classic empty-marketplace problem; the mitigation is seeding it from the author's own workflows before asking the community to contribute.
