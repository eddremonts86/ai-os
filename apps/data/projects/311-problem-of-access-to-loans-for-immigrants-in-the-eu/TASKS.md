---
id: "311"
slug: problem-of-access-to-loans-for-immigrants-in-the-eu
title: Problem of access to loans for immigrants in the EU
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/finance/mebr1a5hi1-problem-of-access-to-loans-for-immigrant"
category: finance
date: "2025-11-12"
tags: [Finance, Immigration, Other]
country: Portugal
tech: [Next.js, TypeScript, Postgres, Plaid (EU), Stripe, Resend, Vercel]
---
# Problem of access to loans for immigrants in the EU

## Phase 0: Scaffold

- [x] Capture problem from ProblemHunt + write SPEC.md skeleton
- [ ] Define DESIGN.md (profile stepper, document uploader, offer card)
- [ ] Provision Vercel EU region + Neon EU Postgres + Hetzner Object Storage (EU)
- [ ] Wire Plaid EU sandbox + 3 lender partner LoIs
- [ ] Decide on auth: email magic link

## Phase 1: Core

- [ ] Applicant signup: email magic link, country of origin, residency status, employer, monthly income
- [ ] Document upload stepper: residence permit, NIF (optional), employment contract, 6 months of rent payments, utility bills
- [ ] Bank link via Plaid EU: last 6 months of transactions (with explicit consent)
- [ ] Alternative credit file builder: rent payment score, income stability score, employer verification, identity proof
- [ ] Portable JSON file spec, versioned and open
- [ ] Lender router: per-lender adapter, ops queue for manual review, offer collection
- [ ] Application tracker: per-lender status, "approved / declined / needs more info"
- [ ] GDPR delete flow: applicant triggers hard delete across file and lender-side views
- [ ] End-to-end test: 10 applicants, 3 lenders each, verify offer flow

## Phase 2: Deploy

- [ ] Move Plaid EU to live credentials
- [ ] Recruit 50 applicants via Portuguese immigrant associations
- [ ] Vercel-side deployment of the console
- [ ] Status page + lender adapter monitoring
- [ ] Post-mortem after week 12 with the pilot cohort
