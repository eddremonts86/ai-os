---
id: "3873"
slug: nohtmlfelixseu
title: Nohtml.felixs.eu
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49499459"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [CSS-only rendering, SVG animation, Content-type tricks, Chromium rendering quirks, Single-file demo, Static hosting]
---
# Nohtml.felixs.eu

## Problem

The poster shares a technical demo at nohtml.felixs.eu: a collection of tricks that plays the Chrome dino runner game without any HTML or JavaScript, with one documented exception — on Chromium-based browsers a small amount of HTML is still needed, which the poster jokes is because "google HATES fun". The post is a flex about what browsers can render without markup: a playable game driven by the browser's own rendering and styling capabilities instead of HTML structure or scripts. There is no stated user base, pricing or roadmap; the deliverable is the trick itself.

## Objective

Preserve and extend the demo: a playable Chrome dino runner with no HTML and no JavaScript, documented as a replicable set of browser tricks. The MVP is the existing demo reproduced from source, with an explanation of each trick.

## Target Users

- Frontend engineers curious about rendering without markup.
- Browser-platform enthusiasts exploring the limits of CSS and related styling.
- Educators demonstrating what a browser can do without HTML.

## MVP Scope

- The dino runner playable without HTML or JavaScript (small HTML shim on Chromium).
- Source published with each trick explained.
- Reproduction instructions for other browsers.

## Constraints

- The capture is a short forum flex; no product economics apply — this is a technical demo.
- Chromium still needs a small HTML shim; the "no HTML" claim has a documented exception.
- No user, pricing or roadmap claims exist in the capture.

## Design Direction

See `DESIGN.md` for this project's design tokens.
