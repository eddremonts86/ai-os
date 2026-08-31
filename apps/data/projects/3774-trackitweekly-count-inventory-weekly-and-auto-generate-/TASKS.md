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

## Phase 0: Scaffold

- Scaffold the phone client (React Native or PWA) with offline storage.
- Implement the Excel-sheet upload for item seeding.
- Implement barcode scanning and the weekly count flow.
- Implement the sync layer; define the merge rule for offline edits.
- Build the PAR engine with the rolling-3-week average.
- Build the green-yellow-red guidance view.
- Wire the vendor-email templates with a customisation UI.
- Add role-based access and the multi-location view.
- Hand-test with three real restaurant operators.

## Phase 1: Core

- All MVP Scope items shipped end-to-end.
- A restaurant operator does the weekly count on the phone and emails the vendor in one tap.
- Offline edits reconcile cleanly when the phone comes back online.
- PAR guidance comes from the operator's own history, not a global default.
- Test coverage on the sync layer and the PAR engine.

## Phase 2: Deploy

- Deploy on Coolify behind HTTPS.
- Document the offline-sync merge rule in the README.
- Publish a multi-location case study with the first three locations.
- Plan the seasonal-menu reset path based on operator feedback.
