---
id: "654"
slug: how-to-do-usage-based-billing-in-your-saas
title: How to do usage based billing in your saas?
status: draft
source:
  name: manual
category: other
---
#

## Tech Stack

Stripe (Payments + Billing + webhooks) for the rails; a thin application layer that owns the credit-wallet model, entitlement gates, and auto top-up orchestration; Postgres for wallet state; an event bus (Inngest / Trigger.dev) for the top-up decisioning.

## Architecture

Usage event → wallet debit → if low balance → schedule top-up → Stripe PaymentIntent → confirm → credit wallet. Entitlement gate sits in front of the customer's API and returns 402 when balance is zero.

## Milestones

- [ ] Wallet schema + balance operations (atomic)
- [ ] Usage event ingestion API
- [ ] Entitlement gate middleware (402 on zero)
- [ ] Auto top-up: interval-based + low-balance-based
- [ ] Stripe integration (PaymentIntent + webhooks)
- [ ] Customer dashboard (balance, top-up history, manual top-up)
- [ ] Vendor directory: integration with Stripe, Orb, Metronome, Lago as alternative rails

## Risks

- Top-up silent failures are catastrophic; idempotency + retries must be airtight.
- Race conditions on wallet debit at high concurrency.
- Vendor competition: if Lago or Orb already serve the indie audience well, building a new vendor is the wrong move.
