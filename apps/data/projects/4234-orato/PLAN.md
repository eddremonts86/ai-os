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

## Tech Stack

- **An iPhone app** built with Apple's toolchain, free on the App Store.
- **Apple Intelligence** as the on-device inference backend, matching the source's "on iPhone with Apple Intelligence it runs on the device".
- **Speech recognition and audio capture** via Apple's native frameworks (AVFoundation / Speech).
- **A drill picker surface** where the speaker picks a drill and speaks for 30 to 90 seconds.
- **A four-axis scoring surface** for pacing, fluency, vocabulary, and coherence.
- **A transcript surface** that surfaces every filler and long pause the speaker said.
- **No account** — the speaker picks a drill and speaks without signing up.
- **No network call for the audio** — the audio stays on the device.

## Architecture

The app has three surfaces: the drill picker, the speak surface (capture + scoring), and the transcript review. The drill picker is where the speaker picks a drill; the speak surface is where the speaker speaks for 30 to 90 seconds; the transcript review is where the speaker reads the transcript back and sees the scores on the four axes.

The speak surface runs on the device via Apple Intelligence. The audio is captured locally, the speech recognition runs locally, the four-axis scoring runs locally, and the audio never leaves the phone. The on-device guarantee is structural; a drill that uploads the audio is a guarantee breach.

The four-axis scoring surface surfaces the pacing, fluency, vocabulary, and coherence scores the speaker is trying to improve. The transcript review surface surfaces every filler and long pause the speaker said, next to the metric the speaker is trying to improve, so the speaker can see the failure modes they need to fix.

The no-account onboarding is structural. The speaker picks a drill and speaks without signing up. The plan does not invent a future account system; the speaker's drill history is on-device.

## Milestones

1. **M1 — Drill picker** — the drill list, the per-drill description, the speaker's drill history (on-device).
2. **M2 — Speak surface** — the 30 to 90-second capture, the local speech recognition, the local four-axis scoring.
3. **M3 — Transcript review** — the transcript surface, every filler and long pause surfaced, the four-axis score alongside the transcript.
4. **M4 — On-device inference** — Apple Intelligence integration, the no-network guarantee, the on-device verification metric.
5. **M5 — No-account onboarding** — the drill picker is the launch surface, no signup, no email, no phone number.
6. **M6 — App Store submission** — the listing, the free launch, the launch tags Productivity, Education, Artificial Intelligence.

## Risks

- **Four-axis score convergence** — the four scores converge on a single number and the speaker cannot see a strong axis and a weak axis. Mitigation: the per-drill score-distribution spread is a metric; the per-axis scoring is unit-tested against known speech fixtures; a regression is a release blocker.
- **Transcript-fidelity gap** — a filler or long pause the speaker hears when they re-listen does not appear on the transcript. Mitigation: the transcript-fidelity rate is a first-class metric; the speech recognition is unit-tested against filler-heavy and pause-heavy fixtures; a regression surfaces visibly with a "transcript may miss some sounds" warning.
- **On-device regression** — a future Apple Intelligence update breaks on-device inference. Mitigation: the on-device verification rate is a metric; the app surfaces a "your iPhone cannot run the drill on the device" warning when the guarantee breaks; the launch tags are honest about the iPhone-with-Apple-Intelligence requirement.
- **iPhone-without-Apple-Intelligence coverage gap** — the speaker's iPhone does not support Apple Intelligence. Mitigation: the app surfaces a "your iPhone does not support on-device inference" warning; the plan does not invent a cloud fallback that would break the on-device guarantee.
- **Drill-duration range too narrow** — the speaker wants a longer drill (a 3-minute talk rehearsal) the app does not support. Mitigation: the drill duration range is documented; the speaker can file a drill-request; the plan does not invent a longer drill the source does not name.
- **App Store review rejection** — the app is rejected for a content concern or a privacy concern. Mitigation: the on-device guarantee is documented in the App Store privacy practices; the listing is explicit about the free launch; the rejection is escalated per the App Store review process.
- **Future fifth-axis scope creep** — the speaker asks for a fifth scoring axis (clarity, persuasiveness). Mitigation: the four-axis launch set is documented; the fifth axis is a future addition that does not displace the four-axis score the speaker is trying to improve.
