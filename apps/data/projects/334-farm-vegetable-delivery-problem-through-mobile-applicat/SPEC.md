---
id: "334"
slug: farm-vegetable-delivery-problem-through-mobile-applicat
title: Farm vegetable delivery problem through mobile application
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/retail/mnvzelo5i1-farm-vegetable-delivery-problem-through"
category: retail
date: "2025-10-29"
tags: [Retail, Logistics, Food, Other]
country: Japan
tech: [Flutter (Android+iOS), Firebase Firestore, Stripe Japan, Japan Post Yu-Pack API, Cloud Functions]
---
# Farm vegetable delivery problem through mobile application

## Problem

A Japanese small vegetable grower sells at a local farmers' market and has a handful of regular customers who keep asking if delivery is possible. Today the answer is 'no' because weekly box packing, same-day dispatch and COD-style payment are not what a single farmer with a 0.5-2 hectare plot can run. The opportunity is real - Japan's subscription produce box market is large - but the operational load is what blocks it.

## Objective

Ship a Japanese-language farm-produce delivery mobile app that lets a small grower take weekly box subscriptions from neighbours, auto-build the box from the harvest forecast, and dispatch through Japan Post Yu-Pack with one tap from the farmer's phone.

## Target Users

- Japanese small growers (0.5-5 ha) who currently sell only at local markets.
- Neighbourhood subscribers within a Yu-Pack next-day radius of the farm.
- Farm cooperatives that want a shared app across 3-10 growers.

## MVP Scope

- Farmer dashboard (mobile-first): harvest forecast entry, weekly box composition, price.
- Subscriber app (Android + iOS): weekly box preview, subscribe, pause, skip.
- Payment via Stripe Japan (card + convenience-store) on subscription sign-up.
- Auto-pack slip generator: subscriber name, address, Yu-Pack tracking sticker, contents.
- Dispatch on the farmer's phone: one tap creates the Yu-Pack shipment, returns tracking number.
- Subscriber notification: shipment out, expected arrival (Yu-Pack ETA), contents.
- No refrigerated transport in v1; ambient-only boxes.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/retail/mnvzelo5i1-farm-vegetable-delivery-problem-thr` follows the constraints in `334-.../SPEC.md` and the chosen stack (Flutter (Android+iOS), Firebase Firestore, Stripe Japan). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Japan.

For Japan, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Must work in Japanese end-to-end (UI strings, fonts, date format, address fields).
- Yu-Pack API is the single supported carrier for v1; no rider integration.
- Refund policy for missed-week boxes is shown at checkout, not in T&Cs.
