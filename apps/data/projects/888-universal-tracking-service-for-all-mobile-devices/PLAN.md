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

## Tech Stack

- **iOS app:** Swift + SwiftUI; CoreLocation with `allowsBackgroundLocationUpdates` + `significantlyChangesOnBattery` for low-power background updates; integrates with Find My where possible to leverage the device-to-device ping network.
- **Android app:** Kotlin + Jetpack Compose; Fused Location Provider + foreground service with the appropriate classification for Android 14/15 background restrictions; WorkManager for periodic sync.
- **Web dashboard:** React + TypeScript SPA served from a single Coolify instance behind Docker; Mapbox or Leaflet for the map view.
- **Backend API:** Node.js + TanStack Start (or Hono) server functions; Postgres via Drizzle ORM for users, devices, location pings, and recovery events.
- **Auth:** email-link (Resend) passwordless; single account per user, multiple devices per account.
- **Billing:** Stripe metered billing for per-recovery fees; webhook updates `Recovery.chargedAt`; a 30-day cooldown per device prevents double-charge.
- **Compliance:** data export + deletion endpoints for GDPR / CCPA / 152-FZ; Russian users can opt into a regional data store (out of scope for v1 unless required by pilot).

## Architecture

The web dashboard authenticates the user and renders the map; device pings arrive via HTTPS from the native apps and are stored in `location_pings` with a per-device partition key. A "Locate now" action issues a high-priority push to the target device via APNs / FCM; the native app responds with a fresh ping if the OS allows. A "successful recovery" is a ping that arrived within 60 seconds AND the user marked it as a recovery in the dashboard; only then does the per-recovery fee charge.

```
iOS / Android device ─▶ HTTPS ping ─▶ /api/pings
                                              │
                                              └─▶ Postgres location_pings (per-device)

Web dashboard ─▶ "Locate now" ─▶ APNs/FCM high-priority push ─▶ device wakes
                                                                     │
                                                                     └─▶ fresh ping ─▶ /api/pings

                              ◀────────────── map updates ──────────┘

Dashboard ─▶ "Mark as recovered" ─▶ Stripe metered charge ($2 per recovery)
                                              │
                                              └─▶ 30-day cooldown per device
```

## Milestones

1. **M0 — Spec + design freeze.** SPEC.md, DESIGN.md, per-OS background-location strategy approved. End of week 1.
2. **M1 — iOS app + dashboard.** Swift app with registration, location reporting, foreground ping; React dashboard with map and device list. End of week 4.
3. **M2 — Android app + dashboard.** Kotlin app with Fused Location Provider + foreground service; same dashboard. End of week 7.
4. **M3 — Locate now + Ring.** APNs / FCM high-priority push, fresh ping flow, ring action for both OSes. End of week 9.
5. **M4 — Pay-per-recovery.** Stripe metered billing, 30-day cooldown, success criteria (fresh ping + user mark), recovery dashboard. End of week 11.
6. **M5 — Pilot.** 200 users across mixed-OS households; weekly recovery-rate + satisfaction review. End of week 19.

## Risks

- **iOS background-location rejection.** Apple has tightened background-location policies repeatedly; if the app is rejected or restricted, the iOS experience degrades to "last-known location only" and the recovery metric drops. Mitigation: ship the app with the most conservative background-location usage description and have an App Store review appeal template ready.
- **Android 14 / 15 foreground-service classification.** Android's foreground-service type rules change frequently; using the wrong classification (e.g., `location` vs. `specialUse`) leads to Play Store rejection or runtime crashes. The v1 launch must pin to the Android 14 / 15 documented classification and add a regression test.
- **Per-recovery cooldown gaming.** A user could mark a ping as a recovery to avoid the cooldown, then mark another ping a day later; the platform must use the timestamp of the "Locate now" action (not the ping arrival) for cooldown, with a 60-second freshness window visible in the UI.
- **Cross-border data residency.** Russian users' location data may be subject to 152-FZ; if a Russian user signs up and the platform stores their data outside Russia, there is a regulatory exposure. v1 default is single-region storage with a documented data-residency roadmap.
- **Battery drain perception.** Continuous background location is the first thing reviewers complain about in app-store reviews; the iOS / Android apps must use `significantlyChangesOnBattery` and motion-triggered updates rather than continuous high-frequency polling, and the trade-off must be visible in the onboarding.
- **Pay-for-result trust.** The "we charge only on a successful recovery" promise is load-bearing; if a user is ever charged for a ping they did not mark as a recovery, trust evaporates and refund requests spike. The success criteria must be transparent and the cooldown must be enforced on the platform side, not the client's.
