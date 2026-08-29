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

## Problem

The capture is only the project URL and the title. The title is "I'm auctioning 10 sticker spots on an RTX 5090 to pay for the GPU", and the URL is gpu-rtx.lol. The title names three things: 10 sticker spots, one RTX 5090, and the funding model — auction the spots so the GPU pays for itself. The capture has no prose body.

The mechanic is fully described by the title and is unusual enough to be worth being explicit about. One physical GPU is being acquired by the author. Ten sponsors each buy a sticker spot on the chassis of that GPU, paying for the hardware through an auction. After the auction the author owns the GPU and the ten sponsors own a printed placement on it. The interesting bit is that the price the GPU ends up costing the author is the sum of the winning bids, not a sticker price, and the sum is set by what the ten sponsors are willing to pay rather than by what the retailer charges.

What is not stated is the auction mechanism (sealed bid, ascending, descending, Dutch), the auction duration, the payment processor, the rules if fewer than ten bids are placed, the rules if more than ten are, the placement layout on the GPU, and what happens to the GPU if the auction does not cover the retail price. Those are honest gaps, and the plan scopes what is knowable from the title and from general engineering knowledge of an auction site, not from anything the author said.

## Objective

Ship a single-page auction site, named gpu-rtx.lol, that lets ten sponsors bid on ten sticker spots on one RTX 5090, with the winning bids funding the GPU and each winning bidder getting a printed placement on the chassis. The auction runs once, the spots are ten, and the funding target is the retail price of the GPU.

## Target Users

- Founders, developers and small-team leaders who want a printed placement on a piece of hardware that will be photographed and shared.
- Creators and project authors who want a low-cost way to fund a piece of equipment they would not otherwise buy.
- Community members who want to support an author they follow and get a small, durable token of that support.
- Collectors of placement-on-hardware artefacts who want a record of being there.
- People who find the auction concept itself funny and want to participate in a one-off.

## MVP Scope

- A public page that explains the auction, the GPU and what the ten winning bidders get.
- A registration flow that lets a bidder submit a bid amount, an email and a sticker design.
- An auction state machine with a single open state, a stated end time and a single closed state.
- A live leaderboard of the current top ten bids, since ten spots means ten winners and the visible top ten is what drives late bidding.
- A close mechanism that, at the stated end time, locks the top ten bids as winners and rejects the rest.
- A payment step that charges the ten winning bidders through a stated processor, with retries and refunds.
- A status line that shows how much of the GPU's retail price the current bids cover, so a visitor can see the funding gap.
- A post-auction page that lists the ten winners, the GPU's serial and a placeholder photo of the placement once it is done.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The number of sticker spots is ten, set by the title, and must not be silently raised or lowered.
- The funding target is the retail price of one RTX 5090, and that target is the only honest reason the auction exists.
- The auction is one physical GPU, not a line of GPUs; once the auction closes, the site is not a continuing storefront.
- The mechanism is an auction, not a fixed-price sale; the price the ten bidders pay is the price they bid, not a sticker price set by the author.
- The capture has no statement of auction mechanism, payment processor, placement rules or refund policy, so anything beyond the title's mechanic is not claimed here.
