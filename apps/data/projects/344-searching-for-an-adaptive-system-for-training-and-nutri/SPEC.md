---
id: "344"
slug: searching-for-an-adaptive-system-for-training-and-nutri
title: Searching for an adaptive system for training and nutrition that helps overcome plateaus and is resilient to schedule disruptions
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/fitness/5x163so5m1-searching-for-an-adaptive-system-for-tra"
category: fitness
date: "2025-10-29"
tags: [Fitness, Food]
country: Russia
tech: [Next.js, Postgres + TimescaleDB, OpenAI API, Apple HealthKit / Google Fit, Telegram Bot API]
---
# Searching for an adaptive system for training and nutrition that helps overcome plateaus and is resilient to schedule disruptions

## Problem

A Russian lifter / runner who has been training for 6-18 months hits a plateau: weight, pace, or strength stops moving despite continued effort. The standard advice - eat less, add a de-load, change the split - is generic and assumes a controlled schedule the user doesn't have: travel, business trips, illness, family. The poster wants an adaptive training and nutrition system that responds to plateaus and to real-world schedule disruptions, not just calendar-driven plans.

## Objective

Ship an adaptive training-and-nutrition system that detects a plateau in the first 10-14 days of stalled progress, suggests a specific corrective block (calorie cycle, deload, swap of lift), and reshapes the week around a travel or illness event instead of breaking the streak.

## Target Users

- Russian intermediate lifters / runners who have plateaued and want a corrective block, not a generic program.
- Russian professionals with unpredictable schedules who need a plan that reshapes around travel and illness, not a calendar.
- Russian-language coaching clients who already log in Strava / Apple Health / Hevy and want their data integrated.

## MVP Scope

- Wearable / app ingest: Apple HealthKit, Google Fit, Strava, Hevy, or manual log.
- Adaptive training engine: weekly plan that re-shapes on missed sessions and travel events.
- Plateau detector: 10-14 days of stalled metric (weight, pace, strength) triggers a corrective block.
- Corrective block library: deload week, calorie cycle, lift-swap, intensity redistribution.
- Adaptive nutrition engine: calorie target shifts with training load and weight trend, <= +/-10% per week to avoid metabolic whiplash.
- Telegram bot: 'week 6: plateau detected, deload week 7, travel shift to Mon-Fri'.
- Coach view (v1.5): one coach overseeing 10-30 clients.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/fitness/5x163so5m1-searching-for-an-adaptive-system-f` follows the constraints in `344-.../SPEC.md` and the chosen stack (Next.js, Postgres + TimescaleDB, OpenAI API). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Russia.

For Russia, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Plateau detector rules are deterministic (a moving-window with a defined hysteresis), not a black-box ML.
- Nutrition target changes documented with a one-line reason the user can read.
- Operates on RU + EN UI; timezone-aware for travel reshapes.
