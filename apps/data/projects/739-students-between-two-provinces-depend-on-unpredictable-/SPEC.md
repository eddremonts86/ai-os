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

## Problem

The poster, a student at a university whose campuses sit in two different Argentine provinces, has no reliable or predictable way to commute between them for class. Public transport is the only mass option — taxis and rideshare are too expensive on a daily-commute basis — and the network does not connect the two campuses directly, so every trip requires a transfer or extra leg. The system fails in three concrete ways the poster names: (1) buses arrive unpredictably and the student often does not know whether one is coming or has already passed; (2) transport strikes and disruptions hit several times a year with no schedule, so the student finds out too late to adjust; and (3) at peak hours buses are overcrowded and students are physically unable to board, leading to missed classes and exams even when they leave in advance. The result is that even a simple trip is a stressful, unplannable part of academic life, with students forced to allocate extra time and money just to reduce the risk of being late.

## Objective

Ship a mobile-first commute companion for inter-campus student travel that turns the unpredictable transport system into a plannable one. The MVP must answer three questions a student has every morning: (1) will my bus actually come today, given the current disruption signal; (2) if it comes, when will it realistically arrive and is there capacity on it; and (3) if the bus does not come, what is the next transfer or alternative route that lands me on campus before the class starts. The product must work even when the disruption is a strike announced hours before departure — the single failure mode the poster calls out by name.

## Target Users

- **Primary:** university students whose studies span two campuses in different Argentine provinces, who depend entirely on public transport and cannot afford taxis on a daily basis.
- **Secondary:** university students more broadly in Argentina (and similar LATAM contexts) who face the same peak-hour overcrowding and transfer-heavy routes even for a single-city commute, and who would adopt the same companion if their city's coverage landed.
- **Tertiary:** students' families, who currently subsidise taxis on disruption days and want a cheaper predictable alternative for the days the system fails.

## MVP Scope

- A mobile app (iOS + Android, React Native) where the student enters their home campus and destination campus once and gets a saved commute plan.
- Real-time disruption signal: a daily check of the transport operators' published alerts (paros / strikes / service notices) plus a community-reported "bus did not arrive" / "service is running normally" feed, geofenced to the student's route.
- A live vehicle-position layer for the routes on the student's plan, using GTFS-Realtime feeds where the operators publish them; for operators without GTFS-RT, fall back to schedule + last-reported position.
- A capacity indicator on the next vehicle: drawn from historic peak-hour load patterns when no live count is available, replaced with a live passenger count where operators expose it.
- A "what if my bus does not come?" fallback view: ranked list of transfer routes and rideshare price estimates, with the caveat that rideshare is not a daily solution.
- Push notifications for disruptions on the saved route: "paro announced for tomorrow 5am–10am" or "your route is currently disrupted, plan adds 25 min".
- Spanish-first UI (the original poster wrote in Spanish per the ProblemHunt moderator's note), with English as a secondary locale.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The poster cannot afford daily taxis / Uber; pricing must be student-affordable. A free tier with the daily disruption signal and the fallback view is the floor; a small monthly fee (a few USD-equivalent in ARS) is acceptable for live vehicle positions and push alerts.
- Must work with the data quality the operators actually publish. Where GTFS-Realtime is missing, the app must not silently fake live arrivals; it must show "schedule only" or "last reported".
- Must work during strikes: the disruption layer is the load-bearing feature, not a nice-to-have.
- Privacy: community-reported "bus did not arrive" submissions must be anonymous at the network layer and visible only as an aggregate signal on the route.
- Spanish-first UI; the app must not assume English literacy. English is a secondary locale.
- Coverage is bound by the operators that actually serve the student's campuses; the app must say "no coverage for this route yet" rather than pretend it can answer.
