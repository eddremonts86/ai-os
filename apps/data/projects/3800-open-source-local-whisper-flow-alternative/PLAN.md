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

## Tech Stack

The site states the core stack; the rest follows from the product's platform claims.

- **On-device ASR (Parakeet V3 on MLX):** the default speech-recognition model, running locally on Apple silicon.
- **Local LLM cleanup model:** a fine-tuned Llama 1B performs Smart Cleanup (fillers, formatting, punctuation) after transcription.
- **Native macOS/Windows/iOS apps:** the three stated platforms; Mac requires M-series.
- **Hotkey dictation layer:** hold Caps Lock to dictate, double-tap for handsfree mode, customizable.
- **Open-source core:** the code is published so the "100% local" claim can be verified.

## Architecture

- **Capture layer:** the hotkey activates audio capture; audio stays on-device end to end.
- **Transcription layer:** Parakeet V3 on MLX converts speech to text locally (model swappable per language, 100+ supported).
- **Cleanup layer:** the local Llama 1B polishes the transcript — filler words, backtracking, email/URL/number/list/time formatting, punctuation.
- **Insertion layer:** the cleaned text is inserted into whichever app or text field has focus.
- **Account layer:** optional signup (Google or email magic link) reserves a free seat; the app works without an account.

## Milestones

1. **M0 — Local loop.** Dictate → transcribe → cleanup → insert, fully offline, on an M-series Mac.
2. **M1 — Cleanup quality.** The formatting cases the site demos (emails, numbers, lists, times, punctuation) all pass send-ready tests.
3. **M2 — Seat mechanics.** The first-5,000-sign-ups free tier and the Enterprise plan exist as distinct states.
4. **M3 — Verification story.** The shipped app is reproducible from the published source, so the privacy claim is checkable.

## Risks

- **Model quality gap:** on-device ASR and a 1B cleanup model may not match cloud dictation quality; users will notice fast.
- **Pricing cliff:** the 5,000-seat cap must resolve into a defined individual offer or the growth story ends at seat 5,001.
- **Binary-source trust:** "open source to verify" only matters if the shipped binaries are reproducible; otherwise it is a slogan.
- **Platform breadth:** Mac M-series first, Windows and iOS named but unproven in the capture.
- **Competitor response:** the $12/month incumbent (Wispr Flow) can cut price or add a local mode; the moat is execution, not architecture.
