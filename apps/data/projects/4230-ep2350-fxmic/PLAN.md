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

## Tech Stack

- **A microphone capsule** at the head of the device, matching the source's claim that the device is a mic.
- **A body with embedded sensors** that detect squeeze (pressure), shake (accelerometer gesture), and play (strike or tap on the body).
- **An onboard DSP engine** that shapes the mic input and the gesture inputs in real time, matching the source's claim that the mic operates without a connected computer.
- **A configuration surface** (the source names no specific form factor; the surface is the device's claim) where the user programs the gesture-to-parameter mapping.
- **Onboard storage** for mappings and samples, matching the source's standalone-mode claim.
- **A connection protocol to a host** (the source names no specific protocol; the protocol is the device's claim) that exposes the mic as a controller and an audio source.
- **A standalone power source** (battery or bus power, the source is silent on which) so the device operates without a connected computer.
- **A firmware update path** that preserves user mappings and samples, or a documented wipe-and-restore flow if it does not.

## Architecture

The device is a single-piece microphone with four logical layers: the capsule, the sensor layer, the DSP engine, and the configuration surface. The capsule is the audio input; the sensor layer detects squeeze, shake, and play; the DSP engine shapes the audio and the gesture inputs in real time; the configuration surface programs the gesture-to-parameter mapping and stores mappings and samples on the device.

The capsule feeds the DSP engine directly; the DSP engine's output is the audio that leaves the device over the connection protocol to a host (or stays on the device in standalone mode). The sensor layer feeds the DSP engine's parameter modulation inputs, so a squeeze, shake, or play gesture modulates a parameter the user has mapped.

The DSP engine is real-time and runs on the device. The parameter surface is the engine's claim; the user maps gestures to any parameter the engine exposes. A gesture the user cannot map to a parameter is a coverage gap, not a missing gesture.

The configuration surface is the device's UI for editing mappings. The source names no specific form factor (small screen with buttons, a touch strip, a hidden gesture editor); the form factor is the device's claim. The surface operates on the device, without a connected computer; a mapping the user cannot edit on the device is a UX failure.

The connection protocol to a host exposes two channels — the audio output and the control input/output — to a common live-performance rig. The source names no specific protocol; the protocol is the device's claim. The device operates without a host (standalone mode) and with a host (host mode); both modes expose the same gesture-to-parameter mapping.

The onboard storage holds mappings and samples. The firmware update path either preserves them or restores them after a documented wipe. The latency budget is the round-trip from gesture to audible change; a latency the performer can hear is a performance failure.

## Milestones

1. **M1 — Microphone capsule and audio path** — the capsule, the preamp, the DSP engine's audio input.
2. **M2 — Sensor layer** — the squeeze sensor, the shake accelerometer, the play strike-or-tap sensor; the gesture-detection firmware.
3. **M3 — Onboard DSP engine** — the real-time engine, the parameter surface, the audio output.
4. **M4 — Configuration surface** — the device UI for editing mappings, the standalone edit flow.
5. **M5 — Onboard storage** — the mappings store, the samples store, the persistence path.
6. **M6 — Host connection protocol** — the audio and control channels, the host-mode behaviour.
7. **M7 — Standalone mode** — the no-host configuration, the battery or bus-power path.
8. **M8 — Firmware update path** — the mappings-and-samples preservation, the documented wipe-and-restore flow.

## Risks

- **Sensor misses a gesture under stage intensity** — the squeeze, shake, or play goes undetected. Mitigation: the sensor layer is tuned for stage intensity; the firmware exposes a sensitivity setting; a missed gesture is a test failure.
- **DSP engine latency audibly above the performance budget** — the performer hears the delay between gesture and sound. Mitigation: the engine is real-time; the latency is measured at every milestone; the audio buffer is bounded.
- **Mapping coverage too narrow** — the user cannot map a gesture to the parameter they want. Mitigation: the parameter surface is the engine's full set; the configuration surface exposes the full set.
- **Host protocol incompatibility** — the host does not recognize the device as a controller or an audio source. Mitigation: the protocol is tested against common live-performance rigs; an unrecognized host is a milestone, not a silent failure.
- **Onboard storage too small** — the user runs out of mappings or samples. Mitigation: the storage capacity is documented; the user can offload to a host; a capacity hit is a coverage gap, not a silent failure.
- **Firmware update wipes mappings** — the user loses their work. Mitigation: the firmware update path either preserves mappings or restores them after a documented wipe; the user is warned before a wipe.
- **Configuration surface too small to edit mappings** — the user cannot program the gesture-to-parameter mapping on the device. Mitigation: the surface is sized for the mapping set; a too-small surface is a UX failure, not an advanced-mode fallback.