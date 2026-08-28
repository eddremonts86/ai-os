---
id: "817"
slug: trust-crisis-in-indias-upi-payments-fear-of-stranger-tr
title: "Trust crisis in India's UPI payments: fear of stranger transfers hurts business"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/finance/jrrxhgsoh1-trust-crisis-in-indias-upi-payments-fear"
category: finance
date: "2025-12-07"
tags: [Finance, Legal, Other]
country: India
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Trust crisis in India's UPI payments: fear of stranger transfers hurts business

## Tech Stack

React with TypeScript for a mobile-first merchant app, TanStack Start as the Node.js API, SQLite with Drizzle ORM for the dispute log and risk decisions, deployed via Coolify and Docker. Chosen because the user works on a phone and the data model is small per merchant.

## Architecture

A web app with three surfaces: a payment-inbox that shows incoming UPI payments with a risk score, a dispute log that records what the merchant decided and why, and an analytics view that shows the merchant's own accept/reject pattern.

## Milestones

- M1 — Manual payment log with a one-tap "accept" or "hold" action and the reason captured.
- M2 — Risk-score layer that combines the merchant's own history with public signals (account age, prior disputes).
- M3 — Dispute-response helper that drafts a clear reply to UPI support requests.

## Risks

- Source is thin: scope is derived from the title alone until the original post is read.
- False positives on the risk score will cost merchants sales and trust.
- Touching Indian payments means a clear legal boundary on what the MVP does and does not do.
