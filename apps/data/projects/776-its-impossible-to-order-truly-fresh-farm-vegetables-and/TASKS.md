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

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/776-its-impossible-to-order-truly-fresh-farm-vegetables-and/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Stand up Django + PostgreSQL + Redis + Celery
- [ ] Build the producer onboarding with per-day inventory and per-item cut-off schedule enforced at the platform layer
- [ ] Implement the producer-side fulfilment timestamp recorder and the rider handover confirmation
- [ ] Build the consumer catalogue with producer-by-produker listings and picked-or-baked timestamps
- [ ] Add the multi-producer basket with cut-off-aware checkout that drops expired items with reason
- [ ] Implement the route planner per neighbourhood per delivery window with pickup-order optimisation
- [ ] Add the Mapbox-backed consumer-facing tracker showing the rider's multi-producer route
- [ ] Build the per-producer freshness rating with the rating shown on the producer's profile
- [ ] Implement the per-order settlement with the producer's net receipt visible and the platform's percentage taken at the consumer side
- [ ] Wire the weekly producer payouts through Stripe with the net receipt line item per order
- [ ] Add the next-window availability surface by producer, replacing any misleading 'available now' label
- [ ] Write an integration test that orders across three producers, runs cut-off enforcement, routes a rider through pickup order, and records a producer payout with the platform's percentage at the consumer side

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-18_
