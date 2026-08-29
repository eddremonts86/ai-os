---
id: "885"
slug: an-educator-seeks-a-tool-for-automatically-creating-coh
title: An educator seeks a tool for automatically creating coherent video lessons from multiple fragments
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/design/oy3gtd71l1-an-educator-seeks-a-tool-for-automatical"
  captured: "2025-10-24"
category: design
date: "2025-10-24"
tags: [Design, Education, Media]
country: Russia
wtp:
  raw: "1500 RUB/month ($18–20)"
  currency: USD
  min: 18
  max: 20
  period: month
  mrrMid: 19
tech: [FFmpeg (video stitching), Whisper (speech-to-text), LLM-based semantic ordering, Next.js (educator review UI), S3-compatible object storage]
---
# An educator seeks a tool for automatically creating coherent video lessons from multiple fragments

## Tech Stack

- **Frontend:** Next.js (React + TypeScript) educator dashboard with per-lesson workspace: upload, transcript viewer, drag-to-reorder, trim handles, render trigger, download.
- **Backend API:** Node.js (Fastify) + Postgres on a single Coolify instance. Postgres stores the lesson record (clips, transcripts, proposed order, render job status).
- **Object storage:** S3-compatible (Backblaze B2 or MinIO on the same Coolify host) for the uploaded fragments, transcripts, and rendered mp4s.
- **Transcription:** Whisper (local `large-v3` or hosted equivalent), per-clip, producing timestamped transcripts with speaker info off.
- **Semantic ordering:** LLM-based prompt that takes the per-clip transcripts and the educator's stated topic + any target order hints, returns an ordered list of clip references with a one-sentence rationale per ordering decision.
- **Render pipeline:** FFmpeg-based stitcher that takes the educator-approved order, normalises resolution and audio levels, and writes a single mp4.
- **Billing:** Stripe Checkout on the 1,500 RUB/month price; webhook updates workspace status.

## Architecture

The educator uploads clips; the backend writes them to object storage and enqueues a transcription job. Once all transcripts are ready, the backend calls the semantic-ordering model with the topic + transcripts and writes a proposed order to Postgres. The educator reviews the order in the Next.js UI (drag-to-reorder, per-clip trim handles), approves, and triggers a render job. The render pipeline pulls the ordered clips from object storage, normalises, and writes the rendered mp4 back, which the educator downloads. Nothing leaves the educator's workspace without an explicit download.

```
Educator (browser)
       │  uploads clips + states topic
       ▼
Next.js dashboard ──▶ Fastify (lessons, clips, transcripts)
       │                       │
       │                       ▼
       │                  S3-compatible storage
       │                       ▲
       │                       │
       │              ┌────────┴─────────┐
       │              ▼                  ▼
       │      Whisper (per clip)   LLM semantic ordering
       │              │                  │
       │              └──── transcripts ─┘
       │                       │
       │                       ▼
       │              proposed order (Postgres)
       │                       │
       ▼                       ▼
   Educator review UI  ◀──── drag-to-reorder, trim
       │                       │
       │              click "render"
       │                       ▼
       │                  FFmpeg stitcher
       │                       │
       │                       ▼
       │                  rendered mp4 (S3)
       │                       │
       ▼                       ▼
   download ◀──────── educator clicks download
```

## Milestones

1. **M0 — Spec freeze + compute budget.** SPEC.md approved; per-lesson compute ceiling locked (target ≤ $2/lesson for transcription + LLM + render). End of week 1.
2. **M1 — Upload + transcription.** Per-clip upload to S3-compatible storage; Whisper transcription; transcript viewer. End of week 3.
3. **M2 — Semantic ordering layer.** LLM prompt takes transcripts + topic + target-order hints, returns proposed order with per-clip rationale. End of week 5.
4. **M3 — Review UI.** Drag-to-reorder, per-clip trim handles, "approve order" action. End of week 6.
5. **M4 — Render pipeline.** FFmpeg-based stitcher; resolution + audio-level normalisation; render-job status visible to the educator. End of week 7.
6. **M5 — Stripe + trial.** 7-day free trial with one rendered lesson; Stripe Checkout on 1,500 RUB/month. End of week 8.
7. **M6 — Pilot.** 30 educators; weekly review of order-override rate, render-success rate, and per-lesson compute cost. End of week 12.

## Risks

- **Semantic-ordering quality.** This is the product. If the proposed order reads the lesson wrong, the educator spends more time fixing the order than they saved by not editing manually. Validate with 10 educators and 30+ real lessons before launch; the order-override rate (target ≤ 20%) is the load-bearing metric.
- **Per-lesson compute cost.** At 1,500 RUB/month ($18–20), with 2–6 lessons/month per typical educator, each lesson must cost under a few dollars to produce. Render time, transcription minutes, and LLM tokens are all in scope. Cost-instrument every lesson and alert when a lesson exceeds the budget.
- **Clip normalisation artefacts.** Inconsistent resolution, frame rate, or audio levels between clips produce a stitched video that visibly jumps. The render pipeline must normalise without producing its own artefacts; if it does, the educator will redo the lesson in Premiere.
- **Privacy of unpublished course material.** Lesson recordings and rendered mp4s are the educator's unpublished IP. Object storage must be private to the workspace; transcripts and rendered outputs must never be used for third-party training without explicit opt-in. A breach incident is brand-ending.
- **"Intelligent combination" is a vague promise.** The dashboard must explain in one sentence what the tool does (semantic ordering from transcript + stated topic, with human override), or the educator will assume "AI magic", get a wrong order on the first lesson, and churn.
