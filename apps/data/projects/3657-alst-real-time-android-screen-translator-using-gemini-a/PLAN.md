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

## Tech Stack

- **Kotlin with Jetpack Compose** for the app UI, because the project is Android-first and the modern Android UI work is best done in Compose.
- **Android AccessibilityService** as the primary screen-capture path, with a documented fallback to MediaProjection for cases where AccessibilityService coverage is incomplete.
- **ML Kit Text Recognition** for the on-device recognition pass, because the title names it and the on-device split is the architectural commitment.
- **Gemini API** for the translation pass, called from the app over OkHttp with a structured prompt that returns per-region translations matching the input layout.
- **OkHttp** for the Gemini network call, with a configured retry and rate-limit policy so the pipeline does not burn quota or hammer the endpoint.
- **WorkManager** for any background deduplication and history cleanup, so the pipeline can defer non-urgent work off the main thread.
- **EncryptedSharedPreferences or Android Keystore-backed storage** for any persistent settings or short-lived cache, with no translation content persisted unless the user asks for a saved history.

## Architecture

The pipeline has two stages, named in the title, and the architecture is the clean separation between them. The first stage is recognition: an Android screen-capture path produces a frame; ML Kit Text Recognition runs on-device and returns text regions with bounding boxes. The second stage is translation: the recognized regions are batched, deduplicated against a short in-memory cache of recently seen strings, and sent to Gemini with a prompt that asks for per-region translations matching the input layout. The result is rendered as an overlay whose regions align to the source.

Screen capture is the privacy-sensitive part, and the plan picks AccessibilityService as the primary path because it can observe text changes without taking full screenshots of every frame, which is a smaller blast radius for what the app sees. MediaProjection is a documented fallback for cases where AccessibilityService coverage is incomplete (some games, some DRM surfaces, some custom views). Whichever path is used, the user has to grant it explicitly, the toggle defaults to off so the app does not run recognition until the user asks, and the privacy posture is stated in plain language.

Deduplication is a cost-control and latency-control mechanism, not a polish item. The pipeline keeps a short in-memory cache of recently seen strings (with a TTL and a bounded size) so a frame that says the same thing as the last frame does not trigger a Gemini call. The cache is in-memory only and is cleared when the user disables the overlay or the app is killed, so no translation content persists unless the user has asked for a saved history.

The overlay renderer places each translated region over the corresponding source region, with a clear visual distinction between source and translation (a subtle background, a font difference, a label). Position matching is best-effort because Gemini does not see the bounding boxes, only the text; the prompt asks Gemini to return translations in the input order, and the renderer maps them back to the bounding boxes by index. When the mapping is uncertain, the renderer falls back to a stacked layout rather than mis-locating the translation.

The supported Android version floor is set by ML Kit capability, and the plan states it honestly rather than promising coverage the on-device model cannot deliver on older OS levels. The Gemini call has a retry and rate-limit policy so the pipeline degrades gracefully under poor connectivity: recognition continues to run on-device, and the user sees a small "translating" indicator while a request is in flight, rather than a silent stale overlay.

## Milestones

1. **M1 — Screen capture** — AccessibilityService path with explicit permission flow and a documented MediaProjection fallback.
2. **M2 — On-device recognition** — ML Kit Text Recognition returning text regions with bounding boxes, with a deduplication cache in front of the Gemini call.
3. **M3 — Gemini translation** — a structured prompt returning per-region translations in input order, with retry, rate-limit, and graceful degradation.
4. **M4 — Overlay renderer** — position-matched overlay with a clear visual distinction between source and translation, and a stacked fallback for uncertain mapping.
5. **M5 — User controls** — toggle default-off, target-language picker, and a latency-visible status indicator.
6. **M6 — Privacy posture** — published statement of what runs on device, what is sent to Gemini, what is not stored; App Store listing updated with privacy labels.
7. **M7 — Language coverage** — measured end-to-end success per supported target language, with the supported list published rather than aspirational.

## Risks

- **Screen-capture permission refusal** — many users will not grant the permission; the value of the app collapses without it, so the permission flow has to be honest about what is being asked.
- **Overlay restriction on newer Android** — system-level overlay rules change across versions; the renderer has to respect what Android actually allows on each supported version.
- **Gemini cost and rate limit** — without deduplication and rate limiting, the app either costs the user real money or hits the endpoint hard enough to be rate-limited.
- **Translation drift over long sessions** — caches can grow stale or wrong; TTL and bounded size on the in-memory cache are required, not optional.
- **Position mismatch** — a translation that does not align to the source is worse than no overlay; the renderer has a fallback, but the prompt has to be designed for order preservation.
- **On-device capability floor** — ML Kit performance varies by OS level; the supported device list has to reflect measured reality.
- **Privacy perception** — "the app reads your screen" is a scary sentence; the privacy posture has to be stated in plain language or the install base will not form.
