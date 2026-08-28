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

## Tech Stack

- Python for the daily scraper and scorer; the vocabulary is a small set of regex rules and Python's `re` module is the right tool.
- SQLite as the only datastore — the corpus is one row per HN story, fits comfortably, and the only reads are aggregations.
- The official HN Algolia search API for ingestion; it returns titles, timestamps, and category metadata that the scorer needs.
- Hugo for the static site, because every page is rendered from the SQLite snapshot and Cloudflare Pages hosts it cheaply with no server to operate.
- A small CSV export job so the chart's underlying data is downloadable.

## Architecture

- A nightly cron fetches every HN story for the prior day from the Algolia API, applies the standard and extended vocabulary scorers, and writes both per-story labels and per-day aggregate percentages to SQLite.
- A render script reads the SQLite, materialises today's number, the rolling-30-days sparkline, and the all-time monthly chart as JSON, and feeds Hugo.
- The Hugo site renders those JSON payloads as static pages and a single SVG line chart.
- A CSV endpoint serves the monthly series as a `text/csv` download.
- A simple "last successful run" indicator on the page so a missed day is visible.

## Milestones

1. Scraper that pulls HN titles for one day and writes them to SQLite with a vocabulary label.
2. Aggregator that produces daily and monthly percentages for both vocabularies.
3. Static Hugo page that shows today's number on both filters.
4. All-time monthly chart from the SQLite history.
5. CSV download of the monthly series, plus a "last run" indicator.
6. Category breakdown page (Show HN, Ask HN, top stories) with the same scoring applied.

## Risks

- The Algolia API has changed shape before; a future field rename or rate-limit change could break the scraper silently.
- The vocabulary is the methodology, and editing it later rewrites history; the codebase needs a versioned vocabulary file with a documented diff policy.
- HN's category taxonomy has not been stable across the corpus's full history; the long-window chart may have apples-to-oranges cells that the page has to flag.
- A single missed day breaks the chart's continuity; an alarm on a missed-day detector is necessary.
