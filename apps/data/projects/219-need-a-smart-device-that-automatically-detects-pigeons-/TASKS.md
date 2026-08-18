---
id: "219"
slug: need-a-smart-device-that-automatically-detects-pigeons-
title: Need a smart device that automatically detects pigeons and permanently deters them. Everything on the market is one-shot or habituation-prone.
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/"
category: iot
date: "2026-02-23"
tags: [IoT, Hardware, Environment]
country: France
tech: [Python, YOLOv8, Raspberry Pi, LoRa, ESP32, Next.js]
---
# Need a smart device that automatically detects pigeons and permanently deters them. Everything on the market is one-shot or habituation-prone.

## Phase 0: Scaffold

- [ ] Read the source at `https://problemhunt.pro/` and quote the original problem statement into a `source-quote.md` for traceability.
- [ ] Create the project folder under `apps/219-need-a-smart-device-that-automatically-d/` (or per the chosen deployment target).
- [ ] Initialize git, pin dependencies for: Python, YOLOv8, Raspberry Pi, and confirm versions resolve in CI.
- [ ] Write DESIGN.md with country-appropriate defaults (`country: France`) — color, type, density, motion tokens — not the global default.
- [ ] Scaffold the auth + persistence layer with data-residency configured for France.
- [ ] Set up the framework router, server actions, and a typed API client for the read/write endpoints listed in PLAN.md.
## Phase 1: Core

- [ ] Pigeon-vs-other-bird classifier
- [ ] Outdoor device with Pi-class CPU
- [ ] Sound deterrent (random tracks)
- [ ] LED deterrent (random patterns)
- [ ] Motion deterrent (random direction)
- [ ] Optional water sprayer
- [ ] Local log and per-device dashboard
- [ ] 10 pilot sites in France

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Python, YOLOv8, Raspberry Pi) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 219-need-a-smart-device-that-automatica MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in France completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Python, YOLOv8, Raspberry Pi errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
