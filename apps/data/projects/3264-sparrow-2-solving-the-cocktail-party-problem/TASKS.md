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

## Phase 0: Scaffold

- [x] Capture problem from HackerNews + write SPEC.md skeleton
- [ ] Define DESIGN.md (scoreboard + docs + WebRTC demo)
- [ ] Pin Python 3.12 + PyTorch + ONNX Runtime versions in the inference service
- [ ] Pick the gRPC schema for the streaming turn-state contract (frame in → state out + confidence)
- [ ] Set up the held-out multi-speaker eval set and the metric definitions
- [ ] Wire the eval harness to publish results into a public scoreboard

## Phase 1: Core

- [ ] Train Sparrow-2 on the multi-speaker conversational corpus (breath, backchannels, ambient cues included)
- [ ] Export the trained model to ONNX; verify parity against PyTorch on a fixed validation set
- [ ] Implement the streaming gRPC service: framing, batching, and backpressure for live audio
- [ ] Emit turn-state events with per-event timestamps and confidence; expose a `verbose` field for debug consumers
- [ ] Canary on internal Tavus replica traffic behind a feature flag; compare to Sparrow-1 on the same scenes
- [ ] Run the held-out eval against Sparrow-1 and at least two named baselines; freeze the scoreboard row
- [ ] WebRTC demo page: capture from the user's mic, stream to the API, render turn states live
- [ ] Write the model card (training data summary, intended use, out-of-scope audio types, eval caveats)
- [ ] Integration guide for one client SDK (the Tavus replica SDK), with audio framing requirements called out

## Phase 2: Deploy

- [ ] Public scoreboard live with the locked eval set pinned; results reproducible from raw audio + model hash
- [ ] Streaming inference API GA behind a documented tier; rate limits and SLA published
- [ ] Notarize / sign the WebRTC demo origin; verify HTTPS end-to-end before opening to the public
- [ ] Post the launch thread on HN / X with the eval numbers and a link to the scoreboard
- [ ] Post-mortem at week 12: measure (a) replication by an independent group, (b) latency in production, (c) backchannel accuracy in the wild
