---
id: "776"
slug: its-impossible-to-order-truly-fresh-farm-vegetables-and
title: "It's impossible to order truly fresh farm vegetables and bread through delivery aggregators — product quality is low, and you have to go to the market yourself."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/food/a6dgf1icc1-its-impossible-to-order-truly-fresh-farm"
category: food
date: "2026-01-22"
tags: [Food, Logistics, Retail, Other]
country: Russia
tech: [Python, Django, PostgreSQL, Redis, Celery, Stripe, Mapbox]
---
# It's impossible to order truly fresh farm vegetables and bread through delivery aggregators — product quality is low, and you have to go to the market yourself.

## Problem

It is impossible to order truly fresh farm vegetables and bread through delivery aggregators — product quality is low, and the user has to go to the market themselves. The ProblemHunt capture is the title plus the country Russia and the tags Food, Logistics, Retail, Other; nothing further — so the actor is a consumer who wants fresh produce and bread delivered, the pain is the quality gap on the existing aggregators, and the missing piece is a delivery surface where quality is the design goal rather than an afterthought.

The implied problem is the supply chain behind an aggregator. An aggregator optimises for catalogue breadth and delivery radius, and freshness is downstream of both: produce sits in a dark warehouse, bread is baked in a centralised industrial bakery, the rider picks up from a single hub. The consumer's frame is that the product is the same regardless of where the rider picks it up, but the supply chain does not honour that frame; freshness is a property of the producer, not the aggregator. The actor's solution today is to go to the market themselves, which is the existing alternative the post explicitly names.

The 'Logistics' tag in the capture is the strongest signal about how the problem has to be solved. Beyond that title the source names no specific aggregator, no specific city, no specific producer, and no price point. The plan reasons from the actor (consumer who has to go to the market), the symptom (low quality through aggregators), and the missing piece (a delivery surface that is honest about freshness), without inventing a city, a producer list, or a current basket size.

## Objective

Ship a delivery service that takes farm vegetables and bread from individual producers and delivers them to the consumer within hours of harvest or bake, so the consumer can order from a phone without the catalogue breath and the warehouse depth that destroys freshness. The producer side is explicit in the product: every item on the surface is named with the producer, and the producer's timing — picked today, baked this morning — is the listing.

## Target Users

- A consumer who currently drives to the market and wants to order truly fresh produce and bread from a phone without a quality compromise.
- A household that has stopped ordering from existing aggregators because the produce and bread arrive bruised or stale, and that wants a delivery surface that does not reproduce that experience.
- A consumer who knows several producers by name but has no shared shopping and delivery surface that links them into one order.
- A consumer who values freshness over breadth — who would rather have a small catalogue of producer-named items than a long catalogue of un-named items.
- A consumer for whom bread is a daily staple and who can name the bakery they would buy from if the aggregator had it but doesn't.

## MVP Scope

- A producer-side onboarding flow that invites individual farmers and bakers to list inventory they have on hand and intend to fulfil that day.
- A consumer-side catalogue organised by producer and category, with each item carrying a 'picked at' or 'baked at' timestamp the producer recorded.
- A basket that combines items from multiple producers in one order, with delivery handled in a single route per neighbourhood.
- A cut-off schedule that closes a producer's listing at a stated time (e.g. orders close at 9am for 11am delivery of freshly baked bread), so the freshness property is structural rather than best-effort.
- A producer-side fulfilment surface that marks each item as picked or baked at fulfilment time and confirms handover to the rider.
- A neighbourhood-routed delivery layer where the rider picks up from multiple producers and delivers to a small set of households in one route.
- A consumer-facing tracking surface that shows the rider's progress across the multi-producer route.
- A freshness-rating surface that lets the consumer rate producer-by-producer on the freshness they received, with the rating landing on the producer's profile.
- A producer-payout surface that handles per-order settlement, with the producer's net receipt visible per order and weekly payouts.
- A availability surface that shows the next delivery window for each producer rather than a misleading 'available now' label that hides the cut-off schedule.

## Design Direction

See DESIGN.md for this project's design tokens.

## Constraints

- The capture is one sentence plus the country Russia and four tags; nothing beyond that is invented here, including city, producer list, specific aggregator, or price point.
- 'Fresh' is the product; any design where freshness degrades silently into a generic aggregator shape is unfit for the post's missing piece.
- The producer is the unit of trust. The platform cannot hide the producer behind a platform label, because the user's choice is being-a-known-producer's-bread over a generic daily-bakery's bread.
- Cut-off times have to be enforced, not advisory; an advisory cut-off is the same as the existing aggregator shape.
- The producer's payout has to be honest per order, because the producer's motivation to keep listing on the platform depends on the settlement being fair.
- Per-producer freshness ratings are the platform's main quality signal; a rating that is not surfaced on the producer's profile is a rating that does not exist.
- The delivery route shape has to support small producer sets per neighbourhood, because a route that forces a single hub is the warehouse-depth failure the post names.
