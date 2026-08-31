---
id: "3774"
slug: trackitweekly-count-inventory-weekly-and-auto-generate-
title: TrackItWeekly – Count inventory weekly and auto-generate vendor-ready orders
status: enriched
source:
  name: BetaList
  url: "https://betalist.com/startups/trackitweekly"
category: beta
date: "2026-08-29"
tags: [BetaList, Beta, Product]
tech: [TypeScript, React Native (or PWA), Node.js API, SQLite (on-device) + Postgres (server), Drizzle ORM, Postmark / Resend for email, Coolify + Docker]
---
# TrackItWeekly – Count inventory weekly and auto-generate vendor-ready orders

## Problem

TrackItWeekly streamlines weekly inventory for restaurants and multi-location operators. Users count from their phone with barcode scanning and offline mode, then get PAR levels from a rolling 3-week average with clear green, yellow, and red guidance. They send vendor-ready order emails in one tap and hold every location accountable with logs and role-based access. Upload an Excel sheet to start fast, set low-stock alerts, and use velocity reports to cut waste and over-ordering.

## Objective

Ship a phone-first weekly inventory tool for restaurants and multi-location operators that turns a barcode scan into a vendor-ready order email, with PAR guidance and accountability baked in.

## Target Users

1. **Restaurant operator** — the primary user; does the weekly count and emails the vendor order.
2. **Multi-location manager** — needs to hold each location accountable with logs and role-based access.
3. **Chef / kitchen lead** — needs the PAR guidance to be honest about what is running low.

## MVP Scope

- Phone-first weekly count with barcode scanning.
- Offline mode (no signal in the back of the house).
- Rolling 3-week average PAR level with green / yellow / red guidance.
- One-tap vendor-ready order email.
- Role-based access (counter vs manager vs owner).
- Low-stock alerts.
- Velocity reports (what moves, what does not) to cut waste.
- Excel sheet upload to seed the item list quickly.

## Design Direction

See DESIGN.md for design tokens.

## Constraints

- Offline mode is non-negotiable for the back of the house.
- Multi-location accountability requires a real log of who counted what, when.
- Vendor order emails must be human-readable; the vendor is the recipient, not the operator.
- PAR guidance must come from the operator's own history, not a global default.
