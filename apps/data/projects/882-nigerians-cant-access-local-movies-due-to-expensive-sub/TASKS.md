---
id: "882"
slug: nigerians-cant-access-local-movies-due-to-expensive-sub
title: "Nigerians can't access local movies due to expensive subscriptions and piracy"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/media/pypg9yzgy1-nigerians-cant-access-local-movies-due-t"
category: media
date: "2025-10-25"
tags: [Media, Legal]
country: Nigeria
---
# Nigerians can't access local movies due to expensive subscriptions and piracy

## Phase 0: Scaffold

- [x] Capture problem from ProblemHunt + write SPEC.md skeleton
- [ ] Define DESIGN.md tokens (mobile-first PWA shell, video player chrome, creator portal chrome)
- [ ] Provision Coolify project + Docker image + SQLite volume + HLS origin + CDN
- [ ] Wire phone-number OTP auth for the Nigerian market; email-link for diaspora
- [ ] Sign rights documentation for ≥ 200 Nollywood / pan-African titles; ingest as `titles` rows
- [ ] Decide Drizzle schema: `users`, `titles`, `monetisation_models`, `subscriptions`, `purchases`, `creators`, `rights_docs`, `payouts`, `plays`

## Phase 1: Core

- [ ] FFmpeg transcode pipeline: master file → HLS adaptive bitrate (480p / 720p / 1080p) → CDN
- [ ] PWA shell: installable on Android 10, low-end (2 GB RAM) friendly, first video frame ≤ 3s on median 3G
- [ ] Free ad-supported tier: unlimited streaming with ≤ 2 ads per 30-minute session; 5 offline downloads / month
- [ ] Subscription tier: ₦1,500/month (≈ $1), unlimited streaming, no ads, 20 offline downloads / month
- [ ] Pay-per-view tier: ₦500/title (≈ $0.32), buy individual titles to keep forever, including offline
- [ ] Diaspora pricing: $4.99/month or $1.99/title for viewers outside Africa
- [ ] Payments: Paystack primary + Flutterwave fallback + USSD for NG recurring; Stripe for diaspora
- [ ] Resumable downloads per tier quota (5 / month free, 20 / month paid)
- [ ] Discovery: "trending in Lagos / Abuja / PH" rail fed by recent plays
- [ ] Creator portal: upload form with master file + rights documentation; review state machine (`draft → rights-review → published`)
- [ ] Transparent revenue ledger in the creator portal (70/30 split); first monthly payout cycle via Paystack / Flutterwave / direct bank transfer
- [ ] Creator identity verification: BVN for Nigerian creators, passport for diaspora
- [ ] Workspace status gating: free tier continues forever; paid tiers gated by Paystack / Stripe webhook
- [ ] End-to-end test: upload a signed title, publish through the review state machine, watch on a low-end Android over 3G, confirm adaptive bitrate triggers the 480p → 720p upgrade

## Phase 2: Deploy

- [ ] Move Paystack / Stripe to live mode
- [ ] Onboard 50 creators + 10k Nigerian viewers during pilot
- [ ] Weekly catalogue / payout / latency review; calibrate the naira price against the parallel-market USD rate
- [ ] Add collaborative-filtering recommender after the first 10k viewers' watch history
- [ ] Native Android shell (replacing the PWA) once the pilot validates the workflow
