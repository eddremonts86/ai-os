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

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A Nigerian commuter gets a verified-driver carpool at $5–10 per seat — half the price of Uber/Bolt, with KYC'd drivers (BVN + NIN + liveness), in-app SOS, emergency-contact sharing, and a rating system — instead of choosing between an unaffordable Uber ride, a life-risking okada trip, or a 2–3 hour Danfo crawl. The source author is offering to be a first user and provide active feedback, and the equity ask is documented but explicitly not a co-founder track.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Nigerian working professional (22–40) | Daily commute costs them $10–15 on Uber/Bolt or hours on Danfo; wants verified drivers at $5–10/seat. |
| Nigerian university student | Same daily commute pain, tighter budget, higher safety sensitivity (especially female students facing Danfo harassment). |
| Verified independent driver-owner | Owns a 4-door sedan, wants a steady stream of shared rides during commute windows; needs vetting, not just sign-up. |

## Jobs To Be Done

1. **Functional job** — Get to work or home for $5–10/seat with a verified driver, on a route they share with at least one other rider.
2. **Emotional job** — Stop feeling trapped between unaffordable, unsafe, and time-wasting options every morning.
3. **Social job** — Be a passenger in a car that other working professionals use, not a body squeezed onto a Danfo step.

## Success Metrics

- **Activation:** ≥ 60% of new riders complete KYC, book one ride, and complete one trip within 14 days of signup.
- **Cost-saved:** Median rider's per-trip spend drops by ≥ 50% versus their previous Uber/Bolt baseline.
- **Safety:** Driver KYC rejection rate for fraudulent applications ≥ 90%; rider SOS response time ≤ 30 seconds during pilot.
- **Retention:** ≥ 40% of activated riders take ≥ 8 rides per month after month 1 — that is the "this is my commute" signal.

## Pricing & Monetization

The source states $5–10 per ride as the rider's WTP; build the per-seat pricing around that and take a 15–20% platform fee on the rider-side payment. Mirror the source's naira reality by re-pricing in naira monthly, anchored to the $5–10 band via the day's USD/NGN rate, so the price holds even when the naira moves. Driver-side payout is per completed seat via Paystack / Flutterwave transfer; no subscription, no driver-side commission beyond the platform fee.

## Competitive Landscape

- **Uber / Bolt** — the comparison point the source uses; too expensive for daily Nigerian commutes, no carpool surface beyond UberPool which is not priced for the Nigerian mid-tier.
- **Local carpool apps (the source tried several)** — "either dead (no users), no driver verification, clunky interface, no rating system"; the gap is execution depth, not just existence.
- **WhatsApp ride coordination** — the workaround the source and their colleagues actually use; fails on accountability, schedule sync, cost splitting, and ratings.
- **Okada platforms (Gokada, MAX, ORide)** — for motorcycle taxis, not carpooling; some have been restricted in Lagos, and the safety story is exactly what the source is trying to avoid.
- **Danfo (status quo)** — the default the source wants an alternative to; cheap but unsafe, overcrowded, and slow.

## Risks & Open Questions

- [ ] Validate that driver KYC via BVN + NIN + selfie liveness actually rejects fraudulent applications at ≥ 90%; if not, the safety story collapses and the product is just "cheaper Uber" — which Bolt could undercut in a quarter.
- [ ] Confirm Mapbox / OSRM coverage for the Lagos commute corridors (Lekki–Ikeja, Yaba–VI, Surulere–Island) is good enough for accurate ETAs; bad ETAs destroy carpool trust because the rider is the one being late to work.
- [ ] Decide whether the USSD fallback ships in v1 or v2; the source author named female students as a target group and reaching them sometimes means reaching them without a smartphone, but USSD implementation cost is non-trivial.
- [ ] Settle the equity conversation with the source author explicitly; they ask for 1% and are willing to provide feedback, but the request says "not looking for a co-founder" — that is a relationship the founders handle, not the product spec.
