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

## Tech Stack

- **Three.js:** the 3D scene and rendering.
- **WebGL:** GPU-backed planet rendering.
- **MediaPipe hand tracking:** the gesture layer.
- **WebXR:** an optional path toward headsets.
- **Planetary ephemeris data:** positions and orbits.
- **Static hosting:** the public experience.

## Architecture

- A scene graph holds the sun, planets, moons and orbits.
- A camera rig is driven by a shared navigation controller.
- A gesture pipeline: webcam feed, hand landmarks, gesture classifier, controller commands.
- Fallback input paths feed the same controller.
- A facts overlay is bound to the selected body.

## Milestones

1. **M0 — Scaffold:** scene with sun and planets, camera controls, static deploy.
2. **M1 — Gestures:** webcam hand tracking wired to select, zoom and rotate.
3. **M2 — Reliability:** fallback inputs, permission UX, performance budgets.
4. **M3 — Content:** planet facts, orbit fidelity, educational framing, public demo.

## Risks

- Gesture accuracy is the product; it must be measured per session, not assumed.
- Camera-permission friction splits the audience.
- Browser variance (Safari vs Chrome) affects both WebGL and camera access.
- Accuracy of orbital content needs a source and a maintenance plan.
