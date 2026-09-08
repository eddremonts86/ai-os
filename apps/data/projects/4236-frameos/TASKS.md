---
id: "4236"
slug: frameos
title: FrameOS
status: enriched
source:
  name: ProductHunt
  url: "https://www.producthunt.com/products/frameos-3"
category: product-launch
date: "2026-08-28"
tags: [ProductHunt, Product Launch]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# FrameOS

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/4236-frameos/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Build the macOS application scaffold with the device-connection entry points and the recording engine integration.
- [ ] Implement the iOS device-connection layer: the iOS bridge handling, the screen capture from the connected iOS device, the device-identification check that confirms the captured screen is the device's screen and not the Mac's screen.
- [ ] Implement the Android device-connection layer: the Android bridge handling, the screen capture from the connected Android device, the device-identification check.
- [ ] Build the recording engine: the documented format, the frame buffer, the pause-and-resume flow that holds the buffer and resumes without dropping frames.
- [ ] Add the post-record preview and trim surface: the playback from the per-user store, the non-destructive cut that produces a new file and preserves the source recording.
- [ ] Implement the per-user recording history store keyed to the user, the revisit surface, and the documented retention policy.
- [ ] Add the device-disconnect recovery path: the mid-recording unplug handling, the save-up-to-disconnect contract, the flag on the resulting recording.
- [ ] Document the iOS and Android version coverage, the recording format list, and the device connection method (USB, Wi-Fi, or both) in the README and the export dialog.
- [ ] Enforce the screen-identification check: the engine refuses to save a capture that the device-connection layer cannot identify as the device's screen; a wrong-screen capture is a test failure.
- [ ] Write the README that documents the macOS application, the iOS and Android support, the recording format, the pause-and-resume flow, the non-destructive trim, the history, and the disconnect recovery.
- [ ] Run an end-to-end test on a representative iOS device and a representative Android device: the recorder captures the device's screen, the pause-and-resume does not drop frames, the trim produces a non-destructive cut, the history holds the recording keyed to the user, and a mid-recording unplug recovers the take up to the disconnect with a flag.

## Phase 2: Deploy

- [ ] Ship the macOS application through the Mac App Store or direct download
- [ ] Document the iOS and Android version coverage, the recording format list, and the device connection method in the launch material so users understand the recorder's scope
- [ ] Verify in production