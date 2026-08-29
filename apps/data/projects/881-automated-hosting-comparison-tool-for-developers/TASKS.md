---
id: "881"
slug: automated-hosting-comparison-tool-for-developers
title: Automated hosting comparison tool for developers
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/dev/djk3np9401-automated-hosting-comparison-tool-for-de"
  captured: "2025-10-26"
category: dev
date: "2025-10-26"
tags: [Dev]
country: Russia
wtp:
  raw: "300–500 RUB ($5–6) per month"
  currency: USD
  min: 5
  max: 6
  period: month
  mrrMid: 5.5
tech: [Go scrapers with per-provider adapters, PostgreSQL with historical price snapshots, HTMX server-rendered filter UI, Playwright for JS-rendered pricing pages, Cron scheduler, CSV and JSON export]
---
# Automated hosting comparison tool for developers

## Phase 0: Scaffold

- [x] Capture the problem from ProblemHunt, including the manual parsing workaround and the three filter axes
- [ ] Write DESIGN.md (filter panel, comparison table, freshness indicator)
- [ ] Pick the launch provider list — the source names none
- [ ] Define the canonical plan schema: price, CPU, RAM, disk, data centre locations, billing period
- [ ] Write the spec-normalisation rules explicitly, with the assumption recorded per rule

## Phase 1: Core

- [ ] Adapter framework in Go: one module per provider, common output contract
- [ ] Three provider adapters against real pricing pages
- [ ] Playwright path for providers whose pricing is rendered client-side
- [ ] Snapshot storage in PostgreSQL: every refresh appends, nothing is overwritten
- [ ] Last-verified timestamp surfaced on every plan row in the UI
- [ ] Filter and sort by price, server specifications and data centre location
- [ ] Side-by-side comparison view for shortlisted plans
- [ ] Show the provider's raw spec claim wherever normalisation cannot honestly produce an equivalent
- [ ] Breakage detection: alert on page-shape change or implausible scraped values before users see them
- [ ] Per-provider refresh cadence driven by observed price volatility, to hold cost inside the $5–6 price
- [ ] CSV and JSON export of a comparison
- [ ] End-to-end test: scrape three providers, assert normalised rows match the live pages by hand

## Phase 2: Deploy

- [ ] Expand to ten providers and measure adapter maintenance hours per month
- [ ] Launch the subscription in the 300–500 RUB band and track infrastructure cost per subscriber
- [ ] Contact the author directly via his listed Telegram, since the thread notes problem authors rarely read comments
- [ ] Review the deploy-comparison MVP posted in the comments before duplicating work
