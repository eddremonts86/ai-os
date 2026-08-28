---
id: "3139"
slug: free-economic-nexus-checker-for-online-sellers-all-50-s
title: Free economic nexus checker for online sellers (all 50 states)
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49448883"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
---
# Free economic nexus checker for online sellers (all 50 states)

## Tech Stack

Static site with client-side calculation: the state threshold rules are a small versioned JSON table, the arithmetic is trivial, and nothing needs a server or a database. Keeping the sales figures in the browser also means the tool never holds a seller's revenue data.

## Architecture

A per-state rules table (threshold amount, transaction count, effective date) shipped as data; a form that takes sales and transaction counts per state; a comparator that renders yes/no/near per state. The rules table is the only thing that changes, so it is versioned separately from the app and stamped with a last-updated date shown in the UI.

## Milestones

1. Compile and cite the 50-state threshold table with effective dates
2. Calculator page returning per-state yes/no/near
3. Visible last-updated stamp and a rules changelog page
4. Ship free at nexussnapshot.com

## Risks

- Thresholds change by legislature; a stale table produces confidently wrong answers
- Presenting a yes/no invites reliance the tool cannot support without a compliance disclaimer
- Marketplace-facilitator rules complicate the simple threshold comparison for some sellers
