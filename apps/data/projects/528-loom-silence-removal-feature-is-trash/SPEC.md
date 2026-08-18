---
id: "528"
slug: loom-silence-removal-feature-is-trash
title: Loom Silence Removal Feature is trash
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vo23cg/loom_silence_removal_feature_is_trash/"
category: saas
date: "2026-08-14"
---
# Loom Silence Removal Feature is trash

## Problem

I just upgraded Loom pricing packages from Business to Business+AI specifically for the silence removal feature. I did a test recording where I paused my speech for a clear 10-15 seconds, twice and it missed it entirely. No background noise or anything. Has anyone noticed this / have a better alternative? submitted by /u/RGar94 [link] [comments]

---

## Objective

Ship a desktop or web app that removes the awkward silences, "umms", and dead air from screen recordings better than Loom's current silence-removal feature, with an export that drops cleanly into the user's existing editing workflow (or replaces it for short-form recordings).

## Target Users

- Primary: solo creator / SaaS founder doing 5-30 minute product demos who currently uses Loom and is frustrated by the silence-removal quality.
- Secondary: a sales engineer doing Loom-style product walkthroughs for prospects.

## MVP Scope

- Drag-and-drop upload of a Loom export (or any MP4/WebM) and an in-browser silence removal pass.
- Tunable silence threshold (dB) and minimum silence length (ms) so the user can dial in the result.
- Side-by-side preview (before / after) with playback rate controls.
- Export as MP4 with the silences removed; no re-encoding of the original frame rate unless the user opts in.
- No editing timeline in v1 — silence removal only.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Browser-based processing where possible (FFmpeg.wasm) so the user does not upload video to a third party.
- For longer files (>30 min), fall back to a server-side ffmpeg job with explicit "your file left your machine" consent.
- No AI voice cloning or filler-word removal in v1 — the source is specifically about silences.
