---
id: "207"
slug: a-russian-developer-built-an-app-for-nigeria-but-cant-a
title: "A Russian developer built an app for Nigeria but can't accept payments. App stores are unavailable, PayPal and Stripe are blocked."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/"
category: fintech
date: "2026-04-04"
tags: [Fintech, Payments, Nigeria]
country: Russia
tech: [Python, FastAPI, Paystack, Flutterwave, PostgreSQL, Next.js]
---
# A Russian developer built an app for Nigeria but can't accept payments. App stores are unavailable, PayPal and Stripe are blocked.

## Tech Stack

Python + FastAPI for the orchestration service. PostgreSQL for the transaction ledger. Paystack and Flutterwave APIs for the actual charge. Next.js for the developer dashboard. Bank and USDC settlement via existing rails. Webhook handlers from the processors for the lifecycle.

## Architecture

Developer onboarding → KYC → pairing with a partner-of-record → customer payment page → processor webhook → ledger entry → partner settlement → developer payout. Refund path explicit. Audit log per transaction accessible to both parties.

## Milestones

M0 — 5 partner-of-record entities registered and onboarded. M1 — first 10 developers with end-to-end flow. M2 — settlement automation. M3 — 50 active developers. M4 — public launch with a clear trust page.

## Risks

Regulatory risk if the partner-of-record is not properly licensed. Sanctions risk if the routing touches a sanctioned entity. Chargeback risk in a market where card-not-present fraud is high. Reputational risk if the partner-of-record disappears with a month's revenue.

## Data Model

## Integrations

Python + FastAPI for the orchestration service. PostgreSQL for the transaction ledger. Paystack and Flutterwave APIs for the actual charge. Next.js for the developer dashboard. Bank and USDC settlement via existing rails. Webhook handlers from the processors for the lifecycle.
