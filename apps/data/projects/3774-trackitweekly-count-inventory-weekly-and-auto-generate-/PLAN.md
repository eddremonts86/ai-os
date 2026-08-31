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

## Tech Stack

TypeScript, React Native (or PWA), Node.js API, SQLite (on-device) + Postgres (server), Drizzle ORM, Postmark / Resend for email, Coolify + Docker.

## Architecture

Phone client (offline-capable) + Node.js API + Postgres. Counts are stored locally and synced. PAR engine runs on the server with the rolling-3-week average. Vendor-email templates are per-vendor and editable.

## Milestones

- **M0:** SPEC + DESIGN approved.
- **M1:** Item seeding from Excel + barcode scan + weekly count.
- **M2:** PAR engine + green-yellow-red guidance + low-stock alerts.
- **M3:** Vendor email templates + role-based access + multi-location.

## Risks

- Offline sync reconciliation is the engineering risk; the MVP must define the merge rule.
- Seasonal menus break the rolling-3-week PAR; the MVP needs a 'reset' path.
- Vendor email formatting varies; a customisation UI is non-trivial.
- Multi-location permissions on a phone surface need careful UX.
