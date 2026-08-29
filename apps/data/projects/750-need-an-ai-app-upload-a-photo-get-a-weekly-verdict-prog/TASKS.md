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

## Phase 0: Scaffold

- [x] Capture the problem statement, the rejected alternatives and the stated price from ProblemHunt
- [ ] Expo app shell with camera permission and a single-screen navigation model
- [ ] FastAPI service with a job queue for weekly comparisons
- [ ] Postgres schema: users, weekly entries, verdicts, abstentions, recommendations, consent records
- [ ] Encrypted object storage with per-user keys and a working delete path
- [ ] Write DESIGN.md (capture overlay, verdict screen, history sequence — no metrics panel)

## Phase 1: Core

- [ ] Capture guidance: previous-week silhouette overlay, distance and exposure checks
- [ ] On-device pose keypoint extraction and stance comparison against the reference shot
- [ ] Reject non-comparable shots before upload, with a plain reason shown to the user
- [ ] Weekly entry upload to encrypted storage, one entry per week per user
- [ ] Keypoint-based alignment of the current and prior images, with an alignment-quality score
- [ ] Abstain rule: decline a verdict on poor alignment, lighting or too-short interval, and state which
- [ ] Vision comparison producing progress / no progress on aligned pairs only
- [ ] Hand-labelled validation set of weekly photo pairs, with verdict agreement measured against it
- [ ] Rule layer over verdict history selecting one recommendation: increase load or adjust nutrition
- [ ] Consistency check so consecutive weeks never issue contradictory advice
- [ ] Verdict screen: photo, verdict, at most one sentence, nothing else
- [ ] History as a photo sequence with the verdict attached to each week
- [ ] Weekly reminder aligned to the user's existing measurement day
- [ ] GDPR consent flow, deletion that removes images and derived data, opt-in gate for any training use
- [ ] Per-verdict inference cost logging, checked against the $100/year price

## Phase 2: Deploy

- [ ] Annual billing at $100/year plus the $150 PRO tier with contents defined from the source's ask
- [ ] Ship to TestFlight and Play internal testing
- [ ] Run eight weeks with the problem author, tracking verdict agreement and abstention rate
- [ ] Verify in production
