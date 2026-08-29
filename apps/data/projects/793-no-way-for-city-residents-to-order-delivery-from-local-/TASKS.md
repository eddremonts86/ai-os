---
id: "793"
slug: no-way-for-city-residents-to-order-delivery-from-local-
title: No way for city residents to order delivery from local stores to their elderly relatives in remote villages
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/logistics/kos2aznku1-no-way-for-city-residents-to-order-deliv"
category: logistics
date: "2026-01-13"
tags: [Logistics, Retail, Other]
country: Russia
tech: [Python, FastAPI, PostgreSQL with PostGIS, Redis, Celery, Telegram Mini App, WhatsApp Business API, Yandex Maps geocoder, Sberbank or Tinkoff payment integration, Coolify]
---
# No way for city residents to order delivery from local stores to their elderly relatives in remote villages

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/793-no-way-for-city-residents-to-order-delivery-from-local-/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Model the village courier (identity, verification state, coverage zone, availability window) and the order (two legs, handoff point, recipient confirmation) in PostgreSQL with PostGIS.
- [ ] Build the village-courier sign-up and verification flow with the published verification rubric, and the coverage-zone declaration.
- [ ] Implement the routing plane's spatial join: a city courier covers the store, a verified village courier covers the recipient's zone; refuse to assign otherwise.
- [ ] Build the requester Telegram Mini App with the order-placement flow, the two-leg price breakdown, and the recurring-order setup.
- [ ] Wire the licensed payment processor (Sberbank or Tinkoff) for the requester's payment and the escrow that holds the funds until recipient confirmation.
- [ ] Build the city-courier integration with the handoff protocol: timestamp, photo where supported, courier identifier.
- [ ] Build the village-courier surface for pickup confirmation, delivery confirmation, and the recipient confirmation step (SMS or call).
- [ ] Implement the per-order tracking page the requester can open, with each transition timestamped and the parties named.
- [ ] Implement the escrow-release event on recipient confirmation, with both legs paid out and the order-state machine closed.
- [ ] Add the recurring-order Celery job, with the coverage-rule gate that pauses the job when no village courier is available.
- [ ] Add the WhatsApp Business API plane as a second requester surface, sharing the same order model.
- [ ] Add the documented data-retention policy and the escalation path for missed handoffs, with perishable-goods flag support.
- [ ] Add the regulatory-confirmation milestone before live orders: Russian personal-data rules, payment-processor licensing, courier classification.
- [ ] Wire Russian-language copy throughout requester, courier and operator surfaces; keep English out of scope at MVP.
- [ ] Run an end-to-end test: a city resident places an order for an elderly relative in a remote village, the city leg completes, the handoff is logged, the village courier picks up and delivers, the recipient confirms, both legs are paid.

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-18_
