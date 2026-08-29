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

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

gpu-rtx.lol is a single-page auction site for ten sticker spots on one RTX 5090. Ten sponsors bid against each other in a one-off auction, the top ten bids at the close win a printed placement on the chassis, and the winning bids together fund the GPU itself. The price the author pays for the GPU is the sum the ten bidders agreed to pay; the price the bidders pay is the bid they placed, not a sticker price set by the author.

The auction is a single event with a stated end time, not a continuing storefront. Once the auction closes the site is a record of the ten winners and the GPU they funded, not a place to bid on another piece of hardware.

**One-liner:** gpu-rtx.lol auctions ten sticker spots on one RTX 5090 so the winning bids fund the GPU itself; ten spots, one GPU, one auction.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Founders and developers | They want a printed placement on hardware that will be photographed and shared. |
| Creators and project authors | They want a low-cost way to fund a piece of equipment they would not otherwise buy. |
| Community members | They want a durable token of support for an author they follow. |
| Collectors of placement artefacts | They want a record of being there when the auction happened. |
| People who find the idea funny | They want to participate in a one-off, not buy a continuing product. |

## Jobs To Be Done

1. **Functional job** — Place a bid on one of the ten spots and see whether it is in the current top ten.
2. **Functional job** — See how much of the GPU's retail price the current bids cover, so a visitor can tell whether the auction is on track.
3. **Functional job** — Be charged only if the bid wins, since bidders outside the top ten should not be charged.
4. **Functional job** — After the auction, find the GPU's serial and the list of winners on a permanent page.
5. **Emotional job** — Feel that the bid was a real vote and not just a payment.
6. **Social job** — Show that one piece of hardware can be funded by ten supporters and not a single buyer.

## Success Metrics

- **Funding coverage** — sum of winning bids divided by the retail price of the GPU; the product exists to make this at least 100%.
- **Bidder count** — number of distinct bidders, since ten winners out of one bidder is not really an auction.
- **Top-ten churn** — how often the visible top ten changes during the auction, since a static top ten signals no late bidding.
- **Charge success rate** — share of winning bidders successfully charged, since a winning bid that fails to charge is a real failure.
- **Close latency** — time from the stated end time to the top ten being locked, since a slow close creates a contested window.
- **Refund latency** — time from the close to a non-winning bidder being refunded if any pre-authorisation was taken.

## Pricing & Monetization

The auction price is whatever the winning bidders bid, summed. The architecture fixes a specific cost shape regardless: payment processing takes a percentage per winning charge, and the auction is a one-off event so there is no recurring revenue from this site. Any future monetisation would therefore be either a follow-up auction on another GPU or a placement-on-hardware service for other authors, not a subscription to this page.

## Competitive Landscape

- **Generic sponsorship pages** — accept flat sponsorship amounts rather than running a real auction, and therefore do not discover the price the bidder is actually willing to pay.
- **Indiegogo and Kickstarter for hardware** — fund hardware at a much larger scale and over a longer window, but the prize is the product itself, not a printed placement on it.
- **Sticker sales** — sell stickers outright rather than auction a placement, and therefore do not produce a visible "ten sponsors on one GPU" artefact.
- **Auction platforms for other categories** — the post names none specifically, and no competitor is named in the capture, so no further comparison is claimed here.

## Risks & Open Questions

- [ ] Confirm the auction mechanism (sealed bid, ascending, Dutch) before the page goes live, because the choice changes the bidding behaviour.
- [ ] Establish the refund policy for non-winning bidders if any pre-authorisation is taken.
- [ ] Decide the placement layout on the GPU before the auction closes, so winners know what they have bought.
- [ ] Establish what happens if bids do not cover the retail price, since the funding model collapses in that case.
- [ ] Confirm the payment processor's handling of partial failures, so a winning bid that fails to charge does not leave the spot unfilled.
- [ ] Verify the close mechanism under contention, so two near-simultaneous bids cannot both claim the same spot.
