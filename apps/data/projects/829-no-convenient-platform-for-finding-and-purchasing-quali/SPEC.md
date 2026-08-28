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

## Problem

A buyer who wants quality produce from local farms in quantities smaller than a full wholesale order — restaurants, small grocers, food businesses — does not have one place to find the farms, see what they have, and place a small order. The post, filed under "Food" with AgTech, Logistics and Retail tags from Russia, frames the gap as a platform problem, not a price or quality problem on its own. Source names no specific buyer, no crop, no volume band.

## Objective

Give a small-volume wholesale buyer in Russia one place to discover local farms, see what is in season, and place a small order without negotiating a full-truckload contract.

## Target Users

Small-volume wholesale buyers in Russia — restaurants, small grocers, food businesses — who want produce from local farms in quantities below a full wholesale pallet. Secondary: small and mid-size local farms that want a steady stream of small wholesale orders without setting up their own e-commerce.

## MVP Scope

- A farm directory filtered to a region, with the crops and seasons each farm is known for.
- A product listing per farm with the small-volume wholesale price and the minimum order.
- An order surface that lets the buyer place a small order with one farm at a time.
- A short trust signal per farm (length of operation, verification status) without inventing ratings the source does not support.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Country of submission is Russia; any payment, logistics, or regulatory assumption is local and must be confirmed, not assumed.
- "Small wholesale" is undefined in the post; the volume bands in MVP must come from interviews, not invented.
- Source names no specific crop or buyer type; the persona should be the one confirmed by interviews before any segment-specific copy goes in.
- No named competitor appears in the source.
