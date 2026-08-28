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

> Auto-generated brief rewritten. Source-grounded.

## Value Proposition

ThunderPhone v2 attacks the three-step voice pipeline (STT → LLM → TTS) at the failure modes its author has named: thin information from a single STT, mistakes that fast non-thinking LLMs cannot recover from, and broken turn-taking on noisy calls. The interim full-duplex-style stack combines multiple transcription models run in parallel, direct audio piping into LLMs, a thinking/non-thinking LLM mix, and a swarm of small specialised models for noise and conversation handling. The result is shipped as three per-minute tiers: Spark at 2c/min for simple transactional calls, Bolt at 5c/min for the fastest conversational path, and Storm at 9c/min with a +3c/min "extra intelligence" add-on that hits 99.4% on Big Bench Audio.

The product exists because the honest end-state (a real full-duplex model on phone calls) is not here yet, and the three-step pipeline is not good enough. The post names OpenAI's GPT-Live release as the first credible path to the end-state and is explicit that the stack in v2 is an interim stitch.

**One-liner:** A phone-first voice AI stack that uses multiple STTs, audio-aware LLMs, and a thinking/non-thinking mix to beat the standard 3-step pipeline on robustness and benchmark accuracy.

## Target Users

- B2B voice-agent builders who need transactional calls to complete on the first try and have been blocked by bad transcription or non-thinking-LLM mistakes; this is the author's stated primary audience.
- App developers who want to add a voice surface without running their own audio ML stack; the three tiers map to their latency / accuracy / cost triangle.
- Personal users delegating phone tasks such as restaurant reservations and pharmacy calls, which the author explicitly supports.
- Enterprise buyers who will evaluate on the Big Bench Audio claim (99.4% on Storm+Int) before signing a contract; the benchmark must be reproducible.

## Jobs To Be Done

- When a call goes through a noisy environment or speakerphone, keep the conversational floor: distinguish "uh, wait" from "uh-huh", suppress background voices, do not lose the user's turn.
- When the user asks something hard, let the agent pause and reason without dropping the call; the thinking/non-thinking mix is the explicit mechanism.
- When a caller mumbles a name, address, or number, recover through multi-STT consensus instead of accepting one transcription model's guess.
- When a developer is debugging a failed call, surface which STT transcripts were considered, which model handled which segment, and where the system paused to think.
- When a buyer is comparing tiers, see the accuracy / latency / cost trade-off side by side, anchored to the Big Bench Audio result the author cites.

## Success Metrics

- Per-tier accuracy: Spark passes the simple-transactional baseline, Storm+Int holds 99.4% on Big Bench Audio, with the number reproducible from the public harness.
- Latency budget: Bolt is the fastest tier offered; turn-taking latency stays inside the non-thinking-LLM budget even when the thinking model is engaged mid-call.
- Mistake rate on hard inputs: data entry, multilingual calls, and noisy environments show fewer derailing mistakes than a comparable 3-step baseline (target: substantial drop on the author's stated examples).
- Adoption: paid minutes per tier (Spark / Bolt / Storm / Storm+Int), tracked separately because each tier proves a different thesis about the stack.
- Self-serve funnel: developers can sign up, get credits, run a test call, and read a per-call trace without emailing the author.

## Competitive Landscape

The post names OpenAI's GPT-Live as the leading edge of full-duplex voice and states it is not yet ready for phone calls. It does not name other vendors or claim specific competitor benchmarks.

- Compared to OpenAI's GPT-Live, ThunderPhone v2 ships on phone calls today; the trade-off is that it is a stitched stack, not a single full-duplex model.
- Compared to standard 3-step pipelines from other voice-AI vendors, ThunderPhone's pitch is the multi-STT, audio-aware LLM, and thinking/non-thinking mix as the differentiator; price tiers are positioned against the implied per-minute cost of those stacks.

## Risks & Open Questions

- Stitch fragility: the stack is explicitly interim until full-duplex models are phone-ready; if OpenAI (or another lab) ships a phone-capable full-duplex model, the stitching becomes a liability rather than an asset.
- Benchmark reproducibility: the 99.4% Big Bench Audio claim is the headline; if the public harness cannot reproduce it, the marketing collapses.
- Cost economics at the bottom tier: Spark at 2c/min is described as the cheapest on the market; margin under sustained B2B load is the open question.
- Carrier and audio quality variance: real phone networks add jitter, packet loss, and codec artefacts that benchmarks do not capture; per-call trace data has to be good enough to debug these.
- Model-provider dependency: the stack fans out to multiple LLMs and STTs; an outage or price change at any one provider can shift the tier behaviour the author is selling.

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49466204) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
