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

## Value Proposition

A non-native English speaker gets a single "Narrate" button inside the YouTube player that replaces the lecturer's accented voice with clear, perfectly-pronounced English in real time, without leaving YouTube or downloading the video, at $12/month — turning the videos she already wants to watch into ones she can actually understand.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Non-native English-speaking learner | Hits the accent wall on instructional YouTube daily; will pay $12/month to remove that friction without leaving YouTube. |
| Student / lifelong learner of long-form educational channels | The bottleneck is pronunciation, not content; a clear voice in the same player restores comprehension. |
| ESL teacher / accessibility advocate | Recommends tools to learners; an extension that lives inside YouTube is dramatically more useful than a separate website. |
| TTS / ASR API providers (indirect) | Gain a steady, low-friction B2C distribution channel for clear-English voices and ASR fallbacks. |

## Jobs To Be Done

1. **Functional job** — Replace the lecturer's voice in any YouTube video with clear English, with one click, without downloading the video or leaving YouTube.
2. **Emotional job** — Stop feeling shut out of instructional videos by the lecturer's accent; feel like the content is finally accessible.
3. **Social job** — Be able to recommend the same videos to other learners without each of them hitting the same wall.

## Success Metrics

- **Activation:** install → first "Narrate" press → first minute of clear-English audio within the same session, in under 60 seconds.
- **Trial conversion:** ≥ 25% of free-trial users convert to the $12/month plan before the trial ends.
- **Engagement:** median active subscriber uses the Narrate button on ≥ 5 videos per month, indicating the workflow is sticky and not a one-off.
- **Latency:** time from pressing Narrate to the first word of synthesized clear English is short enough that the user does not feel they are waiting (target: under the video's first-segment load).
- **Caption-quality fallback rate:** percentage of narrations that successfully use YouTube's own captions (no ASR fallback needed) is the headline operational metric.

## Pricing & Monetization

$12/month subscription, matching the author's stated willingness-to-pay. 7-day free trial so the user can validate the workflow on a real video before paying; the trial limits can be generous (no hard cap on trial videos) because the activation cost is the bottleneck, not usage during trial.

## Competitive Landscape

- **ElevenLabs / Speechify / Narakeet as standalone services** — produce high-quality re-narrated audio but require uploading or linking a video, then waiting for processing; the friction Piroska explicitly rejects.
- **YouTube's built-in auto-translated captions** — visual, not audio, and the original accented audio is still playing; addresses a different need.
- **Speed-changing / pitch-shifting extensions** — make the original audio faster / clearer but do not actually replace the voice with a clear English one; partial workaround at best.
- **No incumbent.** Piroska's framing ("I want a Narrate button inside YouTube, not a separate service") is the gap no current product closes; the comparison set is "what non-native learners do today, which is rewatch the same video three times or skip it".

## Risks & Open Questions

- [ ] Confirm that YouTube's terms of service allow in-page audio replacement by a third-party extension, and that the Chrome Web Store / Firefox Add-ons review process is compatible with the chosen implementation.
- [ ] Validate that the chosen TTS voice is genuinely clear, neutral English without an accent of its own; Piroska's threshold for "clear" is implicit and must be checked with non-native listeners.
- [ ] Decide the ASR fallback cost model: when captions are missing, who pays for the transcription and at what per-minute rate; a runaway ASR bill on heavy users would erase the $12/month margin.
- [ ] Watch for YouTube player refactors (the player chrome changes frequently) which can silently break the injected Narrate button; the extension must have a regression test that opens a real YouTube video on each release.
- [ ] Decide the privacy posture for the transcript / audio pipeline: many learners would object to sending every watched video's audio to a third-party server; the design must answer that question on day one, not after a leak.
