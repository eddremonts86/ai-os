---
id: "805"
slug: regional-media-outlets-lack-news-there-is-no-service-fo
title: "Regional media outlets lack news: there is no service for automatically finding local events and topics not yet covered by competitors"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/media/hap6bnpjo1-regional-media-outlets-lack-news-there-i"
  captured: "2026-01-03"
category: media
date: "2026-01-03"
tags: [Media, AI, Other]
country: Russia
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Regional media outlets lack news: there is no service for automatically finding local events and topics not yet covered by competitors

## Phase 0: Scaffold

- [x] Capture problem from ProblemHunt + write SPEC.md skeleton
- [ ] Provision Coolify app + Drizzle migrations
- [ ] Schema: newsroom, region, competitor_set, item, coverage_score
- [ ] Ingestion-job skeleton (cron container + per-source fetcher)
- [ ] Per-source health-check alert (24h silence → Slack/email)

## Phase 1: Core

- [ ] Ingestion: municipal calendars (1 region)
- [ ] Ingestion: court dockets + arbitration filings
- [ ] Ingestion: government procurement (zakupki)
- [ ] Ingestion: regional Telegram channels (public RSS only)
- [ ] Ingestion: small-business registry changes
- [ ] Coverage scoring: 7-day window per item against the newsroom's competitor set
- [ ] Editorial dashboard: ranked feed, sortable columns (discovered-at, source, coverage-count, region)
- [ ] Per-item detail drawer: source attribution, primary-record link, ingestion timestamp
- [ ] "Draft story" export: opens CMS or downloads a markdown brief with the source links
- [ ] End-to-end test: 1 region, 5 ingestion sources, 50+ ranked items/day, 1 published story

## Phase 2: Deploy

- [ ] Coolify production deploy with daily SQLite backup
- [ ] Free / Pro $99 / Enterprise $499 Stripe plans wired
- [ ] 90-day ingestion-source health review
- [ ] Country-expansion onboarding page for a 2nd country with open municipal/court data
- [ ] Post-mortem at week 14: did the coverage-score ranker actually predict scoop stories?