---
id: "732"
slug: a-photographer-moving-to-the-us-needs-clients-platforms
title: "A photographer moving to the US needs clients. Platforms require reviews, agencies are expensive. Wants a website + ads that bring bookings. Willing to pay $100–300/month."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/6t7ke01t41-a-photographer-moving-to-the-us-needs-cl"
category: other
date: "2026-07-17"
tags: [Immigration, Freelance, Marketing, Career, Other]
country: Serbia
wtp:
  raw: $100-300/month
  currency: USD
  min: 100
  max: 300
  period: month
  mrrMid: 200
tech: [Next.js, TypeScript, Tailwind CSS, Stripe subscriptions, Google Ads API, Meta Ads API, Calendly embed, Coolify]
---
# A photographer moving to the US needs clients. Platforms require reviews, agencies are expensive. Wants a website + ads that bring bookings. Willing to pay $100–300/month.

## Phase 0: Scaffold

- [x] Capture problem from ProblemHunt + write SPEC.md skeleton
- [ ] Define DESIGN.md (photographer-facing dashboard chrome, portfolio template, lead list, wallet card)
- [ ] Provision Coolify project + Docker image + SQLite volume + per-workspace subdomain routing
- [ ] Wire Resend email-link auth (single workspace per account, country-of-origin aware)
- [ ] Decide niche-site template structure (portfolio grid, 3 service packages, city landing pages) and codify per-genre variants

## Phase 1: Core

- [ ] Self-serve onboarding form: city, genre, portfolio upload (S3-compatible), ideal-client description
- [ ] Niche site generator: render `{slug}.platform.com/{city}/{genre}` from the per-genre template + the photographer's portfolio
- [ ] Google Ads API integration: create paused search + local-services campaigns from per-genre templates, expose a per-workspace ads dashboard
- [ ] Meta Ads API integration: create paused Instagram + Facebook lead-gen campaigns from per-genre templates, with AI-assisted caption/headline variants within a curated safe library
- [ ] Stripe Subscriptions ($100/month, $90/month annual) + Stripe Checkout; webhook updates `Workspace.subscriptionStatus`
- [ ] Stripe Top-ups for the ad-spend wallet; webhook updates `Wallet.balanceCents` and unpauses campaigns on first top-up
- [ ] Calendly or Cal.com embed on the niche site; booking submissions land in a `leads` table with name, email, shoot date, package
- [ ] Resend + Twilio notifications on new lead (SMS opt-in per workspace)
- [ ] Hourly cron: sync ad spend from Google + Meta APIs into `ad_spend_log`, decrement `Wallet.balanceCents`, alert at $20 remaining
- [ ] Nightly cron: per-workspace performance digest emailed (leads, spend, cost-per-lead)
- [ ] Wallet dashboard with top-up, balance, and 30-day spend chart
- [ ] End-to-end test: photographer signs up, completes onboarding, tops up $200, campaigns go live, lead submits booking, photographer receives email + SMS

## Phase 2: Deploy

- [ ] Move Stripe to live mode
- [ ] Onboard 10 pilot photographers across 5 US cities (LA, NYC, Austin, Miami, Chicago)
- [ ] Weekly performance review with pilot cohort for 8 weeks
- [ ] Set up status page + ad-spend reconciliation audit
- [ ] Post-mortem after week 17 with pilot cohort; decide v2 scope (Pro tier, native booking widget, TikTok Ads)
