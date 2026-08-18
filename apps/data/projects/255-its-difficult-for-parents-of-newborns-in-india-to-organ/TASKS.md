---
id: "255"
slug: its-difficult-for-parents-of-newborns-in-india-to-organ
title: "It's difficult for parents of newborns in India to organize vaccination: there is no service for easy doctor search and a «turnkey» process provision."
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/health/o94v8yjuj1-its-difficult-for-parents-of-newborns-in"
category: health
date: "2026-01-09"
tags: [Health, Other]
country: India
---
# It's difficult for parents of newborns in India to organize vaccination: there is no service for easy doctor search and a «turnkey» process provision.

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/255-its-difficult-for-parents-of-newborns-in-india-to-organ/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Build the clinic + vaccine catalogue in PostgreSQL with Prisma; onboard 30–50 clinics across one or two pilot cities with curated vaccine listings and "last confirmed" dates.
- [ ] Build the parent search (city + vaccine) with results list showing distance, price band, next available slot, and last-confirmed stock date.
- [ ] Implement the booking flow: Redis slot reservation, parent confirm, structured WhatsApp notification to the clinic.
- [ ] Wire WhatsApp Business API (or Gupshup as the Indian alternative) for clinic YES / NO / ALT-TIME replies; degrade to SMS on delivery failure.
- [ ] Build the schedule engine that maps child DOB to the IAP immunisation schedule; clearly attribute the schedule to the IAP recommendation.
- [ ] Add the parent-side schedule tracker with next-due, overdue, and WhatsApp reminders the day before each appointment and when the next vaccine is due.
- [ ] Add post-visit confirmation; parent confirms vaccine given, schedule updates, next reminder queued.
- [ ] Define the retention policy and parent-controlled deletion path before launch with real child data.

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (the chosen stack) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 255-it-s-difficult-for-parents-of-newbo MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in India completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for the chosen stack errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
