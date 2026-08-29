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

## Tech Stack

- **Flutter with Dart** for the cross-platform mobile client, chosen because the app is mobile-first and a single Flutter codebase covers iOS, Android, and the lite web surface a passenger may open from a browser.
- **Firebase Firestore** as the primary store for flight watchlists, claim drafts, and claim-history rows, because a passenger travelling on Nigerian mobile data needs an offline-tolerant read path and Firestore's local persistence is well suited.
- **Cloud Functions** for the eligibility-check logic and the per-claim submission envelope, because the rule logic is server-side and the airline-submission step runs on a transactional surface.
- **AviationStack** as one real-time flight-status feed, chosen because the source names no feed preference and AviationStack is one of the broader general flight-status feeds with coverage in West Africa.
- **NCAA rule table** stored server-side in Firestore for the published passenger-rights rules that the eligibility check references, because the eligibility check has to reflect the current published rules and not invent its own.
- **Sentry** for error reporting across the mobile client and the Cloud Functions, because a passenger using the app on Nigerian 3G needs reliable error reporting to keep the team honest about failures.

## Architecture

The passenger searches for a flight by Nigerian airport code (LOS, ABV, PHC, etc.) or by airline plus flight number. The search hits a Cloud Function that maps the input to a flight record in the upstream AviationStack feed and creates a watchlist entry in Firestore. The watchlist entry is the passenger's per-flight record and is the unit of subscription for push notifications. A background-trigger refresh of the upstream feed runs every minute for flights within 24 hours of departure and every five minutes for flights further out, with the freshness visible to the passenger in the UI.

When a status change exceeds the passenger's configured threshold (default: 30 minutes of new delay, cancellation, or gate change), a push notification is dispatched through Firebase Cloud Messaging. The notification carries the tracked flight id, the new status, and a deep link back into the flight's detail screen. Offline, the app shows the last-known status with a 'last sync' timestamp; the freshness indicator is part of the trust surface, not hidden behind a spinner.

The eligibility-check function is a server-side piece that compares the flight's actual state against the NCAA rule set published in the rule table. The rule table is updated by an editorial process that reads the NCAA publication and refreshes the table on a cadence the team owns. The eligibility output is 'claim possible with reason' or 'no claim under current rules', and the wording the passenger sees is plain language rather than a rule number. A claim confirmed possible generates a pre-filled draft with the flight record, the passenger's stored profile, and the rule citation; the passenger adds the narrative and any supporting evidence.

The claim-submission step is airline-specific. Cloud Functions handle the per-airline submission envelope (a structured file the airline accepts, formatted against the airline's published claim format), and the airline's acknowledgement is recorded in Firestore with a timestamp. The claim-history view shows submitted, acknowledged, paid, and declined states per claim, and the supporting artefact (the submitted envelope and any acknowledgement) is stored against the claim id.

## Milestones

1. **M1 — Flight search and watchlist** — Search by Nigerian airport codes and airline+flight number; watchlist creation; per-flight subscription record in Firestore.
2. **M2 — Real-time feed and freshness** — AviationStack feed integration; background-trigger refresh cadence; freshness indicator in the UI; offline last-known status with timestamp.
3. **M3 — Push notifications** — Threshold-based push notifications through Firebase Cloud Messaging with deep links into the flight detail screen.
4. **M4 — NCAA rule table and eligibility** — Server-side rules table fed from the NCAA publication; eligibility-check function with plain-language output.
5. **M5 — Claim draft** — Pre-filled draft using the flight record, the passenger profile, and the rule citation; passenger narrative and evidence fields.
6. **M6 — Claim submission and history** — Airline-specific submission envelopes; per-claim submission state in Firestore with acknowledgement timestamps; claim-history view.
7. **M7 — Multi-flight watchlist polish** — Multi-flight watchlist with per-flight subscription state and push notification toggle per flight.

## Risks

- **NCAA rule drift** — eligibility that drifts away from the current published rules is unfit; the rule table has to be refreshed on a cadence the team owns, with version visibility.
- **Feed freshness honesty** — the app's status depends on the upstream feed; freshness must be visible to the passenger rather than implied by a happy UI.
- **Airline submission envelope variance** — every airline publishes a different submission format; the per-airline adapter is owned by someone who knows the format, not inferred.
- **NDPR compliance** — Nigerian passenger data is governed by NDPR; retention settings and account deletion have to be visible and effective.
- **Offline-record lifetime** — the app on poor airport connectivity has to show the last-known status with a 'last sync' timestamp, not a stale look presented as current.
- **Claim-success fee transparency** — the claim fee has to be presented before the claim is initiated; a fee structure that surprises the passenger is unfit.
- **Push notification fatigue** — a passenger who tracks many flights could be over-notified; per-flight notification toggle and a configurable threshold are not optional.
- **Republished gap durability** — the post's 'Republished' signal means the gap has lasted; a launch that only does information and not claims (or vice versa) leaves the durability intact.
