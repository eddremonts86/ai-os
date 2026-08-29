---
id: "861"
slug: business-setup-and-launch-challenges-in-india
title: Business setup and launch challenges in India
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/ai/m7vsm5tpv1-business-setup-and-launch-challenges-in"
category: ai
date: "2025-10-30"
tags: [AI, Business, Legal, Other]
country: India
tech: [Python, FastAPI, PostgreSQL, Redis, Celery, SvelteKit, Playwright]
---
# Business setup and launch challenges in India

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/861-business-setup-and-launch-challenges-in-india/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Model entity types, thresholds, portal URLs and language mappings in PostgreSQL with seed data for private limited, LLP and OPC
- [ ] Build the FastAPI endpoint that takes the situation form and returns the ordered checklist as a typed join
- [ ] Build the SvelteKit form and the English-only checklist render with the disclaimer block between submit and result
- [ ] Add the GST, MSME/Udyam, Shops & Establishments and professional tax items for at least three states
- [ ] Add the English-plus-Hindi string table and select language per row at render time
- [ ] Implement the weekly Celery-driven portal-link check with a Playwright fallback for captcha-protected sites
- [ ] Build the public status page that lists per-portal reachability and last-checked timestamp
- [ ] Add the per-founder account, checklist tick-off state, reference-number capture and open-versus-done view
- [ ] Build the admin source-data editor with version history and the disclaimer re-acknowledgment flag
- [ ] Write the unit tests for the rule evaluation and the integration tests for the bilingual checklist render

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-18_
