---
id: "3657"
slug: alst-real-time-android-screen-translator-using-gemini-a
title: ALST – Real-time Android screen translator using Gemini and ML Kit
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49482977"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [Kotlin, Jetpack Compose, Android AccessibilityService, ML Kit Text Recognition, Gemini API, OkHttp, WorkManager]
---
# ALST – Real-time Android screen translator using Gemini and ML Kit

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/3657-alst-real-time-android-screen-translator-using-gemini-a/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Implement the AccessibilityService screen-capture path with explicit user-grant flow and a MediaProjection fallback for incomplete coverage
- [ ] Integrate ML Kit Text Recognition and emit text regions with bounding boxes
- [ ] Build the in-memory deduplication cache so unchanged text is not re-translated, with TTL and bounded size
- [ ] Implement the Gemini translation call with a structured prompt returning per-region translations in input order
- [ ] Add retry, rate-limit, and graceful-degradation behavior so poor connectivity does not produce a silent stale overlay
- [ ] Build the overlay renderer with position-matched translation, clear visual distinction between source and translation, and a stacked fallback for uncertain mapping
- [ ] Add the toggle default-off, target-language picker, and a latency-visible status indicator
- [ ] Publish the privacy posture: what runs on device, what is sent to Gemini, what is not stored beyond the in-memory pipeline
- [ ] Measure end-to-end latency and publish the number, since latency is the headline property of a real-time translator
- [ ] Measure supported-language coverage with end-to-end success and publish the supported list honestly

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-28_
