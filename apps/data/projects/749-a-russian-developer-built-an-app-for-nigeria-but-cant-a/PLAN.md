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

## Tech Stack

- **Billing surface:** Next.js (single landing + checkout page) hosted on Vercel; one product SKU in the chosen MoR (Lemon Squeezy as primary, Paddle as backup) configured for monthly USD subscription billing with auto-renewal.
- **Webhook receiver:** a Cloudflare Worker that consumes the MoR's `order_created` and `subscription_updated` events, validates the signature, persists the order to Postgres, and issues a short-lived entitlement token for the mobile app.
- **Entitlement API:** a Cloudflare Worker endpoint (`GET /entitlements?email=…`) the mobile app calls on launch; returns a signed short-lived JWT with `active: true|false` and the plan name.
- **Admin view:** a password-protected Next.js page that lists the last 30 days of orders and entitlements, pulled from Postgres, for the developer to reconcile against the MoR dashboard.
- **Database:** Postgres (Neon or Supabase free tier is enough for MVP) for orders, entitlements, and the audit log.
- **Documentation:** a single `PLAYBOOK.md` covering provider choice, KYC, payout routing, MoR-issued receipts, Russian tax expectations, refund / chargeback handling, and a fallback path to a second MoR if the primary one changes pricing or country support.

## Architecture

The mobile app stays as-is. The developer ships one URL (the billing page) and one webhook URL (the entitlement source). The MoR handles card data, fraud, chargebacks, tax in the customer's jurisdiction, and the customer receipt; the Russian entity never sees PAN data. The Worker is the only integration point the developer has to maintain: it converts the MoR's webhook into an entitlement the mobile app can verify offline-first for the duration of the token.

```
Nigerian end user
       │  taps "subscribe" in the app
       ▼
Next.js billing page ──▶ Lemon Squeezy (Merchant of Record)
       │                       │ handles card, fraud, receipt, VAT
       │                       ▼
       │                 Webhook: order_created / subscription_updated
       │                       │
       │                       ▼
       │               Cloudflare Worker ──▶ Postgres (orders, entitlements)
       │                       │
       │                       └─▶ signed JWT (short-lived)
       ▼
Mobile app calls /entitlements on launch ──▶ Worker verifies JWT ──▶ "active: true"
                                                       │
                                                       ▼
                                                (developer reconciles
                                                 against MoR dashboard)
```

## Milestones

1. **M0 — Spec freeze + provider choice.** SPEC.md approved; Lemon Squeezy (primary) and Paddle (backup) evaluated against Nigeria support and Russian payouts. End of week 1.
2. **M1 — Landing + checkout page.** Next.js page with one product SKU; MoR KYC submitted; webhook URL registered. End of week 2.
3. **M2 — Webhook + entitlement pipeline.** Cloudflare Worker consumes MoR events, writes to Postgres, issues signed JWT. End of week 3.
4. **M3 — Mobile-app integration.** Mobile app calls `/entitlements` on launch and unlocks paid functionality when `active: true`. End of week 4.
5. **M4 — Playbook.** PLAYBOOK.md covering KYC, payout routing, MoR receipts, Russian tax expectation, refund / chargeback handling, fallback MoR path. End of week 5.
6. **M5 — Pilot.** Poster processes first 50 paid orders from Nigerian customers; reconciliation verified end-to-end. End of week 7.

## Risks

- **MoR rejects Nigerian cards.** Some MoR providers restrict customer-country coverage. If the chosen MoR declines Nigerian customers for consumer subscriptions, the bundle has no viable provider and must pivot. The playbook should be honest about which providers were tested against Nigeria, not just "Lemon Squeezy accepts everyone".
- **Russian-side banking disruption.** The MoR pays out to a Russian bank account, and Russian-side banking for FX payouts is unstable. The developer should validate end-to-end with a $1 test payout before committing; otherwise the developer can have a healthy MoR dashboard with no way to receive the money.
- **Tax treatment of MoR income in Russia is evolving.** A blanket "you owe income tax" line in the playbook is not enough; the playbook should point at the current Russian tax-advisor guidance and flag that it must be reviewed at filing time. Telling the developer "the MoR handles tax" when they are the entity receiving the payout is wrong.
- **Chargeback friction on Nigerian consumer subscriptions.** Dispute rates on consumer subscriptions in some emerging markets are elevated; the MoR's chargeback fee and dispute workflow must be understood before the first subscription is sold, not after the first chargeback.
- **Single-provider lock-in.** If the chosen MoR later changes pricing or drops Nigeria, the bundle is dead. The fallback path (a second MoR or a Stripe-Connect-via-partner arrangement) must be in the playbook and ideally in the codebase, even if it is not the active provider on day one.
