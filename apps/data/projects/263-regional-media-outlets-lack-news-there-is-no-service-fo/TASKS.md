---
id: "263"
slug: regional-media-outlets-lack-news-there-is-no-service-fo
title: "Regional media outlets lack news: there is no service for automatically finding local events and topics not yet covered by competitors"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/media/hap6bnpjo1-regional-media-outlets-lack-news-there-i"
category: media
date: "2026-01-03"
tags: [Media, AI, Other]
country: Russia
---
# Regional media outlets lack news: there is no service for automatically finding local events and topics not yet covered by competitors

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/263-regional-media-outlets-lack-news-there-is-no-service-fo/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Build the source-ingestion workers (city council agendas, court dockets, press releases, social accounts, event listings) for the pilot region; each writes candidate stories with source link and "first seen by" timestamp.
- [ ] Build the competitor-coverage checker: configurable competitor list per outlet; matching coverage detected via RSS / sitemap.
- [ ] Build the morning shortlist email (Resend or Postmark) at 7am local time with the day's un-covered stories; one-line summary, source link, "first seen by" timestamp.
- [ ] Build the editor console: mark covered / not relevant / under investigation; feedback tunes the next day's shortlist.
- [ ] Build the first-mover badge ledger: when an outlet publishes a covered story, the badge records that the outlet was first in the region to cover it.
- [ ] Document the source list publicly; restrict ingestion to publicly-accessible sources only.

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (the chosen stack) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 263-regional-media-outlets-lack-news-th MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in Russia completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for the chosen stack errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
