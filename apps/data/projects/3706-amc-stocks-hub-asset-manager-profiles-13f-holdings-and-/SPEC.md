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

## Problem

Every US asset manager with over $100M in equities has to file Form 13F with the SEC each quarter — disclosing every long position. The raw filings exist; the surface that turns them into something a curious investor can read does not, and the question the landing page asks out loud is the right one: "What does an asset management company do?" and the answer that follows is the product's framing — "An asset management company invests money on behalf of clients — individuals, pensions, endowments and institutions — in exchange for fees."

The site tracks 551 asset managers, 105,472 holding records, 5,271 stocks; data is dated 2026-06-30 and is "updated quarterly" from the EDGAR filings. The three sections the operator wants visitors to use are explicit:

- Every asset management company we track — 13F portfolio value, country, 13F filer status, and a profile page for each one.
- The stocks the most asset management companies own, plus who bought and who sold them last quarter.
- The asset management companies that are publicly listed themselves — US names like BLK and KKR, plus UK, Europe, Hong Kong, Singapore, Japan, Australia, and Canada — with price and market cap.

The "co-holdings" angle is the category the site has staked out — when many asset managers hold the same stock, what does that crowding signal, and how do you read the rankings. The blog published "AMC Co-Holdings: Which Stocks Are Held by Multiple Managers?" on 2026-08-11 and "AMC Stocks Hub Research" on 2026-08-13, both on this exact question.

## Objective

Turn the SEC's quarterly 13F filings into readable asset-manager profiles, searchable holdings, and a co-holdings map, so a curious investor can answer "what is everyone buying?" without parsing raw EDGAR XML.

## Target Users

1. **Retail investors tracking the smart money** — anyone who wants to see what asset managers hold, what they bought last quarter, and what they sold, without paying for a Bloomberg or Capital IQ terminal.
2. **Independent analysts and journalists** — anyone writing about asset-manager flows who needs a starting point: which manager owns what, who else owns the same stocks, and how those positions changed quarter over quarter.
3. **Public-market asset managers themselves** — firms listed in the AMC directory (BLK, KKR and equivalents across the UK, EU, Hong Kong, Singapore, Japan, Australia, Canada) the site profiles with price and market cap.

## MVP Scope

- Directory of every 13F filer with portfolio value, country, filer status, and a profile page.
- Search across all 13F holdings by ticker and by manager.
- "Most held" tab — the stocks that the most asset management companies own.
- "Smart buys" and "Smart sells" tabs — what was added and what was trimmed last quarter.
- Co-holdings view: stocks held by multiple managers, with a crowding signal.
- Public-AMC directory: tickers, price, market cap for listed asset managers (US, UK, EU, Hong Kong, Singapore, Japan, Australia, Canada).
- Quarterly update cadence aligned to SEC filing windows.
- Out of scope for MVP: live price feeds, options/short-interest, private-fund holdings, the rest of the 13F schedule beyond long positions.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The data is public (SEC EDGAR Form 13F) and the cadence is fixed (quarterly). The product's edge is the surface, not the data.
- The site must be honest about the data-as-of date (currently "2026-06-30") on every page; the freshness signal is the trust signal.
- Listed-asset-manager pricing is only as fresh as the upstream source; the site does not claim a live price feed.
- The site is currently a single Astro-rendered front end; the filing ingestion pipeline is the heavy work behind the simple page.
