---
id: "346"
slug: universal-tracking-service-for-all-mobile-devices
title: Universal tracking service for all mobile devices
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/other/kiv6i361e1-universal-tracking-service-for-all-mobil"
category: other
date: "2025-10-29"
tags: [Other]
country: Russia
tech: [React Native (background service), Native iOS (Significant Location Change) + Android (Fused Location Provider), Apple Push + FCM, Postgres + TimescaleDB, Telegram Bot API]
---
# Universal tracking service for all mobile devices

## Phase 0: Scaffold

- [ ] Read the source at `https://problemhunt.pro/en/other/kiv6i361e1-universal-tracking-service-for-all-mobil` and quote the original problem statement into a `source-quote.md` for traceability.
- [ ] Create the project folder under `apps/346-universal-tracking-service-for-all-mobil/` (or per the chosen deployment target).
- [ ] Initialize git, pin dependencies for: React Native (background service), Native iOS (Significant Location Change) + Android (Fused Location Provider), Apple Push + FCM, and confirm versions resolve in CI.
- [ ] Write DESIGN.md with country-appropriate defaults (`country: Russia`) — color, type, density, motion tokens — not the global default.
- [ ] Scaffold the auth + persistence layer with data-residency configured for Russia.
- [ ] Set up the framework router, server actions, and a typed API client for the read/write endpoints listed in PLAN.md.
- [ ] Author the schema migrations named in PLAN.md and seed at least one realistic fixture for the {country} locale.
## Phase 1: Core

- [ ] iOS app with Significant Location Change + background fetch
- [ ] Android app with Fused Location Provider, foreground + background service
- [ ] Garmin + Wear OS companion apps: location from phone
- [ ] Hardware tag: BLE, last-seen uploaded on phone pass
- [ ] Shared map view with geofence alerts and SOS long-press
- [ ] Telegram bot + push alert routing
- [ ] Privacy gates: explicit per-device consent flow, RU data-residency only
- [ ] Pilot with 200 RU families and 5 RU fleet operators over 60 days

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (React Native (background service), Native iOS (Significant Location Change) + Android (Fused Location Provider), Apple Push + FCM) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 346-universal-tracking-service-for-all- MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in Russia completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for React Native (background service), Native iOS (Significant Location Change) + Android (Fused Location Provider), Apple Push + FCM errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
