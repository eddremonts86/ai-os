---
id: "4228"
slug: tether
title: Tether
status: enriched
source:
  name: ProductHunt
  url: "https://www.producthunt.com/products/tether-a-ball-for-boring-meetings"
category: product-launch
date: "2026-08-30"
tags: [ProductHunt, Product Launch]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Tether

## Tech Stack

- **A macOS menu bar app** built for macOS 14 and later, distributed on the Mac App Store as a one-time purchase.
- **A physics engine** that delivers real physics (drag, fling, slingshot, bounce, gravity, rope stretch, snap-back) — the source is explicit that the ball has real physics, not a canned animation.
- **A window-integration layer** that detects real app windows, lands the ball on top edges, rolls along them, and reacts when the user moves the windows.
- **Seven ball configurations** each with their own weight, grip, and bounce, with the user able to pick the ball live.
- **A live-tunable settings panel** for gravity, bounce, size, and rope length, with presets.
- **A hide-on-keypress escape** that hides the ball the instant the user presses the configured key.
- **A cut-the-rope interaction** that lets the ball go loose across the desktop, bouncing off whatever is in the way.
- **No network call, no telemetry, no account** — the no-network guarantee is structural.

## Architecture

The app has three surfaces: the menu bar surface (the ball on the tether, the dock anchor, the cut-the-rope interaction), the settings surface (the live-tunable gravity / bounce / size / rope length, the ball picker, the presets), and the system surface (the window integration, the hide-on-keypress escape).

The menu bar surface is the unit of trust the user sees. The ball hangs from the menu bar on an elastic tether; the user drags it, flings it, slingshot it; the tether stretches and snaps back. The ball lands on the top edges of real app windows, rolls along them, and reacts when the user moves the windows. Cut the rope and the ball goes loose across the desktop, bouncing off whatever is in the way.

The settings surface is where the user tunes the ball live. Gravity, bounce, size, and rope length are tunable, with presets. Seven balls ship, each with its own weight, grip, and bounce; the user picks the ball from the menu bar or the settings surface.

The system surface is the structural reason the ball has real physics. The window-integration layer detects real app windows, lands the ball on top edges, rolls along them, and reacts to window moves. The hide-on-keypress escape is the user's exit from a meeting turn. The no-network guarantee is structural — no account, no subscription, no telemetry, nothing leaves the Mac.

The Mac App Store distribution is the source's distribution. The one-time purchase is the source's monetization. The plan does not invent a subscription, a per-ball price, or a paid tier.

## Milestones

1. **M1 — Menu bar surface** — the ball on the tether, the drag / fling / slingshot interactions, the rope stretch and snap-back.
2. **M2 — Window integration** — the ball lands on top edges of real app windows, rolls along them, reacts to window moves.
3. **M3 — Seven ball configurations** — weight, grip, bounce per ball, the picker, the live ball switch.
4. **M4 — Live-tunable settings** — gravity, bounce, size, rope length, presets.
5. **M5 — Hide-on-keypress escape** — the configured key, the hide latency.
6. **M6 — Cut-the-rope interaction** — the loose ball across the desktop, the bounce-off-anything behaviour.
7. **M7 — No-network guarantee** — the structural no-account, no-subscription, no-telemetry, nothing-leaves-the-Mac enforcement.
8. **M8 — Mac App Store distribution** — the listing, the one-time purchase, the macOS 14+ minimum.

## Risks

- **Physics-fidelity regression** — the ball's behaviour drifts from real physics toward a canned animation. Mitigation: the physics-fidelity rate is a first-class metric; the per-frame integration is unit-tested against known physics fixtures; a regression is a release blocker.
- **Window-integration edge case** — a non-standard window manager (a tiling WM, a custom shell, mission-control-exposed Spaces) breaks the ball's reaction to real windows. Mitigation: the window-integration layer is tested against the standard macOS window manager; the maker documents the supported configurations; a regression surfaces visibly with a "limited integration" warning.
- **Cut-the-rope bounce runaway** — the ball bounces indefinitely and never settles. Mitigation: the cut-the-rope bounce behaviour surfaces a "settled" state after the ball's kinetic energy drops below a threshold; the user can re-attach the rope to stop the motion.
- **Hide-on-keypress latency** — the hide latency exceeds the user's escape-velocity threshold. Mitigation: the hide latency is a first-class metric; the hide is a synchronous call; a regression is a release blocker.
- **Live-tunable range too narrow** — the gravity / bounce / size / rope length range does not cover the user's preferred fidget. Mitigation: the range is documented; the presets are the user's escape valve; the maker documents how to file a tunable-range request.
- **Mac App Store review rejection** — the app is rejected for a privacy or content concern. Mitigation: the no-network guarantee is documented in the App Store privacy practices; the listing is explicit about the one-time-purchase model; the rejection is escalated per the App Store review process.
- **macOS update breaks menu bar integration** — a future macOS version changes the menu bar API. Mitigation: the macOS 14+ minimum is documented; the app ships an OS-compatibility test; a regression is escalated to the maker's support channel.
