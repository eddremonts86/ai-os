---
id: "776"
slug: its-impossible-to-order-truly-fresh-farm-vegetables-and
title: "It's impossible to order truly fresh farm vegetables and bread through delivery aggregators — product quality is low, and you have to go to the market yourself."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/food/a6dgf1icc1-its-impossible-to-order-truly-fresh-farm"
category: food
date: "2026-01-22"
tags: [Food, Logistics, Retail, Other]
country: Russia
tech: [Python, Django, PostgreSQL, Redis, Celery, Stripe, Mapbox]
---
# It's impossible to order truly fresh farm vegetables and bread through delivery aggregators — product quality is low, and you have to go to the market yourself.

## Tech Stack

- **Python with Django** for the web app and the producer and consumer surfaces, because the platform has two sides with their own dashboards and Django's batteries-included approach is the cheapest pragmatic match for the team implied by the source's short capture.
- **PostgreSQL** as the primary store, because the producer inventory, the per-order basket, and the route plan are relational and the freshness timestamp is the central property the data model has to honour.
- **Redis** as the cut-off-schedule and route-plan cache, because the consumer catalogue re-evaluates against cut-offs every minute and the route shape is built per delivery window.
- **Celery** for the producer notification and the route-assignment background jobs, because these are asynchronous and scheduled rather than request-response, and Celery is Django's natural fit.
- **Stripe** for the consumer-side billing and the producer-side payouts, because the source names no billing preference and Stripe supports both sides in one stack.
- **Mapbox** for the consumer-facing tracking surface, because the neighbourhood route across multiple producer pickups is the visible product and the map is the trust surface.

## Architecture

Producers onboard by listing inventory they intend to fulfil that day, with a 'picked at' or 'baked at' timestamp they record at fulfilment. Each producer sets a cut-off time per item, after which the listing closes regardless of demand; the cut-off is structural because the freshness property is what the platform exists for. The consumer catalogue shows producer-by-producer with the cut-off time and the picked-or-baked timestamp, sorted by the next delivery window in the consumer's neighbourhood.

The basket is the order unit. A consumer can add items from multiple producers to one basket; the basket closes at the producer-by-producer cut-off, and an item whose cut-off has passed drops out with the producer's reason. Checkout commits the basket only when at least one item is still available at its cut-off, and the consumer pays once for the whole basket. The basket is the routing unit for delivery.

The delivery route is per neighbourhood and per delivery window. A single rider picks up from multiple producers in the neighbourhood (or in a single out-and-back from a small producer cluster) and delivers to a set of households on the route. The route planner optimises for pickup order so a producer's items don't sit in a saddlebag for an extra leg, and the consumer-facing tracker shows the rider's progress through the route rather than a generic 'out for delivery' label.

The producer payout is per order, with the platform's percentage taken at the consumer-side checkout. The producer's net receipt per order is visible in the producer dashboard, and weekly payouts aggregate the net receipts. The freshness rating per consumer per producer lands on the producer's profile, so the producer's listing quality is the rating the next consumer sees. The freshness-rating signal is the structural difference between this platform and the warehouse aggregator: freshness has an attributable owner.

## Milestones

1. **M1 — Producer onboarding and listing** — Producer profile; per-day inventory with picked-or-baked timestamp; per-item cut-off schedule enforced at the platform layer.
2. **M2 — Consumer catalogue and basket** — Producer-by-producer catalogue; multi-producer basket; cut-off-aware checkout that drops expired items with reason.
3. **M3 — Producer-side fulfilment** — Fulfilment timestamp recorded by the producer; handover confirmation to the rider.
4. **M4 — Routing and tracking** — Per-neighbourhood, per-window route plan; Mapbox-backed consumer-facing tracker with multi-producer pickup sequence.
5. **M5 — Consumer freshness rating** — Per-producer rating on freshness; rating shown on the producer's profile; rating aggregated into the producer's listing quality.
6. **M6 — Producer payout and net receipt** — Per-order settlement with the producer's net receipt visible; weekly Stripe payouts; the platform's percentage taken at the consumer side.
7. **M7 — Availability and cut-off surface** — Next-window availability surface by producer; misleading 'available now' label replaced by the explicit cut-off.

## Risks

- **Cut-off drift** — if the cut-off is advisory rather than enforced, the platform degrades into the warehouse aggregator the post names; enforcement is structural and tested.
- **Producer thinness** — a neighbourhood with one or two producers reproduces the catalogue-breath shape; launch is in a neighbourhood with enough producers to combine meaningfully in a basket.
- **Route inefficiency** — a route plan that sends a rider across the city to each producer is the single-hub failure; the route planner optimises for pickup order within a neighbourhood.
- **Producer fairness** — a platform that takes its percentage from the producer side is unfit; the percentage is taken at the consumer side and the net receipt is visible per order.
- **Freshness rating opacity** — ratings hidden in aggregate reviews do nothing for the producer's listing quality; the rating has to land on the producer's profile.
- **Cut-off honesty for the consumer** — a consumer-facing 'available now' label that hides a cut-off has to be replaced by the explicit cut-off schedule; the consumer's expectation has to be set honestly.
- **Operational scaling by neighbourhood** — each new neighbourhood is a new producer set and a new route shape; the team's operating cost scales with the neighbourhood count and the unit economics have to hold.
- **Producer repeat rate** — if the producers do not return to the platform, the freshness promise is structurally weak; the producer experience has to be the platform's other durable surface.
