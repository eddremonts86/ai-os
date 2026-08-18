---
id: "346"
slug: universal-tracking-service-for-all-mobile-devices
title: Universal tracking service for all mobile devices
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/other/kiv6i361e1-universal-tracking-service-for-all-mobil"
category: other
date: "2025-10-29"
tags: [Other]
country: Russia
tech: [React Native (background service), Native iOS (Significant Location Change) + Android (Fused Location Provider), Apple Push + FCM, Postgres + TimescaleDB, Telegram Bot API]
---
# Universal tracking service for all mobile devices

> Product brief authored from the source title and category. The poster's text was not available (source.name: manual); sections below re-state the problem and infer only what the title and category support.

## Value Proposition

A Russian family gets one map showing a child's phone, a parent's phone, a lost hardware tag, and a Garmin watch - with a shared SOS, a shared geofence, and a battery cost low enough that nobody turns tracking off at night.

## Target Users

- Russian families tracking children, parents or elderly relatives on a single shared map.
- Russian fleet operators with mixed iOS / Android / hardware-tag devices.
- Russian individual users who want a 'find my stuff' service for phone, watch, keys and bag.

## Jobs To Be Done

1. **Functional job** - See every device belonging to my account on one map without juggling apps.
2. **Emotional job** - Stop worrying that a low-battery phone will not be findable.
3. **Social job** - Be the family member who set this up, not the one who nagged.

## Success Metrics

- **Battery:** = 80% of users report they did not turn tracking off for battery reasons after 30 days.

## Competitive Landscape

- **Find My (Apple) / Find My Device (Google)** - vendor-locked; cannot track the other vendor.
- **Life360 / Glympse** - cross-platform but foreign payment processors; data-residency question for RU users.
- **Tile / AirTag** - hardware tag only; no cross-platform picture.

## Risks & Open Questions

- See PLAN.md Risks for the technical / operational risks.
- [ ] Confirm pricing model and WTP signal in user interviews before MVP launch.
- [ ] Validate country-specific compliance (data, payments, content) before MVP launch.

---

_Source:_ ProblemHunt (manual capture) · **Category:** other · **Tags:** Other
