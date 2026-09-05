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

## Problem

A wardrobe is a corpus of clothing the user already owns, but most days the user opens the closet, picks what they have worn before, and never builds new outfits from what they already have. The Ask My Wardrobe launch post names the alternative: the complete digital wardrobe experience. The post is short — a tagline and a discussion link — but the digital-wardrobe claim is explicit: the user has a digital surface for the wardrobe, builds outfits from clothes they already own, plans ahead, and shares looks. The source names the actor (a wardrobe owner who wants a digital surface for the clothes they own), the pain (the user does not build new outfits from what they already has), and the missing thing (a digital wardrobe surface that turns the corpus into outfits the user can plan, save, and share). It does not name a specific outfit-generation model, a specific shopping integration, or a specific sharing surface.

## Objective

Ship a digital wardrobe surface that turns the user's clothing corpus into outfits the user can plan, save, and share, so the user builds new outfits from what they already owns, plans ahead, and uses the surface as the complete digital wardrobe experience.

## Target Users

- Wardrobe owners who want a digital surface for the clothes they already owns and want to build outfits from them.
- Fashion-conscious users who want to plan outfits days or weeks ahead and not pick on the morning of.
- Users who want to virtually try on clothes before buying so they buy less of what they will not wear.
- Users who want to save their best looks and share them with friends for feedback.
- Users who want to use the surface free without signing up.

## MVP Scope

- A digital wardrobe surface where the user enters the clothes they own.
- An outfit generator that suggests outfits from the user's wardrobe (the source names no specific model; the model is the surface's claim).
- An outfit planner that schedules outfits days or weeks ahead.
- A virtual try-on surface that lets the user preview clothes (the source names no specific implementation; the implementation is the surface's claim).
- A saved-looks store where the user keeps the outfits they like.
- A sharing surface where the user shares a look with friends for feedback.
- A free-without-sign-up entry path.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The outfits are built from clothes the user already owns. An outfit the surface suggests that uses clothes the user does not own is a corpus failure.
- The outfit planner is per-user. A plan that is not keyed to the user is a UX regression.
- The virtual try-on is a preview, not a return-policy replacement. A try-on that promises a fit guarantee is a UX failure.
- The saved-looks store is per-user. A look the user did not save is not shared.
- The sharing surface lets the user share a look with friends for feedback. A share the user did not initiate is a sharing failure.
- The free-without-sign-up entry path is the default. A sign-up wall before the user can use the surface is a UX regression.