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

## Phase 0: Scaffold

- [x] Capture ProblemHunt post by Milagros (Argentina, 2026-05-19)
- [ ] Identify the transport operators serving the poster's two campuses; document GTFS / GTFS-RT availability per operator
- [ ] Provision Postgres + PostGIS schema: routes, stops, route_candidates, alerts, community_reports
- [ ] Provision Node.js API skeleton (saved-plan, disruption, fallback, community-report endpoints)
- [ ] Set up Spanish-first i18n in the React Native shell

## Phase 1: Core

- [ ] Static schedule import for the poster's two-campus route pair (offline-first cache)
- [ ] Saved-plan UX: enter home campus + destination campus once; app remembers the plan
- [ ] Operator-notice parser: scrape or poll each operator's service-notice page; normalise into a per-route alert
- [ ] Independent news-feed parser (one source per region); reconcile with operator notice into a single per-route alert object with confidence score
- [ ] In-app alert banner on the saved plan when a disruption is active
- [ ] GTFS-Realtime poller for each operator that publishes it; live vehicle position surfaced on the saved plan
- [ ] Fallback "(schedule only)" label where GTFS-RT is missing — never fabricate a live arrival
- [ ] FCM + APNs push notifications triggered by the disruption watcher
- [ ] Fallback view: ranked alternative routes + rideshare price estimate when the primary bus does not come
- [ ] Community-reported bus presence: anonymous, rate-limited submission UI; aggregated route-level signal
- [ ] End-to-end test: simulate a strike announcement on the operator's notice page; confirm the alert lands on the saved plan within 30 min and triggers a push

## Phase 2: Deploy

- [ ] Onboard 500 inter-campus students across three Argentine universities
- [ ] University partnership pilot (registrar or student affairs office pays institution-wide licence)
- [ ] Weekly review of activation, on-time proxy, and per-route disruption coverage
- [ ] Spanish-first App Store + Play Store listings; English secondary locale
- [ ] Post-mortem at week 14: activation, retention into next semester, per-route coverage gaps
