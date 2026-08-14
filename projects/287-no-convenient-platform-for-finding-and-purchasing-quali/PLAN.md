---
id: "287"
slug: no-convenient-platform-for-finding-and-purchasing-quali
title: No convenient platform for finding and purchasing quality products from local fa
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/food/8ypvtt1my1-no-convenient-platform-for-finding-and-purchas"
category: food
date: "2025-10-29"
tags: [Food, Business, Marketplace]
country: Russia
tech: [Next.js 14, TypeScript, Postgres + PostGIS, YooKassa payments, SDEK / Boxberry shipping, Sentry]
---
# No convenient platform for finding and purchasing quality products from local fa

## Tech Stack

- Next.js 14 (App Router) + TypeScript for consumer and farmer web apps.
- Postgres + PostGIS on Hetzner for geo search (city + delivery radius).
- YooKassa for payments (cards + SBP).
- SDEK and Boxberry APIs for shipping labels and tracking.
- Redis for cart sessions and rate limiting.
- Cloudflare for DDoS and bot protection on the storefront.
- Sentry for error monitoring; Logtail for structured logs.

## Architecture

Two Next.js apps on the same codebase: a consumer storefront at the root domain, and a farmer dashboard at /farmer. Both talk to the same Fastify backend, which fronts Postgres (entities, orders, listings) and Redis (cart, rate limit). Geo queries use PostGIS `ST_DWithin` for delivery-radius filtering. Order lifecycle: cart → YooKassa payment hold → farmer notified → farmer ships → tracking number posted → buyer confirms delivery → 7-day hold release.

## Milestones

1. **M0** — Spec freeze, farmer onboarding flow, single city (Moscow). End of week 1.
2. **M1** — Consumer storefront MVP, search, checkout via YooKassa. End of week 4.
3. **M2** — SDEK + Boxberry shipping integration. End of week 7.
4. **M3** — PostGIS geo search + delivery radius per farmer. End of week 10.
5. **M4** — Expand to St Petersburg + Kazan; onboard 50 more farmers. End of week 14.

## Risks

- **Farmer onboarding drop-off** — farmers abandon at KYC. Mitigation: 1-page onboarding with photo upload via mobile camera; Prody agent assists in chat.
- **Shipping damage claims** — Mitigation: farmer-set shipping method (ambient, refrigerated); buyer can decline perishable orders if the cold-chain tag is missing.
- **Regulatory compliance** — Mitigation: legal review before launch; required display of OGRN/IP on every farmer storefront.
