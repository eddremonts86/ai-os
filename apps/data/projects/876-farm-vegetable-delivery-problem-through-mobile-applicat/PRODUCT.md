---
id: "876"
slug: farm-vegetable-delivery-problem-through-mobile-applicat
title: Farm vegetable delivery problem through mobile application
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/retail/mnvzelo5i1-farm-vegetable-delivery-problem-through"
  captured: "2025-10-27"
category: retail
date: "2025-10-27"
tags: [Retail, Logistics, Food, Other]
country: Japan
wtp:
  raw: "200,000 Indian rupees (≈ $2,400) to launch, including app development and logistics"
  currency: USD
  min: 2400
  max: 2400
  period: one-shot
tech: [Flutter, Django REST, Postgres with PostGIS, OpenRouteService routing, cold-chain telemetry ingestion, Razorpay]
---
# Farm vegetable delivery problem through mobile application

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

Vegetables picked this morning reach a customer's door today, ordered directly from the farm through an app tied to the farm's own website, delivered by capacity the farm does not have to buy. The operator stops discounting produce because logistics were too slow, and sees which areas and baskets actually clear a margin.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Farm operator (the author) | Sells at reduced prices daily without making a profit because delivery cannot be organised fast enough. Wants a direct-sales app with same-day delivery, and is looking for a technical co-founder to build it. |
| Household buying fresh produce | Wants vegetables fresher than a supermarket's supply chain delivers, on the day, without a trip. |
| Third-party driver or vehicle owner | Provides the delivery capacity the farm has already decided not to buy, and needs a sequenced route to make a short run worth taking. |
| The produce itself | Perishability is the clock the whole product runs against; every hour between picking and the door is margin. |

## Jobs To Be Done

1. **Functional job** — Get today's harvest to paying customers today, at farm-direct prices rather than distress prices.
2. **Emotional job** — Stop the daily experience of watching good produce sold at a loss because the route to the customer failed, not because the food did.
3. **Social job** — Sell as a farm customers can name and order from directly, instead of as an anonymous input to somebody else's supply chain.

## Success Metrics

- **Share sold at full price:** the direct counterpart to selling at reduced prices without profit. This is the metric the whole project exists to move.
- **Same-day fulfilment rate:** orders delivered within the promised window, split by weather condition, since extreme weather is a named cause of failure rather than an occasional excuse.
- **Orders per delivery trip:** the batching density that decides whether same-day delivery of low-value produce can pay for itself at all.
- **Spoilage and reject rate:** produce lost between picking and the door, which is the cost the missing suitable containers are supposed to prevent.
- **Contribution per order by area:** revenue minus delivery cost per delivery zone, so unprofitable areas can be closed rather than subsidised invisibly.
- **Repeat order rate within 30 days:** direct sales only beat discounting if customers come back, and a farm cannot buy its way to a second order.

## Pricing & Monetization

The only figure in the source is what the author will invest: 200,000 Indian rupees, about $2,400, to launch the solution including application development and logistics organisation. That is a build budget, not a customer price. No basket price, delivery fee or subscription is stated, so the revenue model is an open question — the honest reading is that the author is funding a channel for their own produce, and the margin recovered from ending distress sales is the return, not a software fee.

## Competitive Landscape

The source names what was tried and why each option failed, which bounds the landscape:

- **Self-organised delivery** — requires buying trucks and special containers, and is ineffective in bad weather. Rejected on both cost and reliability.
- **Existing logistics services** — assessed as not suitable for fast delivery of fresh vegetables. Built for parcels whose value does not decay hourly.
- **Selling at reduced prices** — the current fallback, and the definition of the problem: produce moves, profit does not.
- **Wholesale intermediaries and local markets** — the default route for a farm that cannot reach customers directly, and the reason the operator has no pricing power over their own harvest.

## Risks & Open Questions

- [ ] Resolve the geography. The plan records Japan as the country while the budget is stated in Indian rupees. Routing, payments, food-handling rules and even the viability of same-day produce delivery differ completely between those markets, and nothing downstream can be scoped until this is settled with the author.
- [ ] Validate that a $2,400 total budget can cover both an app and an operating delivery arrangement. If it cannot, the honest first version may be a website ordering page plus a manual route, with the app deferred.
- [ ] Establish where delivery capacity comes from, given trucks are ruled out: contracted local drivers, a gig platform, or scheduled runs — and whether any of them will handle produce inside the freshness window.
- [ ] Define the weather policy precisely. Closing windows before orders are taken protects trust but reduces revenue on exactly the days when produce most needs to move.
- [ ] Confirm that customer demand for same-day farm delivery exists at a price that covers the trip. The source establishes the operator's pain in detail and says nothing about buyer willingness to pay.
- [ ] The author is looking for a technical co-founder. Clarify whether this is an equity partnership or a paid build before scoping, since the budget figure reads as the former.
- [ ] Decide whether containers can be avoided entirely by shortening the time window instead, since suitable containers are named as missing and buying them was rejected.

---

_Source:_ [ProblemHunt](https://problemhunt.pro/en/retail/mnvzelo5i1-farm-vegetable-delivery-problem-through) · **Category:** retail · **Tags:** Retail,Logistics,Food,Other
