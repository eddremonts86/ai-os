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

## Tech Stack

- **Frontend:** TypeScript + React SPA, URL paste list, plan grid (3 days × breakfast / lunch / dinner), shopping-list panel, export controls.
- **Ingest:** YouTube transcript API (captions or auto-generated captions) + TikTok extractor (third-party API or captcha-vendor fallback).
- **Extraction:** OpenAI or Anthropic API to turn the transcript into a structured recipe (title, short description, ingredient list with quantities + units, instructions).
- **Ingredient normaliser:** a small rule layer that maps "1 cup chopped onions" and "1 medium onion, chopped" to a common canonical form for shopping-list deduplication.
- **Backend:** Node.js + TanStack Start server functions, PostgreSQL for plans / recipes / shopping lists.
- **Export:** plain text, Markdown checklist, printable HTML view.
- **Billing:** Stripe-backed $6/month with annual lock at $4/month.

## Architecture

```
Browser
   ┌────────────────────────────────────────────┐
   │ React SPA                                  │
   │  • URL paste list (YouTube + TikTok)       │
   │  • Plan grid (3 days × B/L/D)              │
   │  • Shopping list (deduped + grouped)       │
   │  • Export (text / MD / printable)          │
   └────────────────────────────────────────────┘
        │
        ▼
   Backend (Node.js + TanStack Start)
   ┌────────────────────────────────────────────┐
   │  • Ingest: YouTube transcript API          │
   │           + TikTok extractor               │
   │  • Extraction: LLM structured recipe       │
   │  • Ingredient normaliser (rules + LLM slot)│
   │  • Plan + shopping-list generator          │
   │  • Stripe billing                          │
   └────────────────────────────────────────────┘
        │                  │
        ▼                  ▼
   PostgreSQL       OpenAI / Anthropic
                    API
```

## Milestones

1. **M0 — Spec freeze.** URL-paste UX, recipe-extraction prompt, ingredient-normalisation rules, $6/month unit-economics model. End of week 2.
2. **M1 — YouTube extraction.** Ingest + LLM extraction + structured-recipe render; first 50-recipe fixture passes the ingredient-normalisation audit. End of week 4.
3. **M2 — Plan grid + shopping list.** Drag recipes into 3-day grid; dedup + sum ingredients; group by aisle; export to text / Markdown. End of week 7.
4. **M3 — TikTok extractor.** Third-party API or captcha-vendor fallback; ≥ 90% extraction success on a TikTok URL fixture. End of week 10.
5. **M4 — Pricing + free tier.** Free tier: one 3-day plan per week; paid tier: $6/month with annual lock. End of week 12.
6. **M5 — Pilot + region pricing.** Pilot with 100 paying users in Russia + 50 in EU/US; revisit region pricing if needed. End of week 18.

## Risks

- **TikTok extractor reliability.** TikTok aggressively rate-limits and changes transcript availability. A 50% extraction success rate breaks the MVP; the third-party API strategy must be validated on a 100-URL fixture before launch, with a manual-fallback path that does not block the rest of the plan.
- **Ingredient unit normalisation.** "1 cup chopped onions" and "1 medium onion, chopped" must sum to the same line. The normaliser is a small rule layer with an LLM slot for ambiguous cases, but the rule layer must handle ≥ 80% of the 50-recipe fixture correctly before any ML slot is added.
- **$6/month is meaningful in Russia, less so in the US.** The author's ceiling is in rubles; if the same product is sold globally at $6, US / EU users pay below-market. Decide whether to keep $6 globally (the headline) or adjust by region without breaking the author's stated ceiling — and whether the headline number is a trust signal or a pricing inconsistency.
- **Respecting the original creator.** A recipe extracted from a video without a link back is a content-ripping product, not a viewer-routing one. Every recipe card must surface the original video link; the pricing page and the about page must say so explicitly.
