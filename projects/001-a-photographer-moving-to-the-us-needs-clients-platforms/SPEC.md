---
id: "001"
slug: a-photographer-moving-to-the-us-needs-clients-platforms
title: "A photographer moving to the US needs clients. Platforms require reviews, agencies are expensive. Wants a website + ads that bring bookings. Willing to pay $100–300/month."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/6t7ke01t41-a-photographer-moving-to-the-us-needs-cl"
  captured: "2026-07-17"
category: other
date: "2026-07-17"
tags: [Immigration, Freelance, Marketing, Career, Other]
country: Serbia
wtp:
  raw: "$100–300/month"
  currency: USD
  min: 100
  max: 300
  period: month
  mrrMid: 200
tech: [Next.js, Vercel, Stripe, Resend, Google Business Profile API]
---

# A photographer moving to the US needs clients. Platforms require reviews, agencies are expensive. Wants a website + ads that bring bookings. Willing to pay $100–300/month.

## Problem

A photographer relocating from Serbia to the United States has no US client history, no US-based reviews, and no way to satisfy the review prerequisites of booking platforms that gate their marketplace to established sellers. Traditional advertising agencies quote retainers several times what the photographer has budgeted, and DIY website builders do not bring bookings on their own. The result is a cold start: the photographer can shoot, but cannot get in front of buyers who already trust strangers enough to pay a deposit.

## Objective

Ship a thin acquisition system that gives a freshly-relocated photographer a credible US web presence (site, portfolio, reviews funnel) and runs low-cost ads against a tight geographic and stylistic radius, producing booked enquiries within 30 days of launch.

## Target Users

- Primary: independent photographers who have relocated to the US within the last 12 months and have under 20 verifiable US-based reviews.
- Secondary: US-based photographers in their first year of business with the same review-deficit problem (immigration is the trigger, not the whole market).

## MVP Scope

- One-page portfolio site per photographer, with location, style tags, pricing band, contact form, and a Stripe deposit link for confirmed bookings.
- A review-collection flow: post-booking email asks the client to leave a Google Business Profile review; tracks the count to lift the photographer above platform review thresholds.
- A small ads manager: create one Meta and one Google ad campaign with a photographer-tunable radius (miles from zip code) and a daily budget cap.
- Dashboard showing bookings, deposits collected, review count, and cost per acquired booking.
- No mobile app, no marketplace directory, no social scheduling in v1.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Total monthly product cost to the photographer must stay under 30% of the stated $100–300 budget so the tool pays for itself in the first month.
- No HIPAA/PHI exposure; no payments to anyone outside Stripe.
- Must run on a single Vercel project and a single Postgres instance for the first 50 photographers.