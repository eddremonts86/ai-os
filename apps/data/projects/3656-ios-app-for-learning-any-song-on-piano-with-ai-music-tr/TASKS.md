---
id: "3656"
slug: ios-app-for-learning-any-song-on-piano-with-ai-music-tr
title: iOS app for learning any song on piano with AI music transcription
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49483015"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [Swift, SwiftUI, AVFoundation, Core Audio, Core ML, ONNX Runtime, MusicXML renderer]
---
# iOS app for learning any song on piano with AI music transcription

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/3656-ios-app-for-learning-any-song-on-piano-with-ai-music-tr/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Implement AVFoundation audio capture and file import with a documented rights posture per source
- [ ] Build the Core Audio decode and resample path to the sample rate and channel layout the inference pipeline expects
- [ ] Integrate the first on-device transcription model via Core ML or ONNX Runtime with a defined input/output contract
- [ ] Emit per-region uncertainty estimates from the pipeline and pass them to the renderer as a first-class output
- [ ] Build the practice view: alignment between transcription and audio, tempo control, region looping
- [ ] Add a difficulty-aware single-hand starting point so a learner is not dropped into two-handed polyphony with no guidance
- [ ] Implement the uncertainty display in the renderer so uncertain regions are visible rather than hidden
- [ ] Add encrypted on-device library storage for transcriptions and source audio
- [ ] Add MusicXML export so transcriptions are not locked to the app
- [ ] Implement the practice session log and surface tempo, region, and time-spent back to the learner
- [ ] Publish a note-level accuracy benchmark on a known evaluation set and document it in the app
- [ ] Update the App Store listing with the "any song" claim correctly framed, privacy labels, and on-device vs server split disclosed

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-28_
