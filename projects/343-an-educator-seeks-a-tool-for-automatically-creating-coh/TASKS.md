---
id: "343"
slug: an-educator-seeks-a-tool-for-automatically-creating-coh
title: An educator seeks a tool for automatically creating coherent video lessons from multiple fragments
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/design/oy3gtd71l1-an-educator-seeks-a-tool-for-automatical"
category: design
date: "2025-10-29"
tags: [Design, Education, Media]
country: Russia
tech: [Next.js, FFmpeg + Whisper (transcription), OpenAI API (coherence scoring), Postgres, S3-compatible storage]
---
# An educator seeks a tool for automatically creating coherent video lessons from multiple fragments

## Phase 0: Scaffold

- [ ] Read the source at `https://problemhunt.pro/en/design/oy3gtd71l1-an-educator-seeks-a-tool-for-automatical` and quote the original problem statement into a `source-quote.md` for traceability.
- [ ] Create the project folder under `apps/343-an-educator-seeks-a-tool-for-automatical/` (or per the chosen deployment target).
- [ ] Initialize git, pin dependencies for: Next.js, FFmpeg + Whisper (transcription), OpenAI API (coherence scoring), and confirm versions resolve in CI.
- [ ] Write DESIGN.md with country-appropriate defaults (`country: Russia`) — color, type, density, motion tokens — not the global default.
- [ ] Scaffold the auth + persistence layer with data-residency configured for Russia.
- [ ] Set up the framework router, server actions, and a typed API client for the read/write endpoints listed in PLAN.md.
- [ ] Author the schema migrations named in PLAN.md and seed at least one realistic fixture for the {country} locale.
## Phase 1: Core

- [ ] Fragment drag-drop upload (6-12 MP4/MOV)
- [ ] Whisper transcription (RU+EN) with manual transcript fallback
- [ ] Overlap detection: same minute content collapses to one best take
- [ ] Coherence scoring per fragment transitions and slide references
- [ ] Auto-chapter generation from topic-shift detection in transcript
- [ ] Slide resync: slide deck uploaded once, rotated to moment of mention
- [ ] Render queue at 1080p, with progress, resume, and per-lesson output
- [ ] Pilot with 10 Russian educators, 30 lessons, comprehension quiz at week 4

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Next.js, FFmpeg + Whisper (transcription), OpenAI API (coherence scoring)) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 343-an-educator-seeks-a-tool-for-automa MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in Russia completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Next.js, FFmpeg + Whisper (transcription), OpenAI API (coherence scoring) errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
