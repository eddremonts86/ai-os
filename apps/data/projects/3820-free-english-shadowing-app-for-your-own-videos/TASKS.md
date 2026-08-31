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

## Phase 0: Scaffold

- [x] Read the Show HN post and the linked repository README (English and Chinese) to extract the import and privacy rules
- [x] Write SPEC.md (this document)
- [x] Pin Flutter 3.44.4 with FVM and scaffold the app
- [x] Add SRT parsing with filename-based video and subtitle pairing

## Phase 1: Core

- [ ] Implement line-by-line seeking from subtitle lines
- [ ] Add loop and replay controls for the shadowing flow
- [ ] Integrate TTS playback for listen-and-repeat practice
- [ ] Store videos, subtitles and learning records locally with no network calls

## Phase 2: Deploy

- [ ] Build and verify the six targets (Android, iOS, Linux, macOS, Windows, web)
- [ ] Add the opt-in AI subtitle and translation adapter with a clean offline fallback
- [ ] Publish the MIT-licensed release and document the resource setup for new users
