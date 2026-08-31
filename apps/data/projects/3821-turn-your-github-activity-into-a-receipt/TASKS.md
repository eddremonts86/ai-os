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

## Phase 0: Scaffold

- [x] Read the Show HN post and load receipthub.io/github to confirm the itemized-receipt pitch and sibling adapters
- [x] Write SPEC.md (this document)
- [x] Scaffold the web service with the receipt template skeleton
- [x] Register a GitHub OAuth app with read-only activity scopes

## Phase 1: Core

- [ ] Implement GitHub OAuth connect
- [ ] Fetch and normalize activity via the GitHub REST API
- [ ] Define the itemization rules (lines, quantities, totals) and render the receipt
- [ ] Generate shareable image or link output

## Phase 2: Deploy

- [ ] Ship the GitHub page and cross-link the Chess.com, Lichess.org and Last.fm adapters
- [ ] Add caching so rate limits do not block renders
- [ ] Measure receipts generated and share rate, and iterate on the format
