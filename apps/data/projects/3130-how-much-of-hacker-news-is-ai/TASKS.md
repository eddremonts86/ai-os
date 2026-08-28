---
id: "3130"
slug: how-much-of-hacker-news-is-ai
title: How much of Hacker News is AI?
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49449648"
  captured: "2026-08-26"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Analytics, AI, Media]
tech: [Python, SQLite, Hugo, Cloudflare Pages, HN Algolia API]
---
# How much of Hacker News is AI?

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/3130-how-much-of-hacker-news-is-ai/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment
- [ ] Stand up SQLite schema: stories, daily_aggregates, vocabulary_versions
- [ ] Pin the HN Algolia client and confirm rate-limit behaviour with a dry run

## Phase 1: Core

- [ ] Scorer module with the standard vocabulary (`AI`, case-sensitive, word-bounded)
- [ ] Extended vocabulary file (`artificial intelligence`, `LLM`, `GPT`, model and vendor names), versioned
- [ ] Nightly job that ingests one day of HN titles and writes per-story labels
- [ ] Daily aggregator producing standard and extended percentages
- [ ] Hugo page rendering today's number on both filters with an "as of" timestamp
- [ ] Monthly chart from the SQLite history
- [ ] CSV download of the monthly series
- [ ] Missed-day detector with an alarm

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-26_
