---
id: "4234"
slug: orato
title: Orato
status: enriched
source:
  name: ProductHunt
  url: "https://www.producthunt.com/products/orato-speech-coach"
category: product-launch
date: "2026-08-29"
tags: [ProductHunt, Product Launch]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Orato

## Value Proposition

An iPhone app that turns speaking practice into a scored drill. Pick a drill, speak for 30 to 90 seconds, get scored on pacing, fluency, vocabulary, and coherence. Every filler and long pause lands on a transcript the speaker can read back, so the failure modes the speaker needs to fix are surfaced next to the metric the speaker is trying to improve.

On iPhone with Apple Intelligence the drill runs on the device, so the speaker's audio never leaves the phone. No account, no signup, no upload — just pick a drill and speak.

**One-liner:** An iPhone speaking-drill app that scores pacing, fluency, vocabulary, and coherence, surfaces every filler and long pause on a transcript, and runs on the device with Apple Intelligence.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Speakers who want scored drills | Want pacing, fluency, vocabulary, coherence on every drill. |
| Speakers who want to see failure modes | Want every filler and long pause on a transcript they can read back. |
| iPhone users with Apple Intelligence | Want the drill to run on the device so the audio never leaves the phone. |
| Speakers preparing for a talk or interview | Want a focused drill surface, not a generic speaking app. |
| Educators and coaches | Want to recommend a no-account drill app to students. |

## Jobs To Be Done

1. **Functional job** — Pick a drill, speak for 30 to 90 seconds, and get scored on pacing, fluency, vocabulary, and coherence.
2. **Functional job** — Read a transcript back and see every filler and long pause surfaced on the transcript.
3. **Functional job** — Practise on iPhone with Apple Intelligence, with the audio never leaving the phone.
4. **Functional job** — Practise without creating an account.
5. **Emotional job** — Stop the feeling that the speaker is practising into a black box and cannot see the failure modes.
6. **Social job** — Be the speaker whose drill surfaces the fillers and long pauses, so the speaker can fix them before the next talk or interview.

## Success Metrics

- **Per-axis score coverage** — share of drills that surface a score on pacing, fluency, vocabulary, and coherence. A drill missing an axis is a coverage gap.
- **Transcript-fidelity rate** — share of spoken drills where every filler and long pause appears on the transcript the speaker reads back. A filler or pause the transcript misses is a fidelity gap.
- **On-device verification rate** — share of drills where the audio stays on the device. A drill that uploads is an on-device guarantee breach.
- **Drill completion rate** — share of drills where the speaker speaks for the full 30 to 90 seconds and the app emits a score. A drill that ends early is a completion gap.
- **No-account verification rate** — share of app launches where the speaker does not see a signup screen. A launch that surfaces a signup is a no-account guarantee breach.
- **iPhone-with-Apple-Intelligence coverage** — share of supported iPhones where the drill runs on the device with Apple Intelligence. An iPhone without Apple Intelligence is a coverage gap the plan does not invent around.
- **Per-drill score-distribution spread** — share of drills where the four scores differ enough that the speaker can see a strong axis and a weak axis. Four scores that are identical is a metric-distribution failure.

## Pricing & Monetization

The source is explicit that the app is free at launch. The plan does not invent a subscription, a per-drill price, or a paid tier. The free launch is the source's monetization. Any future monetization has to be measured against the on-device verification rate and the per-axis score coverage, because those are the metrics the source ties to the app's value proposition.

## Competitive Landscape

- **Generic speaking apps (the names the source does not provide)** — score a single axis (often pronunciation) and do not surface fillers / long pauses on a transcript.
- **Speech-to-text apps (the names the source does not provide)** — transcribe the speaker's words but do not score pacing, fluency, vocabulary, coherence.
- **Cloud-AI speaking coaches** — score multiple axes but upload the audio; the source's pitch is the on-device guarantee.
- **Account-required speaking apps** — require signup before the first drill; the source's pitch is the no-account onboarding.

The post names no specific incumbent, so no further comparison is claimed here.

## Risks & Open Questions

- [ ] Confirm the four-axis scoring is robust across the drill set. The source names pacing, fluency, vocabulary, coherence; the open question is whether the four axes score differently across drills the speaker practises, or whether the four scores converge on a single number.
- [ ] Validate the filler-and-pause transcript is faithful to the speaker's actual speech. The source is explicit that every filler and long pause lands on the transcript; the open question is whether the transcript's filler / pause detection matches what the speaker hears when they re-listen.
- [ ] Define the policy on an iPhone without Apple Intelligence. The source names iPhone with Apple Intelligence; the open question is whether the app surfaces a "your iPhone does not support on-device inference" warning, fails visibly, or runs in a degraded cloud mode.
- [ ] Confirm the drill duration range (30 to 90 seconds) is the right initial range. The source names 30 to 90 seconds; the open question is whether the speaker wants longer drills (a 3-minute talk rehearsal) the plan does not invent.
- [ ] Decide the policy on a drill the speaker repeats. The source does not name a repeat-drill surface; the open question is whether the speaker can compare two runs of the same drill side-by-side.
- [ ] Establish a documented escalation path when Apple Intelligence's on-device inference is unavailable (a beta regression, a hardware fault). The source names on-device inference as the structural reason; the open question is how the app handles an Apple Intelligence outage.
- [ ] Define the policy on a future launch that adds a fifth scoring axis. The source ships four axes; the open question is whether the app adds a fifth axis (clarity, persuasiveness) and how the four-axis launch set is preserved.
