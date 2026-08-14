---
id: "351"
slug: its-not-possible-to-automatically-create-a-diet-plan-fr
title: "It's not possible to automatically create a diet plan from video recipes"
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/food/yby468h0g1-its-not-possible-to-automatically-create"
category: food
date: "2025-10-29"
tags: [Food]
country: Russia
tech: [Next.js, Whisper (transcription), OpenAI API (ingredient + nutrition extraction), USDA + Russian food-composition DBs, Postgres]
---
# It's not possible to automatically create a diet plan from video recipes

## Phase 0: Scaffold

- [ ] Read the source at `https://problemhunt.pro/en/food/yby468h0g1-its-not-possible-to-automatically-create` and quote the original problem statement into a `source-quote.md` for traceability.
- [ ] Create the project folder under `apps/351-it-s-not-possible-to-automatically-creat/` (or per the chosen deployment target).
- [ ] Initialize git, pin dependencies for: Next.js, Whisper (transcription), OpenAI API (ingredient + nutrition extraction), and confirm versions resolve in CI.
- [ ] Write DESIGN.md with country-appropriate defaults (`country: Russia`) — color, type, density, motion tokens — not the global default.
- [ ] Scaffold the auth + persistence layer with data-residency configured for Russia.
- [ ] Set up the framework router, server actions, and a typed API client for the read/write endpoints listed in PLAN.md.
## Phase 1: Core

- [ ] Video input: paste 1-20 YouTube / VK / Rutube links per week
- [ ] Whisper transcription (RU + EN) with manual transcript fallback
- [ ] Ingredient + quantity extraction normalized to grams; 'to taste' flagged
- [ ] Nutrition lookup: USDA + Russian food-composition DB; missing-nutrient fallback
- [ ] 7-day plan template with daily macros within user target band
- [ ] Editable plan + printable grocery list
- [ ] Pilot with 50 Russian home cooks and 5 nutritionists across 30 days

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Next.js, Whisper (transcription), OpenAI API (ingredient + nutrition extraction)) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 351-it-s-not-possible-to-automatically- MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in Russia completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Next.js, Whisper (transcription), OpenAI API (ingredient + nutrition extraction) errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
