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

## Tech Stack

- **Browser extension:** Manifest V3, TypeScript, content script that injects a "Narrate" button into the YouTube player and a background service worker that handles auth, subscription state, and the cloud endpoints.
- **Frontend of the extension popup:** React (or Preact) + TypeScript for the settings surface (voice selection, playback speed, captions toggle, restore-original toggle).
- **Transcript retrieval:** a Cloudflare Worker that fetches YouTube's caption track (auto or uploaded) and returns a structured timed-cue list; falls back to an ASR provider when captions are missing or low-quality.
- **TTS pipeline:** a streaming AI text-to-speech API (vendor pick deferred to M1) that returns clear-neutral-English audio chunks aligned to the cue list; rendered into the page via the Web Audio API.
- **Audio replacement:** in-page Web Audio graph that mutes / ducks the original video element's audio output and pipes the synthesized chunks to the same output device, so the user perceives a single replaced voice rather than a parallel track.
- **Billing:** Stripe Checkout on the $12/month plan; webhook updates the extension's subscription state.
- **Hosting:** Cloudflare Workers for the transcript / TTS / billing endpoints; extension distribution via Chrome Web Store (Chromium first), Firefox Add-ons (if cheap).

## Architecture

```
YouTube player page
  └─▶ content script injects "Narrate" button into player chrome
        │
        ├─▶ user clicks Narrate
        │     │
        │     ├─▶ background worker ──▶ Cloudflare Worker (transcript)
        │     │                            │
        │     │                            └─ if captions missing/low-quality
        │     │                                 → ASR provider fallback
        │     │
        │     └─▶ Cloudflare Worker (TTS, streaming)
        │           │
        │           └─▶ Web Audio graph ──▶ mutes original video element
        │                                  ▶ pipes synthesized chunks
        ▼
User hears clear-English narration in sync with the video
                                         │
Stripe webhook ──▶ extension subscription state
```

## Milestones

1. **M0 — Spec freeze.** SPEC.md + DESIGN.md + transcript / TTS / ASR vendor shortlist approved. End of week 1.
2. **M1 — Transcript pipeline.** Captions retrieval (auto + uploaded) and ASR fallback, behind a stable Cloudflare endpoint. End of week 3.
3. **M2 — TTS streaming + in-page audio replacement.** Streaming TTS into a Web Audio graph that mutes the original video element and pipes the synthesized chunks to the output device. End of week 5.
4. **M3 — Narrate button + settings surface.** Injected button, voice selection, playback speed, captions toggle, restore-original toggle. End of week 7.
5. **M4 — Stripe + trial.** 7-day free trial, Stripe Checkout, subscription state mirrored into the extension. End of week 9.
6. **M5 — Chrome Web Store launch.** Privacy disclosures, store listing, regression test that opens a real YouTube video on each release. End of week 12.

## Risks

- **YouTube player refactors.** The injected Narrate button depends on the YouTube player chrome, which changes frequently; every YouTube update is a potential silent break, and the extension has to ship a regression test that opens a real video per release.
- **YouTube ToS compatibility.** Replacing audio in the player by a third-party extension lives in a grey zone; the Chrome Web Store review team and YouTube's own developer terms need to be confirmed compatible before launch.
- **TTS cost per user.** A heavy learner narrating 20 hours of YouTube per month at $12/month leaves no margin if the TTS API charges more than a few cents per minute; v1 needs a measured per-user cost envelope, not a guess.
- **Caption-quality fallback rate.** When YouTube auto-captions are wrong on a heavily-accented lecturer, the narration will be wrong too, and ASR fallback (more cents per minute) eats the margin; the failure mode has to be visible to the user so they do not silently absorb bad narration.
- **Privacy posture.** The extension sees "every YouTube video the user narrates" by construction; the design must answer what is sent to the cloud, what is kept, and what is discarded, before the Chrome Web Store privacy review runs.
- **Voice clarity is subjective.** Piroska's threshold for "clear, perfectly-pronounced English" is implicit; the chosen TTS voice must be validated with non-native listeners, not just internal QA.
