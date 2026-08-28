---
id: "3127"
slug: tabu-nsfw-image-and-video-api-for-explicit-content-mode
title: "Tabu, NSFW image and video API for explicit content moderation"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49450127"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
tech: [Node.js, TypeScript, NSFWJS, In-memory request buffer, ffmpeg, REST API, PostgreSQL]
---
# Tabu, NSFW image and video API for explicit content moderation

## Tech Stack

Node.js with TypeScript for the HTTP service. NSFWJS as the in-memory classifier. ffmpeg for video frame extraction. A REST endpoint that returns per-category confidence JSON. PostgreSQL for tier counters, threshold settings, and audit (without storing image content). In-memory request buffer that is destroyed after classification, with an opt-out that records the buffer.

## Architecture

Client uploads an image (or a video) to the REST endpoint. The Node service loads it into an in-memory buffer, runs NSFWJS, and returns five confidence scores — porn, hentai, sexy, drawing, neutral. The buffer is then dropped; if the caller disabled privacy-first mode, the buffer is persisted per the chosen retention. Video is decoded with ffmpeg into sampled frames and scored per frame; the API returns per-frame or aggregate scores. The dashboard reads sensitivity thresholds from PostgreSQL and pushes them into the service.

## Milestones

M0 — single-image REST endpoint with NSFWJS, 200 ms per-image budget, in-memory-only buffer. M1 — per-category confidence scores surfaced as JSON; privacy-first mode default. M2 — video frame sampling via ffmpeg, with per-frame or aggregate confidence. M3 — dashboard for per-image and per-video threshold tuning. M4 — free tier metering at 5,000 requests/month. M5 — expanded model set across more NSFW categories (future).

## Risks

The in-memory model is the scale ceiling; GPU-backed inference or a sharded batch setup is not in scope. NSFWJS covers five categories; broader coverage is noted as future work and is not addressed here. The model itself is general-purpose and will produce false positives on edge cases (medical imagery, art, swimwear) — callers must own the threshold. The poster has no engineering background and is open to a technical co-founder; roadmap velocity depends on that.
