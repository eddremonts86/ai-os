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

## Tech Stack

- **UI:** Swift + AppKit (or SwiftUI for the panes) on macOS 14+. App Sandbox enabled; microphone + speech-recognition entitlements requested at first use.
- **Audio capture:** `AVAudioEngine` for the mic; `ScreenCaptureKit` for system audio if the user opts in.
- **Transcription:** `whisper.cpp` running locally, fed rolling 10–20s audio windows from a small ring buffer.
- **LLM:** `llama.cpp` with a 7–8B parameter model on Apple Silicon (MLX). Optional Apple Foundation Models adapter for Macs that support it.
- **Storage:** CoreData for the meeting, transcript, slide, fact-check entities; the audio waveform stays on disk in the app's container.
- **Slide / infographic rendering:** native `NSAttributedString` for v1; image generation deferred.

## Architecture

```
Mic / system audio ─▶ AVAudioEngine ─▶ rolling ring buffer
                                              │
                                              ├─▶ whisper.cpp ─▶ live transcript (left pane)
                                              │
                                              └─▶ llama.cpp ─▶ ┌─▶ slide generator ─▶ slides (centre pane)
                                                               ├─▶ fact-check extractor ─▶ fact feed (right pane)
                                                               └─▶ post-meeting chat index
```

The LLM is the bottleneck. Two prompt paths run in parallel: a fast "slide update" path on each rolling window and a slower "fact-check + chat" path that processes every ~30s window. The slide path uses a constrained prompt that returns a JSON slide spec; the UI renders the spec directly without further LLM work.

## Milestones

1. **M0 — Capture + transcribe.** Mic permission, rolling 10s transcription, transcript pane. End of week 2.
2. **M1 — Local LLM slide generation.** First llama.cpp model integrated; one slide per 30s window. End of week 4.
3. **M2 — Fact-check feed.** Claim detector + search-result link, user mark verified / false. End of week 6.
4. **M3 — Post-meeting chat.** Embedding the transcript, retrieving per-question, returning grounded answers. End of week 9.
5. **M4 — Public beta.** Free tier meter, export to PDF / Markdown, Show HN writeup. End of week 12.

## Risks

- **Model quality vs speed.** On Apple Silicon a 7–8B model fits in RAM but is still slow; tuning the slide cadence (every 30s vs every 5s) is a quality / responsiveness trade-off.
- **Apple Silicon vs Intel Macs.** The free tier relies on local compute; on Intel Macs the experience may be too slow and degrade retention.
- **Fact-check false positives.** A noisy fact-check panel trains users to ignore it; precision must be tuned before launch.
- **App Sandbox + audio capture.** Capturing system audio on macOS requires explicit user consent; the onboarding must surface this rather than hide it.
