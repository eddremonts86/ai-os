---
id: "3007"
slug: does-anyone-else-feel-like-nothing-matters-anymore
title: Does anyone else feel like nothing matters anymore?
status: enriched
source:
  name: manual
  url: "https://news.ycombinator.com/item?id=49340013"
category: ask-hn
date: "2026-08-18"
tags: [Ask HN, Problem]
---
# Does anyone else feel like nothing matters anymore?

## Tech Stack

- **Static frontend:** Plain HTML, CSS, and a small TypeScript module — no framework. The app is a single page with three screens (capture, timeline, weekly) and does not need virtual-DOM diffing.
- **Storage:** IndexedDB via the native API, with a tiny wrapper module. Chosen because entries are voice blobs plus small text records and need to outlive a tab refresh without a server.
- **Voice capture:** Browser MediaRecorder API. No third-party recording SDK, no WebRTC.
- **Build:** Vite for the dev server and a static bundle. Outputs a folder that can be served from any static host.
- **Hosting:** Any static host — GitHub Pages, Netlify, or a personal server. No Docker, no database, no auth.

## Architecture

The system has no backend. The browser loads a static bundle, asks for microphone permission once, and reads/writes to IndexedDB directly. Capture screen records a MediaRecorder stream and stores the resulting blob; timeline screen reads entries back and renders them with timestamp and tag; weekly screen reduces entries in-memory by tag for the last seven days.

```
Browser (single page)
   |
   | MediaRecorder -> Blob
   v
IndexedDB (entries table)
   ^
   | read on timeline + weekly
   |
   UI renders
```

No server, no API, no queue, no auth. The whole product is a static bundle plus IndexedDB.

## Milestones

1. **M0 — Scaffold:** Static project with Vite, a single HTML page, three route-less screens switched by a hash, design tokens wired up.
2. **M1 — Capture:** MediaRecorder integration, IndexedDB write path, permission denial flow, text-only fallback.
3. **M2 — Timeline:** Read path, tag filtering, date-range filter, basic search over text captions.
4. **M3 — Weekly summary:** Reduce entries by tag over a 7-day window, render a single bar chart drawn in SVG by hand.
5. **M4 — Polish and deploy:** Manifest, installable as a PWA, deploy to a static host, dogfood for two weeks.

## Risks

- **Microphone permission churn on Safari.** Mitigation: detect WebKit, surface a "text-only" path immediately and label the audio path as experimental.
- **IndexedDB quota on long-running users.** Mitigation: warn at 80% of estimated quota, give an export-to-JSON button.
- **The product stops feeling useful because there is no insight.** Mitigation: build the weekly summary without any LLM-generated text; if it still feels empty after dogfooding, revisit, do not paper over with AI.
