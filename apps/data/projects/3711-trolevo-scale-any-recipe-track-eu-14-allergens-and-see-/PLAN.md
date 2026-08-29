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

## Tech Stack

- **Frontend:** Astro for the marketing site and the free scaler (already shipping on `trolevo.com/tools/recipe-scaler`); React + TypeScript for the authenticated kitchen app, where state and edit affordances are heavier.
- **Backend:** Astro endpoints / server actions for the kitchen app; Cloudflare Pages for edge hosting.
- **DB:** SQLite for the free scaler (anonymous, ephemeral); Postgres for the kitchen app once a kitchen signs in, because per-tenant recipe graphs and ingredient catalogues need referential integrity that SQLite's file-per-tenant model can't scale to.
- **i18n:** German, French, Italian, English — Astro's `i18n` routing plus message catalogues; the landing copy and the kitchen UI share the same locale files.
- **Deployment:** Cloudflare Pages; the free scaler is a static Astro page. No Docker, no Coolify for the MVP — Trolevo is a single-founder build, not a self-hosted platform, and the deployment target is edge-hosted static + edge functions.

The legacy AI-OS default stack (TanStack Start, Drizzle ORM, Coolify, Docker) is not used. Trolevo's traffic pattern (low-write, high-read, single-tenant per kitchen) and founder profile (one person, no ops team) point at edge-hosted static + edge functions, not at a self-hosted VM.

## Architecture

```
                    ┌────────────────────────┐
                    │  trolevo.com (Astro)    │
                    │  - marketing            │
                    │  - /tools/recipe-scaler │  ← anonymous, static
                    │  - /pricing             │
                    └──────────┬─────────────┘
                               │  sign up
                               ▼
                    ┌────────────────────────┐
                    │  app.trolevo.com       │
                    │  Astro + React islands │
                    │  - recipes             │
                    │  - sub-recipes         │
                    │  - costing             │
                    │  - EU-14 allergen view │
                    │  - cooking mode        │
                    └──────────┬─────────────┘
                               │
                               ▼
                    ┌────────────────────────┐
                    │  Cloudflare D1 / Neon  │
                    │  per-tenant recipes    │
                    │  ingredient catalogue  │
                    │  EU-14 allergen table  │
                    └────────────────────────┘
```

The free scaler is a pure Astro page with a client-side script island that holds recipe state in localStorage — there is no backend, no auth, and no data leaves the browser. That keeps the marketing surface free to run, and gives the founder a reason to direct a kitchen from `/tools/recipe-scaler` to the kitchen app when the recipe graph grows past what fits on one screen.

## Milestones

1. **M0 — Recipe graph model and free scaler (live)** — the `/tools/recipe-scaler` page already ships; recipe + sub-recipe + ingredient model is the spine of every later milestone.
2. **M1 — Authenticated kitchen app** — sign-up, kitchen creation, recipe + sub-recipe + ingredient CRUD, with the same data model the scaler uses.
3. **M2 — Costing and EU-14 allergen rollup** — per-ingredient price, per-recipe food cost, per-plate cost, and an allergen view computed from the recipe graph (the EU-14 list is a static reference table).
4. **M3 — Cooking mode and i18n** — step-by-step cooking UI with screen-wake on tablet; full de / fr / it / en UI strings.
5. **M4 — Pricing tiers and billing in CHF** — what the landing page already promises ("free plan at launch, paid tiers for kitchens with lots of recipes and staff") turned into actual Stripe / a Swiss billing provider (the source does not name one).

## Risks

- **Allergen calculation is regulatory, not UX.** The EU-14 list is a regulatory artefact (EU FIC Annex II); a wrong rollup means a kitchen serves a dish that mislabels an allergen. The MVP needs a deterministic allergen pass that the founder can audit line-by-line, not an LLM summary.
- **Single-founder velocity.** Every feature competes with founder hours. The MVP needs an explicit "do not build" list (inventory, supplier ordering, multi-location menus, accounting) and a bias toward shipping the core loop first.
- **Currency and locale lock.** Bills in CHF, hosted in Switzerland, four languages. That is fine for the target audience and wrong for any wider launch — expansion to the rest of the EU and the UK needs a separate decision because the allergen model changes (UK FIR, US FALCPA).
- **Free scaler as marketing surface.** The free scaler has no persistence; if a kitchen tries to use it as a real binder it will lose work and blame Trolevo. The MVP must keep the scaler honest about its limits.
