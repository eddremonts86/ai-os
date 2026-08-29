---
id: "744"
slug: need-a-oneclick-solution-that-replaces-a-lecturers-voic
title: "Need a one-click solution that replaces a lecturer's voice with clear English directly inside YouTube. Current services are inconvenient. Willing to pay $12/month."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/education/cuglmz7oz1-need-a-oneclick-solution-that-replaces-a"
  captured: "2026-04-27"
category: education
date: "2026-04-27"
tags: [Education, Productivity, AI, Other]
country: Hungary
wtp:
  raw: $12/month
  currency: USD
  min: 12
  max: 12
  period: month
  mrrMid: 12
tech: [Browser extension (Manifest V3), TypeScript, Web Audio API, Cloudflare Workers, AI text-to-speech API, Stripe subscriptions]
---
# Need a one-click solution that replaces a lecturer's voice with clear English directly inside YouTube. Current services are inconvenient. Willing to pay $12/month.

## Phase 0: Scaffold

- [x] Capture problem from ProblemHunt + write SPEC.md skeleton
- [ ] Choose TTS + ASR vendors; pin Cloudflare Worker baseline
- [ ] Scaffold Manifest V3 extension (content script + background service worker + popup)
- [ ] Define the YouTube-player injection surface (where the Narrate button sits, what happens on player refactor)
- [ ] Wire Stripe Checkout in test mode for the $12/month plan

## Phase 1: Core

- [ ] Captions retrieval: YouTube auto-captions + uploaded subtitle tracks via Cloudflare Worker
- [ ] ASR fallback when captions are missing or low-quality, with a visible caption-confidence indicator
- [ ] Streaming TTS pipeline returning clear-neutral-English audio chunks aligned to the timed cue list
- [ ] Web Audio graph that mutes / ducks the original video element and pipes synthesized chunks to the same output device
- [ ] "Narrate" button injected into the YouTube player chrome; one-click activation
- [ ] Settings surface: voice selection (1–2 clear-neutral voices in v1), playback speed, captions on/off, restore-original-audio toggle
- [ ] 7-day free trial + Stripe subscription gating, mirrored into the extension's subscription state
- [ ] Privacy disclosures written and reviewed for the Chrome Web Store privacy review
- [ ] Per-user cost envelope instrumented (TTS minutes + ASR minutes per subscriber) so margin is observable, not guessed
- [ ] End-to-end test: open a real YouTube video, press Narrate, hear clear-English narration replacing the original audio without leaving the page

## Phase 2: Deploy

- [ ] Submit to Chrome Web Store with privacy disclosures and the production store listing
- [ ] Open Firefox Add-ons submission if cheap (Manifest V3 port)
- [ ] Add a regression test that opens a real YouTube video per release to catch player-chrome breaks
- [ ] Voice-clarity validation round: 10 non-native English speakers rate the synthesized voice against a "clear, neutral English" reference
- [ ] Post-launch review at week 12: trial conversion, cost-per-user envelope, caption-fallback rate, churn
