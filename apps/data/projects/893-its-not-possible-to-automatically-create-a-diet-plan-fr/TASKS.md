---
id: "893"
slug: its-not-possible-to-automatically-create-a-diet-plan-fr
title: "It's not possible to automatically create a diet plan from video recipes"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/food/yby468h0g1-its-not-possible-to-automatically-create"
  captured: "2025-10-16"
category: food
date: "2025-10-16"
tags: [Food]
country: Russia
wtp:
  raw: "500 rubles ($6) per month"
  currency: USD
  period: month
  min: 6
  max: 6
  mrrMid: 6
tech: [Web (TypeScript/React), YouTube + TikTok transcript extractor, OpenAI or Anthropic API for recipe extraction + ingredient parsing, PostgreSQL, Node.js API (TanStack Start)]
---
# It's not possible to automatically create a diet plan from video recipes

## Phase 0: Scaffold

- [x] Capture problem from ProblemHunt + write SPEC.md skeleton
- [ ] Define DESIGN.md (URL-paste list, plan grid, shopping-list panel, export views)
- [ ] Lock the recipe-extraction prompt and the ingredient-normalisation rules
- [ ] Validate the $6/month unit-economics model (LLM cost per recipe + storage + support)
- [ ] Provision PostgreSQL + TanStack Start server functions + Stripe billing
- [ ] Decide the TikTok extractor strategy (third-party API vs captcha-vendor fallback)

## Phase 1: Core

- [ ] URL-paste list accepting 1–N YouTube + TikTok video URLs per planning session
- [ ] YouTube transcript ingest + LLM extraction → structured recipe (title, short description, ingredients with quantities + units, instructions)
- [ ] Ingredient normaliser: ≥ 80% of the 50-recipe fixture dedupes correctly without an LLM slot
- [ ] 3-day plan grid: breakfast / lunch / dinner × 3 days; drag recipes into slots
- [ ] Combined shopping list: deduplicated ingredients, summed quantities where the unit matches, grouped by aisle / category
- [ ] Export: plain text, Markdown checklist, printable HTML view
- [ ] Every recipe card surfaces the original video link so the product is a viewer-routing tool, not a content-scraper
- [ ] TikTok extractor: ≥ 90% success on a 100-URL fixture; manual-fallback path for the failures (user enters ingredients manually, the rest of the plan keeps going)
- [ ] Free tier: one 3-day plan per week; paid tier: $6/month with annual lock at $4/month
- [ ] End-to-end test: paste 5 YouTube URLs → 5 structured recipes render → drag 6 into the 3-day grid → shopping list dedupes + groups → export to Markdown

## Phase 2: Deploy

- [ ] Pilot with 100 paying users in Russia + 50 in EU/US; measure activation, time-to-plan, extraction accuracy, free-to-paid conversion
- [ ] Revisit region pricing if the $6 ceiling does not close US / EU unit economics
- [ ] Add a "creator credit" page that lists the channels whose videos the pilot cohort used, with opt-in links back to the originals
- [ ] Post-pilot retrospective at week 18: revisit TikTok extractor reliability, ingredient-normalisation accuracy, the $6 ceiling, and the viewer-routing vs content-scraping boundary
