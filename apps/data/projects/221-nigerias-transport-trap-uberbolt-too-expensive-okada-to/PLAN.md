---
id: "221"
slug: nigerias-transport-trap-uberbolt-too-expensive-okada-to
title: "Nigeria's transport trap: Uber/Bolt too expensive, okada too deadly, Danfo buses a nightmare. Millions stuck without a safe, affordable option."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/"
category: mobility
date: "2026-02-13"
tags: [Mobility, Nigeria, Marketplace]
country: Nigeria
tech: [Flutter, Node.js, PostgreSQL, Google Maps, Paystack, Firebase]
---
# Nigeria's transport trap: Uber/Bolt too expensive, okada too deadly, Danfo buses a nightmare. Millions stuck without a safe, affordable option.

## Tech Stack

Flutter for both rider and driver apps. Node.js for the matching service. PostgreSQL for the trip and driver data. Google Maps for routing. Paystack for transfers and online payments. Firebase for the auth and push notifications.

## Architecture

Rider request → matching → driver assignment → trip start (with helmet check) → real-time tracking → payment (cash or Paystack) → rating. Driver onboarding with national-ID check. Per-city rules for vehicle class availability.

## Milestones

M0 — driver onboarding with national-ID check. M1 — rider app with sedan class first. M2 — regulated motorcycle class with helmet enforcement. M3 — minibus class. M4 — 100,000 active riders in Lagos in pilot.

## Risks

Regulatory risk if state transport authorities change the rules. Driver-side fraud (fake registrations, dual apps). Rider-side fraud (fake disputes). Cash handling has safety risks for drivers. Motorcycle safety incidents can damage the brand even when the company is enforcing the rules.

## Data Model

## Integrations

Flutter for both rider and driver apps. Node.js for the matching service. PostgreSQL for the trip and driver data. Google Maps for routing. Paystack for transfers and online payments. Firebase for the auth and push notifications.
