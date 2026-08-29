---
id: "3286"
slug: thunderphone-v2-a-new-architecture-for-voice-ai
title: ThunderPhone v2 – a new architecture for voice AI
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49466204"
category: show-hn
date: "2026-08-27"
tags: [Show HN, Product, Problem]
tech: [Python, FastAPI, WebRTC, Web Audio API, multi-STT, LLM router, TTS, Coolify, Docker]
---
# ThunderPhone v2 – a new architecture for voice AI

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/3286-thunderphone-v2-a-new-architecture-for-voice-ai/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Stand up the WebRTC phone ingress/egress with audio resampling, VAD, and diarisation, and a round-trip latency baseline inside the non-thinking-LLM budget.
- [ ] Implement the multi-STT fan-out (at least two transcription models in parallel) with a consensus layer that hands the LLM the best transcript plus the runner-up.
- [ ] Implement the LLM router that mixes non-thinking and thinking models per segment and pipes audio into audio-aware models when the tier supports it.
- [ ] Wire the small-models swarm for noise suppression and turn-taking (background-voice filtering, interrupt-vs-backchannel detection), exposing the decision in the per-call trace.
- [ ] Ship the three tiers (Spark 2c/min, Bolt 5c/min, Storm 9c/min) and the Storm+Int (+3c/min) add-on as named, metered products with the published per-minute prices.
- [ ] Implement the per-call trace (STT transcripts, LLM chosen per segment, think invocations, turn decisions) and the developer trace viewer.
- [ ] Implement the self-serve credits path: signup, credit purchase, run a test call, read the trace, replacing the current "email alex@thunderphone.com" intake.

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-27_
