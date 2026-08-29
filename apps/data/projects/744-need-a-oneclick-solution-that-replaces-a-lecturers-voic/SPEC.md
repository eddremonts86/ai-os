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

## Problem

Piroska Rákóczi (Hungary) is not a native English speaker and knows she has an accent; she relies on instructional YouTube videos to learn, and many of the creators she watches also speak with strong accents that make the material hard to parse. Existing services that can replace a lecturer's voice with clear, perfectly-pronounced English all work the same way — a separate website where you have to send a YouTube link or download the video, wait for the upload, wait for processing, then receive a result — and that round-trip is slow, inconvenient, and breaks the flow of "open YouTube, watch the video, learn the thing." She wants a solution that lives inside the browser, works with a single click, does not require her to download the video or leave YouTube, and does not make her wait through a long upload-and-process step every time. This pain shows up every time she wants to watch a useful video — sometimes daily, at minimum weekly. She is willing to pay $12 per month for a solution that does exactly one thing with one click: replace the voice in a YouTube video with a clear voice in pure English, without taking her out of the YouTube viewing experience.

## Objective

Ship a browser extension that, while watching any YouTube video, replaces the lecturer's spoken track with a clear, perfectly-pronounced English voice in one click — without leaving YouTube, without downloading the video, without an upload-and-wait round-trip — at $12/month, so non-native English speakers can follow instructional content as easily as native ones do.

## Target Users

- Primary: non-native English speakers who rely on instructional YouTube content and routinely hit the "I can't parse this lecturer's accent" wall, and who will pay a small monthly subscription to remove that friction.
- Secondary: students and lifelong learners who watch long-form educational channels (programming lectures, math explainers, science talks) where the lecturer's pronunciation makes comprehension the bottleneck rather than the content itself.
- Tertiary: ESL teachers and accessibility advocates who recommend tools to learners and would benefit from an extension that runs at the YouTube surface itself, not as a separate website.

## MVP Scope

- A browser extension (Chromium / Manifest V3 first; Firefox if cheap) that injects a single "Narrate" button into the YouTube player chrome.
- One-click activation: pressing the button replaces the original audio with a clear, neutral-English TTS voice that reads the transcript in real time, in sync with the video.
- A transcript pipeline: fetch the video's captions (YouTube auto-captions or uploaded subtitles) and, when captions are missing or low-quality, fall back to an on-device or server-side ASR step.
- A TTS render path: stream the synthesized clear-English voice into the YouTube player, replacing the original audio in place (muting / ducking the original) without downloading the full video.
- A $12/month Stripe subscription that gates the Narrate button (a free trial of N videos per month, or a 7-day trial, lets the user validate the workflow before paying).
- A settings surface: voice selection (one or two clear-neutral voices in v1), playback speed, captions-on / captions-off, and a "restore original audio" toggle.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Author's stated budget is $12/month per user; the product must be viable at that price point, which caps the per-user cloud cost (transcript fetch + ASR fallback + TTS synthesis) under roughly $3–4/user/month.
- The solution must work entirely inside the YouTube viewing flow — no separate website, no video download, no upload step — or it fails the stated requirement.
- The TTS voice must be a clear, neutral English voice with perfect pronunciation; "an accent of its own" defeats the whole product.
- Must handle YouTube auto-captions, channel-uploaded captions, and a graceful fallback when neither is reliable.
- Must respect YouTube's terms of service and the underlying media pipeline (no offline re-distribution of the rendered audio in v1; only in-page playback).
- Browser-extension distribution is subject to Chrome Web Store / Firefox Add-ons review cycles; the privacy disclosure and the network endpoints must be production-grade from day one.
