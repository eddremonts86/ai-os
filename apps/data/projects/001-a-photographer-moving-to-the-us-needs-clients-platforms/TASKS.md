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
  raw: $100–300/month
  currency: USD
  min: 100
  max: 300
  period: month
  mrrMid: 200
tech: [Next.js, Vercel, Stripe, Resend, Google Business Profile API]
---
# A photographer moving to the US needs clients. Platforms require reviews, agencies are expensive. Wants a website + ads that bring bookings. Willing to pay $100–300/month.

## Phase 0: Scaffold

- [x] Capture problem from ProblemHunt + write SPEC.md skeleton
- [ ] Define DESIGN.md (location-hero, portfolio grid, deposit CTA)
- [ ] Provision Vercel + Neon Postgres project (one tenant domain)
- [ ] Wire Stripe test mode and a single Checkout endpoint
- [ ] Decide on auth: Clerk vs. passwordless email link via Resend

## Phase 1: Core

- [ ] Photographer onboarding: zip code, style tags, portfolio upload (≤ 30 images, ≤ 8 MB each)
- [ ] Portfolio SSG page per photographer (ISR, 60 s revalidate)
- [ ] Booking form → Stripe Checkout session for 25% deposit; webhook writes `Booking`
- [ ] Confirmation email via Resend with shoot details + review prompt template
- [ ] Review funnel: post-shoot (T+7d) email with Google Business Profile write link
- [ ] Single Meta + single Google ad campaign per photographer, daily budget cap, auto-pause at 110% of monthly cap
- [ ] Dashboard: bookings table, deposits collected, review count, cost per acquired booking
- [ ] End-to-end test: photographer signs up → 5 bookings → 4 reviews → unlocks Thumbtack threshold

## Phase 2: Deploy

- [ ] Move Stripe to live mode
- [ ] Apply for Google Business Profile API access
- [ ] Recruit 5 pilot photographers in 3 US metros (Boston, Austin, Denver)
- [ ] Coolify-side deployment of the dashboard backend
- [ ] Set up status page + Stripe webhooks monitoring
- [ ] Post-mortem after week 12 with pilot cohort
