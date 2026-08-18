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

## Tech Stack

Python + FastAPI for the orchestration. Shopify public-app framework for the plugin. Stripe Connect for the partner-of-record. PostgreSQL for the transaction ledger. USDC settlement via a regulated on/off ramp. Bank transfer for the local leg.

## Architecture

Shopify checkout → partner-of-record page → real charge → route to merchant. Disclosed to the customer. Merchant dashboard with the transaction history. Refund path explicit.

## Milestones

M0 — partner-of-record entity registered. M1 — Shopify plugin live. M2 — first 10 merchants end-to-end. M3 — 100 active merchants. M4 — public launch with a clear trust page.

## Risks

Regulatory risk if the partner-of-record is not properly licensed. Sanctions risk if the routing touches a sanctioned entity. Chargeback risk in a market where card-not-present fraud is high. Reputational risk if the partner-of-record disappears with a months revenue.

## Data Model

## Integrations

Python + FastAPI for the orchestration. Shopify public-app framework for the plugin. Stripe Connect for the partner-of-record. PostgreSQL for the transaction ledger. USDC settlement via a regulated on/off ramp. Bank transfer for the local leg.
