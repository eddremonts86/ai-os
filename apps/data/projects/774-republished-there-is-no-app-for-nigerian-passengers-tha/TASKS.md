---
id: "774"
slug: republished-there-is-no-app-for-nigerian-passengers-tha
title: "Republished: There is no app for Nigerian passengers that shows the real-time flight status and helps claim compensation for delays and cancellations."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/legal/rdydysy711-republished-there-is-no-app-for-nigerian"
category: legal
date: "2026-01-26"
tags: [Legal, Travel, Other]
country: Nigeria
tech: [Flutter, Dart, Firebase Firestore, Cloud Functions, AviationStack, NCAA rule table, Sentry]
---
# Republished: There is no app for Nigerian passengers that shows the real-time flight status and helps claim compensation for delays and cancellations.

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/774-republished-there-is-no-app-for-nigerian-passengers-tha/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Stand up Flutter + Dart + Firebase Firestore + Cloud Functions
- [ ] Build the flight search surface for Nigerian airport codes and airline+flight number combinations
- [ ] Implement the per-flight watchlist entry in Firestore with subscription state per row
- [ ] Wire the AviationStack upstream feed with a background-trigger refresh cadence per departure horizon
- [ ] Add the freshness indicator in the UI and the offline last-known status with 'last sync' timestamp
- [ ] Implement threshold-based push notifications through Firebase Cloud Messaging with deep links
- [ ] Build the server-side NCAA rule table with editorial refresh on a team-owned cadence
- [ ] Add the eligibility-check function with plain-language output and rule citation
- [ ] Implement the pre-filled claim draft with the flight record, the passenger profile, and the rule citation
- [ ] Add the per-airline submission envelope per supported airline with acknowledgement capture
- [ ] Build the claim-history view with submitted, acknowledged, paid, and declined states and supporting artefact storage
- [ ] Implement the multi-flight watchlist with per-flight notification toggles and configurable thresholds
- [ ] Add Sentry error reporting across the mobile client and Cloud Functions
- [ ] Write an integration test that exercises a flight search, a status-change push notification, an eligibility check, a claim draft, and a submitted claim with acknowledgement capture

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-18_
