---
id: "536"
slug: building-a-p2p-trading-saas-capytrader-feedback-on-my-m
title: Building a P2P Trading SaaS (CapyTrader) – Feedback on my model
status: draft
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vob6yi/building_a_p2p_trading_saas_capytrader_feedback/"
category: saas
date: "2026-08-14"
---
# Building a P2P Trading SaaS (CapyTrader) – Feedback on my model

## Tech Stack

- **Order + custody gateway:** broker-API adapters (Interactive Brokers, Alpaca, Tradier) behind a thin abstraction so the risk engine talks to positions, not broker quirks.
- **Risk-firewall engine:** Postgres + a deterministic rule evaluator; every loss-limit check is a transaction against a per-investor position ledger, never an LLM.
- **Marketplace core:** TypeScript API on a Node + Fastify runtime; investor/trader matching is a Postgres read with materialised views per pair.
- **Billing:** Stripe with two SKUs — flat monthly custody fee per active investor, plus a percentage-based performance fee on profitable trades, charged only on net positive closes.
- **Auth + KYC:** Persona (KYC) + Plaid for funding-source verification; investor onboarding cannot reach the marketplace without a passed KYC gate.

## Architecture

Investors register, complete KYC, and fund a custodial account. The risk firewall attaches a per-investor loss-limit envelope to every order routed to a paired trader; on breach, the engine issues a market-flatten order and freezes the account. Performance-fee calculations run nightly against closed positions so a losing trader never triggers billing.

```
Browser ─▶ Next.js (investor/trader dashboards)
              │
              ├─▶ API (Fastify) ──▶ Postgres (positions, limits, ledger)
              │                    │
              │                    └─▶ Risk-firewall worker ──▶ broker adapter ──▶ markets
              │
              └─▶ Stripe (custody fee monthly; performance fee on profitable close)
```

The risk firewall is the wedge: it is the reason a passive investor trusts the marketplace, and the reason a trader does not blow through their allocation. Without it, the product is just copy-trading with extra fees; with it, the marketplace has a defensible safety story.

## Milestones

1. **M0 — Regulatory scoping.** Confirm money-transmitter and broker-dealer obligations in target jurisdictions; pick the path that avoids becoming a registered broker-dealer (likely: act as a software intermediary, custody through partner brokers).
2. **M1 — Single-broker MVP.** Risk firewall + investor/trader onboarding + one broker adapter (IBKR). End of week 8.
3. **M2 — Performance-fee billing.** Stripe webhook on closed-position events; nightly reconciliation. End of week 12.
4. **M3 — Second broker adapter + matching UX.** Investor sees ranked traders by risk-adjusted return; trader accepts allocations. End of week 18.
5. **M4 — Closed beta with 20 paired investors.** End of week 26.

## Risks

- **Regulatory classification.** The OP does not state whether CapyTrader acts as a broker-dealer, an investment adviser, or a software intermediary. In the US, copy-trading products that hold custody or set trade signals on behalf of investors usually trigger SEC and state-registrations; the OP must pick a lane before any money moves. Source: Reddit thread body names "regulatory blind spots" as the first thing it wants stress-tested.
- **Performance-fee fairness dispute.** A trader can dispute the net-positive calculation if a position is closed early by the risk firewall. The reconciliation job must preserve the per-fill ledger so disputes are auditable.
- **Broker-API outage cascade.** A single broker-API outage during a high-volatility session can leave positions un-flattened; the risk engine needs a circuit-breaker that pauses new pairs and a degraded mode that lets existing investors close positions directly with the broker.
