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

## Problem

Long work meetings need something to keep the hands busy. Pens, cables, the corner of a notebook — the usual. Tether is a Mac menu bar app that hangs a ball on an elastic tether. Drag it, fling it, slingshot it; the ball bounces off real app windows, rolls along their edges, and settles into the dock. Cut the rope and it goes loose across the desktop. Real physics, not a canned animation, so it never does the same thing twice.

The source is the ProductHunt page for Tether by Alex. The app is built for macOS 14 and later, distributed as a one-time purchase on the Mac App Store, with no account, no subscription, no telemetry, and nothing leaving the Mac. The poster named ADHD as a use case ("Thank you, that is exactly the case I built it for. Hands busy, ears free!"), and the comments surfaced requests for audio (which the maker declined: "Completely silent, no audio anywhere in the app").

Seven balls ship with the app, each with its own weight, grip, and bounce. Gravity, bounce, size, and rope length are tunable live, with presets. One key hides the ball the instant somebody says the user's name. The launch tags are Mac, Productivity, Menu Bar Apps.

The source names the actor (a Mac user in long meetings who wants to keep their hands busy), the pain (pens and cables are limited; a physical fidget ball is not on the desk; canned animations are predictable), and the missing thing (a menu bar ball with real physics that reacts to real app windows). It does not name a specific meeting tool, a specific work context, or a specific commercial offering beyond the one-time Mac App Store purchase.

## Objective

Build the Tether menu bar app for macOS 14 and later: a ball on an elastic tether with real physics that reacts to real app windows, seven balls each with their own weight, grip, and bounce, live-tunable gravity / bounce / size / rope length, a hide-on-keypress escape, distributed as a one-time purchase on the Mac App Store, with no account, no subscription, no telemetry, nothing leaving the Mac.

## Target Users

- Mac users in long work meetings who want to keep their hands busy.
- Users with ADHD (the maker's named use case: "Hands busy, ears free").
- Users who want a real-physics fidget ball that reacts to real app windows rather than a canned animation.
- Users who want a one-time purchase on the Mac App Store, no subscription, no telemetry.
- Users who want a hide-on-keypress escape ("one key hides it the instant somebody says your name").

## MVP Scope

- A menu bar app for macOS 14 and later, distributed as a one-time purchase on the Mac App Store.
- A ball on an elastic tether that hangs from the Mac menu bar.
- Real physics: drag, fling, slingshot, the tether stretches and snaps back, the ball lands on the top edges of real app windows, rolls along them, and reacts when the user moves the windows.
- Cut the rope: the ball comes loose across the desktop, bouncing off whatever is in the way.
- Seven balls, each with its own weight, grip, and bounce.
- Live tuning of gravity, bounce, size, and rope length, with presets.
- A hide-on-keypress escape that hides the ball the instant somebody says the user's name.
- No account, no subscription, no telemetry, nothing leaves the Mac.
- The Mac App Store distribution as a one-time purchase.
- The launch tags Mac, Productivity, Menu Bar Apps.
- The maker's explicit "completely silent, no audio anywhere in the app" choice.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The ball has real physics, not a canned animation. A canned animation that repeats is a UX failure.
- The ball reacts to real app windows: lands on top edges, rolls along them, reacts to window moves. A ball that ignores real windows is a physics-fidelity failure.
- Seven balls ship at launch, each with its own weight, grip, and bounce. The plan does not invent an eighth ball.
- Gravity, bounce, size, and rope length are live-tunable, with presets. The plan does not invent an additional tunable.
- The app is completely silent: no audio anywhere, including the comments the maker declined. The plan does not invent audio.
- One key hides the ball. The plan does not invent a second hide key.
- macOS 14 and later is the supported OS. The plan does not invent support for older macOS versions.
- Distribution is the Mac App Store as a one-time purchase. The plan does not invent a subscription, a per-ball price, or a paid tier.
- No account, no subscription, no telemetry, nothing leaves the Mac. The plan does not invent a network call.
