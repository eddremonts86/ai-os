---
id: "294"
slug: cant-start-a-photography-and-videography-business-due-t
title: "Can't start a photography and videography business due to lack of clients and sy"
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/business/3zqee2a4x1-cant-start-a-photography-and-videography-bus"
category: business
date: "2025-10-29"
tags: [Business, Media, Marketing]
country: Kenya
tech: [Next.js 14, TypeScript, Postgres, M-Pesa Daraja API, Cloudinary (media), WhatsApp Business API]
---
# Can't start a photography and videography business due to lack of clients and sy

## Tech Stack

- Next.js 14 (App Router) + TypeScript for photographer console and public portfolio.
- Postgres on Hetzner for users, bookings, packages, payment ledger.
- M-Pesa Daraja API for STK push (C2B) deposits and balances.
- Cloudinary for image and video storage, signed URLs for delivery galleries.
- WhatsApp Business API for booking and milestone notifications.
- Redis for session and rate-limit.
- Cloudflare for ingress, DDoS, image optimisation.

## Architecture

Next.js app serves three surfaces from one backend: photographer console at /studio, public portfolio at /p/[slug], discover at /explore. Bookings go through a state machine: requested → deposit-paid → shoot-scheduled → delivered → balance-paid. M-Pesa C2B STK push triggers a callback that advances the state. Cloudinary signed URLs gate the final delivery gallery. WhatsApp templates fire on each state transition.

## Milestones

1. **M0** — Spec freeze, single photographer MVP with M-Pesa deposit. End of week 1.
2. **M1** — Public portfolio + package selector + M-Pesa C2B deposit. End of week 4.
3. **M2** — Cloudinary delivery gallery + WhatsApp milestone notifications. End of week 7.
4. **M3** — Discover surface + city/category SEO. End of week 10.
5. **M4** — Studio tier with multi-creative + payout splits. End of week 14.

## Risks

- **M-Pesa Daraja sandbox-to-live transition** — Mitigation: full sandbox walk-through with Safaricom dev support before live credentials.
- **Portfolio image theft** — Mitigation: Cloudinary signed URLs, watermarks, monitoring for hotlinking.
- **Discover cold start** — Mitigation: seed with 50 onboarded photographers in Nairobi before opening the city filter; partnership with Kenyan wedding vendor directories.
