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

## Problem

Indian disaster response teams - NDRF, state SDRF, fire services - operate in post-collapse, post-flood and industrial-accident scenarios where sending a human rescuer into a structurally compromised space is the highest-risk part of the operation. The poster identifies that the kits currently available either cost more than the responding team can procure or are too limited in sensing to replace a rescuer for long enough to matter. What is missing is a mid-priced robot that carries thermal + visual + two-way audio and can be operated by a responder with a one-week training course.

## Objective

Ship a mid-priced tracked rescue robot platform for Indian disaster response teams that carries thermal + stereo visual + two-way audio into compromised structures, streams to a wearable operator console, and can be deployed by a trained responder within 90 seconds.

## Target Users

- Indian NDRF battalions and state SDRF teams handling post-collapse, flood and industrial incidents.
- Industrial hazmat teams in refineries and chemical plants needing reconnaissance without a human entry.
- Fire services in tier-1 Indian cities whose commanders want a tracked scout before committing crew.

## MVP Scope

- Tracked chassis: stair-climbing, IP67, <= 18 kg, 90-min battery.
- Payload: ZED 2i stereo camera, FLIR Boson thermal, IP68 microphone + speaker, headlight + IR illuminator.
- Onboard compute: Jetson Orin Nano running ROS 2 Humble; real-time SLAM, thermal-visual overlay.
- Operator console: chest-worn tablet + one-handed controller; LTE/5G telemetry up to 500 m through a building.
- Deploy-in-90-seconds ritual: power-on, link check, drop-to-floor.
- Two-way audio with push-to-talk handled inside the operator console.
- No manipulator arm in v1 (a v2 feature).

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/other/m5ks0dxi31-the-problem-of-lacking-effective-res` follows the constraints in `335-.../SPEC.md` and the chosen stack (ROS 2 (Humble), NVIDIA Jetson Orin Nano, ZED 2i depth camera). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in India.

For India, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Per-unit bill of materials under INR 8 lakh to fit NDRF annual procurement budgets.
- Spares and repair must be possible at a state-level workshop, not only OEM.
- No classified or encrypted telemetry payload; standard ROS topic names are exposed for interop.
