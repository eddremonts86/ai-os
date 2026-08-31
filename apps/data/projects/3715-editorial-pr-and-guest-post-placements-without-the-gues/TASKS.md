---
id: "3715"
slug: editorial-pr-and-guest-post-placements-without-the-gues
title: "Editorial PR and guest post placements, without the guesswork"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49488777"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, SEO, Marketing]
tech: [Next.js, Postgres, Stripe, Ahrefs API, Moz API, Majestic API]
---
# Editorial PR and guest post placements, without the guesswork

## Phase 0: Scaffold

- [x] Read the Show HN post to confirm the vetted 1,330-publisher catalogue, the DR/DA/TF metric sources, and the pay-only-for-live-links workflow
- [x] Write SPEC.md (this document)
- [x] Write PRODUCT.md covering pricing, competitive landscape, and success metrics grounded in the listing
- [x] Scaffold the Next.js app, the Postgres schema for publishers/metrics/quotes, and the Stripe sandbox wiring

## Phase 1: Core

- [ ] Build the catalogue table with niche, DR/DA/TF, traffic, and price filters plus the inline Add-to-Quote action
- [ ] Wire the metrics panel: Ahrefs DR/traffic/RD, Moz DA, Majestic TF, each with a last-refresh timestamp
- [ ] Implement the quote builder: multi-publisher selection, brief submission, and availability confirmation without upfront payment
- [ ] Implement the editorial approval loop: draft review, revision requests, and approval before the placement goes live
- [ ] Build the verification worker that re-pulls the live URL and issues the Stripe invoice only after the link is confirmed
- [ ] Add refund and credit handling for non-delivery cases
- [ ] Flag sponsored and discreet placements on both the catalogue row and the live-link confirmation

## Phase 2: Deploy

- [ ] Onboard the first cohort of publishers through the admin back-office with metric-refresh scheduling
- [ ] Publish ETA windows, not single dates, on every catalogue row
- [ ] Run a pilot with a small set of agency buyers and measure live-link rate against the 90%+ target
- [ ] Monitor dispute rate and catalogue freshness (refresh timestamps at most 14 days old) after launch

---

_Generated automatically by Lúa on 2026-08-29_
