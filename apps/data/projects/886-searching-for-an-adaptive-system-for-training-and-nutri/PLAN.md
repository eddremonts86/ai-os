---
id: "886"
slug: searching-for-an-adaptive-system-for-training-and-nutri
title: Searching for an adaptive system for training and nutrition that helps overcome plateaus and is resilient to schedule disruptions
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/fitness/5x163so5m1-searching-for-an-adaptive-system-for-tra"
  captured: "2025-10-24"
category: fitness
date: "2025-10-24"
tags: [Fitness, Food]
country: Russia
wtp:
  raw: "currently spends ~6,000 RUB ($75) per month on gym, sports nutrition and vitamins; ready to pay more than that for a solution"
  currency: USD
  min: 75
  max: 75
  period: month
  mrrMid: 75
tech: [Kotlin Multiplatform, Ktor, Postgres, deterministic periodisation rules engine, HealthKit and Google Fit ingestion, RevenueCat]
---
# Searching for an adaptive system for training and nutrition that helps overcome plateaus and is resilient to schedule disruptions

## Tech Stack

- **Kotlin Multiplatform:** the periodisation logic is the product, and it must produce identical plans on iOS, Android and the server. Sharing that engine as one module removes the failure mode where the phone and the backend disagree about what this week's session should be.
- **Deterministic rules engine, not a model:** load progression, deload timing and volume adjustment follow published periodisation logic. This is a choice about explainability — the user is a knowledgeable lifter who has trained for over a year, and a plan change he cannot follow the reasoning of will be dismissed. A rules engine can always state why.
- **Ktor + Postgres:** sessions, sets, disruption events, plan versions and nutrition targets. Plan versions matter: every recalculation is a new version with the triggering event recorded, so the weekly review can show what changed and why rather than presenting a plan with no history.
- **HealthKit and Google Fit ingestion:** sleep is one of the three legs he names, and lost sleep is among the first things to go during a disruption. Reading it passively from what his phone or watch already records avoids adding a logging chore to the worst weeks.
- **Local-first logging with sync:** gym basements have no signal, and a log that fails at the rack is a log that stops being kept.
- **RevenueCat:** subscription handling across both stores, so pricing can be tested without release cycles — necessary because the price itself is unvalidated.

## Architecture

The system is a loop with disruption as a first-class event, and that is the only structural difference from every app that failed him. A **plan version** holds the next weeks of sessions and nutrition targets. Completed sets flow in from the gym log; sleep flows in from the phone; disruptions — missed workout, missed meals, short sleep, illness, travel — are logged with a single tap each.

Two triggers cause the plan to change. A **disruption trigger** fires on a logged interruption: the engine recalculates upcoming sessions from where the body actually is, reducing load and volume proportionally to what was lost, so the user resumes at a point that exists rather than at the point the calendar expected. A **stagnation trigger** fires on the pattern he describes himself — consecutive sessions with no added weight, set or repetition — and produces a deliberate programme variation in volume, intensity or exercise selection.

Every recalculation writes a new plan version with the trigger and the rule that fired attached. The weekly review renders that: what changed, what caused it, in one line each. Nutrition targets recalculate alongside, and a missed meal adjusts the day's remaining targets rather than marking the day failed — because the caloric surplus is the leg of his triangle that real life breaks first.

Ambiguity is handled explicitly. When logged data cannot distinguish insufficient stimulus from insufficient recovery, the engine says which inputs would resolve it instead of picking a fix and asserting it.

## Milestones

1. **M0 — Logging that survives a bad week.** Gym log with local-first sets, one-tap disruption events, passive sleep ingestion. Tested by deliberately logging a broken week. End of week 4.
2. **M1 — Plan versions and the disruption trigger.** Recalculation after a logged interruption, with the reason attached to the new version. End of week 7.
3. **M2 — Stagnation detection.** Plateau identified from consecutive sessions with no added load, set or repetition, matching his own criterion. End of week 9.
4. **M3 — Programme variation.** Rules-driven change in volume, intensity or exercise selection on plateau, each with a one-line explanation. End of week 12.
5. **M4 — Adaptive nutrition targets.** Surplus targets that flex with logged reality, missed meals adjusting the day rather than failing it. End of week 14.
6. **M5 — Weekly review.** The change log a user reads in a minute: what moved, what caused it, what is next. End of week 16.
7. **M6 — Three-month validation.** Run with plateaued lifters through at least one plateau exit and several real disruptions, measuring recovery and logging survival. End of week 28.

## Risks

- **Plateau cause is underdetermined.** Insufficient stimulus, insufficient surplus, insufficient recovery and simple measurement noise produce similar data. An engine that always names a cause will be wrong regularly, and being wrong to a lifter who already knows the theory ends the trial. Saying "this is ambiguous, here is what would resolve it" is less satisfying and more defensible.
- **The data stops exactly when it is needed.** During a business trip with a deadline and a cold, logging is the first thing to drop. The adaptation engine is then blind during the week it exists to handle. This is the product's central design problem, not a UX detail, which is why M0 addresses it before anything else.
- **Explainability constrains the algorithm.** A model could adapt more subtly than a rules engine, and would not be able to justify itself in one line. For a user already demotivated by a year without return, an unexplained change is indistinguishable from noise — so the more capable option is the wrong one here.
- **Illness sits near medical advice.** It is one of his named disruptions, and any adjustment logic around it must stay conservative and clearly bounded, which limits how much the system can do with the input.
- **Nutrition without logging.** He never mentions tracking meals and requiring it would rebuild the fragile routine that keeps collapsing. That leaves nutrition adaptation working from coarse inputs, which caps its precision honestly rather than pretending otherwise.
- **Price is unknown.** He anchored on $75 a month of gym, supplements and vitamins and said the solution is worth more than that. He did not price the software. Building a business plan on that inference would be reading a number he never gave.
- **Validation takes months.** A plateau is a background state measured in months, and disruption resilience only shows across several real interruptions. There is no fast test, which makes this an expensive thesis to check.
- **One person's framing.** The clarity of the problem statement comes from a single lifter in Russia. Nothing here establishes how many others would describe their plateau the same way.
