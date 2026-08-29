---
id: "763"
slug: nigerias-transport-trap-uberbolt-too-expensive-okada-to
title: "Nigeria's transport trap: Uber/Bolt too expensive, okada too deadly, Danfo buses a nightmare. Millions need safe, affordable carpooling. Ready to pay."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/transportation/i0p4ciscj1-nigerias-transport-trap-uberbolt-too-exp"
  captured: "2026-02-13"
category: transportation
date: "2026-02-13"
tags: [Transportation, Other]
country: Nigeria
wtp:
  raw: $5–10 per ride
  currency: USD
  min: 5
  max: 10
  period: one-shot
tech: [Flutter (Android-first), Node.js API, PostgreSQL with PostGIS, "USSD fallback via Africa's Talking", Paystack / Flutterwave for cards and bank transfer, Mapbox / OpenStreetMap for routing, driver KYC via BVN + NIN + selfie liveness]
---
# Nigeria's transport trap: Uber/Bolt too expensive, okada too deadly, Danfo buses a nightmare. Millions need safe, affordable carpooling. Ready to pay.

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/763-nigerias-transport-trap-uberbolt-too-expensive-okada-to/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Pick the KYC provider shortlist (Mono, Smile Identity, Dojah) and run a one-week bake-off against 20 known-good and 20 known-bad test cases for BVN + NIN + liveness; pick one
- [ ] Driver KYC flow end-to-end: BVN → NIN → selfie liveness → vehicle papers upload → manual review queue; rejections carry a reason
- [ ] First 50 verified driver-owners onboarded in Lagos with working bank accounts for payouts
- [ ] Flutter Android app: signup, route search (pickup + dropoff), list of active drivers on the corridor with rating and plate, booking confirmation
- [ ] OSRM self-hosted for Lagos corridors (Lekki–Ikeja, Yaba–VI, Surulere–Island); ETAs match observed drive times within ± 15%
- [ ] Paystack + Flutterwave live; rider pays the platform, platform pays the driver per completed seat; per-seat settlement
- [ ] In-app cost split: two riders on the same route see one shared fare split automatically, pay their shares independently
- [ ] In-app SOS button: SMS to two pre-set emergency contacts with live location, plus webhook to a 24/7 call-centre partner
- [ ] Trip recording kept for 7 days post-ride; rider and driver can both flag the trip from history
- [ ] End-to-end test: rider books a shared Lekki–Ikeja ride, two riders split the fare, driver is paid within 24h, SOS button fires correctly on a simulated emergency

## Phase 2: Deploy

- [ ] Scale Lagos pilot to 2,000 active riders and 200 verified drivers
- [ ] Set up status page + Paystack / Flutterwave webhook health alerts
- [ ] Safety incident playbook documented and rehearsed with the call-centre partner before any real launch
- [ ] Equity conversation with the source author (Bidemi Ige Olaosebikan) concluded on its own track, separate from the product
- [ ] Post-mortem after week 16 with pilot cohort and the source author as the named feedback lead
