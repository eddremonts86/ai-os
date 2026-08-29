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

## Phase 0: Scaffold

- [x] Capture ProblemHunt post by Kristina (Russia, 2025-10-24)
- [ ] Provision Next.js dashboard + Fastify API + Postgres + S3-compatible storage on Coolify
- [ ] Provision Whisper transcription worker (local `large-v3` or hosted equivalent)
- [ ] Decide per-lesson compute ceiling (target ≤ $2/lesson) and the LLM tier that hits it
- [ ] Define storage layout: per-lesson prefix, private bucket, no public access

## Phase 1: Core

- [ ] Educator workspace: upload 4–5+ clips, enter stated topic and any target-order hints
- [ ] Per-clip upload to S3-compatible storage with progress
- [ ] Whisper transcription per clip; timestamped transcript viewer in the dashboard
- [ ] Semantic ordering layer: LLM prompt takes transcripts + topic + hints, returns proposed order with per-clip rationale
- [ ] Review UI: drag-to-reorder, per-clip trim handles (in / out), "approve order"
- [ ] Render pipeline (FFmpeg): resolution + frame-rate + audio-level normalisation, single mp4 output
- [ ] Render-job status visible to the educator; download link on completion
- [ ] Lesson history: title, original clips, final transcript, rendered mp4
- [ ] One-sentence "how the tool works" explainer visible on first lesson
- [ ] Stripe Checkout on 1,500 RUB/month + 7-day trial with one rendered lesson
- [ ] End-to-end test: upload 5 clips, propose an order, override one position, approve, render, download, verify no audio-level jump

## Phase 2: Deploy

- [ ] Onboard 30 educators across online-course and tutoring niches
- [ ] Weekly review of order-override rate (target ≤ 20%), render-success rate (target ≥ 95%), per-lesson compute cost (target ≤ $2)
- [ ] Privacy review: object storage is workspace-private; no third-party training on transcripts or renders without explicit opt-in
- [ ] Post-mortem at week 12: lessons produced per educator, retention past month 2, NPS-style "would you publish this lesson?" yes-rate
