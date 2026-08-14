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

> Product brief authored from the source title and category. The poster's text was not available (source.name: manual); sections below re-state the problem and infer only what the title and category support.

## Value Proposition

A Russian home cook drops in a list of cooking videos, picks a daily calorie and protein target, and gets an editable 7-day plan with a printable grocery list - instead of transcribing each video by hand and reconciling ingredients across clips.

## Target Users

- Russian home cooks who learn from YouTube cooking channels and want the daily plan to follow.
- Russian nutritionists preparing client meal plans from video-recipe catalogues.
- Russian-speaking fitness clients who want a coach-grade weekly plan that uses the recipes they already like.

## Jobs To Be Done

1. **Functional job** - Cook from videos and still hit the week's macro target.
2. **Emotional job** - Stop feeling that 'cooking from videos' and 'eating on plan' are mutually exclusive.
3. **Social job** - Hand the family a grocery list, not a 20-video recommendation thread.

## Success Metrics

- **Activation:** first 7-day plan saved within 30 minutes of signup.
- **Plan adherence:** >= 70% of generated plans are used without major rework in pilot cohorts.
- **Nutrition accuracy:** generated daily macros within +/- 10% of the user's stated target across 5+ days.

## Competitive Landscape

- **Paprika / Whisk / recipe apps** - input is user-typed recipes; video is out of scope.
- **MyFitnessPal + manual entry** - what users do today; labour-intensive and error-prone.
- **Mealime / Eat This Much** - algorithmic plan generators but do not accept videos as input.

## Risks & Open Questions

- See PLAN.md Risks for the technical / operational risks.
- [ ] Confirm pricing model and WTP signal in user interviews before MVP launch.
- [ ] Validate country-specific compliance (data, payments, content) before MVP launch.

---

_Source:_ ProblemHunt (manual capture) · **Category:** food · **Tags:** Food
