---
id: "3122"
slug: pairbook-correlation-and-holdings-overlap-for-4700-us-s
title: "PairBook – correlation and holdings overlap for +4,700 US stocks/ETFs"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49450429"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
---
# PairBook – correlation and holdings overlap for +4,700 US stocks/ETFs

## Tech Stack

Not stated by the source. A pair-lookup financial tool typically uses a price-time-series store (Postgres + TimescaleDB, or a columnar store) and periodic jobs to compute rolling correlations. Specifics are TODO.

## Architecture

A web UI that takes two tickers, queries a price-correlation store and a holdings store, and returns the pair's correlation and overlap. No account or portfolio sync is implied by the title.

## Milestones

- [ ] Pair lookup returns a correlation for any two of the 4,700+ named instruments.
- [ ] Holdings-overlap table renders for any two ETFs.
- [ ] Anything beyond pair lookup (portfolio sync, alerts, screening) is not implied by the source.

## Risks

Market-data licensing terms and stale holdings data are the main operational risks.
