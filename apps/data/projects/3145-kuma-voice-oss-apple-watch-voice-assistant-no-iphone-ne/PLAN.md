---
id: "3145"
slug: kuma-voice-oss-apple-watch-voice-assistant-no-iphone-ne
title: "Kuma Voice – OSS Apple Watch voice assistant, no iPhone needed"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49448238"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
---
# Kuma Voice – OSS Apple Watch voice assistant, no iPhone needed

## Tech Stack

Native watchOS in Swift, because the constraints in play, microphone access, background execution, battery, and running without the paired phone, are all platform APIs with no cross-platform escape hatch.

## Architecture

An independent watchOS app that captures audio on the watch, turns it into text, resolves an intent, and speaks back, using the watch's own network path rather than the phone relay. Every stage is budgeted against battery and the watchOS execution window, which is the real constraint, not model quality.

## Milestones

1. Independent watch app that records and transcribes audio
2. Intent handling and spoken reply
3. Verified operation with the paired iPhone absent
4. Public repo with build instructions

## Risks

- watchOS memory, audio, and background limits are tight and may block a hands-free wake path
- Running without the phone puts networking and compute on the watch battery
- Distribution of an assistant app is subject to platform review
