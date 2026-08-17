---
id: "302"
slug: problem-of-market-access-for-francophone-african-freela
title: Problem of market access for francophone African freelancers
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/freelance/kh7v4kr3i1-problem-of-market-access-for-francophone"
category: freelance
date: "2025-11-13"
tags: [Freelance, Career, Other]
country: Cameroon
tech: [Next.js, TypeScript, Postgres, Stripe Connect, Resend, Fiverr-style marketplace, Hetzner]
---
# Problem of market access for francophone African freelancers

## Phase 0: Scaffold

- [x] Capture problem from ProblemHunt + write SPEC.md skeleton
- [ ] Define DESIGN.md (profile hero, brief card, escrow status pill)
- [ ] Provision Hetzner VPS + Postgres + Coolify reverse proxy
- [ ] Wire Stripe Connect test mode + a regional payout aggregator sandbox
- [ ] Set up next-intl with FR + EN locale files

## Phase 1: Core

- [ ] Freelancer signup: email + phone OTP, profile wizard (skills, language pairs, portfolio links)
- [ ] Identity check: government ID upload + selfie match, manual review queue
- [ ] Paid trial task: freelancer submits a real 1-page deliverable against a posted brief; reviewer approves or rejects
- [ ] Public profile page per freelancer (ISR), FR/EN toggle
- [ ] Buyer signup: company email + billing details (Stripe Customer)
- [ ] Brief creation: title, description (FR + EN encouraged), budget band, deadline
- [ ] Proposal flow: freelancer submits 200-word proposal + rate; buyer reviews and accepts one
- [ ] Stripe Checkout escrow on accept; webhook marks job in progress; deliverable upload by freelancer
- [ ] Buyer approval → payout via Stripe Connect / regional aggregator → Resend confirmation
- [ ] Dispute path: buyer contests → 5-day freeze → admin review → release or refund
- [ ] End-to-end test in one country: 20 freelancers, 10 buyers, 30 closed jobs

## Phase 2: Deploy

- [ ] Move Stripe to live mode + apply for Connect Custom accounts in pilot countries
- [ ] Recruit 50 pilot freelancers across Cameroon, Senegal, Côte d'Ivoire
- [ ] Coolify-side deployment of the marketplace backend
- [ ] Status page + Stripe webhook monitoring
- [ ] Post-mortem after week 12 with the pilot cohort
