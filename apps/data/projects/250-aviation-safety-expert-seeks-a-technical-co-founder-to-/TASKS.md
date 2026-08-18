---
id: "250"
slug: aviation-safety-expert-seeks-a-technical-co-founder-to-
title: Aviation safety expert seeks a technical co-founder to develop an AI solution that prevents daily collisions between aircraft and birds/drones — a problem causing massive losses.
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/ai/9g9de9og51-aviation-safety-expert-seeks-a-technical"
category: ai
date: "2026-01-13"
tags: [AI, Dev, Logistics, Travel, Hardware, Other]
country: France
---
# Aviation safety expert seeks a technical co-founder to develop an AI solution that prevents daily collisions between aircraft and birds/drones — a problem causing massive losses.

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/250-aviation-safety-expert-seeks-a-technical-co-founder-to-/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Sign the co-founder agreement (equity, IP, decision rights) before any technical work begins.
- [ ] Install radar and PTZ or fixed optical camera on one runway approach corridor with airport authority cooperation.
- [ ] Stand up the edge inference unit (NVIDIA Jetson Orin) and the on-site server; both inside the airport network.
- [ ] Build the radar-track + optical-frame ingestion pipeline in ROS 2 with hardware timestamping.
- [ ] Train and deploy the PyTorch classification model (bird flock / single bird / drone / other) on the edge unit.
- [ ] Build the collision-risk predictor that combines classification, contact trajectory, and active-aircraft context.
- [ ] Build the tower view (React + Vite, read-only) with contacts, classifications, and risk scores in real time.
- [ ] Persist all events to TimescaleDB and run a three-to-six-month shadow-mode validation season; publish recall and false-alarm rate.

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (the chosen stack) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 250-aviation-safety-expert-seeks-a-tech MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in France completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for the chosen stack errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
