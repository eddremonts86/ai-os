---
id: "202"
slug: need-a-oneclick-solution-that-replaces-a-lecturers-voic
title: "Need a one-click solution that replaces a lecturer's voice with clear English directly inside YouTube lectures."
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/"
category: ai
date: "2026-04-27"
tags: [AI, Education, Video]
country: Hungary
tech: [Python, Whisper, Coqui TTS, FFmpeg, FastAPI, yt-dlp]
---
# Need a one-click solution that replaces a lecturer's voice with clear English directly inside YouTube lectures.

## Phase 0: Scaffold

- [ ] Read the source at `https://problemhunt.pro/` and quote the original problem statement into a `source-quote.md` for traceability.
- [ ] Create the project folder under `apps/202-need-a-one-click-solution-that-replaces-/` (or per the chosen deployment target).
- [ ] Initialize git, pin dependencies for: Python, Whisper, Coqui TTS, and confirm versions resolve in CI.
- [ ] Set up the LLM provider abstraction (rate-limit, fallback model, prompt cache) and the eval harness for the {country}-relevant test cases.
- [ ] Write DESIGN.md with country-appropriate defaults (`country: Hungary`) — color, type, density, motion tokens — not the global default.
- [ ] Scaffold the auth + persistence layer with data-residency configured for Hungary.
## Phase 1: Core

- [ ] yt-dlp audio/video split
- [ ] Whisper transcription with word-level timestamps
- [ ] Translation step preserving technical terms
- [ ] Coqui TTS resynthesis with three voice profiles
- [ ] Reassembly and re-mux to MP4
- [ ] Progress polling endpoint
- [ ] Side-by-side preview before export
- [ ] End-to-end test on 5 real Hungarian lectures
- [ ] Takedown workflow for lecturer requests to remove the dub

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Python, Whisper, Coqui TTS) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 202-need-a-one-click-solution-that-repl MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in Hungary completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Python, Whisper, Coqui TTS errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
