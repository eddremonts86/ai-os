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

## Tech Stack

- **Frontend:** Next.js 14 + a thin React Native shell for push notifications.
- **Database:** Supabase Postgres + Realtime for the live ETA push channel.
- **Maps:** Mapbox for the route layer.
- **Transit data:** GTFS-RT (where available) with scheduled-time fallback; per-operator cron polls.
- **Notifications:** WhatsApp Business API + push via FCM/APNS.

## Architecture

A self-contained process diagram lives at [`assets/commuter-eta-process.html`](assets/commuter-eta-process.html) (open in any browser; SVG rendered inline, no server required).

A cron poller per supported operator writes the latest GTFS-RT feed into Supabase. The per-student recurring trip is matched to live vehicle positions; when the predicted arrival at the destination crosses the configured late threshold, a Realtime push fires to the student's device and a WhatsApp message is sent. The university hand-off is an outbound email template the student triggers with one tap.

## Milestones

1. **M0 — Spec freeze.** SPEC.md + DESIGN.md + first covered route. End of week 2.
2. **M1 — GTFS-RT ingest.** Cron poller, Supabase schema, scheduled-time fallback. End of week 6.
3. **M2 — Recurring trip + ETA push.** Student onboarding, per-trip ETA, push + WhatsApp notification. End of week 10.
4. **M3 — University hand-off.** "Running late" email template, per-student template editor. End of week 14.
5. **M4 — 5-route pilot.** 5 Argentine intercity routes, 200 student pilot. End of week 22.

## Risks

- **GTFS-RT coverage gaps** — some operators publish only schedules; the "no live data" badge must be honest and prominent so students know the ETA is a fallback.
- **WhatsApp Business API costs** — at scale, the per-message cost can dominate. Mitigation: send only on threshold crossings, not on every poll.
- **False positives** — a false "you're going to be late" notification three days in a row destroys trust; calibration must use a rolling on-time-performance baseline.
