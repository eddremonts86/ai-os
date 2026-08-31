---
id: "3730"
slug: lubb
title: Lubb
status: enriched
source:
  name: ProductHunt
  url: "https://www.producthunt.com/products/lubb-heartbeat-for-sleep"
category: product-launch
date: "2026-08-25"
tags: [ProductHunt, Product Launch]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Lubb

## Tech Stack

Chosen for a product whose entire surface is one felt rhythm on one device — the shipped runtime is native, and the captured JavaScript stack is legacy, not the build.

- **Swift / SwiftUI:** the native iOS app; the listing's Remotion entry is maker tooling for launch video, not the runtime.
- **Core Haptics / Taptic Engine:** the whole product surface — a slow, repeating lub-dub transient pattern.
- **On-device settings:** pace and feel preferences stay local; there is no account and no cloud sync.
- **No audio path:** no loops, no music, no voice — the cue is felt, not heard.

## Architecture

- **Single surface:** one tunable heartbeat with pace (beats per minute) and feel (intensity and sharpness of the transient).
- **Trial timer:** a 10-minute nightly session that auto-stops, started only by an explicit tap.
- **Pillow mode:** the UI assumes a face-down phone with a minimal screen and timer, so the user is not staring at it.
- **Hardware guard:** detects weak or missing Taptic hardware and tells the user rather than buzzing silently.

## Milestones

1. **M0 — Haptic heartbeat.** A tunable lub-dub pattern runs on Taptic-Engine iPhones with an explicit start action.
2. **M1 — Trial mechanics.** The 10-minute auto-stop and the path to a paid session beyond it ship through StoreKit.
3. **M2 — Hardware honesty.** Graceful messaging lands on devices with weak or absent Taptic Engines.
4. **M3 — App Store launch.** The free listing goes live with no account, no analytics SDK, and no login wall.

## Risks

- **Hardware variance:** older iPhones and iPads with weaker Taptic Engines degrade the experience; it must be detected, never silent.
- **Unstated trial-to-paid mechanic:** the listing describes the 10-minute trial but not the gate after it; deciding that is the biggest open question.
- **Privacy drift:** adding any analytics or push SDK would break the "no account, no analytics" claim that anchors the product.
- **Unattended buzzing:** without the explicit start-button requirement the phone could vibrate in a bag or pocket.
- **Novelty versus habit:** the product could be tried once as a gimmick; the seven-night return metric exists to catch that.
