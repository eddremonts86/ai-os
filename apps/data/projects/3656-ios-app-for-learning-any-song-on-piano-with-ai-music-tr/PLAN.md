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

## Tech Stack

- **Swift with SwiftUI** for the iOS client, because the app is iOS-first and the UI work is best done in the platform-native toolchain.
- **AVFoundation** for audio capture and file import, so the app can take input from the microphone, the device library, and (where supported) a shared extension.
- **Core Audio** for the audio decode and resample path that feeds the transcription model, because the model expects a specific sample rate and channel layout that the input audio may not match.
- **Core ML with ONNX Runtime** as the inference path, so the transcription model can run on-device on the supported hardware envelope and the model format is portable enough to update over time.
- **A piano-roll / staff rendering layer** for the practice view, scoped as a design choice (falling notes, staff, or hybrid) rather than a fact, with the rendering format picked in MVP.
- **MusicXML as an interchange format** for any import/export of the transcription, so the user can move a transcription into a notation app without a proprietary lock-in.
- **Encrypted on-device library storage** for the saved transcriptions and their source audio, so the library does not become an unencrypted record of the user's listening and practice habits.

## Architecture

The capture path is the heart of the product. Audio enters through AVFoundation (microphone capture or file import), is decoded and resampled by Core Audio into the sample rate and channel layout the transcription model expects, and is fed into an on-device inference pipeline built on Core ML or ONNX Runtime. The pipeline returns a piano part: notes with onset, offset, pitch and a basic voicing. The capture does not name the model, so the plan treats the model as a swappable inference backend with a defined input/output contract, not a single fixed model.

The piano part is stored as a transcription record alongside its source audio in an on-device library. Each record carries the audio reference, the transcription, the user's annotations, and a per-region uncertainty estimate that the renderer is required to display. The rendering format is a design choice (falling notes, staff, or hybrid) that MVP will pick after usability testing on a phone screen; the architecture supports any of them because the transcription is stored as data, not as a particular visualization.

The practice view is where most of the user's time goes. It aligns the transcription to the audio, lets the user slow the tempo, loop a region, and pick a hand-part focus. These are not polish items: without them, a learner cannot use the transcription, so they are in the MVP scope and not a post-launch backlog. Practice sessions are logged locally so the learner can see tempo, region, and time-spent, and so the app can surface what the user actually practised rather than what they meant to practise.

Uncertainty has to be visible. The transcription model returns per-region confidence; the renderer is required to display it (shading, a marker, a separate visual layer) so the learner never practices an uncertain passage as if it were certain. This is a learner-trust property of the product, not a debugging aid, and the architecture treats it as a first-class output of the pipeline. Input rights are handled per source: microphone capture is unrestricted in most jurisdictions for personal use, file import from a personal library is the user's responsibility, and any streaming-service link path has to respect the service's terms rather than pretending the cases are equivalent.

## Milestones

1. **M1 — Audio input** — AVFoundation capture and file import, Core Audio decode and resample, and a recorded fixture pipeline for testing the inference.
2. **M2 — Transcription pipeline** — first on-device model with a defined input/output contract, returning notes with timing and per-region uncertainty.
3. **M3 — Practice view** — a renderer that aligns transcription to audio, with tempo control and region looping, and the uncertainty display integrated.
4. **M4 — Hand-part split** — a difficulty-aware single-hand starting point so a learner is not dropped into two-handed polyphony with no guidance.
5. **M5 — Library and sessions** — encrypted on-device library, MusicXML export, and a practice session log surfaced back to the learner.
6. **M6 — Accuracy and honesty** — a published benchmark on a known evaluation set, an accuracy statement in the app, and a documented rights posture per input source.
7. **M7 — App Store readiness** — privacy nutrition labels, the App Store listing updated with the "any song" claim correctly framed, and on-device vs server split disclosed.

## Risks

- **Transcription accuracy on unfamiliar genres** — the "any song" claim depends on handling audio the model was not specifically trained on; benchmark coverage has to include genres outside the training distribution.
- **On-device thermal envelope** — long recordings on older devices can throttle or crash, so the inference path needs a measured ceiling and a fallback.
- **Hidden uncertainty** — presenting a confident-looking transcription of an uncertain passage is the headline trust failure; uncertainty display has to be in the design from day one.
- **Rights confusion** — treating microphone capture, file import, and streaming-service links as the same case will get the app removed; per-source rights posture is a real constraint.
- **Practice feature cut** — tempo, looping, and hand split are easy to defer; deferring them makes the app unusable for a learner, so they have to ship in MVP.
- **Library privacy** — an unencrypted library of transcriptions plus source audio is a record of the user's practice and listening; at-rest encryption is non-optional.
- **App Store review** — the "any song" claim and the transcription pipeline will draw scrutiny; the listing and the privacy labels have to be precise.
