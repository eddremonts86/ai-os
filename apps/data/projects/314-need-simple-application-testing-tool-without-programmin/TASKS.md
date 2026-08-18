---
id: "314"
slug: need-simple-application-testing-tool-without-programmin
title: Need simple application testing tool without programming
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/dev/1ic9wdywx1-need-simple-application-testing-tool-without-p"
category: dev
date: "2025-10-29"
tags: [Dev, QA, Other]
country: Kenya
tech: [Next.js 14, TypeScript, Postgres, Playwright headless browser farm, M-Pesa Daraja API, Hetzner]
---
# Need simple application testing tool without programming

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/need-simple-application-testing-tool-without-programmin/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Chrome extension (Manifest V3) recorder: clicks, fills, navigations, selector capture.
- [ ] Test step editor in the operator console: reorder, delete, edit selectors.
- [ ] Assertion editor: text, element visibility, attribute value, URL match.
- [ ] Replay engine: Playwright headless Chromium on Hetzner, per-step screenshots.
- [ ] Screenshot diff with tolerance band and per-step baseline storage.
- [ ] GitHub Actions integration: replay on push, status check back to the PR.
- [ ] Slack + WhatsApp failure notifications with screenshot and failing step.
- [ ] Project dashboard: runs, history, screenshots, failure rate.
- [ ] M-Pesa Daraja payments for Kenya; Stripe for international card fallback.
- [ ] Test history retention: 30 days default, configurable up to 90 days.
- [ ] Pilot with 30 Kenyan dev teams; measure time-to-first-test + bug-caught-pre-prod at week 12.

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Next.js 14, TypeScript, Postgres) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 314-need-simple-application-testing-too MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in Kenya completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Next.js 14, TypeScript, Postgres errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
