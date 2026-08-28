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

## Tech Stack

Python + FastAPI for the orchestration layer, WebRTC for phone audio ingest and egress, Web Audio API for browser-side preview and developer tooling, multiple STT providers running in parallel (Whisper-class plus one or two audio-aware models), an LLM router that mixes non-thinking and thinking models mid-call, a TTS provider per tier, and a small-models layer for noise suppression and turn-taking. Coolify + Docker for hosting. The choice is driven by the real-time audio path and the need to swap model providers without rewriting the call handler.

## Architecture

```
   Phone carrier (PSTN / SIP)
            │
            ▼
     ┌──────────────┐
     │   WebRTC     │  ingress + egress audio
     └──────┬───────┘
            ▼
   ┌────────────────────┐
   │   Audio ingress    │
   │   - resample       │
   │   - VAD / diarize  │
   └──────┬─────────────┘
          ▼
   ┌────────────────────┐         ┌──────────────────┐
   │   Multi-STT fan-   │ ──────▶ │   LLM router     │
   │   out + consensus  │         │   - non-thinking │
   │                    │         │   - thinking     │
   └────────────────────┘         │   - audio-aware  │
                                  └────────┬─────────┘
                                           ▼
                                  ┌──────────────────┐
                                  │      TTS         │
                                  └────────┬─────────┘
                                           ▼
                                  ┌──────────────────┐
                                  │  Audio egress    │
                                  └────────┬─────────┘
                                           ▼
                                      Phone carrier
```

A per-call trace records which STT transcripts were considered, which LLM handled which segment, when the thinking model was invoked, and which small-model signals triggered a turn decision. The trace is the debug surface the author implies when he writes that a single bad STT is unrecoverable in a 3-step pipeline.

## Milestones

- **M1 — Phone audio on WebRTC.** Carrier ingest, audio pipeline (resample, VAD, diarize), egress back to the call, with round-trip latency inside the non-thinking budget.
- **M2 — Multi-STT and consensus.** At least two transcription models in parallel, with a consensus layer that lets the LLM route around the worse transcript on hard audio.
- **M3 — LLM router with think/non-think.** A single call can route a segment to a non-thinking model for fast acknowledgement and to a thinking model for the actual answer; the router publishes the decision in the per-call trace.
- **M4 — Tier surface.** Spark, Bolt, and Storm exposed as per-minute products at the stated prices; the Storm+Int add-on implemented as the +3c/min "extra intelligence" switch.
- **M5 — Public benchmark harness.** Reproducible Big Bench Audio run that lands near 99.4% on Storm+Int and is linked from the marketing page.
- **M6 — Self-serve credits.** Sign-up, credit purchase, run a test call, read the trace — without emailing the author.

## Risks

- **Stitch fragility.** The stack is explicitly interim; a phone-capable full-duplex model from OpenAI or another lab would invalidate the architecture. Mitigation: keep the LLM router abstract so the substitution is mechanical, not a rewrite.
- **Latency regression.** Adding the thinking model and the small-models layer can blow the latency budget; mitigation is a per-segment budget enforced in the router and surfaced in the trace.
- **Benchmark drift.** 99.4% on Big Bench Audio is the headline; if the public harness reproduces lower, trust collapses. Mitigation: pin the harness version and run it on every release.
- **Provider outage.** Any STT, LLM, or TTS provider going down shifts a tier's behaviour. Mitigation: per-tier fallback policy in the router, exposed in the trace so failures are visible.
- **Margin on Spark.** Spark at 2c/min is positioned as the cheapest on the market; sustained B2B load at that price leaves little margin for the multi-STT + small-models stack. Open question: where the floor actually sits.
