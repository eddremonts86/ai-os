---
id: "750"
slug: need-an-ai-app-upload-a-photo-get-a-weekly-verdict-prog
title: "Need an AI app: upload a photo → get a weekly verdict «progress / no progress» and advice on when to increase load. Existing trackers either lack AI or are too complex. Willing to pay $100/year."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/fitness/xhutexah41-need-an-ai-app-upload-a-photo-get-a-week"
  captured: "2026-03-29"
category: fitness
date: "2026-03-29"
tags: [Fitness, AI, Other]
country: Greece
wtp:
  raw: "$100/year, or $150 for a PRO membership"
  currency: USD
  min: 100
  max: 150
  period: year
  mrrMid: 10
tech: [React Native with Expo, FastAPI, Postgres, pose-estimation preprocessing, vision model comparison pipeline, encrypted object storage]
---
# Need an AI app: upload a photo → get a weekly verdict «progress / no progress» and advice on when to increase load. Existing trackers either lack AI or are too complex. Willing to pay $100/year.

## Tech Stack

- **React Native with Expo:** the capture step is the accuracy lever. Native camera access allows a pose overlay, a distance check and an exposure warning at capture time, which is far cheaper than trying to correct framing after the fact. One codebase for iOS and Android because the user searched app stores, not the web.
- **Pose-estimation preprocessing on device:** a lightweight keypoint model (MoveNet-class) checks that the stance matches the reference shot before the photo is accepted. This is the single highest-leverage component: most of the week-to-week noise he would see is posture and distance, not body composition.
- **FastAPI backend:** one weekly comparison per user is a queue-shaped workload, not a request-shaped one. Python keeps the image pipeline, the model calls and the verdict logic in one place.
- **Vision model comparison pipeline:** aligned current and prior images compared for the specific signals a verdict rests on, with an explicit abstain path when alignment quality or interval is insufficient. The output is a verdict plus a reason, never a raw score shown to the user.
- **Postgres:** users, weekly entries, verdicts, reasons, abstentions, recommendation history and consent records. Verdict history matters because a trend across four weeks is more defensible than a single-week delta.
- **Encrypted object storage with per-user keys:** body photographs from an EU user. Encryption at rest, real deletion, and no image leaves storage for training without a separate opt-in.

## Architecture

The pipeline exists to answer one question a week, and its main job is knowing when not to answer. Capture happens under guidance: the app shows the previous week's silhouette as an overlay, checks pose keypoints against the reference, and rejects the shot before upload if the stance or distance is off. That rejection is not a failure state, it is the accuracy mechanism — the reason his ChatGPT attempt was inaccurate is that nothing enforced comparability between two photos.

Upload goes to encrypted storage; the entry is queued. The comparison job aligns the two images using the keypoints, scores alignment quality, and only then runs the vision comparison. Three outcomes exist: progress, no progress, or abstain with a stated reason (framing, lighting, interval too short). The abstain path is what keeps the verdict trustworthy, and it is deliberately allowed to fire often at first.

When the verdict is no progress, a rule layer — not the model — selects the recommendation, using verdict history: consecutive no-progress weeks point at load, a plateau after several progress weeks points at nutrition. Rules rather than a model here because the advice must be explainable in one sentence and must never contradict last week's advice.

The client shows one screen: this week's photo, the verdict, and at most one sentence. History is a photo sequence with verdicts attached. No metrics panel exists, because every metric added is a step back toward the apps he already rejected.

## Milestones

1. **M0 — Capture discipline.** Expo app with pose overlay, keypoint stance check and rejection before upload. Nothing else matters if the two photos are not comparable. End of week 3.
2. **M1 — Alignment and abstention.** Keypoint alignment, alignment-quality scoring, and the abstain rule with stated reasons — built before the verdict, on purpose. End of week 5.
3. **M2 — The verdict.** Vision comparison producing progress / no progress on aligned pairs, validated against a hand-labelled set of weekly photo pairs. End of week 8.
4. **M3 — The recommendation.** Rule layer over verdict history producing one sentence of load or nutrition advice, with no contradictions across consecutive weeks. End of week 10.
5. **M4 — Privacy and consent.** GDPR consent flow, per-user encryption, deletion that actually deletes, opt-in gate on any training use. End of week 12.
6. **M5 — Annual billing and the PRO tier.** $100/year primary price, $150 PRO with contents defined from what he asked for. End of week 14.
7. **M6 — Design-partner validation.** Run the app against the author's own weekly routine for eight weeks, measuring verdict agreement and abstention rate. End of week 22.

## Risks

- **A week may be shorter than the signal.** Real body-composition change over seven days is small, while lighting, posture, pump, hydration and food timing all move the pixels more. If a weekly interval cannot support a defensible verdict, the honest product is a verdict over a longer window with weekly photos feeding it — a change to the ask that has to be discussed with him, not silently shipped.
- **Confident wrongness is the fatal failure.** He left ChatGPT because its photo analysis was not accurate for this purpose. A verdict engine that always answers will be wrong regularly and lose the same user for the same reason. This is why abstention ships before the verdict.
- **The interface will be pushed toward what he rejected.** Every plausible improvement — a percentage, a measurement, a trend chart — moves the product toward the metric-heavy apps he named as unusable. The restraint is a feature and will need defending.
- **Advice without data.** He does not want manual entry, which means nutrition advice has no food log behind it. The recommendation can be honest about that (a general direction from verdict history) or it can pretend to precision it does not have. Only the first is shippable.
- **Cost of accuracy against $100/year.** A stronger verdict tempts multiple model passes per comparison. At 52 comparisons a year inside a $100 price, the inference budget per verdict is small, and the price is fixed by what he said he would pay.
- **GDPR on body photographs.** Sensitive imagery from an EU user makes consent, retention and deletion product requirements rather than legal paperwork, and a breach here is not recoverable by an apology.
- **A single-user brief.** One person in Greece described this precisely. The precision is what makes it buildable and also what makes it unvalidated: nothing in the source says how many others want the same narrow thing at the same price.
