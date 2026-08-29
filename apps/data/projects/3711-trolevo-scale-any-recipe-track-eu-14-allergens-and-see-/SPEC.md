---
id: "3711"
slug: trolevo-scale-any-recipe-track-eu-14-allergens-and-see-
title: "Trolevo – Scale any recipe, track EU-14 allergens, and see cost per plate"
status: enriched
source:
  name: BetaList
  url: "https://betalist.com/startups/trolevo?utm_campaign=startup-181536&utm_medium=atom&utm_source=newsfeed"
category: beta
date: "2026-08-29"
tags: [BetaList, Beta, Product]
country: Switzerland
tech: [Astro, TypeScript, SQLite, Cloudflare Pages]
---
# Trolevo – Scale any recipe, track EU-14 allergens, and see cost per plate

## Problem

The founder, Sven Seiler in Zürich, started Trolevo after watching a chef and restaurateur in his family hit the same wall with every other recipe tool: change one ingredient in a sub-recipe and the quantities should update everywhere that sub-recipe is used. Few tools handle that. The same kitchen also needs an allergen list that rolls up from the same recipe graph — and that is the EU regulatory requirement, not a nice-to-have.

The BetaList post says it directly: "change the portion count and every quantity updates, including nested sub-recipes. Costing runs on the same structure, so you see what a plate costs and the margin left. Sub-recipes and ingredients roll up into one EU-14 allergen label per dish that updates when the recipe changes, helping you meet your labeling duty without rewriting lists by hand." The Swiss/EU labeling context is what makes "EU-14" a real category, not marketing — fourteen allergens are the EU FIC-defined list, and a kitchen that sells across cantons or countries needs them on the label.

The site ships in German, French, Italian and English, is hosted in Switzerland, and bills in Swiss francs. A free recipe scaler at `trolevo.com/tools/recipe-scaler` works today without login — the founder is using the tool's most basic function as the marketing surface. The founder is self-funded, no investors, and one person.

## Objective

Replace the printed recipe binder and the spreadsheet of sub-recipes with one tool that scales, costs, and produces an EU-14 allergen label from the same data — so a chef never has to recompute by hand when one ingredient changes.

## Target Users

1. **Restaurant chefs and kitchen managers** who maintain a real recipe binder and need portion scaling, food cost per plate, and a defensible allergen label from one source of truth.
2. **Catering operations and commissary kitchens** that run the same dish at different cover counts across services and need costing that holds up against an invoice.
3. **Recipe developers / food stylists** who want one place that produces a clean spec they can hand to a client, with the allergen list and cost per serving already attached.

## MVP Scope

- Recipe model with explicit sub-recipe references (not flat ingredient lists), so changes propagate.
- Portion scaler: change the cover count and every leaf quantity updates.
- Cost rollup: ingredient prices stored per recipe; per-plate cost and margin computed against a sale price the kitchen enters.
- EU-14 allergen label generator: one view per dish that lists every EU-14 allergen present, derived from the recipe graph.
- Cooking mode: step-by-step list with timers, screen-stays-on for tablet/phone use.
- Free public scaler at `/tools/recipe-scaler` (already live) — no login, anonymous use, no persistence.
- Localized UI strings for de, fr, it, en.
- Out of scope for MVP: inventory tracking, supplier ordering, multi-location menus, accounting integrations.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Hosted in Switzerland; bills in CHF. The hosting choice and currency are in the public landing copy and not negotiable for an MVP that targets Swiss kitchens.
- Founder is one person, self-funded. The MVP has to be buildable and maintainable by a single engineer.
- Allergen calculation must be deterministic from the recipe graph — kitchens trust the label with their license.
- The free scaler is a marketing surface, not a soft-paywall: it must stay free and useful without login.
