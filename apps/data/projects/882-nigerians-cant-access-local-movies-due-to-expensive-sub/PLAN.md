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

## Tech Stack

- **Client:** a mobile-first PWA (progressive web app) at launch, with a thin native Android shell in v1.x; installable on a 2 GB RAM Android 10 device; offline downloads for the paid tier.
- **Backend API:** Node.js + TanStack Start server functions for the catalogue, creator portal, and user account; SQLite via Drizzle ORM for transactional state, hosted on a single Coolify instance.
- **Video pipeline:** HLS adaptive bitrate streaming (480p default, 720p / 1080p ladders); FFmpeg for transcode; resumable downloads; CDN in front of the stream origin.
- **Payments:** Paystack (primary) + Flutterwave (fallback) + USSD for Nigerian recurring subscriptions; Stripe for the diaspora tier; mobile-money rails in v1.x.
- **Auth:** phone-number OTP for the Nigerian market (email-link for diaspora); Paystack's identity verification for the creator portal.
- **Creator portal:** a separate web app at `creators.platform.example`, role-gated to verified creators; rights documentation upload + review state machine.
- **Discovery:** a collaborative-filtering recommender trained on the first 10k viewers' watch history; cold-start fallback is a "trending in {city}" rail fed by recent plays.

## Architecture

```
Android (PWA) ─▶ TanStack Start (PWA shell)
                       │
                       ├─▶ /api/catalogue      ──▶ SQLite (titles, monetisation models)
                       │                                  │
                       │                                  ▼
                       │                          HLS origin (FFmpeg-transcoded)
                       │                                  │
                       │                                  ▼
                       │                          CDN (480p / 720p / 1080p)
                       │
                       ├─▶ /api/subscribe / /api/pay-per-view
                       │           │
                       │           ├─▶ Paystack / Flutterwave / USSD (NG)
                       │           └─▶ Stripe (diaspora)
                       │
                       ├─▶ /api/download (resumable, per-tier quota)
                       │
creators.platform ──▶ /api/creator/upload (rights docs + master file)
                       │           │
                       │           └─▶ review state machine ──▶ publish
                       │
                       └─▶ webhook ──▶ subscriptions table
```

## Milestones

1. **M0 — Spec + catalogue seed.** SPEC.md + DESIGN.md approved; ≥ 200 Nollywood / pan-African titles signed with rights documentation; creator portal skeleton live. End of week 4.
2. **M1 — Streaming pipeline + PWA shell.** HLS adaptive bitrate (480p / 720p / 1080p); FFmpeg transcode; PWA installable on Android 10; first video frame in ≤ 3s on median 3G. End of week 8.
3. **M2 — Monetisation.** Free ad tier (≤ 2 ads per 30-min session); subscription (₦1,500/month); PPV (₦500/title); diaspora pricing ($4.99/month, $1.99/title). End of week 11.
4. **M3 — Payments.** Paystack primary + Flutterwave fallback + USSD for NG; Stripe for diaspora; recurring subscription billed through Paystack's saved instrument. End of week 12.
5. **M4 — Creator portal + 70/30 payouts.** Upload form with rights documentation; review state machine; transparent payout ledger; first monthly payout cycle. End of week 14.
6. **M5 — Offline downloads + discovery.** Resumable downloads per tier quota (5 / month free, 20 / month paid); "trending in {city}" rail. End of week 16.
7. **M6 — Pilot.** 10k Nigerian viewers + 50 creators onboarded; weekly catalogue / payout / latency review. End of week 22.

## Risks

- **Rights licensing is the operational choke point.** Each title needs a signed licence before it can be published. Mitigation: a creator portal that requires rights documentation on upload; legal review workflow; default to "sub-only" until rights are cleared.
- **Bandwidth and device constraints.** Most viewers watch on a 2 GB RAM Android over 3G. Mitigation: aggressive bitrate adaptation; 480p default with one-tap 720p upgrade; resumable downloads; PWA shell for low-storage devices.
- **Payment friction.** Card penetration in Nigeria is limited; the free ad tier must work without any payment method. Mitigation: Paystack + Flutterwave + USSD at launch; recurring subscription billed through Paystack's saved instrument.
- **Piracy substitution.** If the platform prices even ₦1,500/month too high, viewers will pirate. Mitigation: the free ad tier is the legal answer for the price-sensitive segment; the price band is calibrated against piracy's "free" anchor.
- **Creator payout fraud.** A malicious creator could upload content they do not own. Mitigation: rights documentation review before publish; takedown workflow; creator identity verification (BVN for NG, passport for diaspora).
- **Catalog discovery.** Without Netflix-grade recommendations, the catalogue feels like a stack of tapes. Mitigation: "trending in {city}" rail at launch; collaborative-filtering model after the first 10k users.
- **Co-founder fit.** The author is looking for a co-founder. Mitigation: the build plan is sized for 2 people; if no co-founder is found, the founder must recruit or bootstrap solo.
- **Currency volatility.** The naira has lost value against the dollar repeatedly in recent years. Mitigation: subscription is billed in naira but priced against a USD floor; the price is reviewed quarterly against the parallel-market rate.
