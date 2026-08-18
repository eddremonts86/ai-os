---
id: "295"
slug: finding-buyers-in-the-uk-for-nigerian-food-products-for
title: Finding buyers in the UK for Nigerian food products for export
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/business/8wwv1nzz31-finding-buyers-in-the-uk-for-nigerian-food-p"
category: business
date: "2025-10-29"
tags: [Business, Food, Export]
country: Nigeria
tech: [Next.js 14, TypeScript, Postgres, Stripe Connect (UK + NG), WhatsApp Business API, UK VAT-MOSS compliance flow, DHL / FedEx cross-border shipping API]
---
# Finding buyers in the UK for Nigerian food products for export

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/finding-buyers-in-the-uk-for-nigerian-food-products-for/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Producer onboarding: cooperative profile, region, NAFDAC numbers (where applicable), product list.
- [ ] UK-compliant product page template: ingredients, allergens, weight, importer, best-before.
- [ ] Storefront with Nigerian food categories: pantry, dried fish/meat, drinks, snacks.
- [ ] Stripe Connect checkout in GBP with UK VAT collection.
- [ ] Cross-border shipping: DHL/FedEx label generation, customs declarations, tracking webhooks.
- [ ] UK consolidation partner integration: producer-to-UK-warehouse shipping, repack, final-mile dispatch.
- [ ] Subscription flow for diaspora staples: palm oil monthly, egusi quarterly.
- [ ] Producer payout in NAIRA at daily mid-rate, minus commission.
- [ ] UK retailer wholesale tier: bulk listings, NET-30 invoicing, retailer self-service.
- [ ] Discover surface: diaspora-targeted landing pages in London, Manchester, Birmingham.
- [ ] Pilot with 20 producers, 500 UK buyers, week 12 NPS + repeat-buyer measurement.

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Next.js 14, TypeScript, Postgres) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 295-finding-buyers-in-the-uk-for-nigeri MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in Nigeria completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Next.js 14, TypeScript, Postgres errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
