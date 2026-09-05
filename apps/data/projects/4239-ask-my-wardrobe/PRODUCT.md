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

## Value Proposition

A digital wardrobe surface that turns the user's clothing corpus into outfits the user can plan, save, and share, so the user builds new outfits from what they already owns, plans ahead, and uses the surface as the complete digital wardrobe experience. The outfit generator suggests looks from clothes the user already owns; the planner schedules outfits days or weeks ahead; the virtual try-on previews clothes before the user buys; the saved-looks store keeps the outfits the user likes; the sharing surface lets the user share a look with friends for feedback.

The free-without-sign-up entry path is the default. The user enters the wardrobe, sees outfit suggestions, plans ahead, saves looks, and shares with friends — without a sign-up wall blocking the workflow. A sign-up wall before any of this is a UX regression.

**One-liner:** A free, no-sign-up digital wardrobe surface that turns the clothes you already own into outfits you can plan, save, and share.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Wardrobe owners | Want a digital surface for the clothes they already owns. |
| Fashion-conscious users | Want to plan outfits days or weeks ahead, not on the morning of. |
| Pre-purchase users | Want to virtually try on clothes before buying so they buy less of what they will not wear. |
| Look-savers | Want to save their best looks and share them with friends for feedback. |
| Free-tier users | Want to use the surface free without signing up. |

## Jobs To Be Done

1. **Functional job** — Enter the clothes the user already owns and have the surface treat them as the corpus.
2. **Functional job** — Have the outfit generator suggest looks built from the user's wardrobe.
3. **Functional job** — Plan outfits days or weeks ahead from the planner.
4. **Functional job** — Preview a piece of clothing virtually before the user buys it.
5. **Functional job** — Save the looks the user likes in the saved-looks store.
6. **Functional job** — Share a look with friends for feedback.
7. **Functional job** — Use the surface without signing up.
8. **Emotional job** — Stop the feeling that the wardrobe is mostly unworn and the user is picking the same outfits from muscle memory.
9. **Social job** — Be the wardrobe owner whose looks are deliberate and shareable, not the wardrobe owner who reaches for the same shirt every morning.

## Success Metrics

- **Corpus coverage** — share of outfit suggestions the surface produces that use clothes from the user's wardrobe. A suggestion that uses a piece the user does not own is a corpus failure.
- **Outfit generator coverage** — share of wardrobe entries that yield at least one outfit suggestion. A wardrobe entry with no suggestion is a coverage gap.
- **Planner coverage** — share of planned outfits the user can schedule days or weeks ahead. A planner that only sees the current day is a UX gap.
- **Virtual try-on coverage** — share of previews the surface produces for a piece of clothing. A piece without a preview is a coverage gap.
- **Saved-looks coverage** — share of looks the user saves that land in the saved-looks store. A look the user did not save is not shared.
- **Sharing coverage** — share of shares the user initiates that reach the friends the user picked. A share the user did not initiate is a sharing failure.
- **Free-without-sign-up coverage** — share of entry paths that do not require the user to sign up. A sign-up wall before any of this is a UX regression.

## Pricing & Monetization

The source is explicit on the free-without-sign-up entry path. The source names no fee, no tier, and no commercial plan beyond "free". Any future monetization has to be measured against the corpus coverage and the free-without-sign-up coverage, because those are the metrics the source ties to the surface's value proposition.

## Competitive Landscape

- **Closet-organising apps (the names the source does not provide)** — let the user catalogue the wardrobe, but do not generate outfits or plan ahead.
- **Outfit-of-the-day apps (the names the source does not provide)** — surface a daily look, but the look is the app's, not built from the user's wardrobe.
- **Virtual try-on apps (the names the source does not provide)** — preview clothes, but do not generate outfits from the corpus.
- **Manual wardrobe notes (the names the source does not provide)** — the user keeps a list, but the surface does not plan, share, or save.

The post names no specific incumbent, so no further comparison is claimed here.

## Risks & Open Questions

- [ ] Confirm the outfit generator's model. The source names no specific model; the open question is whether the generator is rule-based, ML-based, or a hybrid, and what inputs it reads from the wardrobe.
- [ ] Define the planner's schedule granularity. The user plans days or weeks ahead; the open question is the granularity (per-day, per-week, per-event) and the recurrence support.
- [ ] Validate the virtual try-on's scope. The source names no specific implementation; the open question is whether the try-on is a 2D overlay, a 3D avatar, or a photo-based fit preview.
- [ ] Decide the saved-looks store's retention. The user saves looks; the open question is the retention policy and the per-user storage budget.
- [ ] Establish the sharing surface's reach. The user shares with friends for feedback; the open question is whether the share is a link, a platform-native share, or a friend-graph lookup.
- [ ] Confirm the free-without-sign-up entry path is the default. The source is explicit; the open question is whether any feature requires a sign-up and how that requirement is communicated.
- [ ] Define the policy on a wardrobe entry the user removes. The user takes a piece out of the wardrobe; the open question is whether the surface removes saved looks and planned outfits that reference the removed piece, or flags them.