---
id: "3774"
slug: trackitweekly-count-inventory-weekly-and-auto-generate-
title: "TrackItWeekly – Count inventory weekly and auto-generate vendor-ready orders"
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

> Brief derived from the source post. No facts added beyond what the post asserts.

## Value Proposition

Count from your phone. Get a green-yellow-red PAR. Email the vendor in one tap.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Restaurant operator | A weekly count that turns into a vendor order in five minutes. |
| Multi-location manager | Logs and role-based access hold each location accountable. |
| Chef | PAR guidance they can trust is the operational signal. |

## Jobs To Be Done

1. **Functional job** — do the weekly count on the phone and email the order in one tap.
2. **Emotional job** — feel in control of stock, not surprised by a 3am low-stock run.
3. **Social job** — look professional to the vendor and to the owner.

## Success Metrics

- **Activation:** % of signups who complete one weekly count within 14 days.
- **Retention:** weekly active operators; weeks-on-platform.
- **Revenue:** per-location subscription; pricing unstated in the post.

## Competitive Landscape

- Excel sheet + pen and paper: the do-nothing baseline.
- Restaurant POS add-ons (Toast, Square): inventory is a secondary surface; the weekly workflow is not the focus.
- MarketMan / BlueCart: dedicated restaurant inventory; the phone-first weekly count and vendor-email flow is the wedge.

## Risks & Open Questions

- Offline sync must reconcile cleanly when the phone comes back online.
- PAR from a rolling 3-week average is wrong for seasonal menus; the MVP must communicate the assumption.
- Vendor email formatting varies by vendor; the MVP needs templates and a customisation path.
- Role-based access on a phone-first surface needs careful UX to avoid permission noise.
