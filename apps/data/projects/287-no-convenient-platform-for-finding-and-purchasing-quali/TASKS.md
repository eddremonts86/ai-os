---
id: "287"
slug: no-convenient-platform-for-finding-and-purchasing-quali
title: No convenient platform for finding and purchasing quality products from local fa
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/food/8ypvtt1my1-no-convenient-platform-for-finding-and-purchas"
category: food
date: "2025-10-29"
tags: [Food, Business, Marketplace]
country: Russia
tech: [Next.js 14, TypeScript, Postgres + PostGIS, YooKassa payments, SDEK / Boxberry shipping, Sentry]
---
# No convenient platform for finding and purchasing quality products from local fa

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/no-convenient-platform-for-finding-and-purchasing-quali/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Farmer onboarding: passport upload, IP/OGRN capture, farm photo, region, product list.
- [ ] Producer profile page: farm story, photos, certifications, region, shipping policy.
- [ ] Product catalogue with seasonal availability calendar (start/end dates, stock).
- [ ] Geo search: city + delivery radius filter using PostGIS.
- [ ] Cart and checkout: YooKassa integration with card + SBP payment.
- [ ] Order lifecycle state machine: pending → paid → shipped → delivered → released.
- [ ] Shipping label generation via SDEK and Boxberry for farmer-paid shipping.
- [ ] Tracking webhook integration: SDEK + Boxberry → buyer-facing order status.
- [ ] Buyer reviews + farmer ratings after delivery confirmation.
- [ ] Featured listings slot — admin-flagged farmers get top placement in their category.
- [ ] Russian-language-only UI; right Cyrillic typography and ruble formatting throughout.

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Next.js 14, TypeScript, Postgres + PostGIS) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 287-no-convenient-platform-for-finding- MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in Russia completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Next.js 14, TypeScript, Postgres + PostGIS errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
