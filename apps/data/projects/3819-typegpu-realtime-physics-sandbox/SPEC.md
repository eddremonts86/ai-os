---
id: "3819"
slug: typegpu-realtime-physics-sandbox
title: TypeGPU Realtime Physics Sandbox
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49495118"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [TypeGPU, WebGPU compute shaders, PBF fluid simulation, Eulerian smoke solver, depth-map light injection, webcam hand tracking]
---
# TypeGPU Realtime Physics Sandbox

## Problem

The poster built the sandbox after being inspired by Konrad Reczko's "Depth-aware light injection in TypeGPU" work. It showcases realtime PBF (position-based fluids) fluid simulation, Eulerian smoke, and multi-source light simulation applied to photos, videos and live webcam. The trick that ties them together is depth: scene gravity is inferred from the surface normals of the depth map, so tilted scenes should simulate fluid motion accurately — pour water across a slanted surface in a photo and it flows the way the geometry suggests. There are also playful extras: hand tracking, and a work-in-progress cup interior detection so you can fill up cups and glasses that appear in live video. The capture names no deployment URL and no repository; the product is the demo itself, shared for people to look at and try.

## Objective

Turn the depth-aware simulation into a shareable, reproducible showcase: fluids, smoke and light that respect the geometry of any photo, video or webcam feed, with hand tracking and cup-filling as the fun demonstrations that make the physics feel real.

## Target Users

- Graphics programmers evaluating TypeGPU and WebGPU compute for physics workloads.
- Interactive-media artists who want depth-aware effects on real footage.
- Demo-curious tinkerers who want to pour simulated water into a real cup on a webcam.

## MVP Scope

- Realtime PBF fluid simulation rendered via WebGPU and TypeGPU.
- Eulerian smoke simulation.
- Multi-source light simulation on photos, videos and live webcam input.
- Depth-map-derived gravity: surface normals from the depth map steer fluid motion on tilted scenes.
- Hand tracking interaction.
- WIP cup interior detection for filling cups and glasses in live video.

## Constraints

- Realtime is the bar: every effect must hold interactive framerates, or the showcase fails.
- Depth quality bounds realism: gravity inference is only as good as the depth map the model produces.
- The cup-filling feature is explicitly work-in-progress; it must be presented as such.
- The capture names no repo, license or hosting; only the described demo is verifiable.

## Design Direction

See `DESIGN.md` for this project's design tokens.
