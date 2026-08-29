---
id: "878"
slug: search-for-an-affordable-way-to-get-pr-in-forbes-and-ot
title: Search for an affordable way to get PR in Forbes and other top media outlets
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/marketing/xi1ox0v161-search-for-an-affordable-way-to-get-pr-i"
category: marketing
date: "2025-10-26"
tags: [Marketing, Media, Other]
country: Russia
wtp:
  raw: $600-650
  currency: USD
  min: 600
  max: 650
  period: one-shot
tech: [Next.js, TypeScript, Stripe Checkout (pay-for-result escrow), Postgres with Drizzle ORM, journalist-contributor marketplace, dispute resolution, Coolify]
---
# Search for an affordable way to get PR in Forbes and other top media outlets

## Phase 0: Scaffold

- [x] Capture problem from ProblemHunt + write SPEC.md skeleton
- [ ] Define DESIGN.md (founder request form, journalist bid card, escrow status, dispute UI)
- [ ] Provision Coolify project + Docker image + Postgres + Stripe Connect platform account
- [ ] Define target-outlet catalog v1 (10–15 outlets: Forbes contributor network, TechCrunch, Bloomberg, Inc, Fast Company, The Verge, Wired, CoinDesk, STAT News, GreenBiz, plus 2–3 vertical-specific)
- [ ] Define per-outlet verification rules (domain, byline profile, contributed-content label)
- [ ] Choose identity-verification provider (Persona or Veriff) and byline-cross-check process
- [ ] Decide cross-border payout primary (Stripe Connect) + fallback (Wise or USDC) for non-US journalists

## Phase 1: Core

- [ ] Founder request flow: target outlet, topic, deadline, budget ($600–$650 range), optional byline preference
- [ ] Journalist onboarding: identity verification + byline cross-check; only approved journalists can bid
- [ ] Journalist bid flow: bid amount within the founder's budget + placement plan (interview, contributed, news hook)
- [ ] Founder accepts a bid → funds escrow via Stripe Checkout (destination charge, held on platform account)
- [ ] Journalist delivers: submits article URL + draft
- [ ] Publication verification crawler: domain check, byline check, keyword check, parse the article
- [ ] 1-day, 7-day, 30-day re-checks enforce the 30-day publication guarantee
- [ ] On verified publication: Stripe transfer 85% to journalist, 15% platform fee; 30-day reserve on the last 10% as clawback
- [ ] On verification failure or pull within 30 days: dispute flow opens automatically
- [ ] Human reviewer dashboard with 5-business-day SLA; resolution = full refund, partial refund, or uphold
- [ ] Public dispute reason log (without exposing journalist identity) for trust signaling
- [ ] Cross-border payout via Wise Business (or USDC) for journalists outside Stripe Connect coverage
- [ ] End-to-end test: founder posts request, journalist bids, founder funds escrow, journalist publishes at a test outlet fixture, crawler verifies, payout triggers, 30-day re-check passes

## Phase 2: Deploy

- [ ] Move Stripe to live mode
- [ ] Onboard 10 pilot founders + 25 vetted journalists (mix of US, EU, and at least 3 non-Stripe-Connect regions to validate the cross-border path)
- [ ] Weekly verification + dispute review with the pilot cohort for 8 weeks
- [ ] Quarterly outlet-catalog review: monitor contributor-policy changes; add or remove outlets as needed
- [ ] Set up status page + per-outlet verification-rule audit
- [ ] Post-mortem after week 17; decide v2 scope (subscription for founders, Team tier for agencies, additional outlets)
