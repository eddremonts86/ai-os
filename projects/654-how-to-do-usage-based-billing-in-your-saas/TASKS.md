---
id: "654"
slug: how-to-do-usage-based-billing-in-your-saas
title: How to do usage based billing in your saas?
status: draft
source:
  name: manual
category: other
---
_Lúa generó este análisis automáticamente el 2026-08-15_

## Phase 1: Core

- [ ] Wallet schema: customer_id, balance, last_topup_at, auto_topup_config
- [ ] Usage event ingestion endpoint (idempotent)
- [ ] Entitlement gate middleware
- [ ] Auto top-up worker (low-balance trigger)
- [ ] Stripe PaymentIntent + webhook handler
- [ ] Customer dashboard
