---
id: "848"
slug: gps-based-taxi-and-delivery-solution-for-zimbabwe
title: GPS-based taxi and delivery solution for Zimbabwe
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/"
category: logistics
date: "2025-11-14"
tags: [Logistics, Other]
country: Zimbabwe
tech: [Flutter (Android-first), Dart, Postgres, Node.js API (Fastify), Coolify, Docker]
---
# GPS-based taxi and delivery solution for Zimbabwe

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A dispatch and tracking tool that actually runs in Harare on the phones and the network people have, not the phones and network the docs assume.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Primary user in Zimbabwe | Small taxi associations and delivery operators in Zimbabwe, plus their drivers and the riders or senders who book them. |
| Adjacent user | Anyone the primary user would need to coordinate with to use the product. |

## Jobs To Be Done

- When a rider requests a taxi, get one assigned in under a minute.
- When a driver is offline, queue the job acceptance until signal returns.
- When an operator monitors, see all active jobs on one map.

## Success Metrics

Whether a 10-driver fleet in Harare can run a full shift without the app blocking them on a dead zone.

## Pricing & Monetization

The source does not name a price or willingness-to-pay. Pricing is left as an open question to be answered after user interviews, not invented here.

## Competitive Landscape

GPS taxi apps (Bolt, Yego) and delivery platforms exist, but the source does not name any direct competitor that is built for Zimbabwe's taxi and delivery market.

## Risks & Open Questions

- Map tile coverage in parts of Zimbabwe is poor; the app must degrade gracefully.
- Cash payments dominate; do not assume card rails in v1.
- [ ] Validate problem with 5 user interviews before MVP
- [ ] Confirm willingness to pay with real users
- [ ] Re-check Zimbabwe-specific compliance expectations

---

_Source:_ [ProblemHunt](https://problemhunt.pro/) · **Category:** logistics · **Country:** Zimbabwe
