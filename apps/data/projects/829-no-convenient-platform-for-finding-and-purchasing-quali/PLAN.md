---
id: "829"
slug: no-convenient-platform-for-finding-and-purchasing-quali
title: No convenient platform for finding and purchasing quality products from local farms in small wholesale quantities
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/food/2mrn1lzlp1-no-convenient-platform-for-finding-and-p"
category: food
date: "2025-11-26"
tags: [Food, AgTech, Logistics, Retail, Other]
country: Russia
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# No convenient platform for finding and purchasing quality products from local farms in small wholesale quantities

## Tech Stack

React + TypeScript front end, TanStack Start API, SQLite via Drizzle ORM, deployed on Coolify / Docker. Same stack as the rest of the AI-OS apps so the farm directory, listings and order surface ship alongside the other corpus apps on the existing VPS.

## Architecture

A farm directory stores each farm and the crops and seasons it is known for. A product listing per farm carries the small-wholesale price and the minimum order. The order surface places an order with one farm at a time and records it in the buyer's history. Trust signals are kept minimal: length of operation and verification status, not invented ratings.

```
region filter
        ↓
farm directory (crops + seasons per farm)
        ↓
product listing per farm (price + minimum order)
        ↓
order with one farm → recorded in buyer history
```

## Milestones

1. Farm directory scoped to one Russian region from interviews, not from the source.
2. Product listings per farm with small-wholesale price and minimum order.
3. Order surface that places a small-volume order with one farm at a time.
4. Buyer history that lets the buyer repeat an order without re-keying it.
5. Minimal trust signal per farm (length of operation, verification status).

## Risks

- Country of submission is Russia; payment, last-mile delivery and farm licensing are local questions the post does not answer.
- "Small wholesale" has no defined volume band; showing a band without interviews would be invented and would distort listings.
- The post tags AgTech, Logistics, and Retail; trying to cover all three at MVP scope dilutes the directory's purpose.
- Trust signals are easy to fake; review and rating features should stay out of MVP until backed by a real verification process.
