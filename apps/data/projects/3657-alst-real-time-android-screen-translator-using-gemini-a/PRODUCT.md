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

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

ALST is a real-time Android screen translator that splits the work where each piece is strongest: ML Kit Text Recognition runs on-device to read the screen, and Gemini translates what was read. Screen capture is the input, an overlay is the output, and the user sees the translation in place of the original text without alt-tabbing to a separate translator app.

The two-piece architecture is the product. On-device recognition keeps the cheap, always-on part cheap and offline-capable. Gemini brings language coverage for the part that needs a language model. The capture does not name the screen-capture mechanism, the language list, or the overlay rendering surface, so the plan treats each as a design choice to be made in MVP and called out explicitly rather than asserted as a fact.

**One-liner:** ALST reads your Android screen with on-device ML Kit and translates it with Gemini, so the translation lands as an overlay in place of the original text.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Android users facing unfamiliar-language text on their phone | Translation arrives where the text is, without switching apps. |
| Travellers in foreign-language apps and sites | The flow they were in is not broken by alt-tabbing to a translator. |
| Bilingual learners | The original and the translation are visible at the same time. |
| People needing assistive translation on demand | The trigger is "I see text I do not understand", not a planned task. |
| Developers reviewing the on-device + cloud split | The architecture is the lesson, with each piece doing what it is good at. |
| Privacy-conscious users | The privacy posture has to be stated: what runs on device, what is sent, what is not stored. |

## Jobs To Be Done

1. **Functional job** — Translate foreign-language text the user sees on screen without leaving the app they are in.
2. **Functional job** — Show the translation in place of the original, so the user does not have to mentally map two regions of the screen.
3. **Functional job** — Skip the work when the text has not changed, so battery and cost stay bounded.
4. **Emotional job** — Trust the app to look at the screen because the privacy posture is stated and the permissions are explicit.
5. **Social job** — Help another person on the phone read something in their language, by enabling translation on the spot.

## Success Metrics

- **Recognition hit rate** — share of captured frames where ML Kit returns usable text, since recognition is the gate the rest of the pipeline depends on.
- **End-to-end latency** — median time from frame captured to translation rendered, because a slow translator is no translator at all.
- **Duplicate-call rate** — share of Gemini calls answered by a translation the app already had, since deduplication is the cost-control mechanism.
- **Supported language coverage** — number of target languages with measured end-to-end success, since the value of a translator is bounded by the languages it actually speaks.
- **Permission grant rate** — share of installs that grant the screen-capture permission, since a translator that runs on no installs is no translator.
- **Overlay accuracy** — share of translations whose position matches the source text closely enough that the user does not have to remap two regions visually.

## Pricing & Monetization

The capture names no price, no tier and no monetization shape; the project is shared on GitHub. The architecture fixes only the cost shape: the dominant cost is per-call Gemini usage, which scales with the volume of unique text the user sees rather than with the number of users, so any future paid shape has to be priced per translated region or per session, not per seat.

## Competitive Landscape

- **Google Translate and similar in-app translators** — strong language coverage but require the user to leave the app they are in, which is exactly the friction ALST is designed to remove.
- **Built-in Android translation overlays** — exist on some Android versions and OEMs, with a permission model and capability set that varies by device and OS level; not named in the capture, so the comparison stops here.
- **Screenshot-and-paste workflows** — what users do today when no overlay exists; the cost is the round-trip out of the app they were using.

The capture names no specific competitor, so the comparison stops here.

## Risks & Open Questions

- [ ] Pick the screen-capture mechanism (AccessibilityService or MediaProjection) and document the privacy posture of each.
- [ ] Define the supported target-language list with measured end-to-end success, not an aspirational list.
- [ ] Build the deduplication layer so unchanged text is not re-translated; this is the cost-control mechanism.
- [ ] Design the overlay so the translation position matches the source layout closely enough that the user does not remap visually.
- [ ] State the supported Android version floor honestly, since ML Kit capability varies by OS level.
- [ ] Add the toggle default-off so the app does not run on-device recognition until the user explicitly enables it.
- [ ] Publish the privacy posture: what runs on device, what is sent to Gemini, what is not stored beyond the in-memory pipeline.
