---
id: "4239"
slug: ask-my-wardrobe
title: Ask My Wardrobe
status: enriched
source:
  name: ProductHunt
  url: "https://www.producthunt.com/products/ask-my-wardrobe"
category: product-launch
date: "2026-08-26"
tags: [ProductHunt, Product Launch]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Ask My Wardrobe

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/4239-ask-my-wardrobe/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Build the free-without-sign-up entry path with the wardrobe entry surface and the local-device scoping of the wardrobe store; the upgrade path is a deliberate opt-in for users who later sign up.
- [ ] Implement the wardrobe store with the entry surface, the wardrobe schema (clothing item, attributes, photos), and the per-user or per-device scoping.
- [ ] Build the outfit generator that reads from the wardrobe store and produces corpus-only suggestions; the generator refuses to emit a look that uses clothes outside the wardrobe.
- [ ] Add the planner with the documented schedule granularity (per-day, per-week, per-event), the recurrence support, and the integration with the wardrobe and the generator's output.
- [ ] Implement the virtual try-on surface with the chosen implementation (2D overlay, 3D avatar, or photo-based fit preview), the preview surface, and the non-guarantee contract that the try-on is a preview and not a fit promise.
- [ ] Build the saved-looks store scoped to the user or the local device, with the retention policy and the wardrobe-removal flow that flags saved looks and planned outfits referencing the removed piece.
- [ ] Add the sharing surface that produces a user-initiated share for friends to comment on; the share-reach contract is documented and the surface refuses a non-user-initiated share.
- [ ] Enforce the corpus-only rule at the generator level: any look that uses a wardrobe-external piece is rejected before it is shown to the user.
- [ ] Write the README that documents the free-without-sign-up entry path, the wardrobe entry, the outfit generator, the planner, the virtual try-on, the saved-looks store, and the sharing surface.
- [ ] Run an end-to-end test on a representative wardrobe flow: the user enters the clothes without signing up, the generator produces corpus-only looks, the planner schedules outfits days ahead, the virtual try-on previews a piece, the saved-looks store holds the user's saved looks, a user-initiated share reaches a friend, and a wardrobe removal flags affected saved looks and planned outfits.

## Phase 2: Deploy

- [ ] Ship the surface as a hosted web application with the free-without-sign-up entry path as the default
- [ ] Document the free-without-sign-up entry path, the corpus-only outfit generator, the planner, the virtual try-on, and the sharing surface in the launch material so users understand the surface's scope
- [ ] Verify in production