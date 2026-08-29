---
id: "749"
slug: a-russian-developer-built-an-app-for-nigeria-but-cant-a
title: "A Russian developer built an app for Nigeria but can't accept payments. App stores are unavailable, direct providers are complex. Needs a simple solution. Budget $500–700."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/finance/y3ik6f8sr1-a-russian-developer-built-an-app-for-nig"
  captured: "2026-04-04"
category: finance
date: "2026-04-04"
tags: [Finance, Legal, Dev, Other]
country: Russia
wtp:
  raw: $500–700 one-time + low monthly
  currency: USD
  min: 500
  max: 700
  period: one-shot
  mrrMid: 595
tech: [Stripe Connect (Express accounts), Lemon Squeezy (Merchant of Record), Cloudflare Worker (payment-webhook), Next.js landing + billing page]
---
# A Russian developer built an app for Nigeria but can't accept payments. App stores are unavailable, direct providers are complex. Needs a simple solution. Budget $500–700.

## Phase 0: Scaffold

- [x] Capture ProblemHunt post by Russia-based mobile dev targeting Nigeria (2026-04-04)
- [ ] Validate Lemon Squeezy as primary MoR against Nigeria customer support and Russian payouts
- [ ] Validate Paddle as backup MoR with the same constraints
- [ ] Provision Next.js landing + checkout page shell with one product SKU placeholder
- [ ] Provision Postgres (orders, entitlements, audit_log) on Neon or Supabase
- [ ] Decide webhook signature validation library and the entitlement JWT signing key approach

## Phase 1: Core

- [ ] Configure MoR product SKU for monthly USD subscription; turn on auto-renewal
- [ ] KYC submission to primary MoR (Lemon Squeezy) as a Russian legal entity; document the questions the MoR asks
- [ ] Cloudflare Worker: consume `order_created` and `subscription_updated` webhook events, verify signature, write to Postgres
- [ ] `/entitlements` endpoint: returns signed short-lived JWT with `active` flag and plan name
- [ ] Mobile-app integration: call `/entitlements` on launch, unlock paid functionality when `active: true`
- [ ] Admin view (password-protected): last 30 days of orders and entitlements, reconciled against MoR dashboard
- [ ] End-to-end test with a $1 test order from a Nigerian card; verify payout routing and Russian bank receipt
- [ ] PLAYBOOK.md covering: provider choice rationale, KYC, payout routing, MoR-issued receipts, Russian income-tax expectation, refund / chargeback handling, fallback to Paddle if primary MoR drops Nigeria
- [ ] Chargeback workflow documented: who fields the dispute, who eats the fee, how the developer responds

## Phase 2: Deploy

- [ ] Poster processes first 50 paid orders from Nigerian customers
- [ ] Reconciliation verified end-to-end (MoR dashboard, Postgres, mobile-app entitlement)
- [ ] Backup MoR (Paddle) configured as a code path (even if inactive), with the same webhook + entitlement shape
- [ ] Post-mortem at week 7: successful charges, chargebacks, payout latency, Russian-side banking stability
