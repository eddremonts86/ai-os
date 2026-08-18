---
id: "316"
slug: automating-b2b-marketing-database-segmentation-client-p
title: "Automating B2B Marketing: database segmentation, client profiling, and contact p"
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/marketing/6yr1d3qgw1-automating-b2b-marketing-database-segmentatio"
category: marketing
date: "2025-10-29"
tags: [Marketing, Sales, AI, Business]
country: Russia
tech: [Python (FastAPI), Next.js 14, Postgres + pgvector, OpenAI API, Hunter.io + LinkedIn Sales Navigator adapters, amoCRM / Bitrix24 CRM integrations, YooKassa]
---
# Automating B2B Marketing: database segmentation, client profiling, and contact p

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/automating-b2b-marketing-database-segmentation-client-p/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Database ingestion: CSV, amoCRM export, Bitrix24 export.
- [ ] Segmentation engine: firmographic, technographic, role-based filters with pgvector similarity.
- [ ] Contact enrichment: Hunter.io (email), OpenAI (company description + role inference), BuiltWith-style signals.
- [ ] Outreach composer: per-segment template + per-contact personalisation, sequenced email + LinkedIn.
- [ ] amoCRM native integration: lead create, contact update, deal stage sync.
- [ ] Bitrix24 native integration: same shape as amoCRM.
- [ ] Per-user rate limits respected on Hunter.io and LinkedIn Sales Navigator.
- [ ] Consent capture per contact + per-contact purge endpoint (152-ФЗ).
- [ ] Russian-language UI + YooKassa RUB billing.
- [ ] Agency tier: per-client workspaces, white-label reports.
- [ ] Pilot with 20 Russian B2B teams; measure reply rate + time-to-segmented-list at week 12.

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Python (FastAPI), Next.js 14, Postgres + pgvector) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 316-automating-b2b-marketing-database-s MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in Russia completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Python (FastAPI), Next.js 14, Postgres + pgvector errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
