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

## Value Proposition

A single live number for how much of Hacker News is about AI, with the methodology spelled out so the number can be argued with rather than just consumed.

## Target Users

- HN readers who want a daily data point on topic drift instead of a vibes-based claim.
- Journalists and analysts writing about HN or the AI industry who want a citable, downloadable trend.
- Researchers doing longitudinal work on platform discourse and topic share.

## Jobs To Be Done

- When I read a claim about HN being "all AI now", I want to check the percentage and the methodology so I can decide whether to repeat the claim.
- When I write about the AI discourse, I want an embeddable chart with a known good data source so my readers can verify the figure.
- When I track topic share over years, I want a CSV of monthly percentages since 2016 so I can run my own analysis.

## Success Metrics

- Daily run of the scraper completes with a successful count for every day in the rolling 30-day window.
- Time-to-publish from end-of-day HN to published figure stays under one hour.
- Number of distinct days in the chart with a value (target: no gaps after the scraper is in steady state).
- Repeat visits to the page per week as a coarse engagement signal.

## Competitive Landscape

_Source does not name any competing product._ The poster cites lcamtuf's earlier HN survey as related reading, not a competing product.

## Risks & Open Questions

- HN Algolia API rate limits or schema changes could break the daily job; the scraper needs a fallback path or at least an alarm.
- The "standard" vs "extended" vocabulary boundary is the most-debated part of the methodology; any expansion must be versioned, not silently merged.
- Show HN's 19.8% number depends on HN's category classification, which has shifted over the years — the series may not be apples-to-apples across a long window.
- Whether comment bodies (not just titles) should ever enter the count; the post scopes to titles only and that scope should hold.
