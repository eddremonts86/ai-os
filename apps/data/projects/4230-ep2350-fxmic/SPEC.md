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

## Problem

A microphone for music performance has traditionally been a passive transducer: it captures sound and the downstream gear shapes it. The Teenage Engineering launch post names the alternative: a programmable mic you can squeeze, shake, and play. The post is short — a tagline and a discussion link — but the programmability claim is explicit: the mic is a controller, not just a transducer. The user squeezes the body to modulate, shakes it to trigger a sample or a parameter change, and plays it like an instrument. The source names the actor (a music performer or producer who wants a mic that is also a controller), the pain (a passive mic requires downstream gear to shape the sound and the performance), and the missing thing (a mic with built-in programmability that responds to squeeze, shake, and play gestures). It does not name a specific DSP engine, a specific gesture set beyond the three named, or a specific connection protocol.

## Objective

Ship a programmable microphone that the user can squeeze, shake, and play as a performance instrument, with the mic's body acting as a controller that shapes the sound and triggers parameters in real time, so the user does not need downstream gear to perform with it.

## Target Users

- Music performers who want a mic that is also a performance controller and not just a passive transducer.
- Producers building live sets who want a single device that captures and shapes sound.
- Electronic musicians who want a hands-on mic that responds to physical gestures.
- Live performers who want the mic itself to be part of the instrument's visual identity.
- Studio producers prototyping vocal-driven performances and wanting a programmable surface to direct them.

## MVP Scope

- A microphone with a body that responds to squeeze (pressure modulates a parameter), shake (gesture triggers a sample or a parameter change), and play (the body is struck or tapped to trigger a note or a sample).
- Built-in programmability: the user maps gestures to DSP parameters or sample triggers without needing a separate computer.
- A real-time DSP engine that shapes the sound from the mic input and the gesture inputs.
- A configuration surface where the user programs the gesture-to-parameter mapping.
- A standalone mode: the mic operates without a connected computer.
- A connection protocol to a host (the source names no specific protocol; the protocol is the device's claim).
- Onboard storage for samples and mappings the user has programmed.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The mic is programmable in the body. A gesture the user cannot map to a parameter is a coverage gap, not a feature.
- The three named gestures are squeeze, shake, and play. A gesture outside the three is a scope expansion, not a default.
- The mic operates without a connected computer. A workflow that requires a host is a standalone failure.
- The configuration surface is onboard. A mapping the user cannot edit on the device is a UX failure.
- The DSP engine is real-time. A latency the performer can hear is a performance failure.
- The connection protocol to a host is open enough to plug into common live-performance rigs.