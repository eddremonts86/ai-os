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

## Phase 0: Scaffold

- [x] Capture the plateau description, the golden-triangle framing and the current monthly spend from ProblemHunt
- [ ] Kotlin Multiplatform project with the periodisation engine as a shared module
- [ ] Ktor service and Postgres schema: sessions, sets, disruption events, plan versions, nutrition targets
- [ ] Local-first gym logging with background sync for basements without signal
- [ ] Write DESIGN.md (gym log, disruption tap targets, weekly review)
- [ ] HealthKit and Google Fit permission flows for sleep ingestion

## Phase 1: Core

- [ ] Set logging at the rack: weight, reps, sets, in as few taps as possible, offline-first
- [ ] One-tap disruption events: missed workout, missed meals, short sleep, illness, travel
- [ ] Deliberately log a broken week end to end and confirm logging survives it
- [ ] Passive sleep ingestion feeding the recovery input without manual entry
- [ ] Plan versions: every recalculation stored as a new version with its trigger recorded
- [ ] Disruption trigger: recalculate upcoming load and volume from what was actually lost
- [ ] Stagnation detection: consecutive sessions with no added weight, set or repetition
- [ ] Programme variation rules on plateau — volume, intensity or exercise selection — each with a stated reason
- [ ] Ambiguity handling: when the cause cannot be distinguished, name the missing input instead of prescribing
- [ ] Adaptive nutrition targets, with a missed meal adjusting the day rather than failing it
- [ ] Conservative bounds on illness-driven adjustments, with clear non-medical framing
- [ ] Weekly review: what changed, what triggered it, what comes next, in one line each
- [ ] Explanation acceptance capture, so unexplained-feeling changes surface as a defect

## Phase 2: Deploy

- [ ] TestFlight and Play internal testing with plateaued lifters
- [ ] Run three months covering at least one plateau exit and several real disruptions
- [ ] Test pricing against the $75/month reference the source anchored on
- [ ] Verify in production
