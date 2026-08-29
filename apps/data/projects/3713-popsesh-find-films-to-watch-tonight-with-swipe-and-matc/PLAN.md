---
id: "3713"
slug: popsesh-find-films-to-watch-tonight-with-swipe-and-matc
title: POPSESH – Find films to watch tonight with swipe-and-match picks
status: enriched
source:
  name: BetaList
  url: "https://betalist.com/startups/popsesh?utm_campaign=startup-181503&utm_medium=atom&utm_source=newsfeed"
category: beta
date: "2026-08-29"
tags: [BetaList, Beta, Product]
tech: [Next.js, TypeScript, TMDB API, TestFlight]
---
# POPSESH – Find films to watch tonight with swipe-and-match picks

## Tech Stack

- **iOS app:** SwiftUI + Swift, distributed via TestFlight. The BetaList post points at TestFlight as the only beta channel.
- **Web join page:** Next.js (App Router) + TypeScript, deployed to Vercel. The Match partner opens `popsesh.com/join/[code]` in any browser.
- **Backend API:** Next.js Route Handlers (or a small Fastify / Hono service if the realtime needs outgrow Route Handlers). Match sessions are realtime; swipes need to land in the other person's deck in under a second.
- **Catalogue:** TMDB API for posters, runtime, genres, mood tags — the post does not name the provider but TMDB is the only realistic choice for a small team.
- **Realtime:** Server-Sent Events for Match session updates (one-way server-to-client push of the partner's swipes); long-poll fallback for browsers that don't support SSE cleanly.
- **No persistent user accounts:** taste seed and swipe history live in iOS Keychain + CloudKit (iCloud) for sync, and in `localStorage` for the web join page. No server-side user model.

The legacy AI-OS default stack (TanStack Start, Drizzle ORM, Coolify, Docker) does not fit. POPSESH is a small iOS-first product with a realtime web backend; the build target is TestFlight + Vercel, not a self-hosted VM.

## Architecture

```
                          ┌────────────────────────┐
                          │  POPSESH iOS app       │
                          │  SwiftUI               │
                          │  - taste seed          │
                          │  - swipe deck          │
                          │  - Match host          │
                          │  local: Keychain+CloudKit
                          └──────────┬─────────────┘
                                     │ realtime
                                     ▼
                          ┌────────────────────────┐
                          │  api.popsesh.com       │
                          │  Next.js Route Handlers│
                          │  - session create      │
                          │  - swipe ingest (SSE)  │
                          │  - match-first-yes     │
                          │  - deck generation     │
                          └──────────┬─────────────┘
                                     │
                                     ▼
                          ┌────────────────────────┐
                          │  Postgres (Neon)       │
                          │  sessions              │
                          │  swipes (TTL: 24h)     │
                          │  (no user accounts)    │
                          └────────────────────────┘

                          ┌────────────────────────┐
                          │  popsesh.com/join/[id] │
                          │  Next.js + React       │
                          │  partner's seat        │
                          │  localStorage only     │
                          └────────────────────────┘
```

The iOS app is the source of truth for taste seeds and solo swipe history; it syncs via iCloud so a user gets the same deck on a new device without an account. The realtime backend is stateless: a Match session lives in Postgres with a TTL (24 hours is enough for an evening's worth of swiping), and SSE streams updates to both clients.

## Milestones

1. **M0 — Solo swipe deck on iOS** — three-poster seed, swipes, time-budget + mood filters, re-deal-after-two-weeks. No Match, no realtime.
2. **M1 — Backend + session creation** — Postgres schema for sessions + swipes, Next.js Route Handlers for swipe ingest and deck generation.
3. **M2 — Match realtime** — SSE channel, partner-join via `popsesh.com/join/[code]`, the partner's swipes appear in the host's deck in under one second; first mutual yes is the match.
4. **M3 — Web join page** — the partner's seat at `popsesh.com/join/[code]` works on any modern browser, no install.
5. **M4 — iCloud sync of taste seed + swipe history** — same deck on a new device, no account.

## Risks

- **Catalogue licence.** TMDB is the obvious metadata source but the post does not confirm. The MVP needs the licence posture (TMDB attribution + their terms) pinned down before the app ships to TestFlight, not after.
- **Realtime under low latency.** Match is the wedge; if the partner's swipes take more than a second to appear, the loop feels broken. SSE on Vercel works but has cold-start and connection-cap edges; the MVP needs an early load test.
- **No-account churn.** A solo user who clears the app loses everything. The MVP has to ship iCloud sync (M4) before a critical mass of users hit this, or the cohort silently halves on every iOS update.
- **Re-deal honesty.** Down-swiped films "come back in two weeks". If the deck stops honouring that, users notice within one session. The re-deal logic is a small piece of code with a large trust impact and needs a regression test.
