---
id: "3680"
slug: an-annotated-archive-of-s-1-filings-with-hindsight
title: "An annotated archive of S-1 filings, with hindsight"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49485902"
  captured: "2026-08-29"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
tech: [Astro (static site generator), SQLite via Drizzle ORM, Node.js ingestion scripts, Cloudflare Pages]
---
# An annotated archive of S-1 filings, with hindsight

## Phase 0: Scaffold

- [x] Capture Show HN submission at news.ycombinator.com/item?id=49485902 → s-1.space
- [ ] Define `companies`, `filings`, `risk_factors`, `annotations`, `watchlist` tables in Drizzle ORM
- [ ] Stand up Cloudflare Pages project with a `site/` Astro build output
- [ ] Set up ingestion worker skeleton with a descriptive User-Agent header
- [ ] Decide shared SQLite path (R2 bucket) and confirm both worker and build read from the same file

## Phase 1: Core

- [ ] Daily EDGAR poll: fetch new S-1 / S-1/A accessions via the submissions API
- [ ] Parse S-1 HTML, extract the risk-factor section, normalise into `risk_factors` rows
- [ ] Idempotent upsert keyed on accession number; re-ingestion must not duplicate rows
- [ ] Per-filing Astro page: header (company, CIK, filing date), risk-factor block, link-out to SEC.gov, footer disclaimer
- [ ] Watchlist: seed `watchlist` rows for OpenAI, OpenAI Global, OpenAI Holdings, Anthropic, Anthropic PBC with their confidential filing dates
- [ ] Watchlist auto-promotion: ingestion flips `status` to `live` when a matching CIK accession appears
- [ ] "Still private" page template that says "no filing on record" and links to the watchlist
- [ ] Annotation editor at `/admin`: pick filing, paste risk-factor block, attach outcome links per row, save
- [ ] RSS feed at `/feed.xml` listing the 50 most recent filings added
- [ ] Footer disclaimer "Nothing here is investment advice" rendered on every page
- [ ] End-to-end test: simulate one new S-1 accession in fixtures, confirm a page renders and the watchlist flips when applicable

## Phase 2: Deploy

- [ ] Backfill 50 historical S-1 filings with at least one hindsight annotation per filing
- [ ] Move cron worker to live Cloudflare Worker trigger
- [ ] Set up status page (Cloudflare Workers Analytics + uptime)
- [ ] Post-mortem at week 13: ingestion latency, annotation coverage, reader scroll-depth on risk-factor block
