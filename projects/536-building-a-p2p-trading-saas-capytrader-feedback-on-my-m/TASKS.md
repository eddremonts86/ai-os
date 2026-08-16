---
tags: ["saas", "fintech", "trading", "marketplace"]
tech: ["Next.js", "TypeScript", "Supabase", "Persona", "Prime Trust", "Plaid", "Stripe"]
id: "536"
slug: building-a-p2p-trading-saas-capytrader-feedback-on-my-m
title: Building a P2P Trading SaaS (CapyTrader) – Feedback on my model
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vob6yi/building_a_p2p_trading_saas_capytrader_feedback/"
category: saas
date: "2026-08-14"
---
# Building a P2P trading SaaS (CapyTrader) — feedback on my model

## Phase 0: Scaffold

- [ ] Create `apps/536-building-a-p2p-trading-saas-capytrader-feedback-on-my-m/` (Next.js + TypeScript)
- [ ] Initialize git with `.gitignore` excluding the trade ledger and the audit log
- [ ] Write SPEC.md (this document) and the matching DESIGN.md tokens
- [ ] Wire Supabase: auth, the trade ledger, the firewall state machine, the audit log
- [ ] Provision Persona or Sumsub KYC integration
- [ ] Provision a custody-partner sandbox (Prime Trust or BitGo) and the ACH link via Plaid
- [ ] Wire Stripe for the custody fee

## Phase 1: Core

- [ ] Two-sided onboarding with KYC (Persona or Sumsub) + AML screening
- [ ] Algorithmic Risk Firewall: per-trade loss cap, circuit-breaker freeze on cap hit
- [ ] Custodial wallet per investor with segregated funds and a daily settlement report
- [ ] Trade dashboard (read-only on investor balance; only firewall moves funds)
- [ ] Performance-fee calculation on realised profit, computed monthly
- [ ] Hash-chained audit log of every firewall action, every trade, every settlement
- [ ] KYC reject path for AML hits (manual review queue)

## Phase 2: Deploy

- [ ] Coolify deployment
- [ ] First 10 design-partner investors and 3 vetted traders
- [ ] 90-day paper-trading pilot before any real capital flows
- [ ] Post-mortem at week 16
