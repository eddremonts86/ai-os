---
id: "267"
slug: startup-teams-have-nowhere-to-find-relevant-custdev-par
title: Startup teams have nowhere to find relevant custdev participants (people for interviews) to test early ideas and prototypes without overpaying for biased feedback
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/startups/frug7pmx31-startup-teams-have-nowhere-to-find-relev"
category: startups
date: "2025-12-15"
tags: [Research, Other]
country: Russia
tech: [Next.js 14, TypeScript, PostgreSQL, Telegram Bot API, Stripe, Resend, YooMoney]
---
# Startup teams have nowhere to find relevant custdev participants (people for interviews) to test early ideas and prototypes without overpaying for biased feedback

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/267-startup-teams-have-nowhere-to-find-relevant-custdev-par/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Postgres schema: participants, personas, vetting, interviews, payouts
- [ ] Participant vetting flow with persona-matching
- [ ] Telegram bot recruitment and screening
- [ ] Email fallback for non-Telegram participants
- [ ] YooMoney / Tinkoff / SBP payout integration
- [ ] Next.js dashboard for startups (persona definition, interview scheduling)
- [ ] Stripe fallback for non-Russian participants
- [ ] Feedback-quality scoring pipeline

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Next.js 14, TypeScript, PostgreSQL) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 267-startup-teams-have-nowhere-to-find- MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in Russia completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Next.js 14, TypeScript, PostgreSQL errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
