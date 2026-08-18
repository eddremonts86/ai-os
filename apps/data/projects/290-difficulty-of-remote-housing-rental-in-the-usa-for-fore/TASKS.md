---
id: "290"
slug: difficulty-of-remote-housing-rental-in-the-usa-for-fore
title: Difficulty of remote housing rental in the USA for foreigners without credit his
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/real-estate/v0rk4jlts1-difficulty-of-remote-housing-rental-in-the-"
category: other
date: "2025-10-29"
tags: [Real Estate, Business, Other]
country: USA
tech: [Next.js 14, TypeScript, Postgres, Plaid (cash-flow verification), Stripe (deposits), Twilio SMS + email, DocuSign]
---
# Difficulty of remote housing rental in the USA for foreigners without credit his

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/difficulty-of-remote-housing-rental-in-the-usa-for-fore/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Applicant profile: passport, visa status, employer letter, US arrival date, target metro.
- [ ] International credit-bureau integrations with country-coverage map and confidence score.
- [ ] Income verification: bank upload + Plaid where available; manual employer-letter flow otherwise.
- [ ] Profile score: weighted (identity 25%, income 35%, credit 30%, immigration 10%); explainable to landlord.
- [ ] Landlord dashboard: applicant queue, profile PDF export, lease templates by state.
- [ ] Lease e-sign via DocuSign with state-specific lease addenda.
- [ ] Deposit escrow: platform or partner-held; release on landlord move-in confirmation.
- [ ] International deposit payments via Stripe + dLocal for cards not in Stripe's default set.
- [ ] Fair-housing compliance review with US counsel; audit log of all marketing copy.
- [ ] Pilot in 3 metros with 50 landlords, 200 applicants, 50 leases signed — measured at week 14.

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Next.js 14, TypeScript, Postgres) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 290-difficulty-of-remote-housing-rental MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in USA completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Next.js 14, TypeScript, Postgres errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
