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

## Tech Stack

- **Web app:** Next.js + TypeScript + Tailwind CSS for the investor and trader dashboards.
- **Backend:** Supabase (auth, the trade ledger, the firewall state machine, the audit log).
- **KYC/AML:** Persona or Sumsub integration for two-sided onboarding.
- **Custody partner:** a regulated custodian (e.g. Prime Trust, BitGo) for fiat custody; the platform never holds funds directly.
- **Payments:** Stripe for the custody fee, Plaid for ACH onboarding from the investor's bank.
- **Audit log:** append-only PostgreSQL table with hash-chain entries.

## Architecture

The investor and trader each have a custodial sub-account at the partner custodian. The platform's Algorithmic Risk Firewall sits between the trader's trading interface and the custodian's API: it reads positions in real time, computes the realised and unrealised P&L against the investor's loss cap, and submits a freeze-order to the custodian when the cap is hit. Every firewall decision is logged with a signed audit entry.

## Milestones

1. **M0 — Spec freeze.** SPEC.md + DESIGN.md + the firewall state-machine spec. End of week 1.
2. **M1 — KYC onboarding (investor + trader).** Persona integration; reject path for AML hits. End of week 4.
3. **M2 — Custody integration.** Investor funds a custodial sub-account via Plaid ACH. End of week 8.
4. **M3 — Firewall state machine.** Real-time P&L against loss cap; circuit-breaker freeze. End of week 12.
5. **M4 — Settlement + performance-fee calculation.** Monthly cycle, signed audit entries. End of week 16.

## Risks

- **Regulatory licensing** — money-transmitter and potentially investment-adviser registration are the binding constraints; the schedule depends on counsel.
- **Custody partner concentration** — a single custody partner is a single point of failure; multi-custody support is roadmap, not v1.
- **Firewall precision** — a missed circuit-breaker hit is a regulatory and reputational event; signed audit entries are mandatory.
