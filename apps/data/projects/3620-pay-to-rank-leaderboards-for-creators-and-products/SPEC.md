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

## Problem

The author built two ranking boards that work by bidding: one for creators, one for products. They are direct about provenance — "The mechanic isn't mine, outbid.lol did it for products first" — and equally direct about what they added: "a creators board and per-country rankings." Both boards had just opened when they posted, so "#1 is still up for grabs," and the invitation to participate was deliberately low-friction: "join the bid with as little as possible."

Read as an engineering statement, the two additions are the entire design. A creators board alongside a products board means the system ranks two different kinds of entity, and they are not interchangeable: a product has a name, a link and a category, while a creator is a person with profiles somewhere else and a body of work. Sharing one ranking table across both would collapse them into the same shape and lose exactly the distinction the author added. So the model needs two entity types over one shared bidding mechanic, which is a different problem from running one board twice.

Per-country rankings are the harder addition, because they multiply the thing that makes a pay-to-rank board work. A global board has one #1 and therefore one prize; adding a country dimension creates a #1 per country per board, so the number of winnable positions grows with the number of countries that have any bids at all. That is the feature's appeal — a bidder in a smaller market can hold a top position they could never afford globally — and also its risk, because a country with one bid has a #1 that means nothing. The system has to decide what determines a bid's country, how a ranking with a single participant is presented, and whether a bid competes globally and locally at once or only in one of the two.

The cold-start problem is stated plainly rather than hidden: both boards just opened and #1 is available. An empty leaderboard has no competitive pressure at all, and the mechanic only generates revenue once someone has something to lose. That is why the ask is "with as little as possible" — the immediate goal is not revenue, it is getting enough occupied positions on both boards, and across enough countries, for outbidding to start meaning something. A minimum bid low enough to be casual is therefore a launch requirement, and it puts payment-fee overhead squarely in the way of the smallest transaction the product wants to accept.

## Objective

Run two bid-ranked boards — creators and products — over one bidding mechanic, with rankings computed globally and per country, designed for the cold-start state the author described: both boards open, #1 unclaimed, and a minimum bid deliberately small enough that someone can join "with as little as possible" without the payment fee swallowing the bid.

## Target Users

- Creators who want a visible top position and today have no board of their own, since the mechanic the author borrowed existed for products first.
- Product makers already familiar with the outbid mechanic, for whom this is a second surface with a country dimension the original does not have.
- Bidders in smaller markets, who are the point of per-country rankings: a top position in one country is reachable at a price a global #1 never would be.
- Early participants during cold start, invited to bid small; they are the ones who create the competitive pressure everyone after them pays for.
- Visitors browsing either board by country, who are the audience the positions are being bought in front of.

## MVP Scope

- Two boards over one bidding engine: a creators board and a products board, with separate entity shapes rather than one generic listing type.
- Creator entries carrying the fields a person needs (name, handle, links, what they make); product entries carrying the fields a product needs (name, link, one-line description).
- Bidding mechanic: a higher bid takes a rank position, the previous holder drops to the position below, and the whole ordering follows from the bid amounts alone.
- Per-country rankings: each bid resolves to a country, and every board exposes a global ranking plus one ranking per country that has bids.
- Explicit country resolution rule, chosen by the bidder rather than inferred silently, so a ranking cannot be gamed or mislabelled by a proxy.
- Minimum bid set low on purpose, matching the author's "as little as possible" invitation, with the payment path chosen so fees do not exceed the smallest accepted bid.
- Cold-start honesty: a country ranking with fewer than a stated number of bidders is labelled as open rather than presented as a contest, so an uncontested #1 is not sold as a win.
- Live position updates on both boards, since the state that matters is whether you still hold your rank right now.
- Outbid notification to the displaced holder with a direct path back to raising their bid.
- Country coverage view: which countries have bids on which board, which is also the growth map during cold start.

## Design Direction

Two boards means navigation is the first design problem, and the answer is that board choice and country choice are the only two controls on the page. Both sit at the top as plain toggles, never nested in a menu, because switching between the creators board and the products board is the most common action a visitor takes. Rankings are rendered as a numbered list with the bid amount visible, since the amount is the rule and hiding it would make the ordering look arbitrary. Because rankings update live, position changes have to be legible without being noisy: a row moves and settles, nothing flashes. Countries with sparse bidding carry a plain text label saying so, in the same type as everything else, because that honesty is more useful than an empty podium graphic. One accent colour, used only on the bid action.

## Constraints

- Minimum bid versus payment fees. A bid small enough to be casual can be smaller than the per-transaction fee, which forces either a credit balance model or a fee-aware floor before launch.
- Cold start on both boards at once. Two boards times many countries divides the initial bids into many nearly-empty rankings, and an empty ranking generates no competition.
- Country attribution must be defensible. If a bidder can pick any country freely, rankings become claims rather than measurements; if it is inferred from an IP address, a proxy defeats it.
- The mechanic is acknowledged as borrowed, so nothing here can depend on novelty. The additions — the creators board and per-country rankings — carry the product.
- Live ranking updates plus a global audience mean the read path is the load, while the bid path is rare and must be ordered correctly.
- Two entity types must not drift into one. If a creator entry and a product entry converge on the same fields, the reason for having two boards disappears.

## Out of Scope

- A third board. Creators and products are the two the author built, and adding categories before either is contested makes cold start worse.
- Verification of creator identity or product ownership in the first version; the board ranks bids, and misrepresentation is handled by takedown rather than by onboarding checks.
- Bid timers, auction endings and reserve prices. Ranking is continuous and the highest current bid holds the position.
