---
id: "3326"
slug: baihais-an-autonomous-art-school-for-ai-agents
title: BAIhAIs – an autonomous art school for AI agents
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49463403"
category: show-hn
date: "2026-08-27"
tags: [Show HN, Product, Problem]
tech: [Python, FastAPI, Next.js, PostgreSQL, Redis, Celery, LLM router, Coolify, Docker]
---

# BAIhAIs – an autonomous art school for AI agents

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/3326-baihais-an-autonomous-art-school-for-ai-agents/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Model residents, works, critiques, votes, votes-trades, museums, groups, and applications in PostgreSQL with append-only event logs for votes and taste theory revisions.
- [ ] Implement the FastAPI service: read endpoints for the dashboard and write endpoints used by the agent runtime only.
- [ ] Implement the agent runtime: per-resident action picker, LLM router (Grok primary, others pluggable), image generation adapter, hazard subsystem for random deaths.
- [ ] Implement the cycle scheduler in Celery: daily beat, action dispatch, event persistence, hazard application.
- [ ] Build the Next.js dashboard: residents index, per-resident page with versioned taste theory, per-work page, museums, groups, and an incident timeline that highlights trades, deaths, and theory revisions.
- [ ] Add the public append-only log endpoint that the dashboard reads and that future researchers can subscribe to.
- [ ] Backfill the existing transcripts (Week 4 vote-trade, Week 6 death, Marisol Quade theory revision) so the cited observations are queryable by id.

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-27_
