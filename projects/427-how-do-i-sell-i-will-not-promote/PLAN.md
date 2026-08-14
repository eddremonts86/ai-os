---
id: "427"
slug: how-do-i-sell-i-will-not-promote
title: How Do I Sell? (I will not promote)
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/startups/comments/1vmdsf4/how_do_i_sell_i_will_not_promote/"
category: startups
date: "2026-08-12"
tech: [Next.js, TypeScript, Node.js API (Hono), PostgreSQL, Resend, Stripe, Railway]
---
# How Do I Sell? (I will not promote)

## Tech Stack

Chosen for this problem:

- Next.js
- TypeScript
- Node.js API (Hono)
- PostgreSQL
- Resend
- Stripe
- Railway

## Architecture

Next.js front-end; Hono API for audit submissions; Postgres for question bank + scoring; Resend for follow-up emails; Stripe Checkout for paid review; single-region Railway deploy.

## Milestones

- Question bank finalised (15 items, mapped to ICP / Demo / Champion / Procurement)
- Scoring rubric returns a 4-quadrant chart with one-line remediation per quadrant
- Stripe Checkout for the optional paid expert review, with revenue split hook
- Landing copy that frames the audit as "find the blocker," not "we will sell for you"

## Risks

- Diagnostic scoring becomes generic if questions are not tied to specific B2B sales failure modes
- Email deliverability from a new domain is a real cold-start risk
