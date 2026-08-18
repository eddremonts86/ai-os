---
id: "301"
slug: low-trust-level-in-nigerian-e-commerce-due-to-lack-of-r
title: Low trust level in Nigerian e-commerce due to lack of reliable logistics service
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/logistics/8msk10fu31-low-trust-level-in-nigerian-e-commerce-d"
category: logistics
date: "2025-11-13"
tags: [Logistics, Business, Retail, Other]
country: Nigeria
tech: [Next.js, TypeScript, Postgres, Flutterwave, Termii SMS, Mapbox Directions API, Hetzner]
---
# Low trust level in Nigerian e-commerce due to lack of reliable logistics service

## Phase 0: Scaffold

- [x] Capture problem from ProblemHunt + write SPEC.md skeleton
- [ ] Define DESIGN.md (city selector, order status timeline, COD ledger)
- [ ] Provision Hetzner VPS + Postgres + Coolify reverse proxy
- [ ] Wire Termii + Flutterwave sandbox accounts
- [ ] Pick auth model for merchants (email + phone OTP) and riders (phone OTP only)

## Phase 1: Core

- [ ] Merchant onboarding: business name, pickup address, default zone, bank account for payouts
- [ ] Order intake form + server action: pickup, drop-off, COD amount, declared value
- [ ] Nearest-rider assignment worker using Mapbox distance
- [ ] Rider PWA: accept/decline job, navigate to pickup, mark picked up, mark delivered (with photo)
- [ ] Buyer tracking page at `/track/` with status timeline and rider phone
- [ ] Status change → Termii SMS to buyer (pickup, on-the-way, delivered)
- [ ] COD ledger: rider-cash-collected event → merchant pending balance → T+1 Flutterwave payout to merchant bank
- [ ] Dispute flow: buyer flags order; payout freezes until merchant or ops resolves
- [ ] End-to-end test in one Lagos zone: 50 orders, 5 riders, on-time rate target

## Phase 2: Deploy

- [ ] Move Flutterwave to live mode
- [ ] Apply for Termii dedicated sender ID
- [ ] Recruit 5–10 pilot merchants in 3 Lagos zones (Yaba, Ikeja, Surulere)
- [ ] Coolify-side deployment of the dashboard backend
- [ ] Status page + Flutterwave webhook monitoring
- [ ] Post-mortem after week 10 with the pilot cohort
