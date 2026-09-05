---
id: "4238"
slug: brandmylaptop
title: BrandMyLaptop
status: enriched
source:
  name: ProductHunt
  url: "https://www.producthunt.com/products/brandmylaptop"
category: product-launch
date: "2026-08-28"
tags: [ProductHunt, Product Launch]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# BrandMyLaptop

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/4238-brandmylaptop/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Build the laptop-owner opt-in flow with the explicit consent path (single toggle, per-format toggle, or per-advertiser toggle), the audit log of every opt-in event, and the refusal of any opt-in-skipped placement.
- [ ] Implement the ad-format layer with the supported formats (sticker, skin, e-ink panel, or another surface), the format-appropriate check that runs before any placement, and the damage-prevention guidance surfaced to the advertiser.
- [ ] Build the advertiser onboarding flow: campaign setup, target definition, budget, and pacing; the campaign does not run until the advertiser has accepted the format-appropriate and damage-prevention guidance.
- [ ] Implement the matching layer that reads the owner's profile (which the owner controls) and the advertiser's target, and produces profile-respecting placements only.
- [ ] Build the tracking layer that records the ad-on-laptop pair at the documented granularity (per-impression, per-day, or per-week) and refuses any entry that would track the user behind the laptop.
- [ ] Add the payout engine with the documented payout model (CPM, CPC, flat fee, or hybrid), the per-impression or per-display calculation that reads from the tracking layer, and the payout dashboard where the owner verifies the payout.
- [ ] Enforce the privacy boundary at the storage layer: every entry is scoped to the owner, the owner's audit surface exposes what is shared, and any cross-owner read is a logged security incident.
- [ ] Implement the damage and dispute resolution flow with the documented timeline, the marketplace's responsibility for damage, and the resolution surface reachable from the owner's dashboard.
- [ ] Write the README that documents the opt-in flow, the ad formats, the matching layer, the tracking granularity, the payout model, the privacy boundary, and the dispute resolution flow.
- [ ] Run an end-to-end test on a representative owner flow: the owner opts in, the owner picks a format, a profile-respecting placement lands, the tracking layer records the ad-on-laptop pair, the payout engine pays under the documented model, the owner verifies the payout, and a privacy-boundary-crossing entry is refused with an explanation.

## Phase 2: Deploy

- [ ] Ship the marketplace as a hosted service
- [ ] Document the opt-in flow, the ad formats, the matching layer, the payout model, and the privacy boundary in the launch material so owners and advertisers understand the marketplace's scope
- [ ] Verify in production