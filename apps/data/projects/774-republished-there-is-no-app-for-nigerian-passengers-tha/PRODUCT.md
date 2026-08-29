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

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

One app for Nigerian passengers that shows real-time flight status for any flight in or out of Nigerian airports, and that pairs each tracked flight with an NCAA-shaped compensation claim the passenger can file in the app when a delay or cancellation qualifies. The information half and the recovery half live in one product, so a passenger who learns about a delay early can begin a claim with the right evidence rather than discovering the situation at the gate.

The ProblemHunt capture names no price, no airline, and no NCAA scheme detail. The category is Legal and the tags are Legal, Travel, Other, which the plan reads as a signal that the post treats this as a passenger-rights problem in the travel domain, not a flight-tracking product alone.

**One-liner:** A flight-status and compensation-claim app for Nigerian passengers, in one screen: real-time tracking on one side, NCAA-shaped claim filing on the other.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Nigerian passenger whose flight is delayed or cancelled | Real-time status from anywhere, plus a compensation-claim path they can actually use. |
| Passenger whose flight qualifies for NCAA-published compensation | A pre-filled claim draft and a submission envelope rather than a counter queue. |
| Frequent domestic traveller | One watchlist across upcoming flights, not per-airline surfaces. |
| Passenger with a connection through a Nigerian airport | Status visibility across legs, with push notifications on material changes. |
| Travelling-for-work passenger | The claim artefact is a record that survives the trip for an expense workflow. |

## Jobs To Be Done

1. **Functional job** — Track a flight's real-time status from any Nigerian airport without standing at a counter.
2. **Functional job** — Receive a push notification when a tracked flight's status changes by a material amount.
3. **Functional job** — File an NCAA-shaped compensation claim from the app, with templates and the right evidence, when the flight qualifies.
4. **Functional job** — Maintain a multi-flight watchlist so a frequent traveller sees everything upcoming from one screen.
5. **Emotional job** — Stop feeling that the airline has all the information and the passenger has none.
6. **Social job** — Tell another passenger about a claim that worked, because the post's republished signal shows the gap has lasted and the app's claims working is the word-of-mouth driver.

## Success Metrics

- **Real-time freshness** — median seconds between a status change in the source feed and the status change reflected in the app, because the app's value collapses if the data is stale.
- **Push-notification open rate** — share of material status-change notifications the passenger opens, because the notifications are the surface that makes the information half useful.
- **Claim eligibility check accuracy** — share of eligibility checks where a claim confirmed by NCAA rules is confirmed by the app, since a wrong-confirmation is worse than no check.
- **Claim submission completion** — share of initiated claims that reach a submitted state, since a claim that stalls in draft is the recovery half failing.
- **Claim success rate** — share of submitted claims that are paid by the airline, because the recovery half is genuinely working when claims pay out.

## Pricing & Monetization

The ProblemHunt capture names no price. What the architecture does fix is the cost shape: the flight status half is free and ad-free for the passenger, because the post's missing piece is the information access itself and a paywall on information defeats the gap. A fee is naturally attached to the compensation-claim half — a per-claim fee or a percentage of a paid claim — because that aligns revenue with the moment the app's recovery half actually delivered value, and an unsuccessful claim produces no fee. No specific number is named here because the source names none. The flight status surface does not charge, and the claim surface charges only on success.

## Competitive Landscape

- **Airline apps and airline websites** — offer status for the airline's own flights, not for any flight in or out of the country's airports, and do not address compensation at all.
- **Generic global flight trackers** — offer status but do not address NCAA-shaped claims, because NCAA is not a global scheme and the global tracker has no jurisdiction-aware claim path.
- **Manual counter-queue plus templated letters** — what the passenger currently defaults to, where the airline has all the information and the claim path is informal.

The capture names no competitor by name and no industry figure, so no further names or market-size figures are claimed here.

## Risks & Open Questions

- [ ] Confirm the NCAA rules version used by the eligibility check, because eligibility that drifts away from the current published rules is worse than no check.
- [ ] Confirm the real-time feed's licensing and rate limits, since pretending to be more current than the upstream feed is unfit.
- [ ] Decide the airline-by-airline submission envelope path, because a uniform API does not exist across airlines.
- [ ] Confirm the app's data footprint under Nigeria Data Protection Regulation, including retention settings and account deletion.
- [ ] Decide the offline-record lifetime so the passenger on poor connectivity still sees the last-known status with a clear timestamp.
- [ ] Confirm the claim-success fee structure is presented before the claim is initiated, because the passenger should see the cost before filing.
