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

## Problem

Most deployed voice agents run a three-step pipeline: a transcription model turns user speech into text, an LLM drafts a response in text, and a TTS model speaks the response. The author (Alex, ThunderPhone) argues this pipeline is the reason voice agents feel broken, and names three concrete causes.

- Latency forces the use of non-thinking LLMs, which make mistakes that derail conversations.
- A single transcription model loses information from the audio (tone, prosody, partial overlap) and the LLM cannot recover from a bad transcription.
- Conversation handling is hard: filtering background voices, distinguishing a "uh, wait" that should interrupt from an "uh-huh" that should not, dealing with loud environments and speakerphone.

The "bitter lesson-pilled" fix is a full-duplex model that receives and emits audio continuously while calling a smarter model behind the scenes. OpenAI's GPT-Live release is described as the first real progress on that architecture but is not yet ready for phone calls, so ThunderPhone has stitched together an interim stack: multiple transcription models running in parallel, audio piped directly into LLMs, a combo of thinking and non-thinking models in one conversation, and a swarm of small specialised models for noise and turn-taking. The stack ships in three price tiers — Spark at 2c/min, Bolt at 5c/min, Storm at 9c/min (+3c/min for extra intelligence) — with Storm+Int setting a 99.4% accuracy on Big Bench Audio.

## Objective

Make phone-based voice agents behave less like a fragile demo and more like a colleague: faster, less brittle on noisy audio, and willing to pause and think mid-call when the user asks something hard, without losing the conversational floor. The v1 product must ship the three-tier stack as described, expose the multi-STT and think/non-think combination through the same phone-call surface, and beat the stated 3-step pipeline on both robustness and benchmark accuracy.

## Target Users

- B2B customers building voice agents on phone numbers — the post's primary audience — who need transactional calls to work on the first try (Spark), fast conversational calls (Bolt), and complex multi-turn calls with high accuracy (Storm).
- Independent developers and small teams who want to add a voice surface to an existing app without running their own audio ML stack.
- Personal users who want to delegate phone tasks such as restaurant reservations or pharmacy calls, which the author explicitly supports.

## MVP Scope

- Phone-call audio pipeline: WebRTC ingest from the carrier, multi-STT fan-out, audio passthrough to LLMs, LLM router mixing thinking and non-thinking models, TTS render back to the call.
- Three tiered product surfaces — Spark, Bolt, Storm — each priced per minute as stated, with the +3c/min "extra intelligence" add-on for Storm.
- Turn-taking and noise model: the swarm of small models the author references, exposed as a single configurable layer for noisy environments and speakerphone.
- Per-call observability: which STT transcripts were used, which model handled which segment, where the system paused to think, so a developer can audit a failed call.
- Self-serve credits path: the author offers credits on request (alex@thunderphone.com) for now; the product needs a minimal intake flow before scaling.
- Honest comparison page showing the three-tier accuracy / latency / cost trade-off, anchored to the cited 99.4% Big Bench Audio result.

Out of scope for v1: replacing the carrier network, owning the LLM weights (the stack fans out, it does not train), and any consumer-facing call-recording product.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Phone-call audio is the dominant case; browser-only or app-only surfaces are secondary.
- Latency budget is non-thinking-LLM-tight. The pipeline must keep the conversational floor (no awkward pauses, no missed interrupts) even when the thinking model is engaged.
- Per-minute cost is the user's mental model: Spark, Bolt, Storm at the stated prices, plus the Storm+Int add-on. No surprise charges.
- Benchmark claims (99.4% Big Bench Audio on Storm+Int) must remain reproducible; the evaluation harness is part of the product surface.
- The system must avoid the single-STT failure mode even when one transcription model degrades — multi-STT is the explicit mitigation, not an optimisation.
