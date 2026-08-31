---
id: "3871"
slug: outfund-a-leaderboard-where-indie-projects-can-raise-fu
title: OutFund – a leaderboard where indie projects can raise funds
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49499709"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [Public leaderboard, Funding campaign pages, Payment provider integration, Ranking algorithm, Owner verification, Public funding ledger]
---
# OutFund – a leaderboard where indie projects can raise funds

## Tech Stack

Chosen for a public, money-moving product; the capture names no tooling.

- **Project listing:** pitch pages with funding state.
- **Leaderboard ranking service:** a stated, published algorithm.
- **Payment provider integration:** contributions with receipts.
- **Owner verification:** identity checks for project owners.
- **Public funding ledger:** per-project totals visible on the leaderboard.

## Architecture

- **Projects:** pitch, funding goal or state, verified owner.
- **Ranking:** a published formula (funds raised, backers, or both) drives the order.
- **Payments:** provider-mediated contributions with receipts.
- **Public ledger:** per-project funding shown next to the pitch.

## Milestones

1. **M0 — Listing.** Project CRUD plus a static leaderboard page.
2. **M1 — Money flow.** Contribution flow with a payment provider, sandbox first.
3. **M2 — Rules.** The ranking algorithm is documented and displayed; abuse rules are added.
4. **M3 — Public launch.** Compliance review completes before real-money flows go live.

## Risks

- **Regulatory exposure** once real money moves across jurisdictions.
- **Gaming:** fake projects or coordinated voting skew the leaderboard.
- **Cold start:** the leaderboard is empty without projects, and projects come without an audience.
