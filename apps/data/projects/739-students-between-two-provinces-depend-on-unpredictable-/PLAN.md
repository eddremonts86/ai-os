---
id: "739"
slug: students-between-two-provinces-depend-on-unpredictable-
title: Students between two provinces depend on unpredictable public transport that regularly causes lateness and missed classes.
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/travel/ygldt05n61-students-between-two-provinces-depend-on"
  captured: "2026-05-19"
category: travel
date: "2026-05-19"
tags: [Travel, Education, Transportation, Logistics, Other]
country: Argentina
tech: [React Native (cross-platform), Node.js API, Postgres + PostGIS, GTFS-Realtime ingestion, FCM push notifications]
---
# Students between two provinces depend on unpredictable public transport that regularly causes lateness and missed classes.

## Tech Stack

- **Mobile:** React Native (iOS + Android from one codebase). Spanish-first UI with English as secondary locale. Offline-first schedule cache so the saved plan works in a tunnel or during a disruption when the operator's feed is down.
- **Backend API:** Node.js (Fastify or Express) exposing the saved-plan, disruption, fallback, and community-report endpoints. Deployed on a single Coolify instance behind Docker.
- **Database:** Postgres with PostGIS for the route geometry, stop locations, and disruption polygons; Redis for the live vehicle-position cache and the per-route alert fan-out.
- **Realtime ingestion:** GTFS-Realtime pollers (Node.js cron) per operator that publishes a feed; for operators without GTFS-RT, fall back to schedule + last-reported vehicle position.
- **Disruption ingestion:** a parser per authoritative source (operator notices + one independent news feed per region), reconciled into a single per-route alert object.
- **Push notifications:** Firebase Cloud Messaging (FCM) for Android and APNs for iOS, triggered by the disruption service whenever an alert lands on a route the student has saved.
- **Community reports:** anonymous, rate-limited submissions aggregated to a route-level signal ("3 reports in 30 min, 2 negative").

## Architecture

A Node.js API serves the mobile app over JSON. The disruption and GTFS-RT ingestion runs on cron schedules that publish into Postgres and Redis. The saved-plan endpoint joins the user's two campuses to one or more route candidates, applies the current disruption overlay, and returns the active plan with the fallback ranking. Push notifications are fired by a watcher that subscribes to Redis pub/sub channels per route. Community reports write to a buffer that aggregates and decays over time so a single spam report cannot poison the signal.

```
Mobile (React Native)
       │
       ▼
   Node.js API ──▶ Postgres + PostGIS (routes, plans, alerts, reports)
       │                       │
       │                       └─▶ Redis (live vehicle cache, pub/sub)
       │
       ├─▶ GTFS-RT poller (per operator, cron) ──▶ Redis + Postgres
       │
       ├─▶ Disruption parser (operator notices + news feed, cron) ──▶ Postgres
       │           │
       │           └─▶ Redis pub/sub per route ──▶ FCM / APNs push
       │
       └─▶ Community reports (rate-limited, anonymous) ──▶ aggregated buffer
                                                            │
                                                            └─▶ route-level signal
```

## Milestones

1. **M0 — Spec freeze + data partnerships.** SPEC.md approved; identify the operators serving the poster's two campuses; confirm whether GTFS-RT feeds are public. End of week 2.
2. **M1 — Static schedule + saved plan.** Mobile app, two-campus entry, schedule-only plan, Spanish UI. End of week 5.
3. **M2 — Disruption layer.** Operator-notice parser + one independent news feed per region, reconciled into the per-route alert object; in-app alert visible on the saved plan. End of week 7.
4. **M3 — Push notifications.** FCM + APNs hooked to the disruption service; the student gets a push the morning of a strike. End of week 8.
5. **M4 — Live vehicle positions.** GTFS-RT poller for the operators that publish it; for the rest, schedule + last-reported fallback with an explicit "schedule only" label. End of week 10.
6. **M5 — Community reports.** Anonymous, rate-limited submission UI; aggregated route-level signal. End of week 11.
7. **M6 — Pilot.** 500 inter-campus students across three universities; weekly review of activation and on-time proxy. End of week 14.

## Risks

- **GTFS-Realtime coverage gaps.** Where the operator does not publish a live feed, the app must not fabricate a live arrival time. The honest fallback ("schedule + last reported") is the right answer but reduces the headline value of the product. If too many of the poster's routes fall into this bucket, the live-vehicle-position feature ships with thin coverage and the marketing must reflect that.
- **Disruption source reconciliation.** Operator notices, union statements, and news outlets publish the same strike with different wording and different times. A naive merge will produce duplicate alerts with conflicting windows. The reconciliation layer needs a canonical per-route alert object with a confidence score.
- **Community-report poisoning.** A coordinated group of bad submissions could falsely mark a route as "not running" and tank legitimate ridership. Submissions must be rate-limited per device, aggregated to a route-level signal, and decayed over time so a single burst cannot dominate.
- **Capacity estimation overpromise.** Historic peak-hour load is a heuristic; on any given day the bus may be emptier or fuller than the model expects. Phrasing must stay qualitative ("usually crowded at this hour") so the user does not make decisions on a guarantee that does not exist.
- **Spanish-first scope creep.** A LATAM student commute app invites expansion into Brazil, Mexico, etc. The MVP is Argentina + Spanish; locale expansion must wait until the disruption ingestion pattern is proven on one country, otherwise the data partnerships become a sales problem rather than an engineering problem.
