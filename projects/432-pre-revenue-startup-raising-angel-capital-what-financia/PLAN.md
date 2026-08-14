---
id: "432"
slug: pre-revenue-startup-raising-angel-capital-what-financia
title: Pre-revenue startup raising angel capital - what financials need to be in a pitch deck/data room? (I will not promote)
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/startups/comments/1vma20k/prerevenue_startup_raising_angel_capital_what/"
category: startups
date: "2026-08-12"
tech: [Next.js, TypeScript, Node.js API (Hono), PostgreSQL, Resend, Stripe, Railway]
---
# Pre-revenue startup raising angel capital - what financials need to be in a pitch deck/data room? (I will not promote)

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

Next.js front-end; Hono API; Postgres for deck templates and form state; Resend for share link; Stripe for paid Pro tier (multi-deck management); Railway deploy.

## Milestones

- Financial slide template (4 slides) with blank-by-default cells
- Form + preview flow with explicit "I don't know" allowed
- PDF export and share link
- Pro tier: multi-deck, milestone history, version compare

## Risks

- Number coercion is a constant risk
- The form must never fill in a number the founder did not type
