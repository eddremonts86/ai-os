---
id: "3898"
slug: explore-the-solar-system-with-hand-gestures-in-a-browse
title: Explore the solar system with hand gestures in a browser
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

## Problem

The capture for this plan is a URL-only Show HN submission pointing at https://github.com/HUANGCHIHHUNGLeo/solar-atlas-gesture. The product claim carried by the title is a browser-based solar system explorer controlled by hand gestures — a visitor's webcam tracks their hands, and gestures navigate, zoom and select planets in a 3D scene, with no headset or app install required. The capture states nothing further: no supported browsers, no gesture vocabulary and no data sources.

## Objective

Build the MVP the title describes: a 3D solar system scene in the browser where the primary control surface is the visitor's own hands through a webcam. The MVP must pair the gesture layer with a conventional fallback — mouse, touch and keyboard — because gesture recognition is unreliable across lighting and hardware.

## Target Users

- Educators and science communicators who want an engaging, zero-install astronomy demo.
- Museums and planetariums with a public screen and a camera.
- Kids and casual explorers who learn by grabbing and spinning planets.
- Web developers curious about camera-based interaction in the browser.

## MVP Scope

- A 3D solar system scene with the planets in orbit.
- Hand-tracking via webcam with a small gesture vocabulary: point to select, pinch or swipe to zoom and rotate.
- Mouse, touch and keyboard fallbacks for every gesture.
- Planet facts surfaced on selection.

## Constraints

- The source is a bare URL plus title; the gesture vocabulary and scene design are ours.
- Camera access requires explicit permission and is a privacy moment; the MVP must work without the camera too.
- Gesture recognition quality varies wildly with lighting and hardware; fallbacks are part of the product, not an afterthought.
- No platform, performance or content claims exist in the capture; none may be invented.

## Design Direction

See `DESIGN.md` for this project's design tokens.
