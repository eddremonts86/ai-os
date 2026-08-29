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

## Problem

The author watched what they describe as "1000s of copy cats of outbid app" appear and decided to build their own version rather than clone the mechanic as it stood. Their framing of it is one line: "Compete and beat your competition to stay on top floor." The unit of the product is a floor, and the whole thing is a vertical stack where paying more moves you up and someone else paying more pushes you back down. So the product problem is not "how do I build a leaderboard" — it is how to make a pay-to-rank board that stands out in a field already saturated with near-identical clones, and the author's answer is execution: they have "been designing for 15+ years" and treat this as the point where the "10,000+ hours I've done in product and design" pay off.

The post is mostly a launch report, and the numbers are the substance. In the first 24 hours of launch it "pulled in $700+ of advert and ~200k+ impressions on socials." Floors claimed: 54. Total sales in 24 hrs: $754. Visitors since launch, and counting: 12,000+. Visitors from 112 countries, with the top 5 being US (20.9%), India (16%), France (11.3%), UK (3.5%), Germany (2.8%), and the rest of the world.

Those figures define the engineering problem more precisely than the concept does. A board that takes 54 paid claims and $754 in 24 hours while absorbing roughly 200k impressions worth of referral traffic from social platforms is a low-write, very-high-read system with a spiky arrival pattern: almost every visitor only reads the stack, and a small fraction pays. Traffic spread across 112 countries with no single country above 20.9% means there is no home region to optimise for, so latency has to be even everywhere rather than good in one place. And because the claim on a floor is money changing hands, the write path — take payment, then move a floor — has to be correct under concurrency even while the read path is being hammered by a viral spike.

The last thing the author states is the operating lesson rather than a feature: "Keep shipping. Over. And over." Read alongside "What a time to be a designer who can build and sell on the internet," the position taken is that in a category where the mechanic is public and copyable, the defensible part is the design and the speed of shipping it, not the idea.

## Objective

Ship a pay-to-rank floor board where the visible differentiator is design and execution rather than the mechanic: a vertical stack of floors, each held by whoever paid most for it, where a higher payment takes the floor and displaces the previous holder downward. It must stay fast and correct for a traffic profile like the reported one — 12,000+ visitors from 112 countries with no dominant region, converting into paid floor claims at the rate 54 claims and $754 in 24 hrs implies — and it must be cheap enough to run that a launch spike does not cost more than it takes.

## Target Users

- Indie makers and small brands buying attention directly, who treat a floor claim the way the author treats their own $700+ advert spend: a measurable, self-serve placement.
- Designers and builders who came from the social posts that generated ~200k+ impressions, arrived to look at the stack, and mostly never pay — the majority of the 12,000+ visitors, and the audience the read path is built for.
- Competitive bidders who return to check whether they still hold their floor; the mechanic only works if being displaced is visible and being displaced hurts.
- The author, as the operator: someone shipping repeatedly and needing per-country and per-floor numbers of the kind they published, without wiring an analytics contract to get them.

## MVP Scope

- A vertical stack of floors as the single primary surface, with the top floor treated as the visual reward and the whole stack readable in one scroll.
- Floor claim flow: pick a floor, pay more than the current holder, take the floor. The displaced holder moves down rather than disappearing, because the mechanic is competition and not deletion.
- Payment before placement, with a claim only becoming visible after the payment settles, so the board never shows an unpaid floor.
- Concurrency-safe claims: two people bidding on the same floor in the same second resolve to one winner and one refunded or released attempt, never to two holders.
- Floor content: name, link, and an image or logo, held to a strict size and format budget so no claimant can degrade page performance for everyone else.
- Displacement notification to the previous holder, since the pressure to re-bid is the product's engine.
- Public counters mirroring what the author reported by hand — floors claimed, total sales, visitors, countries — computed rather than typed.
- Country breakdown of visitors, since the launch report leaned on it: 112 countries with the top 5 at US 20.9%, India 16%, France 11.3%, UK 3.5%, Germany 2.8%.
- Abuse controls on the claim form and on link content, because an ad surface with a paid link is a spam target from the first hour.
- A share surface designed for the social channels that produced the ~200k+ impressions, so a claim is worth posting about.

## Design Direction

Design is the stated differentiator, so it carries load here rather than decorating. The stack is the interface: floors stacked vertically, the top floor visibly the most valuable position on the page, and the descent down the stack legible without labels explaining it. One typographic voice, set large, since a floor is a name and a link and little else. The colour system is narrow — a neutral field with one accent reserved for the act of taking a floor — and the only motion in the product is the displacement animation, because that single moment is the mechanic made visible and everything else should hold still around it. Floor images run through a fixed frame and a fixed weight budget so 54 claims never become 54 layout exceptions. Every number the operator publishes gets a plain, unstyled presentation; the credibility of "$754 in 24 hrs" comes from it being exact, not from a card around it.

## Constraints

- Read-heavy and globally spread: 12,000+ visitors across 112 countries with the largest share at 20.9% means no origin region is the right one, so the board must be served from the edge and cached hard.
- Money on the write path. A floor claim is a payment plus a position change; partial failure between the two is the one bug that cannot ship.
- Launch traffic is a spike, not a curve. The reported ~200k+ impressions in 24 hours arrive concentrated, so cost and capacity have to survive the first day without a scaling decision made under load.
- User-supplied images and links on a paid ad surface. Both are attack surfaces and both directly affect page weight, which is the design differentiator.
- The mechanic is public and already cloned thousands of times over. Nothing here can rely on the idea being scarce; the only defensible parts are execution quality and shipping cadence.
- Small absolute revenue at launch — $754 in 24 hrs against $700+ of advert spend — so running costs have to stay near zero at rest, and the payment provider's per-transaction floor matters at these ticket sizes.

## Out of Scope

- Multiple boards or categories. This is one stack of floors; splitting it dilutes the top floor, which is the only prize.
- Accounts and profiles. A claim needs a payment and a link, not a login.
- Auction extras such as proxy bidding, reserves or scheduled endings. The competition is continuous and the rule stays one sentence long.
