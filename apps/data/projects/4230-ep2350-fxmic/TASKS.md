---
id: "4230"
slug: ep2350-fxmic
title: "EP\u20132350 FX\u2013MIC"
status: enriched
source:
  name: ProductHunt
  url: "https://www.producthunt.com/products/teenage-engineering"
category: product-launch
date: "2026-08-30"
tags: [ProductHunt, Product Launch]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# EP-2350 FX-MIC

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/4230-ep2350-fxmic/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Build the microphone capsule, the preamp, and the DSP engine's audio input path.
- [ ] Integrate the sensor layer for squeeze (pressure), shake (accelerometer gesture), and play (strike or tap on the body); tune the gesture detection for stage intensity.
- [ ] Implement the onboard DSP engine that shapes the mic input and the gesture inputs in real time, exposing the full parameter surface the user can map to.
- [ ] Build the configuration surface (the device's UI for editing mappings) so the user can program the gesture-to-parameter mapping without a connected computer.
- [ ] Add the onboard storage for mappings and samples, with the persistence path that survives a power cycle.
- [ ] Wire the host connection protocol (the audio channel and the control channel) so common live-performance rigs recognize the mic as a controller and an audio source.
- [ ] Implement the standalone mode so the mic operates without a connected computer, with the battery or bus-power path that supports it.
- [ ] Add the firmware update path that either preserves mappings and samples or restores them after a documented wipe, with the user warned before any wipe.
- [ ] Enforce the latency budget: measure the round-trip from gesture to audible change at every milestone; a latency the performer can hear is a test failure.
- [ ] Write the README that documents the three gestures, the configuration surface, the standalone mode, the host protocol, and the firmware update path.
- [ ] Run an end-to-end test on a representative live-performance scenario: a squeeze modulates a mapped parameter, a shake triggers a mapped sample, a play strike triggers a mapped note, the latency holds under stage conditions, the standalone mode operates without a host, and the host protocol exposes the device to a common live-performance rig.

## Phase 2: Deploy

- [ ] Ship the firmware and the device firmware update path
- [ ] Document the parameter surface, the gesture set, and the host protocol in the launch material so users understand the device's scope
- [ ] Verify in production