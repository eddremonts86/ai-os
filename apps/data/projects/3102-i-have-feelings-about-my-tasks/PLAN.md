---
id: "3102"
slug: i-have-feelings-about-my-tasks
title: I have feelings about my tasks
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49446769"
  captured: "2026-08-26"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Productivity, B2C]
tech: [TypeScript, browser-only drag-and-drop, Google OAuth, serverless persistence]
---
# I have feelings about my tasks

## Tech Stack

- **Frontend:** TypeScript + a small framework (Svelte or Solid for the bundle-size-sensitive single-page experience).
- **Drag-and-drop:** native HTML5 drag-and-drop on desktop, pointer events on touch.
- **Persistence (anonymous):** browser localStorage keyed by a randomly generated room id stored in the URL hash.
- **Persistence (signed-in):** a tiny serverless backend (Cloudflare Workers or Hono on a small VPS) backed by SQLite or Turso.
- **Auth:** Google sign-in via Google Identity Services; the Google `sub` claim is the room owner.
- **Distribution:** single-page app hosted on a static host (Cloudflare Pages or the founder's own domain).

## Architecture

```
┌──────────────┐     ┌──────────────┐     ┌──────────────┐
│  Browser     │────▶│  localStorage│     │  Anonymous   │
│  (no sign-up)│     │  (room id in │     │  room        │
│              │     │   URL hash)  │     │              │
└──────────────┘     └──────────────┘     └──────────────┘
       │
       │ Google sign-in
       ▼
┌──────────────┐     ┌──────────────┐     ┌──────────────┐
│  Browser     │────▶│  Serverless  │────▶│  Turso /     │
│  (signed-in) │     │  API         │     │  SQLite      │
└──────────────┘     └──────────────┘     └──────────────┘
```

The browser renders the room. Anonymous mode stores the room in localStorage keyed by a hash-stored room id. Sign-in migrates the room to the server and rehydrates on next visit. The clock is a pure client-side computation over per-box `startedAt` / `stoppedAt` timestamps.

## Milestones

1. **M0:** Single-room browser-only experience with cardboard-box rendering, drag-and-drop, per-box clock, localStorage persistence.
2. **M1:** Google sign-in + server-side persistence + anonymous-to-signed-in room migration.
3. **M2:** "Exactly one box on the desk" enforcement with a settings toggle for "many."
4. **M3:** Mobile touch support for drag-and-drop (the open risk for the cardboard-box metaphor).

## Risks

- **Touch drag-and-drop on mobile.** HTML5 drag-and-drop is desktop-only; a touch-friendly pointer-events implementation has to be hand-rolled. Mitigation: ship desktop-first; add mobile in v2.
- **Clock persistence across reloads.** A clock that resets on reload kills the metaphor. Mitigation: store per-box `startedAt` / `stoppedAt` timestamps, not a running total; compute the total on render.
- **Anonymous room loss.** Clearing the browser loses the room. Mitigation: a one-time "save your room id" prompt when the user has more than five boxes; encourage Google sign-in.
- **Google sign-in UX friction.** The HN audience is technical and tolerant, but a casual visitor may bounce. Mitigation: keep the no-sign-up path excellent and put Google sign-in behind a single click.
