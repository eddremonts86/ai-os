---
id: "858"
slug: automating-b2b-marketing-database-segmentation-client-p
title: "Automating B2B Marketing: database segmentation, client profiling, and contact parsing"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/marketing/8kr7mskh41-automating-b2b-marketing-database-segmen"
category: marketing
date: "2025-11-04"
tags: [Marketing, AI, Other]
country: Russia
tech: [Django, Python, Celery, PostgreSQL, Redis, dbt (DuckDB warehouse), Apache Superset (read-only), OpenAI API (parsing), DuckDuckGo SERP scraping (operator-controlled), YooKassa (sandbox), Coolify, Docker]
---
# Automating B2B Marketing: database segmentation, client profiling, and contact parsing

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/858-automating-b2b-marketing-database-segmentation-client-p/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Stand up the Django operator-facing app with the API surface and the PostgreSQL schema for the unified contact and company model
- [ ] Build the Celery ingestion and enrichment job queue with Celery Beat for scheduled re-runs
- [ ] Implement CSV ingestion with per-row issue reporting and an operator-triage surface in the Django admin
- [ ] Implement versioned enrichment records (no silent overwrites) and the OpenAI API parsing behind a per-request cost gate and content-hash cache
- [ ] Build the email-signature review queue with operator approval before any parsed field becomes canonical
- [ ] Implement the segmentation builder over the unified schema with named, versioned segments and CSV export with audit-trail header
- [ ] Build the per-company client profile assembled from contacts, segment memberships, recent enrichments and operator notes
- [ ] Build the dbt-on-DuckDB analytics layer with contact-decay, enrichment-freshness and segment-staleness models
- [ ] Configure Apache Superset read-only against the dbt models behind single-admin auth
- [ ] Add operator-controlled web ingestion with a per-operator URL list, per-domain rate limit, opt-out mechanism and per-scrape audit log
- [ ] Render the non-CRM-replacement disclaimer in the operator UI and in every CSV export header
- [ ] Wire the request-id-tied audit log across ingestion, enrichment, segmentation, export and write-back
- [ ] Wire YooKassa (sandbox) integration behind the paid tier on a single subscription product
- [ ] Define and document the retention policy for ingested contacts and scraped pages before any pilot user is onboarded

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-18_
