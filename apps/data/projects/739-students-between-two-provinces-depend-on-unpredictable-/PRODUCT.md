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

## Value Proposition

A student whose daily commute couples two campuses in different provinces — and whose only mass option is a public-transport network that strikes without notice, runs overcrowded at peak hours, and offers no direct route between the two campuses — gets one app that answers the three questions they actually have each morning: is there a disruption today, when does the bus realistically arrive, and what is the fallback if it does not come. The product turns an unplannable commute into a plannable one without requiring the student to spend taxi money every disruption day.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Inter-campus student (the poster) | Loses classes and exams to overcrowding, transfers, and unscheduled strikes. Wants a predictable commute. |
| Single-city student in similar LATAM context | Faces the same peak-hour overcrowding and transfer-heavy routes even within one city. |
| Student's family | Currently subsidises taxis on disruption days. Wants a cheaper predictable alternative. |
| Transport operator (indirectly) | Cleaner demand signal on disruption days (people stop heading to the stop), but the MVP does not depend on this. |

## Jobs To Be Done

1. **Functional job** — Know before leaving whether the bus is coming today, when it will actually arrive, and whether capacity is realistic; if it is not, see the next viable transfer or alternative route.
2. **Emotional job** — Stop the morning anxiety of leaving "early just in case" with no idea whether the bus will run at all.
3. **Social job** — Be able to tell classmates and family "I will be on time today" with something other than a guess.

## Success Metrics

- **Activation:** the student enters home campus and destination campus and sees a saved plan within their first session.
- **Disruption coverage:** ≥ 80% of operator-published alerts (paros, service notices) for the student's saved routes are reflected in the app within 30 minutes of announcement.
- **On-time proxy:** the student arrives at class on time ≥ 90% of days they use the app as their primary check (compared to their self-reported baseline before the app).
- **Strike day behaviour:** when the system is on strike, the fallback view shows ≥ 3 viable alternative routes or rideshare price estimates so the student is not stuck at the stop.
- **Retention:** ≥ 50% of students who onboarded during a semester remain active through the next semester's first month (stickiness across academic calendar).

## Pricing & Monetization

The poster explicitly says "willing to pay as much as necessary if the solution truly makes commuting predictable and reliable" but also "for students in general the solution must remain affordable". No specific price is named on the source, so no `wtp` field is set. Plausible monetisation:

- **Free tier** — saved plan, daily disruption signal, schedule-only fallback view, community-reported bus presence.
- **Student-priced subscription** — a few USD-equivalent in ARS per month for live vehicle positions, push notifications, and capacity estimates.
- **University partnership** — the registrar / student affairs office pays for an institution-wide licence so every enrolled student gets the paid tier for free (the model that works for LATAM student-facing apps that have succeeded in adjacent categories).

## Competitive Landscape

- **Google Maps / Citymapper / Moovit** — global transit apps with strong single-city coverage; they do not handle the specific Argentine inter-provincial + strike context well, especially where GTFS-Realtime is missing for the operator serving the route.
- **Local operator apps (when they exist)** — usually schedule-only, no disruption layer, no inter-operator transfer planning, no capacity signal.
- **WhatsApp / Telegram group chats** — what students actually use today to ask "did your bus come?"; fast but unstructured, no fallback routing, no alerts.
- **Rideshare (Uber, Cabify, local taxis)** — solves disruption days but not the daily commute; too expensive to use every day.
- **Government transport portals** — publish strikes and service notices in scattered formats; the value of the app is consolidating them into the saved plan.

## Risks & Open Questions

- [ ] GTFS-Realtime coverage is uneven across Argentine operators; without it the "live vehicle position" is a schedule + last-reported hybrid. The product must not fake live arrivals — it must say "schedule only".
- [ ] Community-reported bus-presence feeds can be gamed or poisoned. Anonymous submissions must be aggregated to a route-level signal (e.g. "3 reports in the last 30 min, 2 saying not running") rather than surfaced individually.
- [ ] Strike announcements come from many sources (union statements, operator notices, news outlets). A single source is unreliable; the app should ingest at least operator notices plus one independent news source and reconcile them.
- [ ] Capacity estimation from historic peak-hour load patterns is a guess; over-promising on capacity ("you will definitely get a seat") creates the same failure the poster described. The UI must phrase capacity as "usually crowded at this hour" not as a guarantee.
- [ ] University partnership sales cycle is long and varies by institution; the consumer subscription tier must be viable on its own in case no university partnership closes in a given region.
