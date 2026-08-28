---
id: "275"
slug: trust-crisis-in-indias-upi-payments-fear-of-stranger-tr
title: "Trust crisis in India's UPI payments: fear of stranger transfers hurts business"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/finance/jrrxhgsoh1-trust-crisis-in-indias-upi-payments-fear"
category: finance
date: "2025-12-07"
tags: [Business, Other]
country: India
tech: [Next.js 14, TypeScript, PostgreSQL, UPI Deep Link API, Razorpay, OTP via SMS Gateway, BharatPe-style merchant directory]
---
# Trust crisis in India's UPI payments: fear of stranger transfers hurts business

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/275-trust-crisis-in-indias-upi-payments-fear-of-stranger-tr/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Next.js merchant onboarding and dashboard
- [ ] UPI deep-link payment-request flow with OTP verification
- [ ] Immutable transaction-log export (signed JSON)
- [ ] Structured dispute form with bank-ready package
- [ ] Razorpay fallback for non-UPI payments
- [ ] SMS Gateway OTP integration
- [ ] RBI compliance review
- [ ] Pilot in 3 Indian cities with 50 merchants

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Next.js 14, TypeScript, PostgreSQL) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 275-trust-crisis-in-india-s-upi-payment MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in India completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Next.js 14, TypeScript, PostgreSQL errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
