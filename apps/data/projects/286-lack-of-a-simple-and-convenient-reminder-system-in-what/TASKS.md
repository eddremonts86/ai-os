---
id: "286"
slug: lack-of-a-simple-and-convenient-reminder-system-in-what
title: Lack of a simple and convenient reminder system in WhatsApp
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/productivity/0bwf3l7wh1-lack-of-a-simple-and-convenient-reminder-sy"
category: productivity
date: "2025-10-29"
tags: [Productivity, Communication]
country: UAE
tech: [Node.js API (Fastify), TypeScript, Postgres, WhatsApp Business Cloud API, BullMQ (Redis), Hetzner]
---
# Lack of a simple and convenient reminder system in WhatsApp

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/lack-of-a-simple-and-convenient-reminder-system-in-what/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] WhatsApp Cloud API webhook receiver with signature verification.
- [ ] Inbound message parser: regex first for English and Arabic, LLM fallback for low-confidence.
- [ ] Reminder model in Postgres: time, recurrence rule, language, timezone, status, delivery attempts.
- [ ] BullMQ delayed-job worker that fires at the right time and calls WhatsApp send API.
- [ ] Pre-approved utility templates for delivery: English + Arabic.
- [ ] Web dashboard (Next.js): list upcoming, cancel, edit, set recurring.
- [ ] Location reminder: parse incoming WhatsApp location share, store geofence, fire on entry/exit.
- [ ] User onboarding: first message triggers a small welcome flow with 1-tap tutorial.
- [ ] Timezone detection from phone locale, default Asia/Dubai, re-confirm on first delivery.
- [ ] Free-tier rate limit (10 active reminders) + Pro upgrade prompt via Stripe Checkout.
- [ ] Family plan: invite by WhatsApp number, shared reminder list, per-user billing.

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Node.js API (Fastify), TypeScript, Postgres) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 286-lack-of-a-simple-and-convenient-rem MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in UAE completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Node.js API (Fastify), TypeScript, Postgres errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
