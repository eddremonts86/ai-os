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

## Problem

The poster is a Russia-based developer with a finished mobile app targeting Nigerian users — the app tracks flights and offers paid functionality around flight disruption support and compensation. The bottleneck is not product: it is monetisation. Native in-app payments via Google Play and App Store are unavailable or restricted for a Russian legal entity serving a foreign market, so the obvious channel is closed. Direct in-app payments are theoretically possible but every provider the poster has looked at is either restricted to Russian entities or impossible to integrate at this stage. The result is a constant problem, not a one-time issue: every time the developer thinks about moving from MVP to actual monetisation, payments get in the way. They are explicitly looking for a legal, practical, low-cost setup that lets a Russia-based legal entity receive payments from Nigerian end users, with a one-time setup budget of $500–700 and a low monthly ongoing cost.

## Objective

Ship a turnkey payments-acceptance bundle for Russia-based app developers targeting foreign (initially Nigerian) end users, using a Merchant of Record or equivalent intermediary so the Russian legal entity never holds the card data and never has to negotiate a per-country payment-processor relationship. The bundle must produce a working checkout page, a hosted billing surface (webhook + customer portal), and a clear legal path for the funds to reach a Russian legal entity, all within a $500–700 one-time setup cost and a low monthly fee.

## Target Users

- **Primary:** the poster — a solo or small-team Russia-based developer with a finished mobile app targeting one or more foreign end-user markets, who has hit the "I have a product, I have users, I cannot take money" wall.
- **Secondary:** other Russia-based indie developers and small studios shipping consumer apps to foreign markets who face the same provider restrictions and would adopt the same bundle for any country (not just Nigeria).
- **Tertiary:** independent contractors and consultancies registered in Russia who bill foreign clients for digital services and need a card-acceptance surface without becoming experts in cross-border payment processing.

## MVP Scope

- A reusable "payments-acceptance" template bundle: a Next.js landing + billing page wired to a Merchant of Record provider (Lemon Squeezy or Paddle), with a single product SKU configured for the poster's flight app.
- A webhook receiver (Cloudflare Worker) that listens for the provider's `order_created` / `subscription_updated` events and unlocks paid functionality in the mobile app via a server-issued entitlement token.
- A short written playbook (one Markdown file) that documents: how the MoR relationship works, who issues the receipt to the Nigerian end user, what the Russian entity receives, the monthly fee and per-transaction cost, the FX conversion path, and the tax-reporting expectation in Russia for MoR-routed income.
- A entitlement-check endpoint the mobile app calls on launch to confirm the user's subscription is active; the endpoint returns a signed short-lived token.
- A minimal admin view (operator-only) showing the last 30 days of orders and entitlements, for the developer to reconcile against the provider's dashboard.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The poster's stated budget: one-time setup $500–700 (ideally), low ongoing monthly fee, standard market-level per-transaction fees acceptable. The MVP must hit these numbers.
- The Russian legal entity must not hold cardholder data. The MoR (or Stripe Connect with a non-Russian platform) must be the entity that handles PAN data and PCI scope.
- The provider must accept customers in Nigeria for the specific use case (consumer subscription to a mobile app); if a candidate provider declines Nigerian cards, it is not viable.
- The bundle must work for the poster without them registering a foreign legal entity. If the only viable path requires one, the playbook must say so and price the additional cost.
- Compliance: the MoR is responsible for VAT / sales tax in the customer's jurisdiction; the playbook must state explicitly what the Russian entity still owes (income tax on the MoR payout).
- The mobile app is already shipped. The bundle must integrate without an app-store-side change (no in-app purchase through Google Play / App Store is required for the MVP).
