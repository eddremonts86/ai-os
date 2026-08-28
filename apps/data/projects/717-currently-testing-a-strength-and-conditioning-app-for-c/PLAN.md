---
id: "717"
slug: currently-testing-a-strength-and-conditioning-app-for-c
title: Currently testing a strength and conditioning app for combat sports
status: draft
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vpxehu/currently_testing_a_strength_and_conditioning_app/"
category: saas
date: "2026-08-16"
---
# Currently testing a strength and conditioning app for combat sports

## Tech Stack

Not stated in the source. The poster is a first-time founder with no prior app experience, so the stack is not something the source signals.

## Architecture

A mobile-first app with three logical pieces:

- Onboarding: questionnaire that captures day-state (sleep, soreness, stress, weight-cut proximity, competition proximity).
- Adaptation engine: takes the day-state + history (strength gains / losses) and produces a workout.
- Tracking: records completed workouts and re-feeds the adaptation engine.

How the adaptation logic is implemented (rules, ML, hybrid) is not stated in the source and should not be invented.

## Milestones

1. M0 — Capture the testing-phase signal: only "a few people testing it", poster has trained jiu-jitsu / Muay Thai / wrestling.
2. M1 — Document the day-state → workout adaptation logic the poster has built (in their own words), without inventing rules.
3. M2 — Treat the cold-launch question (Instagram is not picking up) as the poster's open question; capture community replies.
4. M3 — Do not promote "first-time founder" into a credibility claim — it is a risk signal, not a marketing signal.

## Risks

- First-time-founder risk: no prior app experience increases the chance of scope creep and under-investment in distribution.
- Domain-credentials risk: training and coaching experience is real; no sports-science credentials are claimed in the source.
- Cold-launch risk: the only stated distribution channel (Instagram) is not picking up; do not assume another channel will.
- Adaptation-claim risk: "adapts around strength gains and losses" is asserted but the rule set is not in the source — do not defend it as evidence-based.
