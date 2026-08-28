---
id: "3264"
slug: sparrow-2-solving-the-cocktail-party-problem
title: Sparrow-2 – Solving the cocktail party problem
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49468613"
category: show-hn
date: "2026-08-27"
tags: [Show HN, Conversational AI, Turn Taking, Audio]
tech: [Python, PyTorch, ONNX Runtime, WebRTC, gRPC]
---
# Sparrow-2 – Solving the cocktail party problem

## Problem

Brian, a conversational-models engineer at Tavus, shipped Sparrow-1 earlier this year as a SoTA turn-taking model. Listening to real conversations and stress-testing competing turn-taking systems exposed a pattern: Sparrow-1 and most current models rely on noise cancellation to isolate a single speaker, then predict turn-end from a narrow band of prosodic and phonetic cues.

That pipeline throws away signal. Breath, sighs, micro-interruptions, affirmations, and ambient sounds are exactly the cues humans use to hold, bid for, or release the conversational floor. Existing turn-taking work assumes anything non-transcribable is noise; Tavus argues that assumption is wrong, and that cancelling the "noise" cancels the flow.

The cocktail party problem is the canonical frame: separate one voice from many while hearing what every voice is doing. Sparrow-2 is their attempt at it — train on all the audio, let the model weight what matters per moment, and stream turn decisions continuously instead of after-the-fact.

## Objective

Build and ship Sparrow-2 as Tavus's production turn-taking model for conversational AI use cases (their own replicas and any external service that integrates via API). The model must accept a continuous multi-speaker audio stream, output turn state (hold / yield / take) with low end-to-end latency, and stay robust in real conversational scenes — backchannels, overlapping speech, breath, and ambient sound — without a separate noise-cancellation stage in front of it.

## Target Users

- Conversational AI engineers integrating turn-taking into voice agents, IVR replacements, or live translation pipelines.
- Tavus internal product teams building conversational replicas that need to feel natural in open-mic scenarios.
- Researchers benchmarking end-of-turn detection against the 2026 SoTA on naturalistic multi-speaker audio.

## MVP Scope

- Streaming inference API for Sparrow-2 that accepts raw multi-speaker audio and emits turn-state events with sub-300ms median latency.
- A reference client integration that wires Sparrow-2 into a Tavus conversational replica on a single demo conversation.
- An evaluation harness with a held-out multi-speaker conversational test set and a public scoreboard comparing Sparrow-2 to at least two prior baselines (including Sparrow-1) on turn-end accuracy and micro-interruption handling.
- Documentation covering model card (training data summary, intended use, out-of-scope audio types) and integration guide for one client SDK.
- Out of scope: noise-cancellation front-end as a recommended preprocessor, support for languages beyond English, on-device deployment, and a self-serve pricing tier.

## Design Direction

Design direction for the MVP at `https://news.ycombinator.com/item?id=49468613` follows the constraints in `3264-.../SPEC.md` and the chosen stack (Python, PyTorch, ONNX Runtime, WebRTC, gRPC). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the technical reader / engineer audience.

For show-hn category, the defaults lean toward a documentation-first surface: code blocks are first-class, embedded audio is previewable inline, and no third-party tracking is added.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for the active turn signal, one muted accent for low-confidence frames. No gradients in v1.

**Type** — one display family for model metrics, one text family for the prose, one mono for code/audio references. Type scale is small (4 steps) so scoreboards and stream traces stay compact.

**Density** — tight, table-driven for the evaluation scoreboard; generous spacing for the integration guide.

**Motion** — minimal: live trace updates on the demo client only, no auto-playing audio on the docs page.

## Constraints

- Multi-speaker audio processing is the central technical risk; training data coverage of backchannels, breath, and ambient cues must be validated before the public eval scoreboard goes live.
- Inference must run within Tavus's existing serving budget; if GPU latency exceeds the budget on commodity hardware, the public launch slips rather than the budget gets re-baselined.
- External integration must not require customers to send raw audio to a third-party endpoint they did not consent to; privacy stance must be explicit in the docs on day one.
- English-only at launch; multilingual support requires a separate, separately-evaluated release.
