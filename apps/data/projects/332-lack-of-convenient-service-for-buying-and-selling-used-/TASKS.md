---
id: "332"
slug: lack-of-convenient-service-for-buying-and-selling-used-
title: Lack of convenient service for buying and selling used cars
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/retail/a40dcs4621-lack-of-convenient-service-for-buying-an"
category: retail
date: "2025-10-29"
tags: [Retail, Other]
country: USA
tech: [Next.js, Stripe Connect (Express), Twilio Messaging API, Snowflake data share with Carfax, Postgres]
---
# Lack of convenient service for buying and selling used cars

## Phase 0: Scaffold

- [ ] Read the source at `https://problemhunt.pro/en/retail/a40dcs4621-lack-of-convenient-service-for-buying-an` and quote the original problem statement into a `source-quote.md` for traceability.
- [ ] Create the project folder under `apps/332-lack-of-convenient-service-for-buying-an/` (or per the chosen deployment target).
- [ ] Initialize git, pin dependencies for: Next.js, Stripe Connect (Express), Twilio Messaging API, and confirm versions resolve in CI.
- [ ] Wire Stripe (or the regional PSP for {country}) in test mode and document the price model in PRODUCT.md.
- [ ] Write DESIGN.md with country-appropriate defaults (`country: USA`) — color, type, density, motion tokens — not the global default.
- [ ] Scaffold the auth + persistence layer with data-residency configured for USA.
## Phase 1: Core

- [ ] Seller intake flow (VIN, photos, reserve, address) with mobile photo guideline
- [ ] Inspection scheduling with in-person slot booking and route optimisation for inspectors
- [ ] 150-point mobile inspection checklist (iPad) with photo upload per item
- [ ] Listing template: model, year, mileage, location, inspection report
- [ ] Stripe Connect escrow: buyer funds held, seller paid on title receipt
- [ ] Title filing: pre-filled state forms, mail-in option, status tracking
- [ ] Pilot in TX, FL, AZ with 25 transactions across the first 90 days

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Next.js, Stripe Connect (Express), Twilio Messaging API) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 332-lack-of-convenient-service-for-buyi MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in USA completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Next.js, Stripe Connect (Express), Twilio Messaging API errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
