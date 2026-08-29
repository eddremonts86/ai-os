---
id: "763"
slug: nigerias-transport-trap-uberbolt-too-expensive-okada-to
title: "Nigeria's transport trap: Uber/Bolt too expensive, okada too deadly, Danfo buses a nightmare. Millions need safe, affordable carpooling. Ready to pay."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/transportation/i0p4ciscj1-nigerias-transport-trap-uberbolt-too-exp"
  captured: "2026-02-13"
category: transportation
date: "2026-02-13"
tags: [Transportation, Other]
country: Nigeria
wtp:
  raw: $5–10 per ride
  currency: USD
  min: 5
  max: 10
  period: one-shot
tech: [Flutter (Android-first), Node.js API, PostgreSQL with PostGIS, "USSD fallback via Africa's Talking", Paystack / Flutterwave for cards and bank transfer, Mapbox / OpenStreetMap for routing, driver KYC via BVN + NIN + selfie liveness]
---
# Nigeria's transport trap: Uber/Bolt too expensive, okada too deadly, Danfo buses a nightmare. Millions need safe, affordable carpooling. Ready to pay.

## Problem

Bidemi Ige Olaosebikan, a Nigerian working professional, describes a 4-year-old pain: Uber and Bolt cost $10–15 per ride, which is unaffordable for daily trips; okada (motorcycle taxis) cost $2–3 but are "Russian roulette" — no background checks, missing helmets, ignored traffic rules, fatal accidents routine, no insurance, no support; Danfo (yellow minibuses) are overcrowded to the point where people hang off the doors, drivers run red lights, pickpockets operate inside, women face harassment, and a 30-minute car trip becomes a 2–3 hour wait because buses leave only when full. Over 4 years the author has spent thousands of dollars on Uber/Bolt they would not have spent if a normal alternative existed; a friend was seriously injured on okada, so they no longer take that risk except in emergencies; on a Danfo their phone was stolen and they never returned. The author has tried WhatsApp-based ride coordination with colleagues and it failed — people are late, schedules don't sync, no accountability, no cost-splitting, no ratings. The author wants a service that costs $5–10 per ride (1.5–2× cheaper than Uber/Bolt), with verified drivers, rating systems, real-time support, ride history, and a simple interface to find people with similar routes and schedules. They explicitly say they are not looking for a co-founder and want to be a first user providing active feedback.

## Objective

Ship a carpooling app for Nigerian commuters that matches verified drivers and riders on shared routes at $5–10 per seat, with background-checked drivers, a rating system, in-app cost splitting, real-time trip support, and ride history — so a daily commuter in Lagos / Abuja / Port Harcourt can get to work for half the cost of Uber/Bolt without taking the okada risk or the Danfo time hit.

## Target Users

- Primary: Nigerian working professionals aged 22–40 in Lagos, Abuja, and Port Harcourt who commute daily, currently use Uber/Bolt when they have to and okada / Danfo otherwise, and want a verified-driver alternative at half the price.
- Secondary: Nigerian university students with the same daily-commute pain but with tighter budgets and a higher sensitivity to safety (especially female students, who the source explicitly mentions as targets of Danfo harassment).
- Tertiary: verified independent driver-owners (not fleet operators) who own a 4-door sedan and want a steady stream of shared rides during commute windows; they need vetting, not just sign-up.

## MVP Scope

- Android-first app (Flutter) plus a thin web booking surface for users without a smartphone; iOS in Phase 2 because Android dominates the Nigerian mid-tier market.
- Driver KYC flow: Bank Verification Number (BVN) + National Identification Number (NIN) + selfie liveness + vehicle papers (registration, insurance, roadworthiness); rejections surfaced with reason so the driver knows what to fix.
- Rider side: pickup + dropoff, suggested shared routes from Mapbox/OSRM, list of confirmed drivers on each route with rating and vehicle plate; booking flow with Paystack / Flutterwave at the $5–10 price point.
- Trip support: in-app SOS button that escalates to a 24/7 call centre, the rider's live location shared with two pre-set emergency contacts, and a trip recording kept for 7 days after each completed ride.
- Cost splitting across multiple riders on the same route with automatic settlement; rider pays their share, the system pays the driver.
- USSD fallback for riders without smartphones or data: a short code that lists rides available on the rider's route and books one via SMS.
- Single-city launch (Lagos) before expanding; the city-specific traffic data is what makes the route-matching honest.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Author's stated price ceiling is $10 per ride; the per-seat price must hold against naira volatility, not just against today's USD — pricing must be re-evaluable in naira monthly with the source's $5–10 band as the anchor.
- Driver vetting must use Nigerian identity infrastructure (BVN, NIN) — assuming foreign KYC will land this in a regulatory mess.
- App must work on 3G and on phones with 2 GB RAM; Nigerian mid-tier Androids are the baseline, not flagships.
- USSD and SMS channels must be first-class, not fallbacks hidden in a help article; the source author named female students as a target group, and reaching them sometimes means reaching them without a smartphone.
- No taxi / okada / Danfo replacement rhetoric in the product copy; the author does not want a fight with those industries, just an alternative. Marketing must respect that.
