---
id: "224"
slug: an-african-entrepreneur-cannot-accept-international-pay
title: "An African entrepreneur cannot accept international payments on Shopify. PayPal blocks, Stripe is unavailable, and local processors are limited to local cards."
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/"
category: fintech
date: "2026-02-11"
tags: [Fintech, Africa, E-commerce]
country: Benin
tech: [Python, FastAPI, Shopify, Stripe Connect, Flutterwave, PostgreSQL]
---
# An African entrepreneur cannot accept international payments on Shopify. PayPal blocks, Stripe is unavailable, and local processors are limited to local cards.

## Phase 0: Scaffold

- [ ] Read the source at `https://problemhunt.pro/` and quote the original problem statement into a `source-quote.md` for traceability.
- [ ] Create the project folder under `apps/224-an-african-entrepreneur-cannot-accept-in/` (or per the chosen deployment target).
- [ ] Initialize git, pin dependencies for: Python, FastAPI, Shopify, and confirm versions resolve in CI.
- [ ] Write DESIGN.md with country-appropriate defaults (`country: Benin`) — color, type, density, motion tokens — not the global default.
- [ ] Scaffold the auth + persistence layer with data-residency configured for Benin.
- [ ] Wire Stripe (or the regional PSP for {country}) in test mode and document the price model in PRODUCT.md.
## Phase 1: Core

- [ ] Partner-of-record onboarding in EU/UK
- [ ] Shopify public-app plugin
- [ ] Customer disclosure at checkout
- [ ] Transaction ledger with audit trail
- [ ] USDC and bank transfer settlement
- [ ] Refund workflow with 90-day window
- [ ] Merchant dashboard with transaction history
- [ ] First 100 merchants live end-to-end
- [ ] Trust page with partner list

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Python, FastAPI, Shopify) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 224-an-african-entrepreneur-cannot-acce MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in Benin completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Python, FastAPI, Shopify errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
