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

## Tech Stack

- **Flutter:** one codebase covering the customer app and the driver app, which matters when the entire launch budget is about $2,400. Two native builds would consume it before a single delivery ran.
- **Django REST + Postgres with PostGIS:** the domain is orders, daily availability, delivery zones and routes. PostGIS is doing real work here — zone membership, clustering orders by proximity and choosing which addresses fit one trip are geospatial queries, not application logic.
- **OpenRouteService for sequencing:** an open routing engine keeps per-route cost at zero, which is the only tenable position when each delivered basket carries a few dollars of margin. A commercial optimisation API would cost more per month than the produce it routes.
- **Cold-chain telemetry ingestion, optional and cheap:** a single logger per vehicle recording temperature over a run, uploaded afterwards. Not a monitoring platform — just enough evidence to learn whether spoilage comes from time, heat, or handling, given the author says suitable containers do not exist yet.
- **Razorpay:** matches the rupee-denominated budget in the source. This choice is contingent on resolving the geography question, since a Japanese operation would need a different processor entirely.
- **The existing website stays:** the app talks to the same backend, and the website gets an ordering surface rather than being replaced, because integration with it is a stated requirement.

## Architecture

Everything hangs off a daily cycle rather than a continuous catalogue, because that is how a harvest works. In the morning the farm publishes availability: what was picked, quantities, and a cutoff time. Orders accumulate against that list until the cutoff, each one landing in a delivery zone determined by PostGIS.

At cutoff the system batches: orders are grouped by zone and window, and each batch is sequenced into a route. This is where the economics live — a single vegetable order cannot pay for its own trip, so the batch density decides whether the day is profitable. The route goes to a third-party driver's app, because the author has ruled out owning trucks; the driver sees a sequence, not a map to interpret.

The weather gate sits before order acceptance, not after. Conditions that make a window undeliverable close that window in the app, so customers see no promise rather than a broken one. This inverts the usual approach and is deliberate: extreme weather is a named cause of the original failure, and a farm's reputation with direct customers cannot absorb repeated missed deliveries.

Post-delivery, each order carries its actual cost: driver payment share, distance, and any spoilage recorded. That is what produces the per-zone contribution view, which is the operator's tool for closing unprofitable areas instead of subsidising them out of a margin that is already zero.

## Milestones

1. **M0 — Resolve geography and delivery capacity.** Confirm the operating country (the source records Japan with a rupee budget) and identify who actually drives. Both are blockers, not preliminaries. End of week 2.
2. **M1 — Availability and ordering on the existing website.** Daily availability list, cutoff, zone-scoped ordering, payment. No app yet — the cheapest path to a real order. End of week 5.
3. **M2 — Manual same-day runs.** Batch by hand, deliver, and record time-to-door, spoilage and cost per order for two weeks. This is the data the routing work depends on. End of week 7.
4. **M3 — Batching and routing.** PostGIS zone clustering, OpenRouteService sequencing, driver view with the day's stops. End of week 10.
5. **M4 — Flutter customer app.** The direct-sales app the author asked for, against the same backend as the website. End of week 13.
6. **M5 — Weather gate and margin view.** Window closure ahead of ordering, per-zone contribution reporting, spoilage attribution. End of week 15.
7. **M6 — Season run.** Operate through a full weather cycle, measuring full-price share against the previous distress-sale baseline. End of week 22.

## Risks

- **The geography contradiction blocks the build.** The source records Japan as the country and states the budget in Indian rupees. Delivery cost structures, driver availability, payment rails, food-handling rules and customer expectations for same-day produce are all incompatible between those two markets. Any code written before this is answered may be written for the wrong country.
- **$2,400 for an app and a logistics operation.** The budget covers both, by the author's own statement. Realistically that funds one of the two properly, which is why M1 and M2 deliberately deliver orders before any app exists. Spending the budget on a Flutter build and then discovering the delivery arrangement does not work is the most likely way this fails.
- **Delivery capacity may simply not be available.** Trucks are ruled out, existing logistics services were assessed as unsuitable for fresh produce, and third-party drivers may not accept low-value produce runs inside a tight freshness window. If none of the three works, the same-day promise has no mechanism behind it.
- **Weather closes the window on the days produce most needs to move.** A gate that protects trust also withholds revenue exactly when the harvest is already in and perishing. Closing windows honestly is right and will still hurt, and the operator has to accept that trade before it happens.
- **Unit economics of low-value perishables.** A basket of vegetables carries a few dollars of margin against a delivery that costs real money. Batching is the only lever, and batching requires enough same-zone orders per day — which is a demand problem the source says nothing about.
- **Demand is entirely unevidenced.** The author's pain is documented in detail; the customer's willingness to buy vegetables through a farm app at a price covering delivery is not mentioned once. M1 exists to test that before anything expensive is built.
- **No containers means the freshness window is the only protection.** With suitable containers named as missing and buying them rejected, spoilage control rests on shortening time-to-door. That makes routing quality a food-safety concern rather than an efficiency one.
- **Co-founder, not client.** The author is looking for a technical co-founder. Treating the budget as a project fee would misread the arrangement, and the ambiguity should be settled before work starts.
