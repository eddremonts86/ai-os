---
id: "289"
slug: a-year-of-searching-for-an-affordable-solution-for-remo
title: A year of searching for an affordable solution for remote US business opening wi
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/business/xnzvy42z31-a-year-of-searching-for-an-affordable-solution"
category: business
date: "2025-10-29"
tags: [Business, Legal, Finance]
country: USA
tech: [Next.js 14, TypeScript, Postgres, Stripe Connect, dLocal (payment for non-US cards), DocuSign API, Clerky compliance workflow, Hetzner]
---
# A year of searching for an affordable solution for remote US business opening wi

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/a-year-of-searching-for-an-affordable-solution-for-remo/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Eligibility quiz: entity type, customer geography, tax-treaty considerations, visa status.
- [ ] State picker with reasoning: Wyoming vs Delaware vs New Mexico for non-residents.
- [ ] Articles of organisation filing via registered-agent partner API.
- [ ] Operating agreement template (DocuSign) — single-member and multi-member variants.
- [ ] EIN application via IRS fax-back path with ops-team dashboard for status tracking.
- [ ] US bank-account setup via Mercury + Relay partner APIs.
- [ ] Stripe Atlas path for users who qualify and want it.
- [ ] International card payments via dLocal (covers cards not in Stripe's default coverage).
- [ ] First-year compliance reminders: annual report, registered-agent renewal, franchise tax.
- [ ] Year-2 renewal automation: reminder 60 days before, one-click renewal.
- [ ] Customer support: dedicated Slack/email channel for non-resident founders, with a 24-hour response SLA.

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Next.js 14, TypeScript, Postgres) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 289-a-year-of-searching-for-an-affordab MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in USA completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Next.js 14, TypeScript, Postgres errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
