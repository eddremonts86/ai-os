---
id: "876"
slug: farm-vegetable-delivery-problem-through-mobile-applicat
title: Farm vegetable delivery problem through mobile application
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/retail/mnvzelo5i1-farm-vegetable-delivery-problem-through"
  captured: "2025-10-27"
category: retail
date: "2025-10-27"
tags: [Retail, Logistics, Food, Other]
country: Japan
wtp:
  raw: "200,000 Indian rupees (≈ $2,400) to launch, including app development and logistics"
  currency: USD
  min: 2400
  max: 2400
  period: one-shot
tech: [Flutter, Django REST, Postgres with PostGIS, OpenRouteService routing, cold-chain telemetry ingestion, Razorpay]
---
# Farm vegetable delivery problem through mobile application

## Problem

Sunshine, the author, cannot get fresh vegetables from the farm to customers fast enough. The stated causes are three: complex logistics, no suitable transportation or containers, and extreme weather conditions. The consequence is stated as bluntly: logistics problems force selling vegetables at reduced prices without making a profit, and this happens daily when trying to sell agricultural products. Self-organised delivery was attempted and rejected — it means buying trucks and special containers, and it is ineffective in bad weather. Existing logistics services were also assessed and found unsuitable for fast delivery of fresh vegetables. What the author wants to build is specific: a mobile application for direct sales with same-day home delivery, integrated with the company's existing website. The stated launch budget is 200,000 Indian rupees, about $2,400, covering both application development and organising the logistics, and the author is looking for a technical co-founder rather than a vendor.

## Objective

Put a direct-sales channel with same-day home delivery in the customer's hands, integrated with the existing company website, so produce sells at farm-direct prices on the day it is picked instead of being discounted because delivery took too long — without the truck and container purchase the author already ruled out.

## Target Users

- Primary: the farm operator selling directly — the author, currently discounting daily produce because the route to the customer is too slow, and explicitly seeking a technical co-founder to build the channel.
- Secondary: households buying fresh vegetables for same-day home delivery, who are the demand side of the direct-sales model and who choose freshness over the supermarket's convenience.
- Tertiary: third-party drivers and vehicle owners, since the author has ruled out buying trucks — the delivery capacity has to come from somewhere else.

## MVP Scope

- Customer-facing mobile app for direct ordering, with a same-day delivery window shown honestly at checkout including when it is unavailable.
- Integration with the company's existing website, since the author asked for the app to be connected to it rather than replacing it.
- Daily availability list controlled by the farm: what was picked, how much is left, and a hard cutoff time after which today's delivery closes.
- Order batching by area and delivery window, because same-day economics on vegetables only work if one trip carries many orders.
- Route sequencing for the day's batch, so a single driver covers a cluster rather than crossing the region.
- Third-party delivery capacity: driver assignment and status, since buying trucks was already rejected as ineffective and unaffordable.
- Weather-aware operations: when conditions make a window undeliverable, close it before orders are taken rather than failing them afterwards. Extreme weather is named as a cause, so it belongs in the product logic, not the apology text.
- Payments and a per-order margin view, so the operator can see which areas and baskets actually clear a profit.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The whole launch budget is about $2,400 covering both app development and logistics organisation. That rules out custom hardware, a large native build and any paid delivery fleet, and it makes the technical co-founder search a funding constraint as much as a staffing one.
- No trucks and no special containers. The author tried self-organised delivery and found it required both and was ineffective in bad weather, so the design has to reach customers through capacity it does not own.
- Extreme weather is a stated operating condition, not an edge case. A same-day promise that fails on the first storm is worse for a farm's reputation than not promising same-day at all.
- Existing logistics services were assessed as unsuitable for fast fresh-vegetable delivery. Any third-party courier integration has to be validated against produce timing before being designed around.
- The app must integrate with the company's existing website rather than replace it.
- Produce is perishable and unit prices are low. Every layer of cost between the farm and the door has to come out of a margin the author says is currently zero.
- The listed country is Japan while the stated budget is in Indian rupees. The operating geography is ambiguous in the source and must be confirmed before routing, payments or any regulatory work is scoped — none of those are portable between those two markets.

## Out of Scope

- Buying vehicles or cold-chain containers. Named and rejected in the source.
- A multi-farm marketplace. The problem is one operator's own produce reaching customers.
