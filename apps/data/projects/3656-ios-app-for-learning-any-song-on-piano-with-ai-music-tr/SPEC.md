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

## Problem

The capture for this plan is a link to an App Store listing (https://apps.apple.com/us/app/anything-piano-learn-any-song/id6761146933) and a title; there is no prose body, so the implementation details are unstated and have to be scoped honestly from the title alone.

The title fixes the load-bearing claim: an iOS app for learning any song on piano, with AI music transcription doing the work of converting audio into something playable on a keyboard. "Any song" is the part that defines the project — it cannot rely on a curated sheet-music library, because if the library were the source, the app would be a sheet-music viewer with a search box, not a transcription product. The transcription path is what makes the claim hold: a user can point the app at a recording that does not exist in any catalogue and still get something back.

The capture does not name the audio source the app accepts (microphone, file import, a streaming service, the user's own library), the transcription model, the rendering format (sheet music, falling-notes, MIDI, a hybrid), the practice tooling (tempo control, hand-part split, looping), or the monetization shape. The plan therefore scopes the shape from the title and treats the unsaid as design choices, not facts.

## Objective

Ship an iOS app that turns any audio recording a user can supply into a playable piano part, using AI music transcription rather than a curated sheet-music library, so the "any song" claim is backed by the transcription pipeline rather than by the size of a catalogue.

## Target Users

- Piano learners who want to play a specific recording that does not exist in a sheet-music catalogue and need transcription, not search.
- Self-taught players who learn by ear and want a written part to anchor their practice on a recording they already like.
- Music students who need to learn pieces from recordings assigned in lessons or pulled from non-Western traditions where sheet music is scarce.
- Hobbyist musicians who want to learn pop, rock, jazz, soundtrack or video-game pieces where the canonical source is an audio recording rather than a published score.
- Returning players who want to rebuild repertoire from recordings they remember, rather than from a curated starter set.

## MVP Scope

- An audio input path that accepts what the app can plausibly take in: microphone capture, file import from the device, and paste-in of a streaming-service link where rights permit.
- An AI music transcription pipeline that returns a piano part (notes, timing, basic voicing) rather than a full multi-instrument score.
- A practice view that shows the transcription aligned to the audio and lets the user slow the tempo, loop a region, and follow along.
- A rendering format that is usable on a phone screen: falling notes, a staff view, or a hybrid, with the choice scoped as a design decision rather than asserted as a fact.
- A hand-part split or at least a difficulty-aware single-hand starting point, because a piano transcription with no guidance on which hand plays what is unusable for a learner.
- An honest accuracy statement: transcription is approximate, and the app has to say where it is approximate rather than presenting uncertain notes as certain.
- A library view of past transcriptions stored on-device, with the source audio and the user's notes attached.
- A practice session log: tempo, time spent, region practiced, surfaced back to the learner so progress is visible.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The capture is URL-only, so audio source, transcription model, and rendering format are scoped as plausible defaults rather than asserted as facts.
- The "any song" claim is load-bearing: the system has to work on recordings that do not exist in any catalogue, so the architecture has to assume unknown audio and an uncertain transcription rather than rely on lookup.
- Piano transcription from polyphonic audio is approximate by nature; presenting uncertain output as certain is a learner-trust failure, so the UI has to mark uncertain regions explicitly.
- On-device inference has to fit the thermal and memory envelope of the supported iOS hardware, otherwise the app either crashes on older devices or offloads to a server and the "any song" privacy story changes.
- Music rights for input sources vary: streaming-service links, microphone capture of a radio, and file import from a personal library all have different legal shapes, and the app has to respect that rather than pretending all sources are equivalent.
- Practice tooling (tempo, looping, hand split) is part of the value, not a polish item, because a learner cannot use a transcription they cannot slow down or focus on.
- Local library storage has to be encrypted at rest, because the library contains recordings of songs the user is learning and is in practice a record of their listening and practice habits.
