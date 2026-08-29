---
id: "874"
slug: lack-of-convenient-service-for-buying-and-selling-used-
title: Lack of convenient service for buying and selling used cars
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/retail/a40dcs4621-lack-of-convenient-service-for-buying-an"
  captured: "2025-10-28"
category: retail
date: "2025-10-28"
tags: [Retail, Other]
country: USA
wtp:
  raw: fixed one-time fee per transaction (works for both buyers and sellers)
  currency: USD
  min: 0
  max: 0
  period: one-shot
  mrrMid: 0
tech: [Next.js, TypeScript, Go (API), PostgreSQL, Stripe Connect]
---
# Lack of convenient service for buying and selling used cars

## Phase 0: Scaffold

- [x] Capture problem from ProblemHunt + write SPEC.md skeleton
- [ ] Stand up the Next.js + Go API skeleton, Postgres for listings + offers + transaction records, the per-state adapter scaffolding
- [ ] NMVTIS + NHTSA API integration, history-bundle cache keyed on VIN with a freshness timestamp
- [ ] Pick the two launch states (one with permissive private-party sales mechanics, one stricter) and document the per-state expansion criteria for state 3
- [ ] Stripe Connect Express account flow designed and tested, fixed-fee Payment Intent flow prototyped
- [ ] Per-transaction evidence-bundle schema drafted so the dispute path is in mind from day one

## Phase 1: Core

- [ ] Seller flow: enter VIN → pull NMVTIS + NHTSA → upload photos → publish listing with the merged history bundle and the explicit "what we have / what we do not" disclosure
- [ ] Listing surface: mobile-first, large photos, history bundle prominent, per-state disclaimer about NMVTIS coverage
- [ ] Offer thread: buyer makes offer, seller counter-offers, conversation anchored to the vehicle's facts, no detachment from the listing
- [ ] Stripe Connect close: Express account created at first offer (not at signup, to defer friction), split payment on close, fixed fee deducted, immutable transaction record written
- [ ] Per-state title-transfer and sales-tax handling for the two launch states, with the third state explicitly gated on a checklist
- [ ] Dispute handling: Stripe dispute webhook, evidence-bundle auto-attach, 12-month evidence retention
- [ ] End-to-end test: a seller lists a car with a real VIN, a buyer makes an offer and counter, the deal closes via Stripe Connect, both sides receive the immutable transaction record, a synthetic dispute is filed and the evidence bundle is attached

## Phase 2: Deploy

- [ ] Move Stripe to live mode and KYC the company entity in the two launch states
- [ ] Public launch post with the two-state scope explicit, no national-implication claims
- [ ] Onboard 50 closed transactions across the launch states, weekly dispute-rate review, monthly published close-rate
- [ ] Publish a per-state expansion checklist so a third-state launch is a deliberate decision, not a scope-creep accident
- [ ] Quarterly review of the per-transaction fee band ($79–$199) and a published price update either way
