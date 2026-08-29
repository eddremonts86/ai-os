---
id: "888"
slug: universal-tracking-service-for-all-mobile-devices
title: Universal tracking service for all mobile devices
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/other/kiv6i361e1-universal-tracking-service-for-all-mobil"
category: other
date: "2025-10-22"
tags: [Other]
country: Russia
tech: [Native iOS (Swift, FindMy + CoreLocation background modes), Native Android (Kotlin, Fused Location Provider + foreground service), React + TypeScript admin dashboard, Postgres + Drizzle ORM, Coolify, Stripe metered billing]
---
# Universal tracking service for all mobile devices

## Phase 0: Scaffold

- [x] Capture problem from ProblemHunt + write SPEC.md skeleton
- [ ] Define DESIGN.md (map view, device list, ring action, recovery confirmation modal)
- [ ] Provision Coolify project + Docker image + Postgres + APNs / FCM credentials
- [ ] Wire Resend email-link auth (single account per user, multiple devices per account)
- [ ] Define per-OS background-location strategy and the user-visible trade-off copy
- [ ] Draft privacy policy in plain language covering GDPR, CCPA, and 152-FZ

## Phase 1: Core

- [ ] iOS app (Swift + SwiftUI): registration, CoreLocation background updates, `significantlyChangesOnBattery`, foreground ping on demand
- [ ] Android app (Kotlin + Compose): registration, Fused Location Provider, foreground service with the correct Android 14/15 classification, WorkManager periodic sync
- [ ] React + TypeScript web dashboard: Mapbox or Leaflet map, device list with battery + online status, last-known location
- [ ] Backend API (Node.js): `/api/pings` ingest, `/api/devices` CRUD, `/api/locate` action that issues APNs / FCM high-priority push
- [ ] "Locate now" action: high-priority push → fresh ping → map updates within 60 s
- [ ] "Ring" action: plays a loud tone for 30 s even on silent (where the OS allows)
- [ ] Stripe metered billing: $2 per successful recovery, with the success criteria being (a) a fresh ping arrived within 60 s of "Locate now" AND (b) the user marked it as a recovery
- [ ] 30-day cooldown per device on the per-recovery fee; visible in the UI before the user marks a recovery
- [ ] Data export + deletion endpoints for GDPR / CCPA / 152-FZ
- [ ] Free tier: unlimited devices, last-known location, ring, basic dashboard — no time limit
- [ ] End-to-end test: register iOS device + Android device under one account, "Locate now" on each, mark one as recovered, verify Stripe charge on the recovered one and no charge on the other, verify 30-day cooldown blocks a second charge

## Phase 2: Deploy

- [ ] Submit iOS app to the App Store (background-location usage description, privacy nutrition labels)
- [ ] Submit Android app to Play Store (foreground-service type justification, data-safety form)
- [ ] Move Stripe to live mode
- [ ] Onboard 200 pilot users across mixed-OS households (at least 30% with both iOS and Android registered)
- [ ] Weekly recovery-rate + satisfaction review with the pilot cohort for 8 weeks
- [ ] Set up status page + per-OS background-restriction monitoring (Apple / Google release notes)
- [ ] Post-mortem after week 19; decide v2 scope (Pro tier with geofence alerts and location history, family / multi-user workspaces, regional data residency for Russian users)
