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

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

Anything Piano is an iOS app that learns any song on piano by transcribing the audio the user supplies, so the answer to "can it learn this song" is "yes, if you can play the audio, we can transcribe it" rather than "only if it is in our library". The AI transcription path is the product: it turns polyphonic audio into a piano part the user can practice against, and it works on recordings that no sheet-music catalogue has indexed.

The capture does not name the input shape, the transcription model, the rendering format, or the practice tooling, so the plan treats each as a design choice to be made during MVP rather than as a fact to be asserted. The "any song" claim has to be backed by the transcription pipeline, not by the size of a catalogue, because if the catalogue were the source, the app would be a sheet-music viewer with a search box.

**One-liner:** Anything Piano turns any audio recording you can supply into a piano part you can practice against, using AI transcription rather than a sheet-music library.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Piano learners with a specific recording in mind | Transcription works on what they want, not on what is in the catalogue. |
| Self-taught players who learn by ear | A written part anchors practice on a recording they already know. |
| Music students working from recordings | Sheet music is scarce for some traditions and genres; transcription fills the gap. |
| Hobbyist musicians learning pop/rock/jazz/soundtrack | The canonical source for these is an audio recording rather than a published score. |
| Returning players rebuilding repertoire | Old favourites are remembered as recordings, not as scores, and transcription recovers them. |
| Privacy-conscious users who do not want audio uploaded | On-device inference (or a documented server path) determines whether the audio leaves the phone. |

## Jobs To Be Done

1. **Functional job** — Turn a recording the user supplies into a piano part they can practice against.
2. **Functional job** — Slow the audio, loop a region, and follow along so a learner can actually use the transcription rather than just see it.
3. **Functional job** — Mark uncertain notes as uncertain, so a learner does not grind on a passage the transcription got wrong.
4. **Emotional job** — Trust the app with a recording they care about, because the privacy and rights story is stated rather than implied.
5. **Social job** — Share a transcription (or a practice clip) with a teacher, a friend, or a community without giving up the source recording.

## Success Metrics

- **Transcription coverage** — share of input audio for which the pipeline returns a piano part rather than failing or returning silence, since the "any song" claim collapses if the app cannot handle a meaningful slice of inputs.
- **Note-level accuracy on a benchmark set** — published accuracy on a known evaluation set, because transcription is approximate and the app has to be honest about how approximate.
- **Practice-session completion** — share of practice sessions that run to the configured duration rather than being abandoned, since a learner who quits in the first minute is not being helped.
- **Library retention** — share of transcriptions kept after 30 days, which signals whether the app is actually used for ongoing practice or tried once.
- **Uncertainty display rate** — share of transcriptions where at least one region is marked uncertain and visible to the learner, because hiding uncertainty is the headline failure mode.
- **Time-to-first-note** — median time from "app opened" to "first playable note on screen", because a long wait is the difference between "try it" and "give up".

## Pricing & Monetization

The capture names no price, no tier and no in-app purchase shape; the App Store listing implies a paid app or freemium shape but does not commit to one. The architecture fixes only the cost shape: the largest cost driver is per-transcription compute, which is bounded by the user's input length rather than by their seat, so any pricing model has to be priced per transcription or per minute of audio rather than per month.

## Competitive Landscape

- **Curated sheet-music apps** — exist for the cases where sheet music exists; they do not solve the "any song" problem because their value is the catalogue, not the transcription.
- **DAWs and audio editors with built-in transcription** — desktop-first and built for producers, not for learners who want a phone-first practice experience.
- **AI transcription APIs and research models** — the technology layer; the value here is the learner-facing product wrapping the model, not the model itself.

The capture names no specific competitor, so the comparison stops here.

## Risks & Open Questions

- [ ] Confirm the supported audio inputs: microphone capture, file import, and streaming-service links, with rights considered per source.
- [ ] Pick the transcription model and the on-device vs server split, and document the privacy consequence of each choice.
- [ ] Decide the rendering format: falling notes, staff view, or hybrid, with a usability test on a phone screen.
- [ ] Build the uncertainty display: how the app marks uncertain regions so a learner can trust the rest.
- [ ] Ship the practice tooling as MVP, not as polish: tempo control, region looping, and a hand-part starting point.
- [ ] Publish a note-level accuracy benchmark on a known evaluation set so the "any song" claim is anchored to a number.
- [ ] Define the rights posture per input source, so the app does not pretend microphone capture of a radio and a personal-library import are the same case.
