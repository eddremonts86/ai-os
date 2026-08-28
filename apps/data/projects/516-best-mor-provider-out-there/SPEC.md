---
id: "516"
slug: best-mor-provider-out-there
title: Best MoR provider out there?
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vo4cmj/best_mor_provider_out_there/"
category: saas
date: "2026-08-14"
---
# Best MoR provider out there?

## Problem

Hey guys, im building my SaaS , SUBSCRIPTION based , and i dont wanna deal with VAT. Stripe has really bad reviews, freezing accounts,.. cream,… i dont know. Which one you use and are happy with? Thank you and take care! submitted by /u/Beneficial-Day7238 [link] [comments]

---

## Objective

Cut the time a SaaS founder spends comparing Merchant of Record providers down to a single decision matrix that surfaces fee structures, payout terms, refund handling, tax/VAT coverage, and supported geographies in one place, with founders able to filter by their own constraints (monthly volume, primary market, subscription vs. one-time).

## Target Users

- Primary: SaaS founders picking their first MoR or evaluating a switch from Stripe Direct / Paddle / Lemon Squeezy / Gumroad / FastSpring.
- Secondary: indie hackers selling low-volume products who want to know whether MoR is worth the fee premium over Stripe Direct.

## MVP Scope

- A static comparison page with rows for each major MoR (Stripe Tax, Paddle, Lemon Squeezy, Gumroad, FastSpring, 2Checkout) and columns for: fee %, payout timing, refund handling, tax/VAT, supported countries, subscription billing.
- A filter widget (volume, geography, subscription-heavy) that highlights the best match.
- A short "decision flowchart" for the three most common cases (US-only SaaS, EU-heavy SaaS, global SaaS).
- No live pricing feeds; data is curated and dated. No accounts; no email capture.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Pricing and feature surfaces change often; the page must show its "last updated" date prominently and avoid implying freshness it doesn't have.
- No claim about regulatory correctness for a specific jurisdiction; this is a comparison, not legal advice.
- Single static page in v1; no CMS, no login.
