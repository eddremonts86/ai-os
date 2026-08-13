---
id: "008"
slug: students-between-two-provinces-depend-on-unpredictable-
title: "Students between two provinces depend on unpredictable public transport that regularly causes lateness and missed classes."
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

See `DESIGN.md` for this project's design tokens.

## Constraints

- GTFS-RT coverage in Argentina is incomplete; the app must fall back to scheduled times with a clear "no live data" badge.
- Notifications must arrive on WhatsApp (not just push) because that is the channel students actually check.
- Per-student data is per-trip; no location tracking outside the active trip window.
- The university attendance integration must work with the institutions' existing email intake, not require new IT projects.