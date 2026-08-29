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

## Problem

There is no app for Nigerian passengers that shows real-time flight status and helps claim compensation for delays and cancellations; the title explicitly carries a 'Republished' prefix, which is data: this is a re-submission on a problem the post itself treats as durable. The ProblemHunt capture is the title plus the country Nigeria and the tags Legal, Travel, Other; nothing further — so the actor is Nigerian passengers, the pain is the absence of real-time flight information and a compensation-claim path, and the missing piece is one app that does both halves.

The implied problem has two halves. The first is information: in Nigeria the surface for real-time flight status is fragmented across airline websites, airport display boards, and informal channels, and a delayed or cancelled flight is something the passenger often discovers at the gate rather than in advance. The second is recovery: the Nigerian Civil Aviation Authority publishes passenger-rights rules, and a passenger whose flight qualifies for compensation has to navigate claims against the airline with no template and no visible path. The two halves are linked — a passenger who learns about a delay early can begin a claim with the right evidence; a passenger who learns at the gate has lost the early half.

The 'Republished' prefix is the strongest signal that the gap is durable and that a one-shot fix will not satisfy the post. Beyond that title the source names no airline, no specific airport, no NCAA scheme details, and no traveller volume. The plan reasons from the actor (Nigerian passengers), the two missing halves (real-time status and compensation claim), and the republished signal (the gap has lasted), without inventing a route, an airline's record, or a claim frequency.

## Objective

Ship one app that Nigerian passengers can use to track the real-time status of any flight operating in or out of Nigerian airports, and that pairs each tracked flight with an NCAA-shaped compensation claim the passenger can file in the app when a delay or cancellation qualifies. The information half and the recovery half live in one product, in one screen.

## Target Users

- A Nigerian passenger whose flight is delayed or cancelled and who needs the information without standing at a counter.
- A Nigerian passenger whose flight qualifies for NCAA-published compensation and who needs a claim they can actually file in the app, with templates and the right evidence.
- A frequent domestic traveller who tracks several flights a month and would like one app for all of them rather than per-airline surfaces.
- A passenger whose itinerary involves a connection through a Nigerian airport and who needs status visibility across legs.
- A passenger who travels for work and needs the compensation-claim artefact (a successful claim record) as part of an expense workflow with their employer.

## MVP Scope

- A flight search surface that accepts Nigerian airport codes or airline+flight number combinations and returns a tracked flight record.
- A real-time status feed that updates the tracked flight with departure, arrival, gate, and delay or cancellation state, refreshed on a cadence the user can see.
- A push notification triggered when a tracked flight's status changes by a configurable threshold (delay beyond 30 minutes, cancellation, gate change).
- A claim eligibility check that compares the flight's actual state against NCAA-published compensation rules and indicates whether a claim is possible, in plain language.
- A claim draft that the app pre-fills using the flight record and the passenger's stored profile, leaving only the narrative and the supporting evidence for the passenger to add.
- A claim-submission path that files the claim with the airline through a documented submission envelope the airline can verify.
- A claim-history view that shows the status of every claim the passenger has filed (submitted, acknowledged, paid, declined) and stores the supporting artefact.
- A multi-flight watchlist so a frequent traveller can track several upcoming flights from one screen.
- A offline record of the flight's last-known status, so the passenger opening the app on poor airport connectivity still sees what was visible at the time of last sync, with a 'last sync' timestamp.
- A help surface that explains, in plain language, what compensation a passenger can claim and under what circumstances, without the passenger needing to look up NCAA rules themselves.

## Design Direction

See DESIGN.md for this project's design tokens.

## Constraints

- The capture is one sentence plus the country Nigeria and three tags, plus an explicit 'Republished' signal that the post is a re-submission; nothing beyond that is invented here, including airline, airport, route, claim volume, or NCAA scheme details.
- NCAA's published passenger-rights rules are the legal source for compensation eligibility, and the source names no version; the eligibility check has to be implemented against the current published rules, not invented.
- Real-time flight status depends on upstream data feeds that have rate limits and per-airline licensing; the app has to show the feed it is using and its freshness, not pretend to be more current than the feed.
- Compensation claims are filed against airlines, and the actual submission mechanism is airline-specific; the app has to support per-airline submission envelopes because a uniform API across airlines does not exist.
- The passenger is travelling, often on mobile data, and the app's responsiveness on a Nigerian 3G network has to be a design constraint, not a post-launch optimisation.
- Nigerian passenger data handling is governed by Nigeria Data Protection Regulation; the architecture has to support per-passenger data retention controls and a way to delete the account.
- The 'Republished' prefix is a signal that the gap is durable; the app has to be defensible against a passenger who tries it once and finds the app has not earned their ongoing trust.
