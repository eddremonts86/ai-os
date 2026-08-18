---
id: "306"
slug: gps-based-taxi-and-delivery-solution-for-zimbabwe
title: GPS-based taxi and delivery solution for Zimbabwe
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/logistics/qkqb82u8i1-gps-based-taxi-and-delivery-solution"
category: logistics
date: "2025-11-12"
tags: [Logistics, Mobility, Other]
country: Zimbabwe
tech: [Next.js, TypeScript, Postgres, Expo React Native, Mapbox Directions API, EcoCash, Hetzner]
---
# GPS-based taxi and delivery solution for Zimbabwe

## Phase 0: Scaffold

- [x] Capture problem from ProblemHunt + write SPEC.md skeleton
- [ ] Define DESIGN.md (customer map screen, driver trip card, dispatcher board)
- [ ] Provision Hetzner VPS + Postgres + Coolify reverse proxy
- [ ] Wire Mapbox account + EcoCash / OneMoney sandbox credentials
- [ ] Decide on auth: phone OTP via SMS for both sides

## Phase 1: Core

- [ ] Customer signup: phone OTP, name, default pickup pin (home)
- [ ] Customer booking flow: pickup pin → drop-off pin → fare estimate → book
- [ ] Driver signup: phone OTP, vehicle details, document upload (license, insurance)
- [ ] Driver app: incoming trip card, accept / decline, navigation, mark arrived / started / completed
- [ ] Trip state machine in Postgres with explicit transitions
- [ ] WebSocket channel for live driver location pings; customer app subscribes for the map
- [ ] EcoCash + OneMoney payment integration: customer fare, webhook confirms
- [ ] Driver payout queue: T+1 settlement to driver EcoCash / OneMoney
- [ ] Dispatcher console: list of unaccepted trips > 90s, manual reassign
- [ ] Trip receipt emailed to customer; basic driver rating
- [ ] End-to-end test in Harare: 50 trips, 20 drivers, measure ETA accuracy

## Phase 2: Deploy

- [ ] Recruit 50 launch drivers in Harare with a guaranteed minimum daily earnings promo
- [ ] Soft launch in 2 Harare zones, then expand city-wide
- [ ] Bulawayo pilot in week 9
- [ ] Coolify-side deployment of the backend
- [ ] Status page + EcoCash / OneMoney webhook monitoring
- [ ] Post-mortem after week 10 with the launch cohort
