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

## Value Proposition

A Mac-side recorder that captures iOS and Android screens without the user maintaining a developer bridge, so the user records from the Mac and the screen is an iOS or an Android screen, not the Mac's screen. The recorder handles the device connection internally, captures the device's screen, pauses and resumes per recording, and lets the user trim the recording after the fact without mutating the source.

The recorder runs on the Mac and the user does not have to keep a bridge up to date. A bridge the user has to update manually is a workflow failure; the recorder's claim is the bridge is the recorder's problem, not the user's. The captured screen is the device's screen, identified by the recorder, not by the user's guess.

**One-liner:** A Mac-side recorder that captures iOS and Android screens without the user maintaining a developer bridge, with pause-and-resume and a non-destructive trim.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Mac users recording mobile screens | Want demos, bug reports, and tutorials without maintaining a bridge. |
| Product and design teams | Want mobile-app demos from a Mac workstation. |
| QA engineers | Want mobile-app bug repros without switching off the Mac. |
| Developer advocates and educators | Want mobile-app walkthroughs recorded on the Mac. |
| Indie developers | Want to show mobile-app progress to stakeholders from the Mac. |

## Jobs To Be Done

1. **Functional job** — Plug an iOS device into the Mac and have the recorder capture the iOS screen.
2. **Functional job** — Plug an Android device into the Mac and have the recorder capture the Android screen.
3. **Functional job** — Pause and resume a recording without dropping frames.
5. **Functional job** — Trim the recording after the fact without mutating the source.
6. **Functional job** — Revisit a previous recording from a per-user history.
7. **Emotional job** — Stop the feeling that recording a mobile screen requires the user to maintain a developer bridge the user does not need otherwise.
8. **Social job** — Be the team whose mobile-screen recordings look like a deliberate capture, not a brittle bridge session.

## Success Metrics

- **Mac-side coverage** — share of recordings that run on the Mac without the user operating the device directly. A recorder that requires the user to operate the device is a Mac-side failure.
- **Screen identification coverage** — share of recordings that capture the device's screen and not the Mac's screen. A capture that records the Mac screen is a screen-identification failure.
- **Bridge coverage** — share of recordings that do not require the user to update a developer bridge manually. A bridge the user has to update is a workflow failure.
- **Recording format coverage** — share of recordings the user can open with a documented player. An undocumented format the user cannot open is a coverage gap.
- **Pause-and-resume coverage** — share of pauses that resume without dropping frames. A pause that drops frames is a recording failure.
- **Trim fidelity coverage** — share of trims that produce a non-destructive cut. A trim that mutates the source is a UX failure.
- **History coverage** — share of recordings the user can revisit. A history gap is a UX failure.

## Pricing & Monetization

The source names no fee, no tier, and no commercial plan. The launch post is a tagline and a discussion link. Any future monetization has to be measured against the Mac-side coverage and the screen identification coverage, because those are the metrics the source ties to the recorder's value proposition.

## Competitive Landscape

- **Desktop screen recorders with manual bridge setup (the names the source does not provide)** — record the device screen but require the user to maintain a developer bridge and configure the recorder per device.
- **Vendor-specific device recorders (the names the source does not provide)** — record one vendor's screen from the Mac, but do not cover the other vendor's screen.
- **On-device recorders (the names the source does not provide)** — record the screen from the device, but the user has to operate the device directly and the workflow is not Mac-side.
- **Cloud screen-recording services (the names the source does not provide)** — route the device screen through a hosted service, but require a network round-trip and a subscription.

The post names no specific incumbent, so no further comparison is claimed here.

## Risks & Open Questions

- [ ] Confirm the device connection method. The recorder handles the bridge internally; the open question is whether the connection is USB, Wi-Fi, or both.
- [ ] Define the iOS and Android version coverage. The source names no specific version; the open question is the minimum iOS and Android versions the recorder supports.
- [ ] Validate the recording format list. The source names no specific format; the open question is which formats the recorder produces on launch.
- [ ] Decide the pause-and-resume semantics. A pause drops frames or not; the open question is the maximum tolerable frame drop on resume.
- [ ] Establish the trim's non-destructive contract. The trim produces a new file; the open question is whether the source recording is preserved or compressed.
- [ ] Confirm the history's storage boundary. The user revisits recordings; the open question is the per-user storage budget and the retention policy.
- [ ] Define the policy on a device disconnect mid-recording. The user unplugs the device; the open question is whether the recording is saved up to the disconnect, aborted, or flagged for recovery.