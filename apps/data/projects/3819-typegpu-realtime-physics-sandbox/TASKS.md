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

## Phase 0: Scaffold

- [x] Read the Show HN post to extract the simulation list, depth-gravity mechanism and WIP features
- [x] Write SPEC.md (this document)
- [x] Set up a TypeGPU project over WebGPU with a render loop
- [x] Build the depth-map pipeline for a single photo input

## Phase 1: Core

- [ ] Implement the PBF fluid solver running in realtime
- [ ] Implement the Eulerian smoke solver
- [ ] Infer gravity from depth-map surface normals and apply it to fluid motion
- [ ] Add multi-source light simulation on photos

## Phase 2: Deploy

- [ ] Run the pipeline on videos and live webcam input
- [ ] Add hand tracking interaction
- [ ] Finish or clearly gate the cup interior detection for fillable cups in live video
- [ ] Publish the showcase and measure framerate on reference hardware
