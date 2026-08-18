---
id: "536"
slug: building-a-p2p-trading-saas-capytrader-feedback-on-my-m
title: Building a P2P Trading SaaS (CapyTrader) – Feedback on my model
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vob6yi/building_a_p2p_trading_saas_capytrader_feedback/"
category: saas
date: "2026-08-14"
tags: [saas, fintech, trading, marketplace]
tech: [Next.js, TypeScript, Supabase, Persona, Prime Trust, Plaid, Stripe]
---
# Building a P2P trading SaaS (CapyTrader) — feedback on my model

> Product brief for the custodial P2P trading marketplace scoped in the source post.

## Value Proposition

A passive investor can deploy capital to a vetted trader with a per-trade loss cap that the platform enforces automatically — without picking individual trades, watching the market, or trusting the trader to honour the stop.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Accredited passive investors | Want exposure to active traders without managing positions. |
| Skilled independent traders | Have skill but lack the capital base. |
| Family offices | Looking for a marketplace to discover vetted traders. |

## Jobs To Be Done

1. **Functional job** — Deploy capital to a trader with a hard loss cap that is enforced by the platform.
2. **Functional job** — Settle monthly with a clear performance-fee breakdown.
3. **Emotional job** — Stop worrying about whether the trader will respect the stop.
4. **Social job** — Look like a serious allocator to the traders you attract.

## Success Metrics

- **Activation:** first capital deployed within 30 days of investor onboarding.
- **Retention:** at least 3 monthly settlement cycles completed without a manual dispute.
- **Firewall precision:** the circuit breaker fires correctly on every loss-cap hit, zero missed hits.

## Pricing & Monetization

Flat custody fee per investor per month (proposed: $25-50) plus a performance fee (proposed: 10-20%) charged only on profitable closed trades, computed monthly.

## Competitive Landscape

- **eToro / ZuluTrade** — copy-trading social platforms; no hard loss-cap enforcement.
- **Interactive Brokers / Alpaca** — self-directed brokerage; no marketplace layer.
- **Managed-futures platforms** — closer in structure but require the user to pick the manager, not the marketplace to vet.

## Risks & Open Questions

- [ ] Money-transmitter licensing in every served jurisdiction; this is the binding constraint.
- [ ] SEC investment-adviser registration if the platform selects traders.
- [ ] The performance-fee math must be computed only on realised profit, not on mark-to-market.
- [ ] The firewall's tamper-evidence: every state-change signed and audited.
