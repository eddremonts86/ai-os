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

## Problem

The Show HN post is URL-only, pointing at cloudless.so. The captured title says "Whisper Flow", but the site it points to is Cloudless Voice, which positions itself as "the free alternative to Wispr Flow" — the name in the title appears to be a misspelling of Wispr Flow, the cloud dictation app the site compares itself against. The problem the site attacks: voice dictation as a category sends audio and transcripts to remote servers, which costs money (the site quotes Wispr Flow at $12/month with 2,000 free words/week) and costs privacy (your voice leaves the device). Cloudless Voice's answer is 100% local dictation: speech recognition runs on-device — by default Parakeet V3 on MLX plus a fine-tuned Llama 1B for cleanup — and a "Smart Cleanup" step polishes transcripts (filler words, backtracking, email/number/list/time formatting, punctuation) before the text lands in any app. The site promises free individual use for the first 5,000 sign-ups, with an Enterprise plan for teams, and says the code is open-source "to verify". Platforms: Mac (M-series), Windows, and iOS, with a Caps Lock hold-to-dictate hotkey.

## Objective

Ship the local dictation loop — speak, transcribe on-device, clean up, insert into any text field — as a free alternative to cloud dictation, with the privacy claim backed by open-source code that can be verified. The MVP is the Mac app path (the site's primary download) with Smart Cleanup, plus the 5,000-sign-up free tier mechanics.

## Target Users

- Individuals paying for Wispr Flow (or its free-tier limits) who want the same speed without a subscription.
- Privacy-sensitive professionals (the site's "verifiable security for serious work" framing) whose dictation must not leave the device.
- Users who type less due to mobility or health reasons — one testimonial on the site mentions RRMS and the need to rest from typing.
- Enterprise teams needing local AI dictation with an Enterprise plan.

## MVP Scope

- On-device dictation in every app, activated by hotkey (Caps Lock hold, double-tap handsfree mode).
- Smart Cleanup: filler-word removal, backtracking fixes, email/URL/number/list/time formatting, advanced punctuation.
- 100+ language model selection from Settings.
- Transcript history, light/dark mode, works in all apps and sites.
- Free individual tier (first 5,000 sign-ups), with the Enterprise plan as the stated upsell.
- Open-source code for verifiable local processing.

## Constraints

- 100% local is the core claim: no audio or transcript may leave the device — the MVP's privacy architecture must make that auditable, not just asserted.
- Free-for-first-5000-sign-ups is a stated, time-limited mechanic; the tier logic must survive the cap being reached.
- Mac support requires M-series (stated system requirement); Windows and iOS are also named surfaces.
- The comparison against Wispr Flow ($12/month, 2,000 free words/week) is the site's own claim; the MVP must not repeat comparisons it cannot verify.
- The title's "Whisper Flow" spelling is likely a capture error for "Wispr Flow"; the plan targets the site's actual product, not the title's literal words.
