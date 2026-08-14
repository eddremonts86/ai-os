---
id: "335"
slug: the-problem-of-lacking-effective-rescue-robots-for-disa
title: The problem of lacking effective rescue robots for disaster situations
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/other/m5ks0dxi31-the-problem-of-lacking-effective-rescue"
category: other
date: "2025-10-29"
tags: [Other]
country: India
tech: [ROS 2 (Humble), NVIDIA Jetson Orin Nano, ZED 2i depth camera, FLIR Boson thermal, LTE/5G cellular telemetry]
---
# The problem of lacking effective rescue robots for disaster situations

## Phase 0: Scaffold

- [ ] Read the source at `https://problemhunt.pro/en/other/m5ks0dxi31-the-problem-of-lacking-effective-rescue` and quote the original problem statement into a `source-quote.md` for traceability.
- [ ] Create the project folder under `apps/335-the-problem-of-lacking-effective-rescue-/` (or per the chosen deployment target).
- [ ] Initialize git, pin dependencies for: ROS 2 (Humble), NVIDIA Jetson Orin Nano, ZED 2i depth camera, and confirm versions resolve in CI.
- [ ] Write DESIGN.md with country-appropriate defaults (`country: India`) — color, type, density, motion tokens — not the global default.
- [ ] Scaffold the auth + persistence layer with data-residency configured for India.
- [ ] Implement the smallest slice from MVP Scope that proves the ROS 2 (Humble), NVIDIA Jetson Orin Nano, ZED 2i depth camera integration in production.
## Phase 1: Core

- [ ] Tracked chassis with IP67 sealing, 90-min battery, stair-climbing geometry
- [ ] Sensor stack integration: ZED 2i + FLIR Boson + IP68 audio + IR illuminator
- [ ] Jetson Orin Nano running ROS 2 Humble with SLAM and thermal-visual overlay
- [ ] Operator console: chest-worn tablet + one-handed controller
- [ ] LTE/5G telemetry link with 500-m NLOS range through building
- [ ] Two-way audio with push-to-talk inside console
- [ ] Pilot with 3 NDRF battalions: 5 deployments each, fortnightly operator interviews

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (ROS 2 (Humble), NVIDIA Jetson Orin Nano, ZED 2i depth camera) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 335-the-problem-of-lacking-effective-re MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in India completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for ROS 2 (Humble), NVIDIA Jetson Orin Nano, ZED 2i depth camera errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
