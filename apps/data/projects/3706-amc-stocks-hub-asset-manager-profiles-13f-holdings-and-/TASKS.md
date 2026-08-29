---
id: "3706"
slug: amc-stocks-hub-asset-manager-profiles-13f-holdings-and-
title: "AMC Stocks Hub – asset-manager profiles, 13F holdings, and co-holdings"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49487177"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
country: United States
tech: [Astro, TypeScript, SQLite, SEC EDGAR ingestion]
---
# AMC Stocks Hub – asset-manager profiles, 13F holdings, and co-holdings

## Phase 0: Scaffold

- [x] Astro site deployed at `assetmanagementcompany.net`.
- [x] Directory of 551 asset managers with portfolio value, country, filer status.
- [x] 105,472 13F holding records, 5,271 stocks covered, data as of 2026-06-30.
- [x] Holdings search, "most held", "smart buys", "smart sells" tabs live.
- [x] Co-holdings index live with the crowding-signal explanation.
- [x] Public-AMC directory live with tickers and price + market cap.
- [ ] Decide on the public-AMC price-feed source (Tiingo / Alpha Vantage / manual CSV) and the freshness policy.

## Phase 1: Core

- [ ] EDGAR ingestion worker: cron on the SEC publication calendar, parse 13F XML, write to Postgres.
- [ ] Co-holdings index: derived view that aggregates "stocks held by N managers" with a crowding signal.
- [ ] Quarter-over-quarter diff: "smart buys" and "smart sells" surfaced from the diff between the current and previous 13F window.
- [ ] Public-AMC pricing: daily pull from the chosen source, with a freshness timestamp on every row.
- [ ] Tests:
 - Parser regression: assert the parsed counters from a known fixture set match SEC-reported totals.
 - Co-holdings regression: assert the index recomputes consistently when the underlying holdings table changes.
 - Price freshness: assert the UI shows "as of" timestamp on every price and never displays a price older than the freshness window.

## Phase 2: Deploy

- [ ] Postgres in production (Neon or self-hosted).
- [ ] Ingestion worker in production: cron on the SEC publication calendar, retry on transient EDGAR errors.
- [ ] ISR / rebuild cadence aligned to the quarterly ingestion window so the static site picks up new data within hours of the SEC publication.
- [ ] Public-AMC price job daily, with a fallback display when the feed is stale.
- [ ] Smoke test in production: walk the user journey from the directory to a manager's profile to a holding to the co-holdings view, and verify the data-as-of date is consistent across pages.
