---
id: "3652"
slug: dipstick-alerts-search-recalls-and-service-bulletins-fo
title: Dipstick Alerts – Search recalls and service bulletins for your car
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49483465"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [TypeScript, Cloudflare Workers, Cloudflare D1 (SQLite), Cloudflare Queues, Cloudflare KV, Google Gemini API, NHTSA API]
---
# Dipstick Alerts – Search recalls and service bulletins for your car

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/3652-dipstick-alerts-search-recalls-and-service-bulletins-fo/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Build the public year/make/model search page with no signup required
- [ ] Persist recalls and bulletins in D1 through the daily NHTSA scan and the Queues pipeline
- [ ] Generate a plain-language summary per result with Gemini and link the original manufacturer document
- [ ] Implement the vehicle-match step and make it auditable so incorrect matches can be reported
- [ ] Track superseding bulletins so a visitor does not act on a stale entry
- [ ] Ship the optional email alert subscription with per-vehicle delivery
- [ ] Add the status page with last-scan time, imported count and queue depth
- [ ] Document the US-only coverage on every page where coverage matters
- [ ] Verify the daily scan completes inside its 24-hour budget under normal load
- [ ] Add the report-incorrect-match flow the author is asking for

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-28_
