---
id: "734"
slug: a-private-breeder-needs-a-platform-to-find-trusted-sell
title: "A private breeder needs a platform to find trusted sellers who work for a commission. One helper at 10% commission already boosted sales. Need more people like that."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/marketing/xcnt6j8g51-a-private-breeder-needs-a-platform-to-fi"
  captured: "2026-07-17"
category: marketing
date: "2026-07-17"
tags: [Marketing, Business, Retail, Other]
country: Georgia
wtp:
  raw: "8,000 RUB per puppy (10% of 80,000 RUB sale) + platform fee TBD"
  currency: RUB
  min: 8000
  max: 8000
  period: one-shot
  mrrMid: 8000
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# A private breeder needs a platform to find trusted sellers who work for a commission. One helper at 10% commission already boosted sales. Need more people like that.

## Phase 0: Scaffold

- [x] Capture problem from ProblemHunt + write SPEC.md skeleton
- [ ] Choose KYC vendor and finalize PSP candidate for ruble + lari settlements
- [ ] Provision Coolify project + Docker image + SQLite volume
- [ ] Wire Resend email-link auth (single account can be both breeder and helper)
- [ ] Define Drizzle schema: users, kennel profiles, helper profiles, listings, deal records, ratings, dispute tickets

## Phase 1: Core

- [ ] Breeder onboarding: kennel profile, listings (item, price), commission terms, preferred regions
- [ ] Helper onboarding: profile + KYC flow (ID + selfie + phone) via the chosen vendor; store verification status only
- [ ] "Looking for helpers" listings: breeders post, helpers filter by category / region / commission
- [ ] In-app contact path between breeder and helper with the deal context attached
- [ ] Deal ledger: close-deal action logs seller, helper, item, agreed commission, timestamps
- [ ] PSP integration: webhook updates deal record; splits helper's 10% commission and the platform fee
- [ ] Reputation: post-deal star rating + written review, persisted to profile
- [ ] Dispute ticket queue: mediator can see the logged deal record + ratings + KYC status
- [ ] First-vet manual review on every new helper (until automated trust score is validated)
- [ ] End-to-end test: David posts a listing, a KYC'd helper applies, they close one deal, helper receives 10% commission, platform takes its fee, both sides rate each other

## Phase 2: Deploy

- [ ] Onboard David and 5 additional breeders as pilot cohort
- [ ] Open helper supply pipeline: outreach to existing Avito / classifieds closers to bring KYC'd helpers onto the marketplace
- [ ] Set up status page + PSP webhook monitoring
- [ ] Decide v1 fee structure based on first 50 closed deals (flat percentage vs. fixed fee vs. hybrid)
- [ ] Post-mortem after week 13 with pilot cohort: did KYC + reputation actually substitute for personal trust?
