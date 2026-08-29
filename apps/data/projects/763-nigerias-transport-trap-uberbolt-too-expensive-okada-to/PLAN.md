---
id: "763"
slug: nigerias-transport-trap-uberbolt-too-expensive-okada-to
title: "Nigeria's transport trap: Uber/Bolt too expensive, okada too deadly, Danfo buses a nightmare. Millions need safe, affordable carpooling. Ready to pay."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/transportation/i0p4ciscj1-nigerias-transport-trap-uberbolt-too-exp"
  captured: "2026-02-13"
category: transportation
date: "2026-02-13"
tags: [Transportation, Other]
country: Nigeria
wtp:
  raw: $5–10 per ride
  currency: USD
  min: 5
  max: 10
  period: one-shot
tech: [Flutter (Android-first), Node.js API, PostgreSQL with PostGIS, "USSD fallback via Africa's Talking", Paystack / Flutterwave for cards and bank transfer, Mapbox / OpenStreetMap for routing, driver KYC via BVN + NIN + selfie liveness]
---
# Nigeria's transport trap: Uber/Bolt too expensive, okada too deadly, Danfo buses a nightmare. Millions need safe, affordable carpooling. Ready to pay.

## Tech Stack

- **Mobile:** Flutter, Android-first; iOS in Phase 2 because Android dominates the Nigerian mid-tier market the source targets.
- **API:** Node.js (Express or Hono), running behind a CDN edge for the static landing page.
- **Data:** PostgreSQL with PostGIS for geo queries on routes and matches; Redis for live driver / rider location with a 30-second TTL so the matching loop is fast.
- **Routing:** Mapbox for in-app map tiles; OSRM (self-hosted) for routing and ETA because Mapbox rate limits would blow the cost ceiling at the $5–10 per ride price point.
- **Payments:** Paystack and Flutterwave for cards, bank transfer, and USSD payments; both have well-trodden Nigerian integrations and the dual integration lets the rider pick the channel their bank supports.
- **USSD / SMS:** Africa's Talking for the offline-channel booking flow.
- **Driver KYC:** BVN verification via a licensed Nigerian KYC provider (Mono, Smile Identity, or Dojah), NIN verification through NIMC's API where available, selfie liveness via Smile Identity or a comparable provider.
- **Trip support:** in-app SOS button triggers an SMS alert to two pre-set emergency contacts with the rider's live location, and a webhook into a 24/7 human call-centre service (e.g. a partner like EHA / Tremendoc).

## Architecture

```
Rider Android app ─────▶ API (Node.js)
                              │
Driver Android app ──────────┤
                              ▼
                       PostgreSQL/PostGIS
                              │
                              ├─▶ Redis (live locations, 30s TTL)
                              │
                              ├─▶ OSRM (self-hosted) for routing + ETA
                              │
                              ├─▶ Paystack / Flutterwave for payments
                              │
                              ├─▶ Africa's Talking for USSD / SMS
                              │
                              └─▶ SOS webhook ─▶ 24/7 call-centre partner
```

The matching engine reads from Redis, not the DB, so a rider in Lekki asking for "shared ride to Ikeja before 8am" gets a list of currently-active drivers on that corridor in under a second. Payments are settled asynchronously after the trip completes — the rider pays the platform, the platform pays the driver — so a single Paystack failure does not strand the driver with no payout.

## Milestones

1. **M0 — Spec freeze.** SPEC.md + DESIGN.md + driver-KYC provider shortlist approved. End of week 1.
2. **M1 — Driver onboarding.** KYC flow end-to-end with a licensed provider; first 50 verified driver-owners onboarded in Lagos. End of week 4.
3. **M2 — Rider app + matching.** Flutter Android app with route search, matched driver list, booking flow; first 200 paying riders complete at least one trip. End of week 8.
4. **M3 — Payments + cost split.** Paystack + Flutterwave live; per-seat settlement; in-app cost split across multiple riders on the same route. End of week 10.
5. **M4 — Safety + SOS.** In-app SOS button, emergency-contact SMS, 24/7 call-centre integration; SOS response time measured end-to-end. End of week 12.
6. **M5 — Pilot scale.** 2,000 active riders and 200 verified drivers in Lagos, weekly review with the source author. End of week 16.

## Risks

- **Naira volatility.** The $5–10 ceiling is in USD but costs and revenue are in naira. A 20% naira devaluation in a quarter can flip a profitable ride into a loss-making one. Monthly naira repricing with the source's $5–10 band as the anchor is the only honest answer; the engineering must support the repricing without redeploying.
- **Driver KYC provider lock-in.** Nigerian KYC providers have had outages and regulatory changes that take down sign-up flows overnight. The KYC layer must sit behind an internal `KycProvider` interface so a provider swap is a config change, not a rewrite.
- **USSD implementation cost.** USSD session state is fragile and Africa's Talking's pricing is per-session. If USSD books 1% of rides but costs 15% of the integration time, the v1 should defer it; the threshold for inclusion must be explicit, not aspirational.
- **Safety incident playbook.** The first serious safety incident on the platform will set the public narrative for a year. A documented, rehearsed incident playbook (who calls the family, who contacts the police, who suspends the driver, who tells the press) must exist before launch, not after the first incident.
