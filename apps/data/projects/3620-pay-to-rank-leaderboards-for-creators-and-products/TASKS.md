---
id: "3620"
slug: pay-to-rank-leaderboards-for-creators-and-products
title: Pay-to-rank leaderboards for creators and products
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49477031"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [Elixir, Phoenix LiveView, PostgreSQL, Oban, MaxMind GeoLite2, Fly.io]
---
# Pay-to-rank leaderboards for creators and products

## Phase 0: Scaffold

- [x] Capture the post and separate the borrowed mechanic from the author's two stated additions
- [ ] Decide the country attribution rule and write it down as a public rule, not an implementation detail
- [ ] Model creator and product as separate entities from the first migration, referenced by a shared entry
- [ ] PostgreSQL schema: creator, product, entry, bid, balance, country_slice, outbid_event
- [ ] Ranking as a window function over current bids, partitioned by board and by country
- [ ] Decide the minimum bid against real payment fees, and whether a prepaid balance is required to honour it
- [ ] Oban queues for outbid notices, coverage recomputation and payment reconciliation
- [ ] GeoLite2 lookup wired as a country proposal that the bidder confirms
- [ ] Define the sparse-ranking threshold: how few bidders makes a country ranking "open" rather than contested

## Phase 1: Core

- [ ] Creators board with creator-specific fields: name, handle, links, what they make
- [ ] Products board with product-specific fields: name, link, one-line description
- [ ] Bidding engine: pending bid, payment, serialised promotion on settlement, demotion of the previous holder
- [ ] Prepaid balance: top-up credits, bid debits, so a minimum-size bid does not carry a full transaction fee
- [ ] Global ranking view per board, bid amounts visible so the ordering rule is self-evident
- [ ] Per-country ranking views derived from the same ordering, with the country selector beside the board selector
- [ ] Sparse-country labelling: a ranking below the threshold is shown as open, never as a won contest
- [ ] LiveView subscriptions scoped to the board and country slice being watched, not to the whole board
- [ ] Position-change rendering: rows move and settle without flashing
- [ ] Outbid notices enqueued inside the demoting transaction, naming the board and the country ranking affected
- [ ] Re-bid path straight from the outbid notice, since that is the moment the mechanic earns
- [ ] Country coverage view: which countries are contested on which board, doubling as the cold-start growth map
- [ ] Per-ranking share cards so a national top position is postable
- [ ] Takedown path for a misrepresenting entry that preserves the bid and payment record

## Phase 2: Deploy

- [ ] Deploy to Fly.io with regions chosen against where the first country slices actually have bids
- [ ] Verify global and national positions for the same entry always derive from one ordering, with a test asserting they cannot disagree
- [ ] Contested-bid test: two bidders on one position produce one holder, one demotion and one notice
- [ ] Measure the fee share of the minimum bid in production and adjust the floor or force the balance path
- [ ] Seed cold start deliberately: open with a small number of countries contested rather than every country empty
- [ ] Weekly review: occupied positions per board, contested countries, outbid rate, re-bid rate, creators-versus-products balance
