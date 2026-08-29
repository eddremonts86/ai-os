---
id: "3641"
slug: i-read-648-banks-exchange-boards-daily-to-show-what-the
title: "I read 648 banks' exchange boards daily to show what they charge"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49480607"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [Python, FastAPI, PostgreSQL, Playwright, Pandas, htmx, Tailwind CSS]
---
# I read 648 banks' exchange boards daily to show what they charge

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/3641-i-read-648-banks-exchange-boards-daily-to-show-what-the/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Pick and document the mid-market reference source used as the denominator for the spread
- [ ] Implement the per-bank scrape with a hard timeout, a recorded error and a retry only when it changes the outcome
- [ ] Persist each daily result with separate captured_at and board_as_of timestamps
- [ ] Build the public list route that returns the latest row per bank with spread in basis points
- [ ] Add currency-pair, region and spread-size filters on the 648-row table
- [ ] Build the per-bank detail page that reads that bank's recent spread history
- [ ] Surface the last-successful-refresh timestamp and the success count on the page header
- [ ] Cover the boards that publish rates via JavaScript with a headless path that runs only on those boards
- [ ] Run the daily scrape against the full 648 set and verify partial-failure behaviour is visible, not silent
- [ ] Declare on every page which mid-market source is used so the spread's denominator is never ambiguous

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-28_
