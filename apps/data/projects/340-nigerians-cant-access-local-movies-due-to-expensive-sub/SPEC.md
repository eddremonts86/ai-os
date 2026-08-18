---
id: "340"
slug: nigerians-cant-access-local-movies-due-to-expensive-sub
title: "Nigerians can't access local movies due to expensive subscriptions and piracy"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/media/pypg9yzgy1-nigerians-cant-access-local-movies-due-t"
category: media
date: "2025-10-29"
tags: [Media, Legal]
country: Nigeria
tech: [Android-first (Kotlin + Jetpack Compose), ExoPlayer + DRM, M-Pesa / Paystack, Cloudflare R2 + Stream, Telegram bot (anti-piracy signal)]
---
# Nigerians can't access local movies due to expensive subscriptions and piracy

## Problem

Nigerian viewers who want Nollywood, Yoruba and Hausa films today face two bad options: subscribe to a global streaming service that has a thin local catalogue and a US-priced plan, or download from pirate sites that the industry points to as the reason the local industry is starved of revenue. The poster - and many Nigerian commentators - frames it as a payment-and-catalogue problem, not a willingness-to-pay problem.

## Objective

Ship a Nollywood-first streaming app for Nigerian viewers with a Lagos-priced monthly plan that pays back into the production ecosystem, with a paid-tier below the price of a single mobile data top-up and a mobile-data-friendly playback path.

## Target Users

- Nigerian adult viewers (18-45) in Lagos, Abuja, Port Harcourt, Kano who already watch Nollywood.
- Nigerian diaspora in the UK, US, Canada and South Africa who want Nollywood at home.
- Nollywood producers who want distribution that pays a clear per-view royalty above what they get from pirate sites (which is zero).

## MVP Scope

- Catalogue: >= 300 Nollywood / Yoruba / Hausa titles licensed from at least 10 Nigerian producers.
- Subscription: NGN 1,500/month (below one Lagos data top-up); annual at NGN 15,000.
- Payment: Paystack (card + bank), M-Pesa where available; one-tap renew.
- Playback: ExoPlayer with HLS + DRM, mobile-data-aware quality ladder, offline download for 30 days.
- Producer share: monthly per-view royalty paid to each producer via a transparent ledger in the producer console.
- Anti-piracy signal: Telegram bot and a browser extension (later v1.5) that lets viewers flag a pirate mirror and route to the licensed version.
- No fake byline or impersonation of production houses; licensed content only.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/media/pypg9yzgy1-nigerians-cant-access-local-movies-d` follows the constraints in `340-.../SPEC.md` and the chosen stack (Android-first (Kotlin + Jetpack Compose), ExoPlayer + DRM, M-Pesa / Paystack). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Nigeria.

For Nigeria, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Per-view royalty calculation in Naira, paid monthly, with a producer-visible ledger.
- DR-grade license required for any title with a theatrical run; DRM configured in ExoPlayer.
- First-run catalogue only; no upload path for viewer-generated content.
