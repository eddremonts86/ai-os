---
id: "3820"
slug: free-english-shadowing-app-for-your-own-videos
title: Free English shadowing app for your own videos
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49494863"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [Flutter, local-first video player, SRT subtitle import and matching, TTS playback, optional AI subtitle services, MIT open source]
---
# Free English shadowing app for your own videos

## Problem

The capture is a URL-only Show HN by markyuan123 pointing at github.com/TideSparrow/shadowing-english, so the product claim is the title plus what the repository states. The repo describes a local-first English shadowing app: import your own videos and subtitles for line-by-line listening and speaking practice. Videos and subtitles are paired by episode-style naming (Friends-S01E01.mp4 with Friends-S01E01.en.srt or .zh.srt), with .en, _en or english filename markers recognized, and the README insists users own the media they import — the repo ships no film or subtitle content. Privacy is explicit: videos, subtitles and learning records stay on the local device; the project hosts nothing; and if a user enables AI subtitles or translation, requests go to a third-party service the user configures themselves. The stack is Flutter (pinned to 3.44.4 via FVM) targeting Android, iOS, Linux, macOS, Windows and web, with ffmpeg tooling, TTS support, bilingual English and Chinese documentation and an MIT license.

## Objective

Make shadowing practice self-serve: a learner brings their own video and subtitle files, the app splits them into repeatable line-by-line units with playback and speech practice, and nothing leaves the device.

## Target Users

- English learners using the shadowing method with their own media.
- Chinese-speaking learners (the repo's bilingual docs suggest the first audience).
- Privacy-minded learners who refuse cloud-hosted courses and want local-only practice.

## MVP Scope

- Import local video plus SRT subtitles (English and Chinese) with filename-based pairing.
- Line-by-line playback: jump to a subtitle line, loop it, listen.
- Shadowing mode: speak after the line, compare or replay (TTS-backed).
- Local-first storage of videos, subtitles and learning records.
- Optional AI subtitle and translation through a user-configured third-party service.
- MIT-licensed Flutter app targeting mobile and desktop platforms.

## Constraints

- Local-first by design: the app hosts nothing and ships no content; the user supplies both media and any AI service keys.
- Media ownership is the user's responsibility — the README's own instruction.
- AI features are opt-in and third-party; the app must work fully without them.
- Flutter 3.44.4 pinned via FVM; the build environment follows that pin.

## Design Direction

See `DESIGN.md` for this project's design tokens.
