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

## Tech Stack

- **Model training + serving:** Python 3.12 + PyTorch for training and GPU inference; ONNX Runtime for any CPU/SKU where PyTorch serving is too heavy.
- **Audio transport:** WebRTC for browser-side capture (reused from the Tavus replica client) and gRPC streaming for low-overhead model I/O.
- **Eval pipeline:** Python harness + a held-out multi-speaker conversational set, evaluated against Sparrow-1 and at least two prior baselines.
- **Storage:** object storage for raw and processed audio; a lightweight Postgres for run metadata, model versions, and eval results.
- **Docs / demo surface:** static docs site with an embedded WebRTC demo so visitors can drive the model from their own microphone.

## Architecture

Audio is captured on the client (WebRTC), framed, and streamed to a Sparrow-2 inference service over gRPC. The service runs a PyTorch model on GPU; ONNX Runtime covers any CPU SKU. The model emits a turn-state stream (hold / yield / take) plus a confidence; the downstream consumer — currently a Tavus replica or external voice agent — decides what to do with each event.

An evaluation harness reads the same inference contract against a fixed audio set and writes scores to the public scoreboard. The eval set and the model version under test are pinned per run so results are reproducible.

## Milestones

1. **M0 — Spec + eval design.** Lock the eval set, the metric definitions, and the two prior baselines Sparrow-2 will be compared against.
2. **M1 — Model in canary.** Trained Sparrow-2 runs behind a flag on internal Tavus replica traffic; not exposed externally.
3. **M2 — Public eval scoreboard.** Run the held-out set against Sparrow-1 and the named baselines; publish results.
4. **M3 — External API beta.** Streaming inference API available to a small set of design partners under the docs SLA.
5. **M4 — General external availability.** API on the documented tier, model card and integration guide stable, demo page live.

## Risks

- **Eval-set quality** — if the held-out multi-speaker set is not naturalistic enough, the scoreboard headline number will not generalize; independent replication may diverge from the internal number.
- **Inference latency / cost** — running an "all the audio" model at production scale may exceed the serving budget; mitigation is export to ONNX and right-sizing per-region GPU pools.
- **Reputational risk if the model regresses on Sparrow-1 wins** — Sparrow-2 is being introduced specifically because Sparrow-1 fails in certain scenes; the eval must measure Sparrow-1's failure modes explicitly so the launch does not oversell.
- **Training-data consent / provenance** — if Sparrow-2 was trained on real customer conversation audio, the consent story for that data has to be public and credible before external launch.
