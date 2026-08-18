---
id: "351"
slug: its-not-possible-to-automatically-create-a-diet-plan-fr
title: "It's not possible to automatically create a diet plan from video recipes"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/food/yby468h0g1-its-not-possible-to-automatically-create"
category: food
date: "2025-10-29"
tags: [Food]
country: Russia
tech: [Next.js, Whisper (transcription), OpenAI API (ingredient + nutrition extraction), USDA + Russian food-composition DBs, Postgres]
---
# It's not possible to automatically create a diet plan from video recipes

## Problem

A Russian user who watches cooking videos and wants to eat from them faces a transcription problem: the video shows ingredients in cups and grams the viewer has to estimate, and the nutrition data they need for a diet plan lives behind a paywall. The poster wants the workflow of 'watch a video -> get a usable weekly diet plan' to be one action, not twenty.

## Objective

Ship a video-to-diet-plan generator that takes a list of cooking videos (Russian or English), extracts ingredients and quantities, normalizes them to grams and to a nutrition database, and produces a 7-day diet plan template the user can edit and follow with portion adjustments.

## Target Users

- Russian home cooks who learn from YouTube cooking channels and want the daily plan to follow.
- Russian nutritionists preparing client meal plans from video-recipe catalogues.
- Russian-speaking fitness clients who want a coach-grade weekly plan that uses the recipes they already like.

## MVP Scope

- Video input: list of 1-20 YouTube / VK Video / Rutube links per week.
- Audio transcription via Whisper (RU + EN).
- Ingredient + quantity extraction: normalized to grams, with 'to taste' and pinch as flag-not-value.
- Nutrition lookup: USDA + Russian food-composition database; missing-nutrient fallback.
- 7-day plan template: uses extracted recipes as the spine; daily macros within user-supplied target band.
- Portion adjustments per user (kcal target, protein target, allergies).
- Output: editable daily plan + printable grocery list.
- No supplement or clinical-advice layer in v1.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/food/yby468h0g1-its-not-possible-to-automatically-cre` follows the constraints in `351-.../SPEC.md` and the chosen stack (Next.js, Whisper (transcription), OpenAI API (ingredient + nutrition extraction)). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Russia.

For Russia, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Ingredient normalization uses canonical grams; non-gram measurements are flagged for manual confirm.
- Nutrition values from a primary DB with provenance citation per food.
- Clinical disclaimer on the diet-plan output; not a substitute for a registered dietitian.
