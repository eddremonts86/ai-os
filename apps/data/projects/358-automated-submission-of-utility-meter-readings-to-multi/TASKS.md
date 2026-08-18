---
id: "358"
slug: automated-submission-of-utility-meter-readings-to-multi
title: Automated submission of utility meter readings to multiple management companies
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/utilities/tp6dgyysf1-automatic-submission-of-readings-of-counters"
category: utilities
date: "2025-10-10"
tags: [Utilities]
country: Russia
---
# Automated submission of utility meter readings to multiple management companies

## Phase 0: Scaffold

- [ ] Create project folder in `apps/`
- [ ] Initialize git repo
- [ ] Copy `edd-app-template` → `apps/358-automated-submission-of-utility-meter-readings-to-multi/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Configure `tailwind.config.ts` with DESIGN.md tokens
- [ ] Set up dev environment
- [ ] Add Prisma + PostgreSQL schema skeleton
- [ ] Add BullMQ + Redis queue skeleton
- [ ] Add encrypted credential vault with per-user key

## Phase 1: Core

- [ ] User account, flat list, portal link list
- [ ] Monthly intake screen with previous-reading pre-fill
- [ ] Per-portal fingerprint format and storage
- [ ] Playwright submission worker (sandboxed)
- [ ] Fingerprint-mismatch detection and error surfacing
- [ ] Audit log: user, portal, reading, timestamp, confirmation screenshot
- [ ] 3-day reminder SMS / push
- [ ] Credential revocation flow

## Phase 2: Deploy

- [ ] Create GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production
- [ ] Onboard 20 users in one city with 2–3 portals each
- [ ] Run one full monthly cycle and measure on-time submission rate
