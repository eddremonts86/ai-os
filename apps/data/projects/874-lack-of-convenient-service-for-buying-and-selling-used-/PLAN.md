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

## Tech Stack

- **Front-end:** Next.js (App Router) for the listing, vehicle-history, and transaction flows; mobile-first because used-car transactions start on the seller's phone in the driveway.
- **API:** Go for the high-throughput listing and transaction paths; TypeScript / Next.js route handlers for the lighter CRUD endpoints.
- **Persistence:** PostgreSQL (single primary, replicas behind PgBouncer) for listings, vehicle-history snapshots, offer threads, transaction records.
- **Vehicle-history integration:** NMVTIS data provider integration (state-dependent access), NHTSA recalls API, Carfax or AutoCheck as a paid enrichment layer when a listing qualifies.
- **Payments:** Stripe Connect (Express accounts for sellers, direct charges from the platform) for the split payment and the fixed fee.
- **State-specific logic:** a per-state adapter layer for title-transfer mechanics, sales-tax rates, and dealer-license checks; the launch is two states with explicit expansion criteria per additional state.
- **Disputes:** Stripe's dispute API + a per-transaction evidence bundle stored for 12 months.

## Architecture

```
Browser ─▶ Next.js (listings + offer thread + transaction surface)
                │
                ├──▶ /api/listings/*  ──▶ Postgres
                │
                ├──▶ /api/history/* ──▶ NMVTIS / NHTSA / Carfax
                │                          │
                │                          └─▶ history bundle cache
                │
                ├──▶ /api/offers/*  ──▶ Postgres (offer threads)
                │
                └──▶ /api/transactions/* ──▶ Go API
                                              │
                                              ├─▶ Stripe Connect
                                              │     • split payment
                                              │     • fixed fee
                                              │     • disputes
                                              │
                                              └─▶ Postgres (transaction record)
```

The vehicle-history bundle is the trust asset. It is cached per VIN so the same VIN never re-pulls, and the snapshot timestamp is displayed on every listing so the buyer can see how fresh the bundle is. The transaction record is the second trust asset — it is immutable once the deal closes, and both sides get a permanent link.

## Milestones

1. **M0 — Listing surface + VIN pull.** Seller enters VIN, system pulls NMVTIS + NHTSA, listing draft created. End of week 3.
2. **M1 — Public listing + history bundle.** Listing goes public with the merged history bundle; mobile-first layout; per-state disclaimer about NMVTIS coverage. End of week 6.
3. **M2 — Offer thread + counter-offer.** Buyer makes offer, seller counter-offers, conversation anchored to the vehicle's facts (price relative to mileage / condition / history). End of week 9.
4. **M3 — Stripe Connect + fixed-fee transaction.** Express accounts for sellers, split payment on close, fixed fee deducted, immutable transaction record created. End of week 12.
5. **M4 — Dispute handling + evidence bundle.** Stripe dispute webhook, evidence-bundle auto-attach, per-state dispute-window logic. End of week 15.
6. **M5 — Second state launch.** Per-state adapter pattern validated on the second state, listing the explicit expansion criteria for state 3. End of week 20.
7. **M6 — Pilot cohort.** 50 closed transactions across launch states, weekly dispute-rate review, monthly published close-rate. End of week 28.

## Risks

- **NMVTIS coverage honesty.** The bundle is only as trustworthy as the data underneath it. NMVTIS is incomplete for cross-state vehicles, and a UI that implies completeness is a liability. The bundle must surface "what we have" and "what we do not" explicitly, not paper over the gap.
- **Per-state compliance footprint.** Each new state adds title-transfer mechanics, sales-tax logic, and dealer-license verification. A "national launch" without per-state validation is a regulatory risk; a two-state launch with explicit expansion criteria is the right MVP shape.
- **Dispute window adequacy.** Used-car transactions have a higher dispute rate than typical e-commerce, and a 60-day Stripe window may not cover a hidden-frame-damage claim that surfaces 90 days later. The product's terms must set buyer expectations explicitly, and the per-transaction evidence bundle must be retained for at least 12 months.
- **Cold-start supply / demand.** A marketplace that has no listings has no buyers, and a marketplace that has no buyers has no listings. The launch must seed with at least one side (likely the listing side, because the post author is a buyer) before opening the funnel to the other.
- **Stripe Connect onboarding friction.** A seller who has never used Stripe Connect has to complete identity verification before their first close. The onboarding flow must be deferred until the listing is published (so the seller invests time first), not gated at signup, or the funnel loses sellers before they list.
