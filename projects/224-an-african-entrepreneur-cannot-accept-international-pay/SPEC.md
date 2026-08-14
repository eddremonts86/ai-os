---
id: "224"
slug: an-african-entrepreneur-cannot-accept-international-pay
title: "An African entrepreneur cannot accept international payments on Shopify. PayPal blocks, Stripe is unavailable, and local processors are limited to local cards."
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/"
category: fintech
date: "2026-02-11"
tags: [Fintech, Africa, E-commerce]
country: Benin
tech: [Python, FastAPI, Shopify, Stripe Connect, Flutterwave, PostgreSQL]
---
# An African entrepreneur cannot accept international payments on Shopify. PayPal blocks, Stripe is unavailable, and local processors are limited to local cards.

## Problem

An entrepreneur in Benin (and across much of West Africa) using Shopify cannot accept international card payments. PayPal blocks accounts in the region for KYC reasons. Stripe is unavailable in Benin. Local processors (FedaPay, Kola Market) accept only local cards. The result is a Shopify store that cannot take an order from a US or EU customer, even though the storefront is set up. What is missing is a routing layer that sits between a Shopify store and the international payment processors, with a partner-of-record structure that is transparent about its role and whose fees are honest. Some informal workarounds exist (a friend in the UK with a Stripe account) but they break the moment the volume grows or the friend needs to be paid back.

## Objective

A Shopify plugin that lets an African merchant accept international payments via a partner-of-record routing layer, with clear disclosure to the customer and a transparent fee structure.

## Target Users

African Shopify merchants in Benin, Togo, Côte d'Ivoire, and other countries where Stripe and PayPal are unavailable. Secondary: WooCommerce merchants in the same countries with the same payment gap.

## MVP Scope

Shopify plugin (public-app). Partner-of-record routing layer. Customer is shown the partner's identity at checkout. Settlement in USDC or local bank transfer. Web dashboard for the merchant. One partner in v1 (a registered entity in the EU or the UK).

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/` follows the constraints in `224-.../SPEC.md` and the chosen stack (Python, FastAPI, Shopify). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Benin.

For Benin, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

Partner-of-record must be a real, registered business — disclosed to the customer. Customer must be told who holds their money and on what legal basis. Refund path must work for 90 days. No USDT laundering flow.
