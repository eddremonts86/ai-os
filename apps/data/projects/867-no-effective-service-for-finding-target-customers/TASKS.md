---
id: "867"
slug: no-effective-service-for-finding-target-customers
title: No effective service for finding target customers
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/marketing/voyb4a4nb1-no-effective-service-for-finding-target"
category: marketing
date: "2025-10-29"
tags: [Marketing, Other]
country: Russia
tech: [Python, FastAPI, Playwright, DuckDB, HTMX, Caddy]
---
# No effective service for finding target customers

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/867-no-effective-service-for-finding-target-customers/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Model the buyer profile as plain text plus a small structured section, with the structured fields stored as typed DuckDB columns
- [ ] Model sources as explicit declarations with URL patterns, candidate shape and per-source rate limits
- [ ] Add a test that a candidate row cannot be exported without its source row attached
- [ ] Build the Playwright collector skeleton with per-source rate-limit enforcement and asyncio concurrency
- [ ] Implement one working source end to end with the collector, the candidate ingestion and the audit row
- [ ] Write the match step as a DuckDB SQL expression the operator can read and adjust
- [ ] Add the threshold configuration and the deduplication-by-fingerprint pass
- [ ] Render the operator dashboard with server-rendered HTML and HTMX for buyer profiles, sources and run history
- [ ] Implement the CSV export with provenance columns and refuse exports without them
- [ ] Build the audit view that resolves every contact in the most recent export back to its source row
- [ ] Add a second source against a structurally different page shape to confirm the framework does not assume the first

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-18_
