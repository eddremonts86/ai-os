---
id: "3898"
slug: explore-the-solar-system-with-hand-gestures-in-a-browse
title: "Explore the solar system with hand gestures in a browser"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49496660"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [Three.js, WebGL, MediaPipe hand tracking, WebXR, planetary ephemeris data, static hosting]
---
# Explore the solar system with hand gestures in a browser

## Phase 0: Scaffold

- [x] Read the Show HN capture and confirm it is URL-only
- [x] Write SPEC.md, PRODUCT.md, PLAN.md and TASKS.md
- [x] Scaffold the Three.js scene with the sun and planets
- [x] Verify camera and hand-tracking behavior in the target browsers

## Phase 1: Core

- [ ] Wire hand tracking to the navigation controller
- [ ] Implement the gesture vocabulary: select, zoom, rotate
- [ ] Add mouse, touch and keyboard fallbacks for every gesture
- [ ] Add the planet facts overlay on selection

## Phase 2: Deploy

- [ ] Measure gesture success rate and tune the classifier
- [ ] Set performance budgets and test on low-end laptops
- [ ] Add orbit fidelity and educational framing
- [ ] Deploy the public experience
