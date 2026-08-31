---
id: "3800"
slug: open-source-local-whisper-flow-alternative
title: Open-Source Local Whisper Flow Alternative
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49491918"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
tech: [On-device ASR (Parakeet V3 on MLX), local LLM cleanup model, native macOS/Windows/iOS apps, hotkey dictation layer, open-source core]
---
# Open-Source Local Whisper Flow Alternative

## Phase 0: Scaffold

- [x] Read cloudless.so to confirm the local-first architecture, pricing mechanics and the Wispr Flow comparison
- [x] Write SPEC.md (this document)
- [x] Verify the local loop on an M-series Mac: dictation → Parakeet V3 transcription → Llama 1B cleanup → insertion, offline
- [x] Publish the open-source core the privacy claim depends on

## Phase 1: Core

- [ ] Pass the Smart Cleanup send-ready tests across the site's demo cases (fillers, emails, numbers, lists, times, punctuation)
- [ ] Implement the hotkey layer (Caps Lock hold, double-tap handsfree, customizable)
- [ ] Implement the first-5,000-sign-ups seat mechanics and the optional account path
- [ ] Ship the Windows and iOS surfaces

## Phase 2: Deploy

- [ ] Make the shipped binaries reproducible from the published source
- [ ] Define the individual offer after the 5,000-seat cap and launch the Enterprise plan
- [ ] Measure dictation latency and cleanup quality against the site's "fast" claim

---

_Generated automatically by Lúa on 2026-08-29_
