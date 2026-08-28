---
id: "3175"
slug: convolens-real-time-slides-and-fact-checking
title: Convolens – Real time slides and fact-checking
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49454839"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Productivity, Meetings, macOS, Local AI]
tech: [Swift (macOS), Whisper.cpp, llama.cpp, CoreData, AppKit, Apple Foundation Models]
---
# Convolens – Real time slides and fact-checking

## Phase 0: Scaffold

- [x] Capture problem + write SPEC.md skeleton
- [ ] Decide distribution: Mac App Store vs direct download + notarisation. Sandbox implications differ.
- [ ] Pick a permissive open-source licence for the wrapper, keep model weights under their own licences
- [ ] Xcode project skeleton: app target, whisper.cpp + llama.cpp via SwiftPM or vendored XCFrameworks
- [ ] CoreData model: Meeting, TranscriptSegment, Slide, FactCheck, ChatMessage
- [ ] Onboarding flow that explains "all on-device" before the mic permission prompt
- [ ] Decide which 7–8B model ships by default; document download + first-run time

## Phase 1: Core

- [ ] AVAudioEngine mic capture with a rolling ring buffer
- [ ] whisper.cpp integration: 10–20s windows, low-latency partial results
- [ ] Live transcript pane with speaker turn detection
- [ ] llama.cpp integration: constrained JSON prompt for slide generation
- [ ] Slide pane with the most recent N slides, scrollable
- [ ] Fact-check detector: every 30s window, claims extracted, search link attached
- [ ] Fact-check pane with verified / false / dismiss actions
- [ ] Post-meeting chat: embed transcript, retrieve per-question, grounded answers
- [ ] Export: PDF of slides + Markdown transcript
- [ ] Free-tier meter (5h/month local minutes tracked client-side)

## Phase 2: Deploy

- [ ] Notarised build for direct download outside the Mac App Store (sandbox-permitting) and a separate App Store submission
- [ ] Landing page on `convolens.app` with a one-minute demo video
- [ ] Show HN writeup emphasising the on-device angle
- [ ] In-app feedback channel + crash reporting (Sentry or self-hosted)
- [ ] Document the model-update cadence so users know when quality jumps
