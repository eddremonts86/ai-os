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

## Phase 0: Scaffold

- [x] Free scaler live at `trolevo.com/tools/recipe-scaler` (already shipped).
- [x] Marketing site at `trolevo.com` with German, French, Italian, English.
- [x] Founder identity (Sven Seiler, Zürich) and brand voice ("No hype, just a tool that does the work") on the landing page.
- [ ] Choose kitchen-app framework: Astro + React islands on Cloudflare Pages.
- [ ] Decide persistence: Postgres (Neon) for tenant recipes vs SQLite per tenant.
- [ ] Decide billing provider for CHF invoicing (Stripe supports CHF; an EU/CH alternative is SumUp or a Swiss PSP).
- [ ] Set up analytics: Cloudflare Web Analytics only, no cookie banner (the source site already runs no cookies).
- [ ] Local Astro dev environment + i18n catalogues (de, fr, it, en).

## Phase 1: Core

- [ ] Recipe model: `Recipe`, `SubRecipe`, `Ingredient`, `AllergenTag` — explicit sub-recipe references so a change propagates.
- [ ] Portion scaler (authenticated version): change cover count → all leaf quantities recompute.
- [ ] Ingredient catalogue: per-kitchen ingredients with unit, price, supplier, last-updated.
- [ ] Cost rollup: per-recipe food cost, per-plate cost at the kitchen's sale price, margin %.
- [ ] EU-14 allergen rollup: deterministic pass over the recipe graph, mapping every EU FIC Annex II allergen to "contains" / "may contain" / "absent".
- [ ] Allergen label view: printable, kitchen-branded, includes the EU-14 list as a checklist with "contains" markers.
- [ ] Cooking mode: step-by-step, per-step timer, screen-stays-on via the Screen Wake Lock API on tablet/phone browsers.
- [ ] Free scaler parity: `/tools/recipe-scaler` continues to work without login and without persistence; the MVP keeps it as the marketing surface.
- [ ] Tests: a deterministic allergen-pass test suite (an allergen in a sub-recipe shows up in the parent), a scaling test suite (a 4-cover recipe and a 400-cover recipe of the same dish).

## Phase 2: Deploy

- [ ] Production deploy: `app.trolevo.com` on Cloudflare Pages.
- [ ] Marketing deploy: `trolevo.com` on Cloudflare Pages (already live).
- [ ] Sign-up flow + email verification (Cloudflare Email Workers or Resend).
- [ ] Pricing tiers in CHF, billed by Stripe (or the chosen PSP), with the free plan the landing page already promises.
- [ ] Smoke test in production: create a recipe, add a sub-recipe, change an ingredient, confirm allergen label and food cost update.
- [ ] Verify the free scaler still works and still loads with no cookies (Cloudflare Web Analytics is cookieless by design).
