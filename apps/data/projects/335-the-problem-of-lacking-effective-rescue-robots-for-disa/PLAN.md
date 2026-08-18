---
id: "335"
slug: the-problem-of-lacking-effective-rescue-robots-for-disa
title: The problem of lacking effective rescue robots for disaster situations
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/other/m5ks0dxi31-the-problem-of-lacking-effective-rescue"
category: other
date: "2025-10-29"
tags: [Other]
country: India
tech: [ROS 2 (Humble), NVIDIA Jetson Orin Nano, ZED 2i depth camera, FLIR Boson thermal, LTE/5G cellular telemetry]
---
# The problem of lacking effective rescue robots for disaster situations

## Tech Stack

- ROS 2 (Humble)
- NVIDIA Jetson Orin Nano
- ZED 2i depth camera
- FLIR Boson thermal
- LTE/5G cellular telemetry

Why this stack: each technology was chosen for this specific problem (the rationale is in the per-section prose). No global default stack is inherited from other plans.

## Architecture

The MVP for other runs as a single backend service on the stack (ROS 2 (Humble), NVIDIA Jetson Orin Nano, ZED 2i depth camera) with a thin client (web or mobile depending on the chosen deployment). Ingestion from the source post — captured at `https://problemhunt.pro/en/other/m5ks0dxi31-the-problem-of-lacking-effective-res` — feeds the problem statement and any captured body. From there, the read/write API serves a single dashboard view for the primary user in India, backed by an append-only audit log so each change can be traced back to a user action.

Components:

- **Edge / client** — serves the user surface and owns the auth handshake.
- **API** — single service exposing typed endpoints; no microservices in v1.
- **Persistence** — relational store (ROS 2 (Humble), NVIDIA Jetson Orin Nano, ZED 2i depth camera) with a migration log.
- **Background jobs** — used only for the source-body fetch and a daily metric rollup; nothing time-critical.
- **Outbound** — limited to the chosen payment processor and a transactional email side; no third-party trackers.

For India, data residency and payment routing follow the source post's locale (see `https://problemhunt.pro/en/other/m5ks0dxi31-the-problem-of-lacking-effective-res`).

## Milestones

M1 — Foundations (weeks 1–2): scaffold the app folder (`335-the-problem-of-lacking-effective-re`), pin dependencies for ROS 2 (Humble), NVIDIA Jetson Orin Nano, ZED 2i depth camera, and confirm CI on the chosen target. The schema from PLAN.md is in place and the auth path is end-to-end against a sandbox.

M2 — Source-faithful MVP (weeks 3–5): implement the smallest slice that solves the problem stated in `https://problemhunt.pro/en/other/m5ks0dxi31-the-problem-of-lacking-effective-res` with no feature creep. A single user from India can complete the core flow without hand-holding. WTP is not yet wired (only if the source post stated one — see SPEC.md).

M3 — Tightening (weeks 6–7): observability (logs + error tracking), data-residency config for India, and the security review per the constraints in SPEC.md.

M4 — Pilot (weeks 8–10): 5–10 users from India test the MVP and give feedback on the exact task the source post described. No marketing, no growth work, only the stated problem.

M5 — Decide (week 11): either commit to a v2 based on pilot signal, or shelve with a written post-mortem.

## Risks

- **Procurement cycles.** NDRF procurement is annual and highly procedural; cash flow during the pilot year must not depend on it.
- **Operator training absorption.** A one-week course is enough only if the UI is simple; the wearable controller carries that risk.
- **Field repair reality.** A failed chassis in the middle of a deployment is acceptable; a failed sensor stack is not - every sensor must be hot-swappable without tools.
