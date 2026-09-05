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

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/4228-tether/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Build the menu bar surface with the ball on the elastic tether, the drag / fling / slingshot interactions, the rope stretch and snap-back.
- [ ] Implement the window-integration layer: detect real app windows, land the ball on top edges, roll along them, react to window moves; surface a "limited integration" warning on non-standard window managers.
- [ ] Build the seven ball configurations: weight, grip, bounce per ball, the picker, the live ball switch.
- [ ] Implement the live-tunable settings: gravity, bounce, size, rope length, with presets.
- [ ] Implement the hide-on-keypress escape: the configured key, the synchronous hide call, the latency metric.
- [ ] Implement the cut-the-rope interaction: the loose ball across the desktop, the bounce-off-anything behaviour, the "settled" state after the ball's kinetic energy drops below a threshold.
- [ ] Enforce the structural no-network guarantee: no account, no subscription, no telemetry, nothing leaves the Mac; verify the no-network verification rate on every launch.
- [ ] Run an end-to-end test: a user installs the app on macOS 14+, sees the ball on the menu bar, drags / flings / slingshot it, watches the ball land on real app windows and roll along them, picks each of the seven balls, tunes gravity / bounce / size / rope length live, cuts the rope and watches the ball go loose across the desktop, presses the hide key and watches the ball disappear instantly; verify the app made no network call during the workflow.

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Submit the app to the Mac App Store as a one-time purchase with macOS 14+ as the minimum
- [ ] Document the no-network guarantee, the seven-ball launch set, the live-tunable settings, and the hide-on-keypress escape in the App Store listing
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-31_
