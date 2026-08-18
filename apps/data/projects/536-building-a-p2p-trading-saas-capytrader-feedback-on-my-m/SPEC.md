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

## Problem

A founder is designing CapyTrader, a financial SaaS that connects passive investors with skilled traders. Investors supply capital but lack time; traders have skill but lack large accounts. The proposed solution is a P2P marketplace with an Algorithmic Risk Firewall: the investor sets a strict loss limit, and if hit, the algorithm instantly freezes the account and protects the remaining funds. Monetization is a flat custody fee plus a performance fee charged strictly on profitable trades. The founder is asking for stress-test feedback on the regulatory and technical blind spots before launching. The implicit product: a custodial P2P marketplace with hard-coded loss limits, KYC/AML for both sides, and an audit trail for every trade decision.

## Objective

Define the MVP scope for a custodial P2P trading marketplace with a hard loss-limit circuit breaker, two-sided KYC/AML, and a settlement pipeline that lets the investor and trader agree on a per-trade loss cap before any capital is deployed. The MVP has to satisfy the basic regulatory perimeter (likely money-transmission or investment-adviser registration depending on jurisdiction) before any real capital flows.

## Target Users

- **Primary:** accredited passive investors with capital who want exposure to active traders without managing positions themselves.
- **Secondary:** skilled independent traders who lack the capital base to trade at scale.
- **Tertiary:** family offices and small funds looking for a marketplace to discover vetted traders.

## MVP Scope

- Two-sided onboarding with KYC (Persona or Sumsub) and AML screening.
- Algorithmic Risk Firewall: per-trade loss cap set by investor; circuit-breaker freezes the account when the cap is hit.
- Custodial wallet per investor with segregated funds and a daily settlement report.
- Trade dashboard for the trader (read-only on the investor's balance; only the firewall can move funds).
- Performance-fee calculation: charged only on profitable closed trades, computed monthly.
- Audit log of every firewall action, every trade, and every settlement.
- Excluded in v1: copy-trading social features, multi-broker integrations, derivatives, leverage, social trading feed.

## Design Direction

See `DESIGN.md` for this project's design tokens. Default visual: a single trading surface — the investor's portfolio on the left with the firewall status front and centre, the trader's positions on the right, the settlement feed below. No marketing-site chrome; the product is the firewall status.

## Constraints

- Custodial funds require a money-transmission licence or partnership with a regulated custodian in every jurisdiction served.
- The Algorithmic Risk Firewall must be tamper-evident: every state-change is logged with a signed audit entry.
- The performance fee must be computed only on realised profit, not on unrealised mark-to-market gains.
- Regulatory blind spots (likely in the source poster's questions): SEC investment-adviser registration if the platform picks traders, money-transmitter licensing, and the EU MiCA framework if any EU users are onboarded.
