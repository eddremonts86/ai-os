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

## Phase 0: Scaffold

- [x] Capture problem from ProblemHunt + write SPEC.md skeleton
- [ ] Define DESIGN.md (commuter-led, ETA-first)
- [ ] Provision Supabase + Mapbox + WhatsApp Business API sandbox
- [ ] Survey GTFS-RT coverage for 10 Argentine intercity operators
- [ ] Recruit 2 university partners for the attendance hand-off

## Phase 1: Core

- [ ] GTFS-RT cron poller per operator; Supabase schema for live vehicle positions
- [ ] Scheduled-time fallback engine with a clear "no live data" badge
- [ ] Student onboarding: save recurring trip (origin, destination, scheduled departure, class start)
- [ ] ETA engine: per-trip prediction with rolling on-time-performance baseline
- [ ] Push notification (FCM/APNS) when ETA crosses the late threshold
- [ ] WhatsApp Business API integration for the same notification
- [ ] One-tap "running late" email template to the university (student-editable body)
- [ ] Trip history and on-time performance per route per operator
- [ ] End-to-end test: 5 routes, 50 students, 200 trip notifications

## Phase 2: Deploy

- [ ] Production deployment on Vercel + Supabase
- [ ] Onboard 5 university partners for the attendance integration
- [ ] Public launch in the Resistencia–Corrientes, Neuquén–Cipolletti, and Rosario–Santa Fe corridors
- [ ] WhatsApp Business API live (post-sandbox)
- [ ] University-side admin console: attendance signal feed
- [ ] Post-mortem at week 22
