---
id: "469"
slug: after-months-of-averaging-1-2-users-per-day-we-suddenly
title: "After months of averaging 1-2 users per day, we suddenly got 400+ users"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/indiehackers/comments/1vkfimr/after_months_of_averaging_12_users_per_day_we/"
category: indiehackers
date: "2026-08-10"
tech: [Next.js, TypeScript, PostgreSQL, PostHog, Stripe, Resend, Vercel]
---
# After months of averaging 1-2 users per day, we suddenly got 400+ users

## Tech Stack

Chosen for this problem:

- Next.js
- TypeScript
- PostgreSQL
- PostHog
- Stripe
- Resend
- Vercel

## Architecture

Next.js; Postgres for daily traffic + journal; PostHog for analytics; Stripe for paid tier; Resend for spike alerts; Vercel.

## Milestones

- Daily traffic log
- Spike detector + alert
- What-changed journal
- Stripe paid tier

## Risks

- Attribution accuracy
- Spike-alert noise
