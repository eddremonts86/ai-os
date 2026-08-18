---
id: "207"
slug: a-russian-developer-built-an-app-for-nigeria-but-cant-a
title: "A Russian developer built an app for Nigeria but can't accept payments. App stores are unavailable, PayPal and Stripe are blocked."
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/"
category: fintech
date: "2026-04-04"
tags: [Fintech, Payments, Nigeria]
country: Russia
tech: [Python, FastAPI, Paystack, Flutterwave, PostgreSQL, Next.js]
---
# A Russian developer built an app for Nigeria but can't accept payments. App stores are unavailable, PayPal and Stripe are blocked.

## Problem

A developer in Russia built a mobile app aimed at the Nigerian market. With app stores unavailable in Russia and Western payment providers (Stripe, PayPal, Apple Pay) blocked in both Russia and Nigeria depending on the route, there is no straightforward way to get paid. Nigerian payment processors (Paystack, Flutterwave) require a registered Nigerian business entity and a local bank account. The developer has neither.

What exists today is a chain of informal workarounds: a friend in Nigeria with a registered business, a Telegram-based escrow, a USDT transfer. All of them break the moment the user count grows past a few hundred, and none of them are auditable for the user's protection.

## Objective

Build a payment-orchestration service that lets a foreign developer accept Nigerian payments through Paystack or Flutterwave without a registered Nigerian entity, by routing through a partner-of-record structure that is transparent about its cut and its legal role.

## Target Users

Foreign (non-Nigerian) developers and small SaaS founders selling to Nigerian consumers or businesses. Secondarily: African creators or small businesses who would rather work with a developer outside their country than wait for a local equivalent.

## MVP Scope

Developer signs up, submits the app, and is paired with a registered Nigerian partner-of-record. Partner has a Paystack or Flutterwave account. Customer pays in NGN. Partner settles in USDC or bank transfer minus the agreed cut. Web dashboard for the developer to see transactions, refunds, and tax. No mobile app in v1.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/` follows the constraints in `207-.../SPEC.md` and the chosen stack (Python, FastAPI, Paystack). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Russia.

For Russia, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

Partner-of-record must be a real, registered Nigerian business — disclosed to the customer. Customer must be told who holds their money and on what legal basis. Settlement must be auditable. Refund path must work for at least 90 days. No USDT laundering flow.
