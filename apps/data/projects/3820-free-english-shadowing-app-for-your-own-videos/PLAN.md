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

## Tech Stack

Stated by the linked repository.

- **Flutter:** the cross-platform framework (Android, iOS, Linux, macOS, Windows, web), pinned to 3.44.4 via FVM.
- **Video player:** local media playback as the practice surface.
- **SRT subtitle parsing:** import and line segmentation of English and Chinese subtitle files.
- **TTS:** speech playback for listen-and-repeat loops.
- **ffmpeg tooling:** media processing support scripts.
- **Optional AI services:** user-configured third-party subtitle and translation APIs.

## Architecture

- **Import layer:** pairs video and subtitle files by episode-style naming (Friends-S01E01.mp4 with .en.srt and .zh.srt, with .en, _en and english markers).
- **Practice engine:** subtitle lines as units with jump, loop and replay controls.
- **TTS layer:** synthesized playback for line practice and comparison.
- **Local store:** videos, subtitles and learning records on the device only.
- **AI adapter:** opt-in bridge to user-configured subtitle and translation services, disabled by default.

## Milestones

1. **M0 — Import and play.** Video plus matched subtitles load, and lines seek correctly.
2. **M1 — Practice loop.** Line-by-line jump, loop, TTS replay and the shadowing flow on one platform.
3. **M2 — Cross-platform.** The six named targets build and run from the pinned Flutter version.
4. **M3 — Optional AI.** Subtitle generation and translation via user-configured services, with a clean offline fallback.

## Risks

- **Alignment failure:** subtitle drift destroys the core loop; detection and correction are likely needed.
- **Copyright friction:** users supply media, but stores and forums still police sharing; the app's ownership rule is only a README line.
- **Third-party AI dependency:** opt-in services can change terms or break, and the app cannot fix them.
- **Solo maintenance:** six platforms from one repo is a lot of build matrix for one maintainer.
