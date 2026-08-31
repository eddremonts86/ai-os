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

## Tech Stack

Guided by the title's two constraints and the demo's visible surfaces.

- **Vanilla JavaScript:** all interactivity without a framework, per the title.
- **CSS scroll-snap:** the snapping mechanism for pages and panels in the reading view.
- **Static hosting (Netlify):** the demo's hosting; a client-only build with no backend.
- **Client-side theming:** CSS custom properties for accent color, backgrounds and text color.
- **Demo catalog data:** bundled works with rating, reading and like counters rendered client-side.
- **Browser storage:** persistence for settings and the hidden-demo toggle (inferred from the settings surface).

## Architecture

- **Reading view:** scroll-snap container over image panels, with gesture and wheel handling in vanilla JS.
- **Catalog:** list of works with counters (4.8 stars, 1.2k readings, 342 likes in the demo) and demo-content filtering.
- **Studio:** the user's own works section.
- **Settings module:** language, accent color, app, card and text backgrounds, library background image with darkening control.
- **Demo toggle:** hides demo works from the catalog while keeping them in the code.

## Milestones

1. **M0 — Snapped reading.** A scroll-snap reading view renders a demo work smoothly in vanilla JS on desktop and mobile.
2. **M1 — Catalog and counters.** Works list with ratings, readings and likes; demo works toggleable from settings.
3. **M2 — Studio and theming.** Studio section for own works; full appearance settings including library background darkening.
4. **M3 — Performance hardening.** 60fps reading on mid-range hardware with image lazy loading validated across browsers.

## Risks

- **Cross-browser scroll-snap:** snap points and momentum behave differently per engine; the QA matrix is the real cost.
- **Memory on long strips:** unbounded image loads will stall long webtoons; virtualization is needed but unstated.
- **Content chicken-and-egg:** a reader with only demo works cannot grow an audience; Studio uploads are unproven.
- **Thin capture:** the code is not linked in the post, so the vanilla-JS claim is unverifiable from the source.
