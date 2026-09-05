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

## Tech Stack

- **A digital wardrobe store** keyed to the user (or to the local device for the free-without-sign-up entry path) that holds the clothes the user enters.
- **An outfit generator** that suggests outfits built from the user's wardrobe (the source names no specific model; the model is the surface's claim).
- **A planner store** that schedules outfits days or weeks ahead.
- **A virtual try-on surface** that previews clothes (the source names no specific implementation; the implementation is the surface's claim).
- **A saved-looks store** keyed to the user, holding the looks the user saves.
- **A sharing surface** that produces a share the user initiates for friends to comment on.
- **A free-without-sign-up entry path** that lets the user use the surface without creating an account.
- **A wardrobe-removal flow** that handles the case where the user takes a piece out of the wardrobe.

## Architecture

The surface is a single-page application backed by four components: a wardrobe store, an outfit generator, a planner, and a sharing surface. The wardrobe store holds the clothes the user enters; the outfit generator reads from the wardrobe and suggests looks; the planner schedules outfits; the sharing surface produces a share the user initiates.

The wardrobe store is keyed to the user, or to the local device for the free-without-sign-up entry path. The user enters a piece, the surface treats it as part of the corpus; an outfit the surface suggests that uses clothes the user does not own is a corpus failure.

The outfit generator reads from the wardrobe store and produces a set of looks the user can save or refine. The model is the surface's claim; the source names no specific model. The generator refuses to suggest a look that uses clothes outside the wardrobe.

The planner schedules outfits days or weeks ahead from the wardrobe and the generator's output. The granularity (per-day, per-week, per-event) and the recurrence support are the surface's claim. A planner that only sees the current day is a UX gap.

The virtual try-on surface previews clothes. The implementation (2D overlay, 3D avatar, photo-based fit preview) is the surface's claim. The try-on is a preview, not a fit guarantee.

The saved-looks store is keyed to the user, holding the looks the user saves. A look the user did not save is not shared. The retention policy is the surface's claim.

The sharing surface produces a share the user initiates for friends to comment on. The share is a link, a platform-native share, or a friend-graph lookup; the reach is the surface's claim. A share the user did not initiate is a sharing failure.

The free-without-sign-up entry path is the default. The user uses the surface without creating an account; a sign-up wall before any of this is a UX regression. The wardrobe store is keyed to the local device in the free path; the saved-looks store and the planner follow the same scoping.

The wardrobe-removal flow handles the case where the user takes a piece out of the wardrobe. The flow flags saved looks and planned outfits that reference the removed piece; a piece that silently disappears from a saved look is a UX failure.

## Milestones

1. **M1 — Free-without-sign-up entry path** — the wardrobe entry without an account, the local-device scoping, the upgrade path if the user later signs up.
2. **M2 — Wardrobe store** — the entry surface, the wardrobe schema, the per-user or per-device scoping.
3. **M3 — Outfit generator** — the corpus-only suggestion rule, the generator model, the corpus-coverage metric.
4. **M4 — Planner** — the schedule granularity, the recurrence support, the wardrobe-and-generator integration.
5. **M5 — Virtual try-on** — the implementation choice, the preview surface, the non-guarantee contract.
6. **M6 — Saved-looks store** — the per-user or per-device store, the retention policy, the wardrobe-removal flow.
7. **M7 — Sharing surface** — the user-initiated share, the friend-feedback loop, the share-reach contract.

## Risks

- **Outfit generator suggests clothes outside the wardrobe** — the user sees a look they cannot wear. Mitigation: the generator is corpus-only by construction; a wardrobe-external piece in a suggestion is a generator failure.
- **Planner limited to the current day** — the user cannot plan ahead. Mitigation: the planner supports the documented granularity (per-day, per-week, per-event); a current-day-only planner is a milestone gap.
- **Virtual try-on promises a fit guarantee** — the user trusts a non-guarantee. Mitigation: the try-on is a preview, not a guarantee; a guarantee claim is a UX failure.
- **Saved-looks store shared by accident** — a look the user did not save is exposed. Mitigation: the store is scoped to the user or the local device; a cross-user read is a security incident.
- **Share initiated without the user** — a look the user did not share is shared. Mitigation: the sharing surface is user-initiated only; a non-user-initiated share is a sharing failure.
- **Sign-up wall before any workflow** — the user cannot use the surface without an account. Mitigation: the free-without-sign-up entry path is the default; a sign-up wall is a UX regression.
- **Wardrobe-removal silently drops a piece from saved looks** — a saved look references a removed piece and the look breaks. Mitigation: the wardrobe-removal flow flags affected saved looks and planned outfits; a silent drop is a UX failure.