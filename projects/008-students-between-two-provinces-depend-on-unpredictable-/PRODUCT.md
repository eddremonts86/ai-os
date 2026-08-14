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

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

An Argentine intercity commuter student gets a push notification when their bus is going to make them late, and can one-tap notify the university attendance system with an "I'm running late" message before the class starts.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Intercity commuter students | A late bus today means an absence tomorrow, which compounds. |
| Universities | Want an attendance signal they can act on, not a one-off excuse email. |
| Long-distance bus operators | Want a feedback channel without building their own app. |

## Jobs To Be Done

1. **Functional job** — Know in advance if the bus will make the student late.
2. **Emotional job** — Stop dreading every commute as a roll of the dice.
3. **Social job** — Look like a serious student in front of professors who see absences as a discipline issue.

## Success Metrics

- **Activation:** recurring trip saved and first push notification sent within 14 days.
- **ETA accuracy:** mean absolute error < 8 minutes on covered routes.
- **University hand-off:** ≥ 30% of late notifications result in a "running late" message to the university.
- **Retention:** ≥ 70% of students still have at least one active recurring trip at month 3.

## Pricing & Monetization

Free for students (ad-supported in v1: bus operators and student-loan providers). Universities pay $200/month per campus for the attendance integration API. Operators pay nothing.

## Competitive Landscape

- **Google Maps transit** — no personalised ETA push, no university integration.
- **WhatsApp groups** — peer-reported lateness, no machine signal.
- **Bus operator apps** — single operator, no cross-operator coverage.

## Risks & Open Questions

- [ ] Confirm GTFS-RT coverage for at least 5 Argentine intercity routes at launch.
- [ ] Decide whether to charge universities or keep it free to seed the network.
- [ ] Validate WhatsApp Business API costs against the free-tier assumptions.

---

_Source:_ [ProblemHunt](https://problemhunt.pro/en/travel/ygldt05n61-students-between-two-provinces-depend-on) · **Category:** travel · **Tags:** Travel, Education, Transportation, Logistics, Other
