---
id: "306"
slug: gps-based-taxi-and-delivery-solution-for-zimbabwe
title: GPS-based taxi and delivery solution for Zimbabwe
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/logistics/qkqb82u8i1-gps-based-taxi-and-delivery-solution"
category: logistics
date: "2025-11-12"
tags: [Logistics, Mobility, Other]
country: Zimbabwe
tech: [Next.js, TypeScript, Postgres, Expo React Native, Mapbox Directions API, EcoCash, Hetzner]
---
# GPS-based taxi and delivery solution for Zimbabwe

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A Harare customer can book a taxi or a parcel courier from a phone, watch the driver approach on a live map, and pay via EcoCash or OneMoney — without standing on a corner or calling a dispatcher.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Harare resident | Currently hails by corner or phone call; wants the visibility that Uber-style apps give. |
| Small-shop owner | Needs same-day intra-city parcel delivery with proof of drop-off. |
| Independent driver | Wants a steady stream of paying trips and same-day settlement to mobile money. |

## Jobs To Be Done

1. **Functional job** — Get from A to B (or send a parcel from A to B) with a known driver, a known ETA, and a known price.
2. **Emotional job** — Replace the anxiety of "will they show up?" with a live map.
3. **Social job** — Have a receipt to share with an employer or household.

## Success Metrics

- **Average ETA accuracy:** predicted ETA within ±3 minutes of actual pickup in 80% of trips.
- **Driver acceptance rate:** ≥ 60% of broadcast trips accepted within 60 seconds.
- **Daily settlement:** ≥ 95% of driver earnings land in EcoCash / OneMoney within 24 hours of trip completion.
- **Repeat usage:** ≥ 40% of customers book a second trip within 14 days.

## Pricing & Monetization

Per-trip commission (15% of fare) + a small booking fee on each parcel delivery. No subscription in v1.

## Competitive Landscape

- **Informal taxi ranks + phone dispatch** — works, but no map, no receipt, no accountability.
- **Bolt / Uber** — not currently available in Zimbabwe at scale; this product targets the gap.
- **WhatsApp-based dispatch groups** — fast for regulars, opaque for newcomers, no payment integration.

## Risks & Open Questions

- [ ] Confirm EcoCash / OneMoney API access before launch; if blocked, fall back to USSD-based confirmation with a manual driver-side reconciliation step.
- [ ] Decide whether to bundle taxi and parcel in one app or split into two surfaces.
- [ ] Define the dispatcher fallback SLA — how long until a trip is reassigned to avoid leaving the customer stranded.

---

_Source:_ [ProblemHunt](https://problemhunt.pro/en/logistics/qkqb82u8i1-gps-based-taxi-and-delivery-solution) · **Category:** logistics · **Tags:** Logistics,Mobility,Other
