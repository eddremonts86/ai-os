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

## Problem

The author has been learning Japanese for a few years and kept running into the same problem: they would find a video they wanted to learn from, hear a useful sentence, and then realise that turning that one sentence into something they could study later was both time-consuming and draining. The workflow bounced between a video player, subtitles or a transcription, a dictionary, screenshots, audio clips and Anki, so the author built SubSmith to bring that workflow together. The user drops a video or audio file in, gets a local transcript, and uses the transcript alongside the media to look up words and sentences, replay individual lines, edit the transcript, save useful sentences with their original context and audio, and export them as Anki cards. The point that matters to the author is that it works with the user's own media — not a specific streaming service or library — so they can use the random anime episode, podcast or lecture they actually want to study. SubSmith is an offline-first desktop app and transcription happens locally rather than shipping the media to a transcription API. The author is now more interested in finding out where this workflow breaks down for other people than in adding features, and explicitly asks: would you actually save sentences from your own media, which step still feels like too much work, does having audio and context attached make an Anki card more useful, would people prefer this inside their existing video player or browser, is installing a desktop app a meaningful barrier, and does requiring an account before the free trial cause drop-off — that last question is live in the current version, which requires an account to start the trial.

## Objective

Be the single offline-first workspace that turns a learner's own media — anime, podcasts, lectures, anything local — into study material that lands directly in Anki, with sentence-level context and audio preserved on every card.

## Target Users

Self-directed language learners who already study from their own media (anime, podcasts, lectures, films) and who already use or are willing to use Anki as their SRS backend. They are technically comfortable installing a desktop app and accept that transcription is a one-time local cost in exchange for their audio never leaving the machine.

## MVP Scope

Ship an offline-first desktop app that accepts a local video or audio file drop, runs transcription locally so the media is not uploaded, lines up the transcript with the media for word and sentence lookup, lets the user replay individual lines and edit the transcript, saves useful sentences together with their original context and audio clip, and exports the saved sentences as Anki cards (.apkg).

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

Must be offline-first so transcription happens on the user's machine rather than via a transcription API; must work with the user's own media files (anime episodes, podcasts, lectures, films) rather than depending on a specific streaming service or library; must require a desktop install; must surface a clear account-required path before the trial starts and treat that requirement itself as something the author is testing for friction; must export to Anki in a format that preserves the audio clip and context the user saved with each sentence.