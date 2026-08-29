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

## Tech Stack

- **Elixir** because the ranking state is shared and live: every viewer of a board needs to see a position change as it happens, and the process model handles many long-lived connections against one authoritative state without a separate push service.
- **Phoenix LiveView** for the boards themselves. Rankings that update while being watched are the product's texture, and LiveView delivers that from the server without a client-side store to keep in sync with two entity types and many country slices.
- **PostgreSQL** for entities, bids and rankings. Per-country ranking is a window function over bids partitioned by board and country, which is a query rather than a subsystem — provided the ordering is computed in the database and not in application memory.
- **Oban** for the jobs the mechanic needs off the request path: outbid notifications, country-coverage recomputation, and payment reconciliation, each retried durably.
- **MaxMind GeoLite2** to propose a bidder's country as a default, which is then confirmed by the bidder, so attribution has a starting point without being silently IP-derived.
- **Fly.io** to run the app close to a geographically spread audience, which matters more here than usual because the country dimension means visitors arrive expecting their own ranking to feel local.

## Architecture

Two boards share one bidding engine but not one entity table. A `creator` and a `product` are separate records with their own fields, and both are referenced by a polymorphic `entry` that carries board type, country and current bid. Keeping the entities distinct is the structural expression of the author's stated addition: if a creator and a product were rows of the same generic listing table, the creators board would be a filter rather than a board, and the distinction they added would exist only in the page title.

Ranking is derived, never stored as a position. A bid is an append-only row; the ranking for a board is an ordering of current bids, and the ranking for a country is the same ordering partitioned by the country attached to each entry. That means a global rank and a national rank are two reads of one truth, so they cannot disagree, and a bid that changes hands does not require rewriting every position below it. LiveView subscribes each connected viewer to the board and country slice they are looking at; when a bid settles, the engine recomputes the affected slices and pushes only those.

The bid path is the careful part. A bid is recorded as pending, payment is taken, and only on settlement does a serialised transaction confirm the amount still exceeds the current holder and promote the entry. Because the minimum bid is deliberately small, the payment design has a fork in it: individual collection makes fees a large share of a tiny bid, while a prepaid balance lets a bidder top up once and bid "with as little as possible" many times. The balance path is modelled from the start — a bid debits a balance, a top-up credits it — because retrofitting it later would mean re-deriving every historical bid. Outbid notifications are enqueued in the same transaction that demotes an entry, and they name the board and the country ranking that changed, since an entry can hold a national top position while sitting mid-table globally.

## Data Model

- `creator` — name, handle, links, what they make.
- `product` — name, link, one-line description.
- `entry` — board type, creator or product reference, declared country, state.
- `bid` — entry, amount, currency, source (balance or direct payment), placed timestamp, settled timestamp.
- `balance` — bidder, credited total, debited total, so a small bid does not require a small payment.
- `country_slice` — board, country, entry count, contested flag, used for the coverage view and for the sparse-ranking label.
- `outbid_event` — entry, board, country, displacing bid, notified timestamp.

## Integrations

- **Payments** — top-ups and direct bids, with the fee structure treated as an input to the minimum-bid decision rather than a detail.
- **GeoLite2** — proposes the country default that the bidder then confirms.
- **Transactional email** — outbid notices naming the board and the country ranking affected.
- **Share cards** — per-ranking Open Graph images so a national #1 is postable, which is the cheapest cold-start lever available.

## Milestones

1. **M0 — Two boards, two entity shapes, one engine.** Creator and product entries with distinct fields, ranked by current bid. Exit criterion: both boards render their own field set from the same bidding engine, and no code path treats a creator as a product.
2. **M1 — Per-country ranking derived, not stored.** Global and national rankings from one ordering. Exit criterion: an entry's global and national positions are both computed from the same bid rows, and a bid change updates both without a stored-position rewrite.
3. **M2 — Small bids without fee bleed.** Prepaid balance plus direct payment, with the minimum bid set against real fees. Exit criterion: a bidder tops up once and places several bids at the minimum, and the fee share of the smallest accepted bid is recorded and acceptable.
4. **M3 — Outbid loop and live updates.** Serialised promotion on settlement, demotion, notification, and pushed updates to watchers. Exit criterion: two bidders contesting one position produce one holder, one outbid notice naming board and country, and every open board view reflects the change without a reload.
5. **M4 — Cold-start honesty and coverage.** Sparse-country labelling and the coverage view. Exit criterion: a country with a single bidder is labelled open rather than shown as a contest, and the coverage view lists which countries are contested per board.

## Risks

- **Cold start divided too many ways.** Two boards times every country splits the first bids into rankings with one participant each. The most likely failure is not losing to a competitor, it is a board full of uncontested positions that generate no outbidding.
- **Country attribution is contestable.** Free choice turns a national ranking into a claim; IP inference is defeated by a proxy. The GeoLite2-proposes, bidder-confirms compromise is a decision that has to be defended publicly, not buried.
- **Fees versus the invitation.** Inviting bids of "as little as possible" while collecting each one individually can mean the processor takes a large share of the bid. Without a balance model the invitation and the economics contradict each other.
- **The two boards can collapse into one.** If creator and product entries drift toward the same fields, the author's stated addition disappears and what remains is the borrowed mechanic.
- **Live ranking cost.** Pushing updates to every watcher of every country slice is cheap at launch volume and not obviously cheap later; slice-scoped subscriptions have to be right before traffic arrives.
- **No novelty to fall back on.** The author says the mechanic is not theirs. If the creators board and per-country rankings do not attract their own bidders, there is nothing else differentiating the product.
- **Unverified entries.** Ranking a person who did not enter themselves is a reputational problem the first version answers only with takedowns.
