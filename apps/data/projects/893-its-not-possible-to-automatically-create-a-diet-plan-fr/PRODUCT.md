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

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A meal planner pastes 3–7 recipe-video URLs from YouTube or TikTok into a web app, drags the extracted recipes into a 3-day breakfast / lunch / dinner grid, and exports a single deduplicated shopping list grouped by aisle — no manual transcription, no per-recipe screenshots, at the author's stated $6/month ceiling.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Meal planner (the author's profile) | Already follows recipe creators on YouTube / TikTok and wants to assemble a multi-day plan without re-typing every ingredient; willing to pay $6/month. |
| Home cook who records their own recipe videos | Wants a structured shopping list from their own content without re-editing the video into a blog post. |
| Nutrition coach / small meal-prep business | Curates video recipes for clients and wants a single shopping list instead of per-recipe screenshots they re-type by hand. |
| Recipe creators (YouTube / TikTok) | Indirect: a discovery surface that pulls more viewers into the original videos rather than scraping them. |

## Jobs To Be Done

1. **Functional job** — Turn 3–7 recipe-video URLs into a 3-day meal plan with one deduplicated shopping list, with no manual ingredient re-typing.
2. **Emotional job** — Stop the Sunday-evening "I have 12 open tabs and no list" panic; trust that the plan and the list will be ready in under five minutes.
3. **Social job** — Be the friend who texts "here's the shopping list, you can grab X if you see it" instead of the one who texts "sorry, I forgot to send the list".

## Success Metrics

- **Activation:** ≥ 70% of new users extract at least one recipe from a video URL within their first session and see a populated plan.
- **Time-to-plan:** median user assembles a 3-day plan with shopping list in ≤ 5 minutes from first URL paste to export.
- **Extraction accuracy:** ≥ 80% of recipes have ingredients with quantities and units (not a transcript blob), measured by a weekly random-sample audit.
- **Retention:** ≥ 60% of free-tier users convert to paid within 14 days; ≥ 50% of paid users remain active after 90 days.
- **TikTok reliability:** ≥ 90% of TikTok URLs return a usable recipe; below that, the manual-fallback path (described in Constraints) must not block the rest of the plan.

## Pricing & Monetization

$6/month subscription (the author's stated 500 rubles / ~$6 ceiling); annual lock at $4/month. Free tier: one 3-day plan per week. No per-recipe or per-video paywalls — the $6 ceiling is the ceiling.

## Competitive Landscape

- **Paprika / Whisk / CopyMeThat** — manual recipe-clipping apps; require the user to paste a recipe URL or type it in, do not extract from video.
- **Mealime / PlateJoy / Eat This Much** — diet-plan generators with a fixed recipe library; do not let the user bring their own video recipes.
- **YouTube transcript + ChatGPT in a spreadsheet** — what power users do today; brittle, no shopping-list deduplication, no plan grid.
- **TikTok recipe accounts** — produce the source material; the product is a downstream tool that respects the original video and routes viewers back to it.

## Risks & Open Questions

- [ ] TikTok extractor reliability — TikTok aggressively rate-limits and changes its transcript availability; a 50% TikTok success rate breaks the MVP. Confirm the extraction strategy (third-party API vs captcha-vendor fallback) before launch.
- [ ] Ingredient unit normalisation is harder than it sounds — "1 cup chopped onions" and "1 medium onion, chopped" should sum to the same shopping-list line. Validate the normaliser against a 50-recipe fixture before the public launch.
- [ ] Confirm the $6/month price is durable in non-Russia markets (the author's ceiling in rubles is meaningful in Russia, less so in the US / EU). Decide whether to keep $6 globally or adjust by region without breaking the author's stated ceiling.
- [ ] Decide whether to surface a link back to the original video on every recipe card so the product is clearly a viewer-routing tool, not a content-scraping one.

---

_Source:_ [ProblemHunt](https://problemhunt.pro/en/food/yby468h0g1-its-not-possible-to-automatically-create) · **Category:** food · **Tags:** Food
