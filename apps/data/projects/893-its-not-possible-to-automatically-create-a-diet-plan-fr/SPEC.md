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

## Problem

The ProblemHunt author (Evgeny, Russia) wants to automate creation of his diet plan from recipe videos but cannot find any ready-made solution that does this end-to-end. He needs a system that takes one or more recipe videos, extracts a brief recipe description with cooking instructions, and produces a combined shopping list of ingredients for a 3-day meal plan. He has tried combining several existing services to automate it, with poor results — the workflow is manual and the output is too rough to follow. He faces this task every time he plans meals. He is willing to pay 500 rubles (~$6) per month for a working solution.

## Objective

Ship a web app that takes a list of recipe-video URLs (YouTube, TikTok), extracts a structured recipe (title, short description, ingredients, instructions) from each, lets the user drag recipes into a 3-day plan, and emits a single deduplicated shopping list grouped by aisle or category — at the author's stated $6/month ceiling, with no manual transcription.

## Target Users

- Primary: meal planners who already follow recipe creators on YouTube / TikTok and want to assemble a multi-day plan without re-typing every ingredient.
- Secondary: home cooks who record their own recipe videos and want a structured shopping list from their own content.
- Tertiary: nutrition coaches and small meal-prep businesses who curate video recipes for clients and want a single shopping list instead of per-recipe screenshots.

## MVP Scope

- Web app accepting 1–N recipe-video URLs (YouTube + TikTok) per planning session.
- Recipe extraction per video: title, short description, ingredient list (with quantities and units), step-by-step instructions.
- 3-day meal-plan grid: breakfast / lunch / dinner × 3 days; user drags recipes into slots or picks from a generated suggestion.
- Combined shopping list: deduplicated ingredients across the chosen recipes, summed quantities where the unit matches, grouped by aisle or category (produce, dairy, pantry, etc.).
- Export: shopping list as plain text, Markdown checklist, or printable view.
- Single subscription at $6/month (the author's stated willingness to pay); free tier allows one plan per week to validate the workflow.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Must hit the author's $6/month price point — no per-recipe or per-video paywalls; the ceiling is the ceiling.
- Recipe extraction must be automatic and produce structured ingredients with quantities, not a transcript blob the user has to clean up.
- Shopping list must deduplicate across recipes and sum quantities where the unit matches (e.g. two recipes calling for 100 g of onions should appear once as 200 g).
- The MVP must support YouTube at launch; TikTok support is required because the author lists it as a source, but the first 50 paying users should not break if a TikTok extractor fails — fall back to a manual ingredient entry on that one video and keep the rest of the workflow going.
