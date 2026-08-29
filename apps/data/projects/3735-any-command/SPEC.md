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

## Problem

The maker (Ince Czechner) describes Any Command as the answer to a "genuinely stupid problem": he runs a single monitor, and when something is playing fullscreen on it — a film, a render, a long compile visualisation — the machine is occupied but he still wants to answer a message or check a build without alt-tabbing the fullscreen away. Buying a second monitor would solve it, and the maker explicitly says "a second monitor was the sensible answer and I did not want to buy one." Existing remote-desktop tools (Microsoft Remote Desktop, Parsec, AnyDesk) solve this in principle but at the wrong level of granularity: they send the whole desktop, with fullscreen interruptions, and they require installation on the PC. The ProductHunt listing pins the product's narrower claim: stream *one* window from the Windows PC to the Android phone, send taps / keyboard / gamepad input back, and let the fullscreen stay fullscreen. Bluetooth mode extends that to "nothing installed on the PC at all" — important on locked-down work laptops and meeting-room machines.

## Objective

Ship an Android-side remote surface for a Windows PC that does three things the listing frames as the core: (a) stream one chosen window to the phone instead of the whole desktop, (b) deliver taps and keypresses back to that window only, and (c) reach the user even on machines where the user cannot install anything (Bluetooth keyboard-and-mouse mode). Around that core, the product also exposes a proper trackpad with gestures, a keyboard, a user-built shortcut panel, a home-screen widget for firing automations, file transfer, clipboard sync, a gamepad, and a live CPU / RAM view. Free tier with no account is the contract; an optional "Premium" upgrade is named without a price.

## Target Users

- **Primary:** single-monitor Windows users who do not want to (or cannot) buy a second monitor and want to reclaim the phone already in their pocket as a screen and an input device.
- **Secondary:** "locked-down PC" users — work laptops, meeting-room machines, family desktops where the user has no install rights; Bluetooth mode is the entry point that does not require a PC install.
- **Tertiary:** power users who already own a stream-to-second-screen tool but want one that streams *one window*, not the whole desktop, so a fullscreen movie / render / compile stays put.

## MVP Scope

- A Windows PC component that exposes one chosen window (titled, selected by the user) as a stream over the local network, with input routed back to that window only.
- An Android app that receives the stream, renders it, and sends taps, scrolls, keyboard, and shortcut-panel input back to the chosen window.
- A trackpad surface with gestures (two-finger scroll, etc.); a software keyboard; a gamepad mapping; clipboard sync; file transfer.
- A home-screen widget that fires a user-built automation on tap.
- A live CPU / RAM readout on the phone (named in the listing).
- Bluetooth mode that pairs the phone as a generic keyboard and mouse (HID), requiring nothing on the PC, falling back to network mode when Bluetooth is unavailable or undesirable.
- Free tier, no account, no telemetry tied to identity; a Premium tier is named without a price in the listing.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- "Stream one window" is the hard part of the product, and the ProductHunt comment thread makes it the load-bearing capability: "Windows really does not want you delivering clicks to a background window, and Chromium apps stop rendering entirely the moment they think nobody can see them." The MVP must communicate honestly when a target window cannot be remoted (some games, sandboxed apps, some DRM'd media), rather than silently failing.
- Bluetooth mode is the entry path for locked-down PCs; the team must ensure the network-mode install is genuinely optional and that no "please install our agent" wall blocks a first run on a managed corporate laptop.
- "Runs on your own network, or over Bluetooth with nothing installed" is the privacy contract for the maker, who explicitly states "no account to create, everything runs on your own network unless you deliberately turn on internet access." A default that quietly opens internet egress would violate the contract.
- Latency on a stream-and-input loop is product-critical. A 200 ms RTT loop is fun; a 600 ms loop is not. The MVP must hit a comfortable target on a home Wi-Fi network and tell the user when the link is degraded.
- Premium pricing is named but not quantified in the source. `wtp` is left `absent` rather than invented; the team should publish a price when the listing references "Premium" so a reader knows the gate, not a guess.
- The maker is one dev, no company, no funding. Reliability for the user still requires an upgrade path (auto-update, rollback, A/B) that a single dev typically has to ship without a backend.
