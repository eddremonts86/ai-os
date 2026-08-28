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

## Tech Stack

- **Merchant dashboard + buyer tracking page:** Next.js 14 (App Router), TypeScript, deployed on Hetzner behind a Coolify reverse proxy.
- **Database:** Postgres on Hetzner for orders, riders, ledger, disputes.
- **Payments + COD payout:** Flutterwave for merchant subscription billing and same-day payout to riders.
- **SMS + status pings:** Termii (Nigerian sender ID) for buyer-facing notifications.
- **Maps + routing:** Mapbox Directions API for distance, ETA, and rider navigation.
- **Rider mobile app:** lightweight PWA (no app store install) — critical for low-end Android adoption.

## Architecture

A Next.js app serves three surfaces from one codebase: the merchant dashboard (authed RSC), the buyer tracking page (public per-order token), and the rider PWA (cookie-based session). Order intake is a POST to a server action that writes to Postgres and queues an assignment job. A worker polls for unassigned orders and uses Mapbox distance to suggest the nearest available rider. Status updates from the rider app flow back via a server action that triggers Termii SMS to the buyer.

```
Browser (merchant) ─▶ Next.js dashboard ─┐
Browser (buyer) ─▶ Next.js tracking page ┼─▶ Postgres ─┐
Rider PWA ─▶ Next.js ride actions ───────┘             │
                                              ┌─────────┴─────────┐
                                              ▼                   ▼
                                       Mapbox Directions     Termii SMS
                                              │                   │
                                              └──────► Flutterwave payout
```

## Milestones

1. **M0 — Spec freeze.** SPEC.md + DESIGN.md + Lagos single-zone pilot approved. End of week 1.
2. **M1 — Order intake + rider PWA.** Merchant posts orders; nearest-rider assignment works on a single zone. End of week 3.
3. **M2 — Live tracking + SMS pings.** Buyer sees a status page; status changes fire Termii SMS. End of week 5.
4. **M3 — COD reconciliation.** Rider marks cash; merchant ledger updates; Flutterwave payout on T+1. End of week 7.
5. **M4 — Dispute flow + 3-zone pilot.** Buyer can dispute; payouts freeze; pilot expands to two more Lagos zones. End of week 10.

## Risks

- **Rider fraud** — a rider could mark "delivered" without delivering. Mitigation: buyer confirmation step + photo proof at drop-off.
- **COD cash-in-transit loss** — riders carrying large cash totals are a target. Mitigation: same-day Flutterwave payout reduces the float window to hours, not days.
- **Buyer trust recovery** — a single visible failure erodes trust in the whole brand. Mitigation: aggressive dispute handling + a public on-time rate per city.
