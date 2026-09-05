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

## Problem

Recording an iOS or Android screen for a demo, a bug report, or a tutorial usually means plugging a phone into a Mac, running a desktop recorder, and capturing the device's screen through a developer bridge that the user has to keep up to date. The FrameOS launch post names the alternative: record the iOS and Android screen from the Mac. The post is short — a tagline and a discussion link — but the cross-platform-from-Mac claim is explicit: the user is on a Mac, the user records, and the screen is an iOS or an Android screen. The source names the actor (a Mac user who wants to record an iOS or Android screen), the pain (the existing workflow requires a developer bridge the user has to maintain and a recorder the user has to keep in sync), and the missing thing (a Mac-side recorder that captures iOS and Android screens without the user maintaining the bridge). It does not name a specific recording format, a specific iOS or Android version, or a specific post-record workflow.

## Objective

Ship a Mac-side recorder that captures iOS and Android screens without the user maintaining a developer bridge, so the user records from the Mac and the screen is an iOS or an Android screen, not the Mac's screen.

## Target Users

- Mac users who want to record an iOS or Android screen for demos, bug reports, or tutorials.
- Product and design teams producing mobile-app demos from a Mac workstation.
- QA engineers recording mobile-app bug repros without switching off the Mac.
- Developer advocates and educators recording mobile-app walkthroughs.
- Indie developers showing mobile-app progress to stakeholders from a Mac.

## MVP Scope

- A Mac-side recorder that captures an iOS screen connected over the Mac.
- A Mac-side recorder that captures an Android screen connected over the Mac.
- A single-device-mode: the user plugs one device and records.
- A recording format the user can hand off (the source names no specific format; the format is the recorder's claim).
- A pause-and-resume recording flow.
- A post-record preview and trim.
- A recording history the user can revisit.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The recorder runs on the Mac. A recorder that requires the user to operate the device directly is a Mac-side failure.
- The captured screen is the iOS or Android screen, not the Mac screen. A capture that records the Mac screen is a screen-identification failure.
- The recorder does not require the user to maintain a developer bridge. A bridge the user has to update manually is a workflow failure.
- The recording format is documented and usable. An undocumented format the user cannot open is a coverage gap.
- The pause-and-resume flow is per-recording. A pause that drops frames is a recording failure.
- The post-record trim is non-destructive. A trim that mutates the source recording is a UX failure.
- The recording history is per-user. A history the user cannot revisit is a UX gap.