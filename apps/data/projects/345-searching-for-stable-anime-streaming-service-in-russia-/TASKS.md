---
id: "345"
slug: searching-for-stable-anime-streaming-service-in-russia-
title: Searching for stable anime streaming service in Russia without VPN requirement
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/media/ycnydla351-searching-for-stable-anime-streaming-ser"
category: media
date: "2025-10-29"
tags: [Media, Legal]
country: Russia
tech: [React Native (Android+iOS), HLS + Widevine DRM, Hetzner storage + CDN (Filia CDN European edge), Stripe / YuKassa, Postgres]
---
# Searching for stable anime streaming service in Russia without VPN requirement

## Phase 0: Scaffold

- [ ] Read the source at `https://problemhunt.pro/en/media/ycnydla351-searching-for-stable-anime-streaming-ser` and quote the original problem statement into a `source-quote.md` for traceability.
- [ ] Create the project folder under `apps/345-searching-for-stable-anime-streaming-ser/` (or per the chosen deployment target).
- [ ] Initialize git, pin dependencies for: React Native (Android+iOS), HLS + Widevine DRM, Hetzner storage + CDN (Filia CDN European edge), and confirm versions resolve in CI.
- [ ] Wire Stripe (or the regional PSP for {country}) in test mode and document the price model in PRODUCT.md.
- [ ] Write DESIGN.md with country-appropriate defaults (`country: Russia`) — color, type, density, motion tokens — not the global default.
- [ ] Scaffold the auth + persistence layer with data-residency configured for Russia.
- [ ] Set up the framework router, server actions, and a typed API client for the read/write endpoints listed in PLAN.md.
## Phase 1: Core

- [ ] Rights licence for >= 2,000 titles with Russian rights-holders, with a rights-ledger check
- [ ] React Native app with HLS + Widevine / FairPlay, 1080p default
- [ ] Weekly simulcast publishing flow with subbed + dubbed variants
- [ ] YuKassa + international-card payment in RUB with one-tap renew
- [ ] Offline download (30 days) with signed URLs
- [ ] Per-account profiles with continue-watching sync
- [ ] Pilot in RU + CIS, 10,000 paid subscribers within 6 months

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (React Native (Android+iOS), HLS + Widevine DRM, Hetzner storage + CDN (Filia CDN European edge)) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 345-searching-for-stable-anime-streamin MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in Russia completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for React Native (Android+iOS), HLS + Widevine DRM, Hetzner storage + CDN (Filia CDN European edge) errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
