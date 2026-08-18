---
id: "306"
slug: gps-based-taxi-and-delivery-solution-for-zimbabwe
title: GPS-based taxi and delivery solution for Zimbabwe
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/logistics/qkqb82u8i1-gps-based-taxi-and-delivery-solution"
category: logistics
date: "2025-11-12"
tags: [Logistics, Mobility, Other]
country: Zimbabwe
tech: [Next.js, TypeScript, Postgres, Expo React Native, Mapbox Directions API, EcoCash, Hetzner]
---
# GPS-based taxi and delivery solution for Zimbabwe

## Tech Stack

- **Backend:** Next.js 14 (App Router) API routes + a small FastAPI service for trip-state machine, deployed on Hetzner (closest region with usable latency to Harare).
- **Database:** Postgres for users, drivers, trips, payments ledger.
- **Mobile apps:** Expo React Native, packaged for Android (APK distribution outside Play Store to avoid Zimbabwe store friction) and PWA for low-end Android browsers.
- **Maps:** Mapbox Directions API for routing and ETA; map tiles cached server-side for offline use on the driver app.
- **Payments:** EcoCash and OneMoney APIs for customer fare payment and driver payouts.
- **Real-time:** a thin WebSocket layer (Pusher or self-hosted) for live driver location pings.

## Architecture

A Next.js backend serves the customer app, the driver app, and a dispatcher console. Trip state is a state machine: requested → accepted → en route → arrived → in progress → completed. Driver location pings flow through a lightweight WebSocket channel that the customer app subscribes to for the live map. Payments are confirmed via EcoCash / OneMoney webhooks; the same ledger handles fare receipt and driver payout.

```
Customer app ─┐                                        ┌─▶ EcoCash / OneMoney API
              ├─▶ Next.js + WebSocket ─▶ Postgres ─────┤
Driver app ───┘                          │              └─▶ Driver payout queue
Dispatcher ─▶ Console ───────────────────┘
                                       Mapbox
                                       Directions API
```

## Milestones

1. **M0 — Spec freeze + customer PWA.** Pickup/drop-off pins and a fare estimate on a stub map. End of week 1.
2. **M1 — Driver app + trip state machine.** Driver accepts, navigates, marks arrived / completed. End of week 4.
3. **M2 — EcoCash / OneMoney integration.** Customer pays; driver paid out next morning. End of week 6.
4. **M3 — Dispatcher console + Harare launch.** Manual reassignment when drivers don't accept in 90 seconds. End of week 8.
5. **M4 — Bulawayo pilot.** Same stack in a second Zimbabwean city. End of week 10.

## Risks

- **EcoCash / OneMoney API friction** — both APIs have changed; the integration may stall. Mitigation is a fallback to USSD-based confirmation with a manual driver-side reconcile step.
- **Driver acquisition** — without a critical mass of drivers in a zone, customer wait times balloon; mitigation is a "guaranteed pickup within 5 minutes or half off" launch promo per zone.
- **Map tile cost** — Mapbox charges per tile load; aggressive caching on the driver app is required to keep margins on a low-fare market.
