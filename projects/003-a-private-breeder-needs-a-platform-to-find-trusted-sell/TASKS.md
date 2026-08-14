---
id: "003"
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
tech: [Next.js, Postgres, Stripe Connect, Twilio, Mapbox]
---
# A private breeder needs a platform to find trusted sellers who work for a commission. One helper at 10% commission already boosted sales. Need more people like that.

## Phase 0: Scaffold

- [x] Capture problem from ProblemHunt + write SPEC.md skeleton
- [ ] Define DESIGN.md (breeder-led palette, two-column profile layout)
- [ ] Provision Supabase project + Stripe Connect platform application
- [ ] Telegram Bot father token + privacy review
- [ ] Vetting rubric document (v1)

## Phase 1: Core

- [ ] Breeder onboarding: kennel info, region, animal types, commission rate
- [ ] Seller onboarding: profile, references, sample pitch video, Stripe Connect link
- [ ] Listings: create, browse, filter by region/animal, apply with message
- [ ] Two-sided chat: in-app messaging + Telegram bridge
- [ ] Vetting console: human reviewer approves/denies with a note
- [ ] Closed-deal flow: breeder marks a sale; Stripe transfer to seller with 15% platform fee
- [ ] Region analytics: deals per region, average commission, repeat-buyer rate
- [ ] End-to-end test: 3 breeders + 5 sellers + 1 closed deal paid out

## Phase 2: Deploy

- [ ] Stripe Connect live mode + platform fees
- [ ] Telegram bot public release
- [ ] Recruit first 20 breeders in Georgia via direct outreach (Telegram groups, breeder forums)
- [ ] Vetting SOP published; second reviewer hired
- [ ] Landing page + onboarding in Georgian and Russian
- [ ] Post-mortem at week 16
