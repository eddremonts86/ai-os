---
id: "3821"
slug: turn-your-github-activity-into-a-receipt
title: Turn your GitHub activity into a receipt
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49494693"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [GitHub REST API integration, receipt-style rendering, web service, OAuth authorization, shareable artifact generation, multi-platform stat adapters]
---
# Turn your GitHub activity into a receipt

## Tech Stack

Inferred from the capture's single page and the adapter pattern it reveals.

- **GitHub REST API:** activity ingestion (events, contributions or commit data).
- **OAuth authorization:** account connection for reading a user's GitHub data.
- **Receipt rendering engine:** the store-receipt template (lines, quantities, totals) shared across adapters.
- **Web service:** the hosted pages (receipthub.io/github and siblings).
- **Shareable artifact generation:** image or link output for social sharing.
- **Platform adapters:** the Chess.com, Lichess.org and Last.fm variants referenced on the page.

## Architecture

- **Adapter layer:** per-platform fetchers (GitHub first) normalizing activity into line items.
- **Receipt template:** one rendering pipeline producing the itemized receipt for every platform.
- **Auth module:** OAuth flows scoped to read-only activity.
- **Sharing surface:** generated receipts as images or URLs, with the cross-links between adapters.

## Milestones

1. **M0 — GitHub connect.** OAuth plus activity fetch from the GitHub REST API works end to end.
2. **M1 — Itemization.** Activity maps to receipt lines, quantities and totals with a defined metric set.
3. **M2 — Rendering and sharing.** The receipt renders as a shareable image or link.
4. **M3 — Adapter family.** The GitHub path ships alongside working Chess.com, Lichess.org and Last.fm pages.

## Risks

- **API ceilings:** GitHub rate limits and token scopes constrain depth; caching must hide it without serving stale numbers.
- **Metric ambiguity:** choosing what counts as a line item decides whether receipts look right or wrong.
- **Novelty decay:** the format joke wears thin; the adapter family is the retention bet.
- **Thin capture:** everything beyond the title and the cross-links is plan inference.
