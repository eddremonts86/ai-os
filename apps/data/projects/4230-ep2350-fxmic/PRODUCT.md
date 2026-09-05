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

## Value Proposition

A programmable microphone that the user can squeeze, shake, and play as a performance instrument. The mic's body is a controller, not a passive transducer: pressure modulates a parameter, a shake gesture triggers a sample or a parameter change, and a strike or tap triggers a note or a sample. The onboard DSP engine shapes the sound in real time, the user programs the gesture-to-parameter mapping on the device, and the mic operates without a connected computer.

The mic is the rig. A workflow that requires a separate computer to map gestures to parameters, or to shape the sound, is a workflow failure. The connection protocol to a host is open enough to plug into common live-performance rigs; the mic is the instrument's visual identity and the source of its sound.

**One-liner:** A programmable mic you can squeeze, shake, and play, with onboard DSP and gesture mapping that does not need a separate computer.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Music performers | Want a mic that is also a performance controller, not just a passive transducer. |
| Producers building live sets | Want a single device that captures and shapes sound. |
| Electronic musicians | Want a hands-on mic that responds to physical gestures. |
| Live performers | Want the mic itself to be part of the instrument's visual identity. |
| Studio producers prototyping vocal-driven performances | Want a programmable surface to direct them. |

## Jobs To Be Done

1. **Functional job** — Squeeze the mic body and have the pressure modulate a DSP parameter the user has mapped.
2. **Functional job** — Shake the mic and have the gesture trigger a sample or a parameter change the user has mapped.
3. **Functional job** — Strike or tap the mic and have the play trigger a note or a sample the user has mapped.
4. **Functional job** — Program the gesture-to-parameter mapping on the device without a connected computer.
5. **Functional job** — Plug the mic into a live-performance rig and have the host see it as a controller and an audio source.
6. **Emotional job** — Stop the feeling that a performance mic is a passive transducer the user has to feed through downstream gear to make interesting.
7. **Social job** — Be the performer whose mic is the instrument, not just a source for the instrument.

## Success Metrics

- **Gesture coverage** — share of squeeze, shake, and play gestures the mic reliably detects at performance intensity. A missed gesture is a sensor gap.
- **Mapping coverage** — share of gestures the user can map to any DSP parameter or sample trigger the engine exposes. A gesture the user cannot map is a coverage gap.
- **Real-time latency** — the round-trip latency from gesture to audible change. A latency the performer can hear is a performance failure.
- **Standalone coverage** — share of configurations the user can run without a connected computer. A configuration that requires a host is a standalone failure.
- **Host compatibility** — share of common live-performance hosts that recognize the mic as a controller and an audio source. An unrecognized host is a protocol gap.
- **Onboard storage coverage** — share of mappings and samples the device holds without a connected computer. A storage limit the user hits is a capacity gap.

## Pricing & Monetization

The source names no fee, no tier, and no commercial plan. The launch post is a tagline and a discussion link. Any future monetization has to be measured against the gesture coverage and the real-time latency, because those are the metrics the source ties to the mic's value proposition.

## Competitive Landscape

- **Passive performance mics (the names the source does not provide)** — capture sound faithfully, but require downstream gear to shape the sound and the performance.
- **MIDI controllers with built-in mics (the names the source does not provide)** — combine a controller and a mic, but the controller is a separate surface from the mic, not the mic body.
- **Tabletop vocal processors (the names the source does not provide)** — shape the sound from a mic input, but the user programs them from a separate computer, not from the mic body.
- **Gesture-only controllers (the names the source does not provide)** — respond to physical gestures, but do not capture vocal audio.

The post names no specific incumbent, so no further comparison is claimed here.

## Risks & Open Questions

- [ ] Confirm the gesture detection's reliability at performance intensity. The source claims squeeze, shake, and play; the open question is whether the sensors hold up under sustained stage use.
- [ ] Define the DSP engine's parameter surface. The source names no specific engine; the open question is the parameter list the user can map gestures to.
- [ ] Validate the onboard mapping surface. The user programs on the device; the open question is whether the surface is a small screen with buttons, a touch strip, or a hidden gesture editor.
- [ ] Decide the connection protocol to a host. The source names no specific protocol; the open question is whether it is MIDI, OSC, USB audio class with control, or a vendor-proprietary protocol.
- [ ] Establish the standalone mode's storage. The user stores mappings and samples on the device; the open question is the storage capacity and the format for samples.
- [ ] Confirm the latency budget under stage conditions. The DSP is real-time; the open question is whether the latency holds under heavy gesture load.
- [ ] Define the policy on a firmware update. The device is programmable; the open question is whether a firmware update preserves the user's mappings and samples or wipes them.