---
id: "239"
slug: hours-of-manual-searching-for-parts-for-chinese-cars-ne
title: Hours of manual searching for parts for Chinese cars. Need an AI agent that understands queries from photos or text and finds the part
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/retail/a035m95nv1-hours-of-manual-searching-for-parts-for"
category: retail
date: "2026-01-21"
tags: [AI, Other]
country: Russia
tech: [Python, FastAPI, OpenAI CLIP + GPT-4o, Elasticsearch, Next.js 14, Telegram Bot API, PostgreSQL]
---
# Hours of manual searching for parts for Chinese cars. Need an AI agent that understands queries from photos or text and finds the part

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/239-hours-of-manual-searching-for-parts-for-chinese-cars-ne/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] FastAPI agent endpoint with photo + text input
- [ ] Postgres schema: users, queries, suppliers, parts
- [ ] Elasticsearch index with canonical part names and OEM numbers
- [ ] GPT-4o text normalisation prompt (Russian-language)
- [ ] CLIP visual embedding pipeline
- [ ] Daily ETL for OEM catalogues and supplier feeds
- [ ] Telegram bot with inline-keyboard results
- [ ] Eval harness on labelled photo set

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Python, FastAPI, OpenAI CLIP + GPT-4o) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 239-hours-of-manual-searching-for-parts MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in Russia completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Python, FastAPI, OpenAI CLIP + GPT-4o errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
