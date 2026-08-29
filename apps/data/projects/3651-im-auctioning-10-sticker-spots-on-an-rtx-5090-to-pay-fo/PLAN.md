---
id: "3651"
slug: im-auctioning-10-sticker-spots-on-an-rtx-5090-to-pay-fo
title: "I'm auctioning 10 sticker spots on an RTX 5090 to pay for the GPU"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49483507"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [Next.js, TypeScript, Stripe, PostgreSQL, Redis, Tailwind CSS]
---
# I'm auctioning 10 sticker spots on an RTX 5090 to pay for the GPU

## Tech Stack

- **Next.js with TypeScript** for the public page and the bid submission API, because the surface is a single small web app with a server-rendered landing and a form post.
- **PostgreSQL** for the bid store and the auction state, since the natural shapes are tabular and the auction state is the source of truth for the close.
- **Redis** as a cache for the live top-ten leaderboard, since the page is read more often than bids are placed and a live top ten is what drives late bidding.
- **Stripe** for the payment step, because the auction is a one-off and a hosted processor with refunds and retries is the right surface for winning bidders.
- **Tailwind CSS** for the front-end, since the page is a one-page site with a clear visual hierarchy and Tailwind keeps the styling predictable.
- **No deploy target beyond the page itself** — the site is a single domain and a single small backend.

## Architecture

The bid submission lands at a single API endpoint that records the bid, the bidder's email and the sticker design, and returns a confirmation. The auction state is read on every page render from PostgreSQL, and the leaderboard is computed against the current state.

A cron-style scheduled task enforces the close at the stated end time. The task locks the top ten bids, marks them as winners, and rejects the rest. Stripe is invoked for each winning bidder with a pre-authorisation that is captured on confirmation. Non-winning bidders are not charged.

The funding coverage is the live sum of the current top ten bids divided by the retail price of the GPU. The number is shown on the page so a visitor can tell at a glance whether the auction is on track. The page is otherwise a small, dense landing with a clear visual hierarchy: the GPU's photo, the auction rules, the bid form and the live leaderboard.

## Milestones

1. **M1 — Landing page** — the public page that explains the auction, the GPU and what the ten winners get.
2. **M2 — Bid submission** — a form that records the bid amount, an email and a sticker design.
3. **M3 — Live leaderboard** — the visible top ten and the running funding coverage.
4. **M4 — Close** — a scheduled task that locks the top ten at the stated end time and rejects the rest.
5. **M5 — Charging** — Stripe charges for the ten winners with retries on transient failures.
6. **M6 — Post-auction page** — the permanent page that lists the ten winners, the GPU's serial and a placeholder photo.

## Risks

- **Funding shortfall** — if the top ten bids do not cover the retail price of the GPU, the auction's whole premise collapses; the page must show the funding gap clearly.
- **Pre-authorisation failures** — a winning bidder whose card fails at charge time leaves a spot unfilled unless there is a ranked fallback.
- **Race at the close** — two near-simultaneous bids both claiming the same spot is a real failure mode that must be handled deterministically.
- **Refund liability** — any pre-authorisation on non-winning bidders must be refunded promptly to avoid a chargeback dispute.
- **Auction-mechanism choice** — the choice of ascending, sealed-bid or Dutch changes bidder behaviour and the final price; it must be decided before the page goes live.
- **Placement layout** — the design of the placement on the GPU affects what each winner is actually buying and should be settled before the auction closes.
