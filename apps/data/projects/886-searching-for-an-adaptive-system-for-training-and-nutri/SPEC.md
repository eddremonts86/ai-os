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

## Problem

Vadim has trained seriously for over a year to gain mass. The first few months showed visible progress; now the weights are not increasing and the muscles are not growing, even though he keeps going to the gym regularly. His own summary of the state: spending time and effort without any tangible return, and it is demotivating. He describes the plateau as a constant background condition rather than a one-off setback — every failed workout where he cannot add a single set or repetition confirms to him that the problem is systemic and not going away. He knows the theory and names it as the "golden triangle": a perfect training plan, a caloric surplus, and eight hours of sleep. His diagnosis of why that theory fails is the real problem statement: in real life it is almost impossible to follow. A business trip, a mild cold, a work deadline, and suddenly a meal is missed, an hour of sleep is lost, a workout is skipped. The entire fragile routine collapses and getting back on track is hard. As he puts it, there is no system that helps adapt to life's interruptions. He currently spends about 6,000 RUB ($75) a month on gym membership, basic sports nutrition and vitamins, and says a solution that gets him out of this dead end is worth more than his current expenses.

## Objective

Build a training and nutrition system whose first-class input is disruption: when a trip, an illness or a deadline breaks the plan, it recalculates the next weeks rather than expecting the user to resume a schedule that no longer fits — and when progress stalls without disruption, it changes the programme instead of asking for more consistency.

## Target Users

- Primary: self-coached lifters a year or more into serious training who have plateaued and whose plans keep collapsing against work and life. Vadim is the archetype: knows the theory, trains regularly, gets no return.
- Secondary: people in the same position who travel or work irregular hours, for whom a fixed weekly template is broken by design rather than by failure of will.
- Tertiary: returning trainees restarting after an illness or a long break, who face the same problem in its acute form — the plan they had no longer matches the body they have.

## MVP Scope

- Disruption logging as a primary action, not a settings screen: missed workout, missed meals, short sleep, illness, travel. Each one is an input the plan responds to.
- Plan recalculation on disruption: after a break the next sessions adjust load and volume instead of resuming where the schedule left off.
- Plateau detection from logged training data: consecutive sessions with no added set, repetition or weight, which is exactly how he describes recognising it.
- Programme change when a plateau is detected — a deliberate variation in volume, intensity or exercise selection, with the reason stated in one line so it does not read as a random shuffle.
- Nutrition targets that flex with what actually happened: a missed meal adjusts the day rather than being marked as a failure, since the caloric surplus is the part real life breaks first.
- Sleep as an input to load, not a separate wellness metric, since he names eight hours of sleep as one of the three legs and lost sleep as one of the first things to go.
- A short weekly review showing what changed in the plan and why.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The reference price is his current spend: about 6,000 RUB ($75) a month on gym, sports nutrition and vitamins, and he says the solution is worth more than that. He does not name a figure for the app itself, so the ceiling is inferred from that comparison and no software price may be attributed to him.
- Logging must survive a bad week. If recording a missed meal or a skipped workout takes effort, the user stops logging precisely when the adaptation logic needs the data most — and that is the week the product exists for.
- Adaptation must be explainable. A plan that silently changes reads as arbitrary and destroys the trust of someone already demotivated by a year of effort without return.
- This is training and nutrition guidance for a healthy adult, not medical advice. Illness as an input needs conservative handling and clear boundaries.
- Plateau causes are ambiguous from logged data alone: insufficient surplus, insufficient recovery, insufficient stimulus and measurement error all look similar. The system has to reason under that ambiguity or it will confidently prescribe the wrong fix.
- No food logging burden beyond what he already tolerates. He never mentions tracking meals in detail, and requiring it would replace one collapsing routine with another.

## Out of Scope

- A social feed, challenges or leaderboards. Nothing in his account asks for them, and his problem is structural, not motivational.
- Coach marketplace or human programming. He is looking for a system.
- Body-composition scanning or photo analysis. He describes stalled weights and reps, not appearance tracking.
