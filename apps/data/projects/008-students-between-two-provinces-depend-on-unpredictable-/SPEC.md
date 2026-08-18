---
id: "008"
slug: students-between-two-provinces-depend-on-unpredictable-
title: Students between two provinces depend on unpredictable public transport that regularly causes lateness and missed classes.
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/travel/ygldt05n61-students-between-two-provinces-depend-on"
  captured: "2026-07-17"
category: travel
date: "2026-07-17"
tags: [Travel, Education, Transportation, Logistics, Other]
country: Argentina
tech: [Next.js, Postgres, Mapbox, GTFS-RT, Supabase Realtime]
---
# Students between two provinces depend on unpredictable public transport that regularly causes lateness and missed classes.

## Problem

Argentine students commuting between two provinces for university or technical school are at the mercy of long-distance buses whose arrival time swings by an hour or more depending on traffic, weather, and operator reliability. A late bus means a missed class; missing a class repeatedly means academic consequences. Students have no advance warning that their bus will be late, and no way to tell the university they will be late.

## Objective

Ship a per-student commuter companion that ingests public GTFS-Realtime feeds, computes a personalised door-to-door ETA per trip, pushes a notification when the ETA slips past a threshold, and optionally notifies the university attendance system with an automatic "will be late" message.

## Target Users

- Primary: Argentine university students commuting between two provinces (e.g., Resistencia → Corrientes, Neuquén → Cipolletti).
- Secondary: their universities, which want attendance data they can act on; secondary transport operators who want a feedback channel.

## MVP Scope

- GTFS-RT ingest for the major Argentine intercity bus operators (via their public feeds where available).
- Personalised route: each student saves a recurring trip (origin city, destination city, scheduled departure, class start time).
- ETA push notification when the predicted arrival time crosses a configurable threshold (default: 30 minutes before class).
- "I'm running late" template that the student can one-tap send to the university attendance system via email or WhatsApp.
- Trip history and on-time performance per route per operator.
- No booking, no ticketing, no carpool in v1.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/travel/ygldt05n61-students-between-two-provinces-depe` follows the constraints in `008-.../SPEC.md` and the chosen stack (Next.js, Postgres, Mapbox). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Argentina.

For Argentina, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- GTFS-RT coverage in Argentina is incomplete; the app must fall back to scheduled times with a clear "no live data" badge.
- Notifications must arrive on WhatsApp (not just push) because that is the channel students actually check.
- Per-student data is per-trip; no location tracking outside the active trip window.
- The university attendance integration must work with the institutions' existing email intake, not require new IT projects.
