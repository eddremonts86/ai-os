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

SubSmith is an offline-first desktop app that takes a learner's own audio or video file, transcribes it locally, lines the transcript up with the media for lookups and replay, and exports saved sentences — with their original context and audio — straight to Anki. The author built it after years of bouncing between a video player, subtitles, a dictionary, screenshots, audio clips and Anki to study Japanese from the anime and podcasts they actually wanted to learn from.

**One-liner:** turn your own videos and audio into Anki cards with context and audio preserved — entirely on your machine.

## Value Proposition

SubSmith collapses the video-to-Anki workflow into one offline-first workspace. The user drops in their own audio or video file — an anime episode, a podcast, a lecture — SubSmith transcribes it locally rather than uploading the media to a transcription API, lines the transcript up with the media, and gives the user word and sentence lookup, line replay, transcript editing, sentence saving with the original context and audio, and Anki export. The author explicitly built it to work with the user's own media rather than a specific streaming service or library, because that is the media they actually want to study.

## Target Users

Self-directed language learners who already study from their own media — anime, podcasts, lectures, films — and who already use Anki as their SRS backend or are willing to adopt it. They are comfortable installing a desktop app and accept local transcription as the cost of keeping their media off third-party servers. The author specifically asks for feedback from people who already learn languages through their own media.

## Jobs To Be Done

When I find a video or audio clip I want to study from, drop it into SubSmith without shipping it to a third party; when a useful sentence comes up, look it up and replay the line without juggling player and dictionary windows; when I want to capture a sentence, save it together with its audio and original context so the card has the surrounding material attached; when I'm ready to study, export those sentences to Anki in a single step; when the transcript is wrong, fix it in place and keep the edits applied downstream.

## Success Metrics

Free-trial activations per week and the share that complete the first sentence-to-Anki round-trip; Anki cards exported per active user per week; share of saved sentences that come from the user's own media (anime, podcast, lecture, film) — the metric the author centers the whole pitch on; trial-to-paid conversion for whatever paid surface the author introduces; trial-funnel drop-off attributable to the account-before-trial requirement, which the author is explicitly testing.

## Pricing & Monetization

The post is explicit only on a few points: SubSmith is free to try today; the current version requires an account to start the trial, and the author is openly testing whether that account gate is meaningful friction; the author is collecting feedback rather than naming a price. There is no `wtp` to record.

## Competitive Landscape

The post does not name competitors. The implied alternatives are the workflow SubSmith replaces — a video player, subtitles or a transcription, a dictionary, screenshots, audio clips and Anki — used together as a hand-rolled pipeline. The author positions SubSmith against that workflow on three points: it is offline-first and runs transcription locally, it works with the user's own media rather than a specific streaming service, and it preserves audio and context on every exported Anki card.

## Risks & Open Questions

The author flags the account-before-trial requirement as an open friction hypothesis and is explicitly asking whether it causes drop-off — so account-gate conversion is itself a measurement risk; requiring a desktop install is named as a possible barrier the author is testing; local transcription depends on the user's hardware for speed and may be a deal-breaker on lower-end machines; the app is not tied to a specific streaming service, so users studying from copyrighted media carry their own source-of-media problem; Anki export quality hinges on preserving audio and context on every card — if the .apkg degrades either field, the value proposition collapses; pricing and a paid surface are unstated.

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49476894) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
