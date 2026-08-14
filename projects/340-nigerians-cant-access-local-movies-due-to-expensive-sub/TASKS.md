---
id: "340"
slug: nigerians-cant-access-local-movies-due-to-expensive-sub
title: "Nigerians can't access local movies due to expensive subscriptions and piracy"
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/media/pypg9yzgy1-nigerians-cant-access-local-movies-due-t"
category: media
date: "2025-10-29"
tags: [Media, Legal]
country: Nigeria
tech: [Android-first (Kotlin + Jetpack Compose), ExoPlayer + DRM, M-Pesa / Paystack, Cloudflare R2 + Stream, Telegram bot (anti-piracy signal)]
---
# Nigerians can't access local movies due to expensive subscriptions and piracy

## Phase 0: Scaffold

- [ ] Read the source at `https://problemhunt.pro/en/media/pypg9yzgy1-nigerians-cant-access-local-movies-due-t` and quote the original problem statement into a `source-quote.md` for traceability.
- [ ] Create the project folder under `apps/340-nigerians-can-t-access-local-movies-due-/` (or per the chosen deployment target).
- [ ] Initialize git, pin dependencies for: Android-first (Kotlin + Jetpack Compose), ExoPlayer + DRM, M-Pesa / Paystack, and confirm versions resolve in CI.
- [ ] Write DESIGN.md with country-appropriate defaults (`country: Nigeria`) — color, type, density, motion tokens — not the global default.
- [ ] Scaffold the auth + persistence layer with data-residency configured for Nigeria.
- [ ] Provision the iOS/Android signing pipeline and confirm TestFlight/Internal Testing build distribution.
## Phase 1: Core

- [ ] Licence 300+ titles from >= 10 Nigerian producers with monthly per-view royalty terms
- [ ] Android app (Kotlin + Jetpack Compose) with ExoPlayer + DRM, mobile-data-aware quality
- [ ] Paystack + M-Pesa subscription path with one-tap renew
- [ ] Offline download (30-day window, signed URLs, storage cap)
- [ ] Producer console: per-view ledger, monthly payout, CSV export
- [ ] Pirate-signal Telegram bot, optional browser-extension slot in v1.5
- [ ] Pilot in Lagos/Abuja/Port Harcourt, 5,000 paid subscribers within 90 days

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Android-first (Kotlin + Jetpack Compose), ExoPlayer + DRM, M-Pesa / Paystack) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 340-nigerians-can-t-access-local-movies MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in Nigeria completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Android-first (Kotlin + Jetpack Compose), ExoPlayer + DRM, M-Pesa / Paystack errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
