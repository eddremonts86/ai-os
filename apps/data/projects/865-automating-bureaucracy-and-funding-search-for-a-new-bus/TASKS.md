---
id: "865"
slug: automating-bureaucracy-and-funding-search-for-a-new-bus
title: Automating bureaucracy and funding search for a new business
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/legal/9gly3h5lg1-automating-bureaucracy-and-funding-searc"
category: legal
date: "2025-10-29"
tags: [Legal, Finance, Business]
country: Canada
tech: [Ruby, Ruby on Rails, PostgreSQL, Sidekiq, Redis, Turbo, Stripe]
---
# Automating bureaucracy and funding search for a new business

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/865-automating-bureaucracy-and-funding-search-for-a-new-bus/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Stand up the Rails app and the PostgreSQL schema for business profiles, bureaucratic steps, funding steps and per-business trackers
- [ ] Build the business profile form capturing province, planned entity type, sector, headcount, expected turnover and founder count
- [ ] Implement the ordered federal-registration workflow (corporate federal number, Business Number, GST/HST) with per-step deadlines
- [ ] Add provincial registrations for the four largest provinces with bilingual entries for Quebec as the first-class language case
- [ ] Wire the funding layer to the adjacent grants-only plan's corpus on a scheduled refresh with staleness surfaced when the refresh is overdue
- [ ] Build the per-step tracker with identified-through-outcome stages for both bureaucratic and funding workflows
- [ ] Add the Sidekiq-driven portal-status check and the public status page that calls out broken or slow portals
- [ ] Build the admin source-data editor with version history and the change timestamp visible per item
- [ ] Wire Stripe billing for the paid tier with organisation-level access for accountants, bookkeepers and small-business support organisations
- [ ] Write the unit tests for the workflow ordering and the integration tests for the bilingual Quebec render

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-18_
