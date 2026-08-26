---
id: "804"
slug: immigrants-lack-an-ai-service-for-finding-familiar-and-
title: "Immigrants lack an AI service for finding familiar and verified places (pharmacies, doctors, banks) in a new country, causing daily stress and time loss"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/zlt9tnxv31-immigrants-lack-an-ai-service-for-findin"
  captured: "2026-01-03"
category: other
date: "2026-01-03"
tags: [Immigration, AI, Other]
country: Serbia
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Immigrants lack an AI service for finding familiar and verified places (pharmacies, doctors, banks) in a new country, causing daily stress and time loss

## Phase 0: Scaffold

- [x] Capture problem from ProblemHunt + write SPEC.md skeleton
- [ ] Provision Coolify app + Drizzle migrations + multilingual i18next setup
- [ ] Schema: place, user, vouch, review, sponsored_placement
- [ ] Email verification flow (tenure gate)
- [ ] Disclaimer copy reviewed by a Serbia-licensed lawyer

## Phase 1: Core

- [ ] UK seeded from CQC public registry (doctors first)
- [ ] Germany seeded from Apothekenverzeichnis (pharmacies first)
- [ ] USA seeded from NPI (doctors first)
- [ ] Per-place page: address, hours, languages spoken, insurance accepted, vouch count
- [ ] Filter UI: spoken language, accepted insurance, category
- [ ] Vouch flow: registered user with ≥ 30-day tenure can vouch for one place
- [ ] Review flow: registered user with ≥ 14-day tenure can leave one review
- [ ] "Verified by community" badge with vouch-count threshold
- [ ] Sponsored placement: separate index with explicit "Sponsored" label, no mixing with verified tab
- [ ] End-to-end test: immigrant profile → filter → 3 verified places → 1 vouch

## Phase 2: Deploy

- [ ] Coolify production deploy with daily SQLite backup
- [ ] Weekly registry-ingestion jobs (UK CQC + DE Apothekenverzeichnis + US NPI) with diff reports
- [ ] Sponsored-placement Stripe plans wired (€19–€49/mo per place)
- [ ] 90-day manual re-verification cadence for verified places
- [ ] Country-expansion onboarding page for community organisations to seed a 4th country
- [ ] Post-mortem at week 14: do 3 vouches actually correlate with immigrant-reported reliability?