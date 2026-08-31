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

## Value Proposition

Planets you can reach out and grab. The solar system is the perfect demo for gesture control — big objects, slow motion, intuitive navigation — and the browser is the perfect delivery: no headset, no install, just a camera and a tab. The product's promise is presence: exploring space by moving your hands instead of a mouse.

**One-liner:** Explore the solar system with hand gestures, in a browser.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Educators | A memorable, free astronomy demo that runs on a classroom screen. |
| Museums | Gesture exhibits engage visitors without touchscreens to clean. |
| Kids | Spinning planets by hand beats clicking buttons. |
| Web interaction researchers | A working reference for camera-based controls in WebGL scenes. |

## Jobs To Be Done

1. Open a browser tab and be flying through the solar system immediately.
2. Navigate the scene with hands, with mouse and touch available whenever the camera fails.
3. Select a planet and read its facts.
4. Run the experience on modest hardware without a GPU-spec'd machine.

## Success Metrics

- Sessions started per week and the share that opt in to camera permission.
- Gesture success rate: share of gesture attempts that produce the intended action.
- Time in scene per session, the presence signal.
- Fallback usage share, telling whether gestures carry the product or the fallbacks do.

## Pricing & Monetization

None stated. The capture contains no pricing information.

## Competitive Landscape

The capture names no competitors. The category is interactive astronomy visualization — desktop software and web planetariums — where the title's differentiation is the interaction layer: hand-gesture control in a plain browser, which few of the established tools attempt.

## Risks & Open Questions

- [ ] Gesture recognition in the wild is fragile; a laggy or wrong response reads as a broken product.
- [ ] Camera permission is a drop-off point for a meaningful share of visitors.
- [ ] The source is a bare URL plus title; scope may differ from the author's actual build.
- [ ] Ephemeris data needs a maintenance story to stay accurate.
- [ ] Performance on low-end laptops must be measured, not assumed.
