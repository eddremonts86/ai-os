---
id: "254"
slug: solar-installation-companies-lack-a-platform-for-end-to
title: "Solar installation companies lack a platform for end-to-end tracking of a customer's project — from sale to official approval, causing complaints and dissatisfaction"
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/business/ldt9cicmy1-solar-installation-companies-lack-a-plat"
category: business
date: "2026-01-10"
tags: [Business, Marketing, Other]
country: Brazil
---
# Solar installation companies lack a platform for end-to-end tracking of a customer's project — from sale to official approval, causing complaints and dissatisfaction

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/254-solar-installation-companies-lack-a-platform-for-end-to/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Build the project + milestone data model in PostgreSQL with milestone templates per project type (residential rooftop, commercial rooftop, ground-mount).
- [ ] Build the installer console (Rails + Hotwire) so an installer can create a project, pick a template, and record a milestone event in under a minute on a field engineer's phone.
- [ ] Build the customer status page — public, login-free URL per project — with the timeline in pt-BR, overdue flags, and attachment links.
- [ ] Wire the Monday-morning weekly digest job (ActionMailer or Resend) that emails each active customer a summary of the week's events, blockers, and the next expected milestone.
- [ ] Add the stale-project alert to the installer's project manager when a project has had no event recorded in 14 days.
- [ ] Use ActiveStorage on S3-compatible MinIO for permit receipts, photos, and inspection attachments.
- [ ] Onboard three to five Brazilian installers with seeded projects; vet the milestone labels (homologação, art, vistoria) with a Brazilian installer before launch.

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (the chosen stack) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 254-solar-installation-companies-lack-a MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in Brazil completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for the chosen stack errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
