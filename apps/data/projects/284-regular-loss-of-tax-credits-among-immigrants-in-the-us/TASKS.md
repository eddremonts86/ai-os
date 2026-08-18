---
id: "284"
slug: regular-loss-of-tax-credits-among-immigrants-in-the-us
title: Regular loss of tax credits among immigrants in the US
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/finance/dpxn6fcl71-regular-loss-of-tax-credits-among-immigra"
category: other
date: "2025-10-29"
tags: [Other]
country: USA
tech: [Next.js 14 (App Router), TypeScript, Postgres + pgvector, OpenAI Assistants API, Plaid (bank OAuth), Stripe, Hetzner]
---
# Regular loss of tax credits among immigrants in the US

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/regular-loss-of-tax-credits-among-immigrants-in-the-us/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Eligibility engine: rules schema (TypeScript) + tests for EITC, CTC, ODC, AOTC, Saver's Credit, based on IRS Publication 596 and 972.
- [ ] Tax-year versioned config — one config file per year, with diff tooling so a rule change is auditable.
- [ ] Interview Q-graph: 60 questions max per return, with branching and bilingual strings (i18n via next-intl).
- [ ] Document upload: W-2, 1099, 1098-T, 1098-E, ITIN letter, SSN/ITIN card — encrypted at rest.
- [ ] Plaid Link integration: income verification + bank statements for refund-advance underwriting.
- [ ] Filing-status optimiser: enumerate single / MFS / HOH / MFJ and rank by net refund for the inputs given.
- [ ] Preparer dashboard: case queue, language filter, visa-mix filter, return-time analytics.
- [ ] ITIN helper flow: Form W-7 walkthrough, certified document upload, paper-mailing tracking.
- [ ] Mixed-status return type — SSN spouse + ITIN spouse + SSN children; route to senior preparer.
- [ ] Refund-advance product: small EITC-bridge, repaid automatically from the refund when it lands.
- [ ] Filing-season load test (simulate 1,000 concurrent interviews) before IRS e-file opens.

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Next.js 14 (App Router), TypeScript, Postgres + pgvector) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 284-regular-loss-of-tax-credits-among-i MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in USA completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Next.js 14 (App Router), TypeScript, Postgres + pgvector errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
