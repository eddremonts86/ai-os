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

## Phase 0: Scaffold

- [ ] Catalogue provider decision: TMDB API + licence check (attribution + commercial-use terms).
- [ ] iOS app skeleton: SwiftUI project, TestFlight distribution, App Store Connect record.
- [ ] Next.js project for the marketing site + the `/join/[code]` partner page; deploy to Vercel.
- [ ] Postgres schema (Neon): `sessions`, `swipes` with TTL index on `sessions.expires_at`.
- [ ] No-account identity: iOS Keychain + CloudKit for taste seed; `localStorage` for the web join page.
- [ ] Design tokens: warm dark UI (matches the existing marketing site), poster cards, swipe gestures.

## Phase 1: Core

- [ ] Taste seed onboarding: pick three posters you actually loved (search + pick, no questionnaire).
- [ ] Swipe deck: gesture + button equivalents (right / left / down), `dealt_at` timestamp on every card.
- [ ] Filters: time budget (one sitting, main event, pilot night) and mood strip; combine with taste seed to build a deck.
- [ ] Re-deal: down-swiped cards return after 14 days; the deck generator respects this and excludes re-deals too early.
- [ ] iOS app ships to TestFlight; solo swipe + filters + re-deal all working without an account.
- [ ] Tests: re-deal regression test (a card down-swiped today does not reappear for 14 days), filter test (a one-sitting deck only contains films under 110 min).

## Phase 2: Deploy

- [ ] Backend live on Vercel (Route Handlers + SSE channel for realtime swipes).
- [ ] Postgres (Neon) live with `sessions` + `swipes` tables; swipes TTL out after 24h.
- [ ] Match: host creates a session, partner joins via `popsesh.com/join/[code]`, partner's swipes appear in the host's deck in under one second.
- [ ] First mutual yes is computed and surfaced on both sides; matched film is the answer.
- [ ] iCloud sync of taste seed + swipe history so a returning user sees the same deck on a new device.
- [ ] Smoke test in production: full solo loop, full Match loop with two devices, link-to-first-swipe time on the partner's seat measured and under three taps.
