---
id: "766"
slug: an-african-entrepreneur-cannot-accept-international-pay
title: "An African entrepreneur cannot accept international payments on Shopify. PayPal blocks, Stripe is unavailable. There is no payment gateway that does not discriminate based on geography."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/finance/ces298ikj1-an-african-entrepreneur-cannot-accept-in"
category: finance
date: "2026-02-11"
tags: [Finance, Legal, Business, Other]
country: Benin
tech: [Node.js, Hono, Cloudflare Workers, D1 (SQLite at edge), Hyperwallet Africa, Flutterwave, Cloudflare R2]
---
# An African entrepreneur cannot accept international payments on Shopify. PayPal blocks, Stripe is unavailable. There is no payment gateway that does not discriminate based on geography.

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/766-an-african-entrepreneur-cannot-accept-international-pay/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Stand up the Node.js + Hono service on Cloudflare Workers with D1 as the ledger
- [ ] Build the country-agnostic onboarding flow that hides the upstream compliance checks behind a single merchant-facing surface
- [ ] Implement the Shopify app-store integration with a single country-agnostic install path
- [ ] Build the routing engine: merchant-country × buyer-country → upstream rail
- [ ] Add FX rate lock at transaction time and a rate snapshot recorded against the reconciliation row
- [ ] Wire international card processing through the regional aggregator for launch markets
- [ ] Wire mobile-money and domestic-card acceptance for launch markets including Francophone Africa
- [ ] Add payouts to local bank accounts and mobile-money handles on each rail's settlement schedule
- [ ] Build the consolidated dispute inbox across all upstreams with action propagation
- [ ] Implement the fallback-rail consent flow and per-transaction consent audit row
- [ ] Add the reconciliation feed with originating rail, fees, FX snapshot, and settlement destination
- [ ] Write an integration test that exercises a successful transaction, a fallback-rail retry, and a chargeback through the consolidated inbox

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-18_
