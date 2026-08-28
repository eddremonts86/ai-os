---
id: "3161"
slug: recalled-track-your-products-and-get-instant-alerts-whe
title: Recalled – Track your products and get instant alerts when recalls occur
status: enriched
source:
  name: BetaList
  url: "https://betalist.com/startups/recalled?utm_campaign=startup-184458&utm_medium=atom&utm_source=newsfeed"
category: beta
date: "2026-08-26"
tags: [BetaList, Beta, Product]
tech: [mobile app, push notifications, REST API, SQLite/Postgres]
---
# Recalled – Track your products and get instant alerts when recalls occur

## Problem

U.S. product-safety recalls are scattered across four federal agencies (CPSC, NHTSA, FDA, USDA) and consumers have no single place to monitor them. Recalled aggregates daily from those four sources, lets users save the products they own by photo, barcode, or manual entry, and pushes a phone alert when a matching recall is filed. Urgent Class I or serious hazards are flagged; the listing links out to the original notice. Categories covered include appliances, vehicles, food, drugs, and medical devices.

## Objective

Keep users ahead of recall risk across the categories the source names — appliances, vehicles, food, drugs, medical devices — by surfacing a matching recall on their phone the same day one is filed.

## Target Users

U.S. consumers who own products across the categories the source names (appliances, vehicles, food, drugs, medical devices) and want to be told, not have to go look, when one of those products is recalled.

## MVP Scope

Daily aggregation from CPSC, NHTSA, FDA and USDA; product entry by photo, barcode, or manual; matching against newly filed recalls; phone push alerts when a match lands; urgent-hazard (Class I / serious) flagging; link-out to the original notice. Source does not state international coverage, so U.S.-only for MVP.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

Each federal agency publishes on its own cadence and format — the aggregator has to normalise them. Source does not state the push-notification provider or the product-matching algorithm; both are open. Phone-side product entry by photo implies some kind of visual match (brand/model from a photo), which is itself an open question the post does not answer.
