---
id: "3527"
slug: subsmith-turn-your-own-videos-into-language-learning-ma
title: SubSmith – Turn your own videos into language-learning material
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49476894"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [Offline-first desktop app, local speech-to-text transcription (whisper.cpp or equivalent), Anki export (.apkg), local media playback]
---

# SubSmith – Turn your own videos into language-learning material

## Tech Stack

Offline-first desktop app (Electron or Tauri) that owns its own local SQLite store; local speech-to-text via whisper.cpp (or an equivalent on-device model) so media never leaves the machine; a media playback layer with timestamp-anchored transcript alignment; a local card-store with audio and context preserved per sentence; Anki export as .apkg so the user's SRS workflow stays intact; an account + free-trial surface the author is currently testing for friction.

Justification: the post is explicit that transcription happens locally, that the app is offline-first, and that media must not be shipped to a transcription API — so the load-bearing pieces are the desktop runtime, the local STT model, and the .apkg export. The legacy TanStack Start + Coolify + Docker default would push the app onto a server, which contradicts the offline-first constraint.

## Architecture

A desktop shell wraps a local SQLite store and a media player. The user drops a video or audio file; the file stays on disk, is fed to a local whisper.cpp-style transcription pipeline, and the resulting transcript is aligned to the media by timestamp. The transcript view is the workspace: a learner can look up words and sentences against a bundled or local dictionary, replay any line, edit the transcript, and mark sentences as saved. Each saved sentence carries its audio clip plus the surrounding context so the Anki card has more than the bare text. An export job bundles the saved sentences into an .apkg file the user drags into Anki. An account gate currently sits in front of the free trial and is itself an experiment the author is running to measure trial-funnel drop-off.

## Milestones

- **M1 — Desktop shell:** offline-first app scaffold, local SQLite, media drop and playback with timestamp alignment.
- **M2 — Local transcription:** whisper.cpp integration that runs on the user's machine, with progress UI and per-segment timestamps.
- **M3 — Transcript workspace:** word and sentence lookup, line replay, transcript editing.
- **M4 — Sentence saving:** capture a sentence with its audio clip and surrounding context preserved on the card.
- **M5 — Anki export:** .apkg export that round-trips into a real Anki deck with audio and context intact.
- **M6 — Trial funnel:** account-required free trial as it stands today, plus instrumentation to measure whether the account gate causes drop-off.
- **M7 — Open feedback:** pose the author's six open questions (sentence-saving behaviour, friction points, audio/context value, in-browser vs. desktop, install barrier, account-before-trial) inside the app and collect responses.

## Risks

Account-before-trial friction is itself an open hypothesis the author named — if the gate causes too much drop-off, the funnel itself becomes a measurement risk; local transcription speed depends on user hardware and may be a deal-breaker on lower-end machines; the Anki export must round-trip audio and context or the value proposition collapses, so .apkg fidelity is a single-point-of-failure risk; the desktop install requirement is named as a possible barrier; users studying from copyrighted media carry their own source-of-media problem that the app does not address; pricing and a paid surface are unstated.