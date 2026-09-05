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

## Tech Stack

- **A Mac-side recorder** that runs on macOS, matching the source's claim that the recorder is a Mac application.
- **An iOS device-connection layer** that captures the iOS screen without the user maintaining a developer bridge.
- **An Android device-connection layer** that captures the Android screen without the user maintaining a developer bridge.
- **A recording engine** that writes the captured frames to a documented format.
- **A pause-and-resume recording flow** with no frame drops on resume.
- **A post-record preview and trim surface** that produces a non-destructive cut.
- **A per-user recording history store** the user can revisit.
- **A device-disconnect recovery path** that handles the case where the user unplugs the device mid-recording.

## Architecture

The recorder is a single macOS application backed by three components: a device-connection layer, a recording engine, and a per-user store. The device-connection layer handles the iOS and Android bridges internally; the recording engine captures the device's screen, pauses and resumes without dropping frames, and writes the captured frames to a documented format; the per-user store holds the recording history.

The device-connection layer is the recorder's claim. The source names no specific connection method; the open question is whether the connection is USB, Wi-Fi, or both. The bridge is the recorder's problem, not the user's; a bridge the user has to update manually is a workflow failure.

The recording engine captures the device's screen and writes it to the documented format. The format is the recorder's claim; the source names no specific format. The engine identifies the captured screen as the device's screen, not the Mac's screen; a capture that records the Mac screen is a screen-identification failure.

The pause-and-resume flow holds the recording state per recording. A pause that drops frames is a recording failure; the engine buffers frames in memory and resumes without a gap.

The post-record preview and trim surface reads the recording from the per-user store, plays it back, and produces a non-destructive cut. The cut is a new file; the source recording is preserved. A trim that mutates the source is a UX failure.

The per-user recording history store holds the recordings, keyed to the user. The user revisits a recording and replays it; a history gap is a UX failure. The retention policy is the recorder's claim.

The device-disconnect recovery path handles the case where the user unplugs the device mid-recording. The recovery is the recorder's claim; the open question is whether the recording is saved up to the disconnect, aborted, or flagged for recovery.

## Milestones

1. **M1 — Mac-side recorder scaffold** — the macOS application, the device-connection entry points, the recording engine integration.
2. **M2 — iOS device-connection layer** — the iOS bridge handling, the screen capture, the device identification.
3. **M3 — Android device-connection layer** — the Android bridge handling, the screen capture, the device identification.
4. **M4 — Recording engine** — the documented format, the frame buffer, the pause-and-resume without frame drops.
5. **M5 — Post-record preview and trim** — the playback surface, the non-destructive cut, the new file.
6. **M6 — Per-user recording history** — the keyed store, the revisit surface, the retention policy.
7. **M7 — Device-disconnect recovery** — the mid-recording unplug handling, the save-up-to-disconnect contract.

## Risks

- **Device-connection layer drifts** — the iOS or Android bridge changes and the recorder breaks. Mitigation: the layer is versioned; a drift is a documented upgrade; the recorder fails gracefully with a clear error.
- **Recording format undocumented** — the recorder writes a format the user cannot open. Mitigation: the format is documented in the README and in the export dialog; an undocumented format is a coverage gap, not a silent regression.
- **Pause drops frames** — the resume shows a gap. Mitigation: the engine buffers frames in memory; the pause-and-resume contract is a test failure when frames drop.
- **Trim mutates the source** — the user's recording is overwritten. Mitigation: the trim produces a new file; the source recording is preserved; a mutation is a UX failure, not a default.
- **History grows unbounded** — the user accumulates recordings past what the recorder can hold. Mitigation: the retention policy is documented; the user can archive; a storage hit is a coverage gap, not a silent failure.
- **Device disconnect mid-recording loses the take** — the user unplugs and the recording is lost. Mitigation: the recovery path saves up to the disconnect and flags the recording; a complete loss is a test failure.
- **Wrong screen captured** — the recorder captures the Mac screen instead of the device screen. Mitigation: the engine identifies the captured screen by the device-connection layer; the wrong-screen case is a screen-identification failure and is corrected before the recording is saved.