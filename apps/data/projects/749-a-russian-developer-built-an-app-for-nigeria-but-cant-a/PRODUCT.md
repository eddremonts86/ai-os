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

## Value Proposition

A Russia-based developer with a finished mobile app and a foreign user base cannot accept card payments directly because their legal entity is excluded from the obvious providers and the app stores are unavailable to them. The bundle gives them a working checkout + subscription + entitlement pipeline routed through a Merchant of Record, so the Russian entity never holds card data and never negotiates a per-country processor relationship. The developer ships a one-page billing surface and a webhook, the MoR handles the cross-border side, and the developer gets paid out in a currency and to an account that works from Russia — all within the poster's $500–700 setup budget.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Russia-based indie mobile dev (the poster) | App is shipped, users exist, monetisation is blocked by provider restrictions and store availability. |
| Other Russia-based indie devs / small studios | Same provider wall, same need, different apps and different target countries. |
| Russian consultants billing foreign clients | Need a card-acceptance surface for digital services without becoming a cross-border payments expert. |
| MoR provider | Indirect: more Russia-origin merchants on their platform without onboarding complexity. |

## Jobs To Be Done

1. **Functional job** — Accept card payments from Nigerian end users for a mobile-app subscription, with the funds arriving in a bank account the Russian entity can actually use.
2. **Emotional job** — Stop the "I built the product, I have the users, I still can't take money" loop and start treating the app as a real business.
3. **Social job** — Be able to tell the user "here is a checkout page" instead of "pay me by bank transfer".

## Success Metrics

- **Setup cost:** the bundle lands the developer at a working checkout + webhook + entitlement flow within the poster's $500–700 one-time budget. If a provider's onboarding fee pushes past this, the playbook flags it.
- **First transaction:** the developer records their first paid order from a Nigerian end user within 14 days of starting the bundle.
- **Recurring billing:** ≥ 70% of new orders convert to a second successful monthly charge via the MoR's subscription primitive (proxy for the billing flow being stable).
- **Compliance paperwork:** the developer has the MoR-issued statement they need for Russian income-tax filing within 30 days of each payout.
- **Outcome:** the developer moves from "I cannot monetise" to "I have revenue" within one month of starting, with no foreign-entity registration required.

## Pricing & Monetization

The poster's budget is one-time $500–700 for setup, low monthly, and "standard market-level commissions" on transactions. The bundle itself is best priced as:

- **One-time template fee** — a single charge for the reusable Next.js + Worker + playbook bundle, at the bottom of the poster's range ($500) so a developer who just needs the working pieces is covered.
- **Implementation help** — a paid hour (or half-day) for the developer's specific provider onboarding, since each MoR's KYC takes time and varies.
- **No monthly fee** — the developer pays the MoR directly; the bundle does not sit on top of the MoR's pricing.

## Competitive Landscape

- **Direct integration with Stripe / Adyen / Paystack** — the typical advice for a non-Russian entity; for a Russian legal entity, the issuer-banking side is the blocker, not the API. Each provider declines Russia-origin merchants at the KYC stage.
- **Merchant of Record providers (Lemon Squeezy, Paddle, Gumroad)** — the realistic path; the MoR is the seller of record, the Russian entity receives a payout. Pricing and supported customer countries vary; not all accept Nigerian cards.
- **Crypto payments (USDT, BTC) on-chain** — possible workaround but adds volatility, tax complexity, and user-experience friction for a consumer subscription.
- **Paxum, WebMoney, YooMoney, regional Russian gateways** — viable for Russian-domestic customers, not designed for Nigerian consumer subscription billing.
- **Reseller / payment agent model** — a Nigerian partner entity fronts the customer relationship and pays the Russian entity as a contractor; legal and tax cost often exceeds the poster's budget.

## Risks & Open Questions

- [ ] The candidate MoR must accept Nigerian customers for consumer subscription billing. Validate Lemon Squeezy / Paddle against this constraint before recommending one in the playbook.
- [ ] Russian-side banking is unstable for FX payouts; the MoR's payout currency and the receiving bank must be verified end-to-end with a small test payout before the developer commits.
- [ ] Tax treatment of MoR-routed income in Russia is evolving. The playbook must cite current guidance (or flag that it should be reviewed with a Russian tax advisor) — the developer should not rely on a generic "you owe income tax" line.
- [ ] Provider risk: a single MoR is a single point of failure. The playbook should describe a backup path (a second MoR or a Stripe-Connect-via-partner path) so the developer is not locked in.
- [ ] Refund / chargeback handling differs per MoR. The developer needs to know who eats the chargeback fee and who fields the dispute — Nigerian customers on consumer subscriptions tend to have higher-than-average dispute rates.
