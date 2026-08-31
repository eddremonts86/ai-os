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

## Phase 0: Scaffold

- [x] Read the Show HN post and inspect the linked Netlify demo (catalog, Studio, settings, counters)
- [x] Write SPEC.md (this document)
- [x] Create the static site skeleton deployable to Netlify
- [x] Implement a minimal scroll-snap reading container with one demo work

## Phase 1: Core

- [ ] Build the full reading view with gesture, wheel and keyboard navigation in vanilla JS
- [ ] Render the catalog with rating, reading and like counters per work
- [ ] Add the Studio section for the user's own works
- [ ] Implement settings: language, accent color, backgrounds, library image with darkening control
- [ ] Add the hide-demo-works toggle that keeps demo content in the code

## Phase 2: Deploy

- [ ] Add lazy loading and virtualization for long webtoon strips
- [ ] Validate snap behavior across Chrome, Safari, Firefox and mobile browsers
- [ ] Ship on Netlify and measure pages read per session and reading performance
