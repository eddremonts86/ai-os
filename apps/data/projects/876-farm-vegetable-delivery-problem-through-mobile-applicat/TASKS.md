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

## Phase 0: Scaffold

- [x] Capture the problem, the rejected delivery options and the stated launch budget from ProblemHunt
- [ ] Confirm the operating country with the author before any routing, payment or compliance work
- [ ] Identify who provides delivery capacity, given trucks and containers are ruled out
- [ ] Django REST project with Postgres and PostGIS enabled
- [ ] Write DESIGN.md (availability list, checkout with window, driver stop sequence)
- [ ] Clarify whether the arrangement is a co-founder equity partnership or a paid build

## Phase 1: Core

- [ ] Daily availability publishing: picked items, quantities, and a hard order cutoff
- [ ] Delivery zones as PostGIS geometries, with address-to-zone resolution at checkout
- [ ] Ordering surface on the existing company website, sharing the backend the app will use
- [ ] Payment integration matched to the confirmed operating country
- [ ] Honest window display: show same-day availability only when it can be met, otherwise show nothing
- [ ] Two weeks of manual same-day runs, recording time-to-door, spoilage and cost per order
- [ ] Order batching by zone and window after cutoff
- [ ] Route sequencing per batch via OpenRouteService
- [ ] Driver app view: today's stops in order, with delivery confirmation per stop
- [ ] Weather gate closing windows before orders are accepted, not after
- [ ] Flutter customer app for direct sales against the same backend
- [ ] Per-order cost capture: driver share, distance, spoilage
- [ ] Per-zone contribution report so unprofitable areas can be closed
- [ ] Optional temperature logging per run to attribute spoilage to time or heat

## Phase 2: Deploy

- [ ] Publish the customer app to the store for the confirmed market
- [ ] Operate through a full weather cycle, measuring full-price share against the distress-sale baseline
- [ ] Review batch density and per-zone margin before expanding the delivery area
- [ ] Verify in production
