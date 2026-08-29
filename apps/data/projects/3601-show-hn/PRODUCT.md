---
id: "3601"
slug: show-hn
title: Show HN
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49478909"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [Astro, Cloudflare Workers, Cloudflare D1, Stripe Checkout, Cloudflare Turnstile, Plausible Analytics]
---
# Show HN

## Value Proposition

A stack of floors where paying more takes you higher and someone else paying more takes your floor. The rule is the author's own sentence: "Compete and beat your competition to stay on top floor." The mechanic is copied from a category that already has, in their words, "1000s of copy cats" — what is not copied is the execution, built by someone who has "been designing for 15+ years."

The launch report is the evidence, and it is specific: floors claimed 54, total sales in 24 hrs $754, $700+ of advert and ~200k+ impressions on socials in the first 24 hours, 12,000+ visitors since launch, from 112 countries with the top 5 at US (20.9%), India (16%), France (11.3%), UK (3.5%), Germany (2.8%).

## Target Users

| Stakeholder | Why they care |
|---|---|
| Indie makers and small brands | Buy a placement directly, priced by whoever wants it more, with no ad platform in between. |
| Designers and builders arriving from social | The ~200k+ impressions sent 12,000+ visitors who mostly came to look; the board has to reward reading, not just paying. |
| Current floor holders | Return to check they still hold their floor. Displacement pressure is the product's engine, not a side effect. |
| Displaced bidders | Get told they lost the floor, which is the moment a re-bid happens. |
| The operator | Needs floors claimed, sales, visitors and country split computed rather than assembled by hand for the next launch post. |

## Jobs To Be Done

1. **Functional job** — Get my name and link seen by the traffic this board attracts, at a price I set by outbidding whoever is there.
2. **Functional job** — Know immediately when I have been pushed off my floor so I can decide whether to take it back.
3. **Emotional job** — Win a visible position. The top floor is a public scoreboard, and being on it is the reason to pay.
4. **Social job** — Have something worth posting: a claim on a well-designed board is shareable, which is what turns advert spend into ~200k+ impressions.
5. **Operator job** — Ship, measure, and post the numbers. The stated lesson is "Keep shipping. Over. And over."

## Success Metrics

- **Paid claims per day** — the launch baseline is floors claimed: 54, with total sales in 24 hrs $754. Anything measured later is measured against those exact figures.
- **Revenue against advert spend** — $754 in sales against $700+ of advert in the first 24 hours. That ratio, not raw revenue, is the number that decides whether the next push is worth buying.
- **Visitor to claim conversion** — 12,000+ visitors since launch against 54 floors claimed sets the starting conversion; improving it is a design question, which is where this product claims its edge.
- **Displacement rate** — share of floors that change hands per week. A board where nobody is ever outbid has stopped being a competition.
- **Re-bid rate after displacement** — share of displaced holders who take a floor again, the direct read on whether the notification and the mechanic work.
- **Geographic spread** — the baseline is 112 countries with the top 5 at US 20.9%, India 16%, France 11.3%, UK 3.5%, Germany 2.8%; a spike that narrows that spread is a traffic-quality warning.

## Pricing & Monetization

The price of a floor is not set by the operator: it is whatever exceeds the current holder's payment, which is the mechanic itself. The post reports the outcome rather than a rate card — total sales in 24 hrs $754 across 54 floors claimed — and states no listed price, no floor minimum and no subscription, so none is invented here. The one cost fact the post does give is on the other side of the ledger: $700+ of advert spent in the same 24 hours, which is what any pricing decision has to clear.

## Competitive Landscape

- **outbid.lol and the pay-to-rank category around it** — the origin of the mechanic. The author is explicit that they watched "1000s of copy cats" and deliberately did not copy it as is.
- **The clone field itself** — thousands of near-identical boards mean the mechanic is worth nothing on its own; the author's position is that design and shipping cadence are the differentiator.
- **Buying attention through ad platforms** — the alternative for the same buyer. A floor is bought once, is visible as a position, and is contestable in public, which an ad impression is not.

No other competitor is named in the post, so none is asserted here.

## Risks & Open Questions

- [ ] Decide what happens when displacement stalls. If the top floor settles with a holder nobody outbids, the competition ends and so does the revenue.
- [ ] Establish whether launch traffic repeats. 12,000+ visitors and ~200k+ impressions came with $700+ of advert behind them; the retained-traffic number without paid support is unknown.
- [ ] Confirm the claim path is safe under concurrent bids on the same floor before any promotion drives a spike.
- [ ] Define the moderation rule for paid links and images, since a paid ad surface attracts spam from the first hour.
- [ ] Work out whether payment-provider fees are tolerable at the ticket sizes 54 claims and $754 imply.
- [ ] Decide whether displaced holders keep a lower floor indefinitely, since an ever-growing stack dilutes the value of every position above it.
