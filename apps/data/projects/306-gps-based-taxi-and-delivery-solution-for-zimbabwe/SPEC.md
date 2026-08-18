---
id: "306"
slug: gps-based-taxi-and-delivery-solution-for-zimbabwe
title: GPS-based taxi and delivery solution for Zimbabwe
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/logistics/qkqb82u8i1-gps-based-taxi-and-delivery-solution"
category: logistics
date: "2025-11-12"
tags: [Logistics, Mobility, Other]
country: Zimbabwe
tech: [Next.js, TypeScript, Postgres, Expo React Native, Mapbox Directions API, EcoCash, Hetzner]
---
# GPS-based taxi and delivery solution for Zimbabwe

## Problem

Zimbabwe lacks a widely-used GPS-based taxi and delivery platform. Riders and couriers operate informally, customers rely on phone-call hailing or word-of-mouth, and there is no live map of where a driver is between the booking and the drop-off. The title describes both halves of the gap: the dispatch side and the delivery side, both anchored on GPS visibility, neither addressed by an existing local product.

## Objective

Ship a lightweight super-app-style service for Harare (and one secondary city) that lets a customer book a taxi or a small-parcel courier, watch the driver approach on a map, and pay via mobile money — without requiring either side to own a smartphone newer than five years old.

## Target Users

- Harare residents who currently hail taxis by standing on a corner or calling a dispatcher.
- Small-shop owners in Harare who need same-day parcel delivery within the city.
- Independent drivers and riders who want a steady stream of paying trips with daily settlement.

## MVP Scope

- Customer app (mobile web + Android wrapper): pickup pin, drop-off pin, fare estimate, book a driver, watch the driver on the map.
- Driver app (mobile web + Android wrapper): accept or decline trips, turn-by-turn navigation, mark arrived / started / completed.
- EcoCash and OneMoney integration for fare payment and driver payouts.
- Dispatch fallback: if no driver accepts in 90 seconds, a dispatcher console reassigns manually.
- Trip history, fare receipt, basic driver rating.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/logistics/qkqb82u8i1-gps-based-taxi-and-delivery-solu` follows the constraints in `306-.../SPEC.md` and the chosen stack (Next.js, TypeScript, Postgres). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Zimbabwe.

For Zimbabwe, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- App must run on 2G/3G with intermittent connectivity; map tiles cached aggressively.
- No requirement for a smartphone newer than ~2019; PWA over native where possible.
- All amounts in USD (Zimbabwe's primary transaction currency) with EcoCash / OneMoney settlement.
