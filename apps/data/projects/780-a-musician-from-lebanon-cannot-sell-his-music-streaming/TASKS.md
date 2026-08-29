---
id: "780"
slug: a-musician-from-lebanon-cannot-sell-his-music-streaming
title: "A musician from Lebanon cannot sell his music: streaming pays pennies, and Bandcamp doesn't accept payments in his country. Needs a fair radio-platform with direct sales."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/media/0vvg4xzv91-a-musician-from-lebanon-cannot-sell-his"
category: media
date: "2026-01-21"
tags: [Media, Other]
country: Lebanon
tech: [Elixir, Phoenix LiveView, PostgreSQL, Stripe Connect, Cloudflare R2, Mux, Tailwind CSS, Docker, Fly.io]
---
# A musician from Lebanon cannot sell his music: streaming pays pennies, and Bandcamp doesn't accept payments in his country. Needs a fair radio-platform with direct sales.

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/780-a-musician-from-lebanon-cannot-sell-his-music-streaming/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Stand up the Elixir + Phoenix LiveView radio surface with a scheduled, always-on mix of the musician's catalogue.
- [ ] Build the catalogue onboarding flow: musician sign-up, track upload, metadata editor and the rights flag on each track.
- [ ] Implement the Stripe Connect checkout for single-track, album and subscription purchases, with the split shown at checkout.
- [ ] Add the documented processor fallback for countries the primary processor does not serve, with the musician onboarding walking through it.
- [ ] Ship the musician dashboard with listen counts, listen-to-sale conversions, payout history and the catalogue freshness view.
- [ ] Wire Mux for adaptive-bitrate audio delivery and Cloudflare R2 for the lossless master storage.
- [ ] Validate end-to-end with one Lebanese musician: real catalogue, real radio, real fan checkout, real payout.

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-18_
