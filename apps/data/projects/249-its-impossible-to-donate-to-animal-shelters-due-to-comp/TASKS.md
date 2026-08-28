---
id: "249"
slug: its-impossible-to-donate-to-animal-shelters-due-to-comp
title: "It's impossible to donate to animal shelters due to complete distrust in charity fundraisers. There is no service with guaranteed transparency and audit"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/other/1adxzgi7b1-its-impossible-to-donate-to-animal-shelt"
category: other
date: "2026-01-17"
tags: [Other]
country: Russia
---
# It's impossible to donate to animal shelters due to complete distrust in charity fundraisers. There is no service with guaranteed transparency and audit

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/249-its-impossible-to-donate-to-animal-shelters-due-to-comp/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Build the donor surface: shelter profile pages (location, capacity, line items, target monthly amount) and the donor dashboard showing the donor's contributions and the underlying receipts and audit confirmations.
- [ ] Build the shelter console for receipt upload tagged against line items (feed, vet, utilities) with disbursement status.
- [ ] Wire YooKassa (or Tinkoff Payments) for ruble donations; record donation events in PostgreSQL.
- [ ] Add object storage (S3-compatible MinIO) for receipt files, public-by-default.
- [ ] Build the auditor console: independent auditor reviews receipts, confirms or rejects, publishes monthly audit reports per shelter.
- [ ] Add the disbursement worker (Celery beat) that triggers a ruble disbursement to the shelter when receipts are confirmed, and records a public disbursement event.
- [ ] Onboard three to five partner shelters and one independent auditor before launch.

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (the chosen stack) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 249-it-s-impossible-to-donate-to-animal MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in Russia completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for the chosen stack errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
