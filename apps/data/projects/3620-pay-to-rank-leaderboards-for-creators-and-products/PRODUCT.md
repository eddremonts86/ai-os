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

## Value Proposition

Two bid-ranked boards, one for creators and one for products, where the highest bid holds the top position and rankings exist per country as well as globally. The author states the mechanic's origin plainly — outbid.lol did it for products first — and states their own contribution just as plainly: a creators board and per-country rankings. Both boards just opened, so #1 is still up for grabs, and the invitation is to "join the bid with as little as possible."

The per-country dimension is what makes a small bid worth placing: a top position in one country is reachable at a price the global #1 is not.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Creators | Get a ranked board of their own; the borrowed mechanic previously existed for products only. |
| Product makers | A second surface for the mechanic they already know, with a country dimension the original does not have. |
| Bidders outside the largest markets | Per-country rankings are the reason to bid at all; a national top position is affordable where a global one is not. |
| Cold-start participants | Invited to bid small while both boards are open, which is the only moment #1 is cheap. |
| Displaced holders | Need to know they lost the position, on which board and in which country, since a bid can be top locally and mid-table globally. |
| Visitors browsing by country | The audience the positions are bought in front of, and the reason a country ranking has value. |

## Jobs To Be Done

1. **Functional job** — Buy a visible ranked position on the board that matches what I am, a creator or a product.
2. **Functional job** — Win somewhere reachable: pick a country where my bid can hold a top position rather than compete globally.
3. **Functional job** — Know immediately when I have been outbid, and on which ranking.
4. **Emotional job** — Take #1 while it is still cheap, which is exactly what an opening board offers and a mature one does not.
5. **Social job** — Point at a ranking that names me first in a place that means something to my audience.

## Success Metrics

- **Occupied positions per board** — the cold-start metric. With both boards just opened, the first target is enough filled positions on each for outbidding to begin, tracked separately for creators and products.
- **Countries with a contested ranking** — countries where more than one bidder is present, which is the only state where per-country ranking creates competition rather than a label.
- **Outbid rate** — share of held positions displaced per week, per board. A board where nobody is displaced has stopped working regardless of how many entries it has.
- **Re-bid rate after being outbid** — the direct read on whether the notification plus the country dimension bring a displaced bidder back.
- **Median bid size** — starts deliberately low given the "as little as possible" invitation; whether it rises is the read on whether competition is real.
- **Fee ratio at the minimum bid** — payment fees as a share of the smallest accepted bid, because a casual minimum is only viable if that ratio stays sane.
- **Board balance** — activity on the creators board relative to the products board, since the creators board is the author's stated addition and its failure would leave a clone.

## Pricing & Monetization

Revenue is the bids themselves: a position costs whatever it takes to exceed the current holder, so the board sets no price. The only pricing statement in the post is the floor, and it is an invitation rather than a figure — "join the bid with as little as possible" — so no amount, tier or fee is asserted here. What that invitation does force is a decision the post does not make: whether small bids are collected individually, which payment fees punish, or against a prepaid balance, which absorbs them.

## Competitive Landscape

- **outbid.lol** — named by the author as the origin of the mechanic for products. This board's differences are stated, not implied: a creators board and per-country rankings.
- **Other implementations of the same mechanic** — the author acknowledges the mechanic is not theirs, so the field is assumed crowded; the additions are the position, not the idea.
- **Creator directories and product listing sites generally** — the same audience reached by editorial or chronological ordering rather than by bid. The post names none of them, so none is compared here.

## Risks & Open Questions

- [ ] Solve cold start on two boards at once. Splitting early bids across creators, products and many countries can leave every ranking uncontested, which is the one state where the mechanic earns nothing.
- [ ] Decide how a bid's country is determined, and defend it. A freely chosen country makes rankings claims; an IP-derived one is beaten by a proxy.
- [ ] Set the minimum bid against real payment fees, and decide whether a prepaid balance is required to make "as little as possible" workable.
- [ ] Decide how a country ranking with a single bidder is presented, so an uncontested #1 is not sold as a victory.
- [ ] Confirm the creators board attracts its own bidders rather than the same product makers, since its absence would reduce this to the mechanic it borrowed.
- [ ] Determine whether one bid competes globally and locally simultaneously, or whether the two rankings take separate bids.
- [ ] Define the takedown path for a creator entry that misrepresents a person, given no identity verification at entry.
