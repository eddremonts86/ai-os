---
id: "3813"
slug: a-comicwebtoon-reader-with-css-scroll-snap-vanilla-java
title: "A comic/webtoon reader with CSS scroll-snap, vanilla JavaScript"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49495856"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [Vanilla JavaScript, CSS scroll-snap, static hosting on Netlify, client-side theming, demo content catalog, browser reader UI]
---
# A comic/webtoon reader with CSS scroll-snap, vanilla JavaScript

## Value Proposition

A comic reading experience that feels cinematic and stays light. MotionPanel presents itself as a cinematic comic reading platform whose reading engine is CSS scroll-snap driven by vanilla JavaScript — no framework payload, fast page snapping, and an interface that already shows catalog discovery (ratings, readings, likes), a Studio for creators' own works, and deep theming (accent color, backgrounds, a library image with a legibility darkening control). The demo ships with works so a visitor can feel the reading loop immediately, and demo content can be hidden without touching code.

**One-liner:** A cinematic comic and webtoon reader built on CSS scroll-snap with vanilla JavaScript, with a creator Studio and deep theming.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Webtoon and comic readers | Snappy, cinematic reading without a heavy app. |
| Independent creators | The Studio section gives their works a shelf in the catalog. |
| Portuguese-speaking users | The demo UI is Portuguese-first (catalog, settings, counters). |
| Frontend developers | A reference implementation of scroll-snap reading with zero framework code. |

The post describes no commercial market; the demo reads as a public showcase of the reader.

## Jobs To Be Done

1. **Functional job** — Read comic and webtoon pages in a smooth, snapped scrolling flow.
2. **Functional job** — Discover works through a catalog showing ratings, reading counts and likes.
3. **Functional job** — Manage one's own works via the Studio section.
4. **Functional job** — Personalize appearance (accent color, backgrounds, library image with darkening) without breaking legibility.

## Success Metrics

- **Reader engagement:** pages read per session — the metric the demo already surfaces (1.2k readings).
- **Likes:** works liked by visitors (342 in the demo), as the community signal.
- **Catalog reach:** share of demo works that get read at least once after publishing.
- **Performance:** scroll-snap reading stays at 60 frames per second on mid-range hardware — the whole point of the vanilla-JS claim.
- **Creator uploads:** works added through the Studio (the section exists; the actual upload flow is not described in the capture).

## Pricing & Monetization

None stated. The capture is a URL-only Show HN pointing at a Netlify demo; no pricing appears anywhere in the linked interface.

## Competitive Landscape

The post does not name competitors. The category is web-based comic and webtoon readers (and the broader webtoon platforms that own their catalogs); the demo's position is the open-web reader niche — a self-hosted-style reading surface for a creator's own catalog, differentiated by its dependency-free scroll-snap engine and per-user theming rather than by a licensed content library.

## Risks & Open Questions

- [ ] Scroll-snap behavior differs across browsers and input methods (wheel, touch, trackpad), the classic long-tail cost of the vanilla approach.
- [ ] A reader without a content pipeline depends on creators; the demo shows demo works, not a real upload path.
- [ ] Long-strip webtoons stress image memory; the capture says nothing about virtualization or lazy loading.
- [ ] The Portuguese-only UI bounds the audience until localization lands; nothing in the capture states a plan.
- [ ] A URL-only capture: the code is not linked, so the scroll-snap claim cannot be audited from the post alone.
