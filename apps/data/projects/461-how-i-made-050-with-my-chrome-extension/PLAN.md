---
id: "461"
slug: how-i-made-050-with-my-chrome-extension
title: How I made $0.50 with my Chrome extension
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vntsbi/how_i_made_050_with_my_chrome_extension/"
category: saas
date: "2026-08-14"
tech: [Next.js, TypeScript, Manifest V3, Chrome Web Store API, PostgreSQL, Stripe, Resend, Vercel]
---
# How I made $0.50 with my Chrome extension

## Tech Stack

Chosen for this problem:

- Next.js
- TypeScript
- Manifest V3
- Chrome Web Store API
- PostgreSQL
- Stripe
- Resend
- Vercel

## Architecture

Manifest V3 extension; Next.js for marketing + sync server; Postgres for rules; Stripe for paid tier; Resend for changelog; Vercel.

## Milestones

- Selective blocker for YouTube / Reddit / Instagram
- Per-site rules UI
- Cross-device sync
- Stripe paid tier

## Risks

- Manifest V3 churn
- Chrome Web Store approval
