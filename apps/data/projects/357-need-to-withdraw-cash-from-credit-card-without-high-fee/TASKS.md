---
id: "357"
slug: need-to-withdraw-cash-from-credit-card-without-high-fee
title: Need to withdraw cash from credit card without high fees
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/finance/tp6dgyysf1-need-to-withdraw-cash-from-credit-card-safe"
category: finance
date: "2025-10-10"
tags: [Finance]
country: Portugal
---
# Need to withdraw cash from credit card without high fees

## Phase 0: Scaffold

- [ ] Create project folder in `apps/`
- [ ] Initialize git repo
- [ ] Copy `edd-app-template` → `apps/357-need-to-withdraw-cash-from-credit-card-without-high-fee/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Configure `tailwind.config.ts` with DESIGN.md tokens
- [ ] Set up dev environment
- [ ] Add Drizzle + PostgreSQL schema skeleton
- [ ] Add Stripe and Twilio sandbox keys

## Phase 1: Core

- [ ] Public intake: issuer picker, amount, deadline
- [ ] Route-explainer catalogue for the top 5 Portuguese issuers
- [ ] Route ranking by total cost (fee + interest + flat)
- [ ] Timeline display per route
- [ ] Booking step that prepares the chosen route (deep link / partner code)
- [ ] Settlement confirmation
- [ ] Audit log of (user, route, fee, date)
- [ ] Repeat-route lookup

## Phase 2: Deploy

- [ ] Create GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production
- [ ] Sign the first partner-ATM agreement
- [ ] Run a 100-user pilot in Lisbon and Porto
