---
id: "281"
slug: the-problem-of-discrimination-wage-delays-and-fear-of-f
title: "The problem of discrimination, wage delays, and fear of firing/deportation among immigrant construction workers in the USA"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/ydplsur631-the-problem-of-discrimination-wage-delay"
category: other
date: "2025-12-01"
tags: [Other]
country: USA
tech: [Next.js 14, TypeScript, PostgreSQL, Stripe (for legal-aid donations), Twilio SMS, Retool / Airtable-style case tracker, Multilingual UI (Spanish / English)]
---
# The problem of discrimination, wage delays, and fear of firing/deportation among immigrant construction workers in the USA

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/281-the-problem-of-discrimination-wage-delays-and-fear-of-f/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Next.js multilingual web app (Spanish / English)
- [ ] Anonymous wage-claim tracker with no persistent identifier
- [ ] Twilio SMS hotline with no-caller-ID logging
- [ ] Legal-aid referral directory with vetting pipeline
- [ ] Anonymous incident reporting for unsafe or discriminatory job sites
- [ ] Stripe donation flow for legal-aid funding
- [ ] Internal case tracker for partner NGOs
- [ ] Native-speaker translation review (not machine-translated)

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Next.js 14, TypeScript, PostgreSQL) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 281-the-problem-of-discrimination-wage- MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in USA completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Next.js 14, TypeScript, PostgreSQL errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
