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

## Problem

The capture for this plan is a link to a GitHub repository (https://github.com/navidseyedain/ALSTMobile) and a title; there is no prose body in the capture, so the implementation details are unstated and have to be scoped honestly from the title alone.

The title names the architecture explicitly: a real-time Android screen translator built from two named pieces — Gemini and ML Kit — with screen capture as input and translation as output. The split between the two pieces is the load-bearing choice. ML Kit's Text Recognition runs on-device and produces recognized text from the screen image; that recognition is the cheap, always-on part. Gemini does the translation work, which is the part that needs a language model and runs over the network. Screen capture is the input side, and the overlay is the output side. The capture does not name how screen capture is obtained (AccessibilityService, MediaProjection, a system-level screenshot API), which languages are supported, how latency is managed, or how the overlay is rendered, so those are scoped as design choices rather than facts.

## Objective

Ship a real-time Android screen translator that combines on-device ML Kit text recognition with Gemini-powered translation, so the recognition is cheap and offline-capable while the translation brings language coverage, and the result is delivered as an overlay the user can read in place of the original text.

## Target Users

- Android users who routinely encounter text in a language they do not read fluently — signs, menus, social feeds, messages, app UI strings — and want a translation without alt-tabbing to a separate translator app.
- Travellers navigating foreign-language apps and websites on their phone, where switching apps breaks the flow they were in.
- Learners using bilingual content as study material and wanting the original and the translation visible at the same time.
- People who need assistive translation on demand, where the trigger is "I see text I do not understand" rather than a planned translation task.
- Developers and reviewers evaluating the ML Kit + Gemini split for other on-device-vs-cloud pipelines on Android.

## MVP Scope

- A screen-capture path that runs on Android, scoped as a design choice between AccessibilityService and MediaProjection, with the privacy posture of each made explicit.
- ML Kit Text Recognition running on-device to extract text from each captured frame, with the result deduplicated so unchanged text is not re-translated.
- A Gemini call that translates the recognized text into the user's chosen target language, with the prompt designed to return a per-region translation matching the input layout.
- An overlay renderer that places the translation on top of the original text, with a clear visual distinction between source and translation.
- A toggle for the user to enable or disable translation, with the default off so the app does not run on-device recognition until the user asks for it.
- A target-language picker, since the value of a translator is bounded by the languages it actually speaks.
- Latency visible to the user: a small status indicator that says "recognizing" and "translating", so the user can see when the pipeline is working and when it is not.
- A documented privacy posture that names what runs on device, what is sent to Gemini, and what is not stored.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The capture is URL-only, so the screen-capture mechanism, the supported language list, and the overlay rendering surface are scoped as plausible defaults rather than asserted as facts.
- Screen capture is a sensitive Android permission; whichever path is chosen (AccessibilityService, MediaProjection, system-level), the user has to grant it explicitly and the privacy posture has to be stated in plain language.
- Gemini calls cost money and consume network, so the pipeline has to deduplicate repeated text and rate-limit calls, otherwise the cost or the latency will make the app unusable.
- ML Kit recognition runs on-device and is bounded by Android version and device capability, so the supported device floor has to be stated honestly.
- Overlay rendering on top of other apps is restricted by Android; the project has to respect what Android actually allows rather than promising a universal overlay.
- The translation has to match the layout of the source, otherwise the user reads source text in one place and translation in another and the overlay is worse than no overlay.
- The app must not log or store translated content beyond the in-memory pipeline unless the user explicitly asks for a saved history.
