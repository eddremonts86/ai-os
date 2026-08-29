---
id: "864"
slug: problem-of-finding-and-obtaining-grants-for-small-busin
title: Problem of finding and obtaining grants for small businesses
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/finance/gkrcgpelx1-problem-of-finding-and-obtaining-grants"
category: finance
date: "2025-10-29"
tags: [Finance, Business, Legal, Other]
country: Canada
tech: [Python, FastAPI, Elasticsearch, Redis, Playwright, PostgreSQL]
---
# Problem of finding and obtaining grants for small businesses

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/864-problem-of-finding-and-obtaining-grants-for-small-busin/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Stand up the FastAPI endpoint and the Elasticsearch corpus with the federal programmes of broad small-business reach
- [ ] Build the business profile form capturing sector, province, headcount, revenue band, ownership profile and active project
- [ ] Implement the per-criterion eligibility fit score with the pass-fail breakdown surfaced on every grant entry
- [ ] Add provincial programmes for the four largest provinces with province as a filter on the grant list
- [ ] Build the lifecycle feed surfacing newly opened programmes, closing deadlines and outcome announcements with a recency boost
- [ ] Add the per-business application tracker with the identified-through-outcome stages and the deadline visible at every stage
- [ ] Implement the fit-score recalibration against the user's outcome history with a per-business cadence
- [ ] Build the admin source-data editor with version history and the change timestamp visible per programme
- [ ] Add the Playwright fallback for programme-portal link checks when plain HTTP hits a captcha or a browser-only check
- [ ] Write the unit tests for the eligibility fit score and the integration tests for the lifecycle feed

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-18_
