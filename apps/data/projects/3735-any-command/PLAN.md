---
id: "3735"
slug: any-command
title: Any Command
status: enriched
source:
  name: ProductHunt
  url: "https://www.producthunt.com/products/any-command-remote-control-for-pc"
category: product-launch
date: "2026-08-23"
tags: [ProductHunt, Product Launch]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Any Command

## Tech Stack

Chosen for a Windows-to-Android loop whose load-bearing capability is streaming one window and letting the fullscreen stay fullscreen — the captured JavaScript defaults are legacy, not the build.

- **Windows window-capture component:** exposes one user-chosen window as a stream over the local network.
- **Android app:** renders the stream and sends taps, scrolls, keyboard, and shortcut-panel input back to that window only.
- **Bluetooth HID mode:** pairs the phone as a generic keyboard and mouse with nothing installed on the PC.
- **Local-network transport:** everything runs on the user's own network unless internet access is deliberately enabled.
- **Auxiliary surfaces:** trackpad with gestures, software keyboard, gamepad mapping, clipboard sync, file transfer, a home-screen widget, and a CPU / RAM readout.

## Architecture

- **One-window targeting:** window selection and input routing to that window only; the monitor's fullscreen stays untouched.
- **Input back-channel:** taps and keys route to the chosen window; windows that cannot be remoted (some games, sandboxed apps, DRM media) are reported honestly.
- **Bluetooth fallback:** HID keyboard-and-mouse mode requiring no install — the entry path for locked-down PCs.
- **Privacy contract:** no account, local network only, and no internet egress unless the user opts in.
- **Latency monitor:** per-session RTT is surfaced so a degraded link is visible instead of silent.

## Milestones

1. **M0 — One-window streaming.** A chosen window streams to the Android phone on a home Wi-Fi network with input back.
2. **M1 — Bluetooth mode.** HID keyboard-and-mouse pairing works with nothing installed on a locked-down PC.
3. **M2 — Peripheral surfaces.** Trackpad gestures, keyboard, gamepad, shortcut panel, widget, clipboard, file transfer, and the CPU / RAM view land.
4. **M3 — Launch.** The free tier ships with no account; Premium is named with a published price; auto-update and rollback exist.

## Risks

- **Window remoting limits:** Windows resists background-window input and Chromium apps stop rendering when unfocused; honest reporting is mandatory.
- **Install friction:** if SmartScreen, AV, or MDM blocks the network agent on managed laptops, the Bluetooth path must carry the product.
- **Latency drift:** above the comfort threshold the "second screen" promise erodes silently; the per-session RTT display is the mitigation.
- **Unpublished Premium price:** a named tier with no number cannot communicate its gate; publish before the listing drives traffic.
- **Single-developer fragility:** one bug in the stream loop crashes the value proposition; auto-update and rollback are not optional.
