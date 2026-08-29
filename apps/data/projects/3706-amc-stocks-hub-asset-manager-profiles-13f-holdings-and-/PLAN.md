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

## Tech Stack

- **Front end:** Astro + TypeScript, rendered statically with route-level ISR (incremental static regeneration) on each filing window. The site is a directory — every page is the same shape, so static rendering is the right default.
- **Ingestion:** A Python or Node worker that pulls SEC EDGAR Form 13F filings each quarter, parses the XML, and writes into Postgres. Filing windows are fixed; cron on the SEC's publication schedule is enough.
- **DB:** Postgres for asset-manager profiles, holdings, and the co-holdings index. SQLite for local development; Postgres for production because the holdings table grows to hundreds of thousands of rows.
- **Public-AMC pricing:** Daily pull from a market-data source for the listed asset managers (the post does not name one; the obvious choices are a free daily close via Tiingo, Alpha Vantage, or a manual CSV).
- **Search:** Postgres full-text for manager and ticker search; no external search service needed at this scale.

The legacy AI-OS default stack (TanStack Start, Drizzle ORM, Coolify, Docker) is not used. The product is a static-rendered directory with a quarterly ingestion job — the build target is edge-rendered static + a cron worker, not a self-hosted VM.

## Architecture

```
                    ┌────────────────────────┐
                    │  assetmanagementcompany│
                    │  .net (Astro)          │
                    │  - directory           │
                    │  - profile pages       │
                    │  - co-holdings         │
                    │  - public AMC ticker   │
                    └──────────┬─────────────┘
                               │  ISR / cron
                               ▼
                    ┌────────────────────────┐
                    │  Ingestion worker      │
                    │  - SEC EDGAR pull      │
                    │  - 13F XML parse       │
                    │  - manager + holdings  │
                    │  - co-holdings index   │
                    └──────────┬─────────────┘
                               │
                               ▼
                    ┌────────────────────────┐
                    │  Postgres              │
                    │  - filers              │
                    │  - holdings            │
                    │  - co_holdings         │
                    │  - public_amc_prices   │
                    └────────────────────────┘
```

The static-rendered site is a thin view over Postgres; the ingestion worker is the heavy lift and runs quarterly on the SEC's publication calendar.

## Milestones

1. **M0 — Directory and profile pages** (already live) — 551 asset managers, each with portfolio value, country, filer status, profile page.
2. **M1 — Holdings search and "most held" tab** (already live) — search by ticker, by manager; "most held" tab on the holdings page.
3. **M2 — "Smart buys" / "Smart sells" tabs** (already live) — what was added and what was trimmed last quarter, surfaced from the diff between the current and previous 13F window.
4. **M3 — Co-holdings index** (already live, blog published 2026-08-11) — stocks held by multiple managers, with the crowding-signal explanation in the linked blog post.
5. **M4 — Public-AMC directory and pricing** (already live) — tickers across US, UK, EU, Hong Kong, Singapore, Japan, Australia, Canada; price + market cap.

## Risks

- **EDGAR parser regression.** A bug in the 13F XML parser silently propagates to every page. The MVP needs a fixture set of known filings and a regression test that asserts parsed counters match SEC-reported totals.
- **Freshness gap.** Between SEC filing windows (45 days after quarter-end, then up to 60 days before publication), the data is stale. Every page must show the data-as-of date or the trust signal erodes.
- **Public-AMC price feed.** A stale price is worse than no price. The MVP needs a freshness timestamp on every price row and a fallback ("price as of YYYY-MM-DD, may be stale") in the UI.
- **No stated business model.** No pricing, no subscription, no ads. The post leaves the path to a business open. A subscription tier for live data, an API for analysts, or affiliate links to a brokerage are all obvious shapes; the post does not commit to any.
