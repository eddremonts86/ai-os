---
id: "234"
slug: its-impossible-to-order-truly-fresh-farm-vegetables-and
title: "It's impossible to order truly fresh farm vegetables and bread through delivery aggregators \u2014 product quality is low, and you have to go to the market yourself"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/food/a6dgf1icc1-its-impossible-to-order-truly-fresh-farm"
category: food
date: "2026-01-22"
tags: [Logistics, Retail, Other]
country: Russia
tech: [Next.js 14, TypeScript, PostgreSQL, PostGIS, Stripe Connect, Yandex Maps API, Telegram Bot API]
---
# It's impossible to order truly fresh farm vegetables and bread through delivery aggregators — product quality is low, and you have to go to the market yourself

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/234-its-impossible-to-order-truly-fresh-farm-vegetables-and/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Postgres schema: vendors, listings, freshness_claims, orders, ratings
- [ ] PostGIS index on vendor geolocation
- [ ] Vendor onboarding form with KYB document upload
- [ ] Listing editor with harvest-date / bake-date field
- [ ] Buyer browse page with Yandex Maps view of nearby vendors
- [ ] Freshness filter (today / yesterday / this week)
- [ ] Order placement flow with YooMoney + Tinkoff + SBP
- [ ] Telegram bot for vendor order notifications
- [ ] Buyer-side rating after delivery, tied to freshness claim

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Next.js 14, TypeScript, PostgreSQL) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 234-it-s-impossible-to-order-truly-fres MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in Russia completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Next.js 14, TypeScript, PostgreSQL errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
