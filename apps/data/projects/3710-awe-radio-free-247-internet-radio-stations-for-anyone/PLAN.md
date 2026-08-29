---
id: "3710"
slug: awe-radio-free-247-internet-radio-stations-for-anyone
title: "Awe Radio, free 24/7 internet radio stations for anyone"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49485708"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
tech: [iOS app (Swift/SwiftUI), web player, station-owner dashboard]
---
# Awe Radio, free 24/7 internet radio stations for anyone

## Tech Stack

- **iOS app:** Swift / SwiftUI, distributed via the App Store (App ID `id6761093598`). iPhone, iPad, and Apple Watch targets.
- **Web player:** SvelteKit or Next.js at `listen.aweradio.app` — the source does not name the framework; both fit. Static-rendered station directory with a client-side audio player.
- **Station-owner dashboard:** Web app at `listen.aweradio.app/station/` with Upload, Broadcast, and Stats views.
- **Streaming backend:** Icecast or a comparable HTTP streaming server; the operator has already shipped their stations to radio-browser.info, which is the de facto directory for the Icecast ecosystem.
- **Catalogue:** A relational store of stations with mood / genre tags (chill, hype, afterdark, cruise, focus, workout, lounge, indie, plus user-started stations).
- **Stats:** Per-station listener count, bandwidth, uptime, CPU, memory — surfaced on the dashboard as a "refreshing stream" panel.

The legacy AI-OS default stack (TanStack Start, Drizzle ORM, Coolify, Docker) is not used. The product is iOS app + web player + station-owner dashboard + Icecast-grade streaming backend; the build target is the App Store + web + a streaming server, not a self-hosted web app.

## Architecture

```
                    ┌────────────────────────┐
                    │  AWE Radio iOS app     │
                    │  iPhone / iPad / Watch │
                    │  - station catalogue   │
                    │  - now playing         │
                    │  - background audio    │
                    └──────────┬─────────────┘
                               │ HTTPS / HLS
                               ▼
                    ┌────────────────────────┐
                    │  listen.aweradio.app   │
                    │  - station directory   │
                    │  - web player          │
                    │  - station-owner dash  │
                    │  - stats               │
                    └──────────┬─────────────┘
                               │ control plane
                               ▼
                    ┌────────────────────────┐
                    │  Streaming server      │
                    │  (Icecast-class)       │
                    │  - per-station mount   │
                    │  - now-playing meta    │
                    │  - listener accounting │
                    └────────────────────────┘
```

The streaming server is the source of truth for "what's playing now" and for listener accounting. The iOS app and the web player are both consumers of that stream and the now-playing metadata.

## Milestones

1. **M0 — Marketing site and curated stations** (already live) — `aweradio.app` with the named stations and now-playing per station.
2. **M1 — iOS app** (already on the App Store) — iPhone, iPad, Apple Watch targets.
3. **M2 — Web player** (already live) — `listen.aweradio.app` with the same catalogue.
4. **M3 — Station-owner dashboard** (already live) — Upload, Broadcast, Stats; signup at `/signup`.
5. **M4 — radio-browser.info integration** (already shipped, per the HN thread) — operator has pushed their stations into the directory so existing apps like StreamTuner-ng can find them.

## Risks

- **Music licensing.** A 24/7 internet radio is a music-licensing minefield. The MVP needs a published policy on who covers PRO / SoundExchange / DMCA. The source does not address this, and it is the single biggest risk for the product's existence.
- **Cross-device parity.** iPhone, iPad, Apple Watch, and the web must show the same catalogue and the same now-playing. A watchOS app is a sustained commitment across watchOS releases and Apple silicon transitions.
- **Station-owner funnel.** "Anyone can start one" is the promise; the MVP needs the signup-to-first-broadcast time measured and under five minutes, or the funnel dies silently.
- **Live stats cost.** Per-station listener count, bandwidth, uptime, CPU, memory are exposed on the dashboard. That is a continuous operational cost; the MVP needs a sampling policy so the cost scales with the user count, not with the wall clock.
- **Revenue model unstated.** Free at the entry tier, no pricing visible. The pricing shape is an open question the post leaves for the team.
