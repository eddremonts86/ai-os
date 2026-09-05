---
id: "3894"
slug: train-300m32-layer-model-in-15gb-ram-on-base-m1-mac
title: Train 300M/32-Layer Model in 1.5GB RAM on Base M1 Mac
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49497451"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [Rust, RWKV-8 Heron, "1-bit ROSA activations", Metal compute shaders, BinaryConnect training, safetensors checkpoints]
---
# Train 300M/32-Layer Model in 1.5GB RAM on Base M1 Mac

## Value Proposition

A 300M-parameter-class model training inside 1.5GB of RAM on a base M1 Mac sounds impossible; Ullis's logs show it running. The value is the architecture choice — RWKV-8 Heron with 1-bit ROSA activations — plus an honest, reproducible accounting of what it costs: 28 seconds a step, 73 tokens a second, a 1.63GB resident set. The author is not selling; he is asking for testers, which is exactly the state an MVP should honor.

**One-liner:** Train a 272M-parameter, 32-layer model in a 1.5GB RAM footprint on a base M1 Mac.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Low-RAM Mac owners | They are excluded from most training stacks; Ullis runs where they are. |
| RWKV and 1-bit researchers | A concrete, logged data point for Heron and ROSA at small scale. |
| Recruited testers | The author explicitly asks them to reproduce and break the project. |
| ML hobbyists | A tiny, readable Rust codebase to learn from, versus opaque framework stacks. |

## Jobs To Be Done

1. Start a training run on an 8GB Apple Silicon machine and watch it survive within the memory budget.
2. Reproduce the posted logs as a sanity check before trusting anything else.
3. Generate from a saved checkpoint without losing the token-level detail in the logs.
4. Give the author feedback he can act on — the stated reason the post exists.

## Success Metrics

- RSS during training: the logged 1628 to 1643 MiB is the headline constraint to hold.
- Step latency and throughput on the reference M1: about 28 seconds per step and 73 tokens per second are the reproducibility targets.
- External reproductions: people who run the train command and report comparable numbers.
- Steps trained per run, now capped by laptop availability, as the author's own bottleneck.

## Pricing & Monetization

None stated. The project is open-source research-style tooling; no monetization appears in the post.

## Competitive Landscape

The capture names no commercial competitors, but it does name architectural rivals: the author tried KAN and Hyena and discarded them as resource-heavy before landing on RWKV-8 Heron with 1-bit ROSA activations. The competitive frame is memory-efficient LLM training on consumer hardware, where inference tooling dominates and training remains the hard, sparsely populated half.

## Risks & Open Questions

- [ ] The author himself suspects training bugs; the posted results may not survive external scrutiny.
- [ ] ROSA SAM is pinned to the CPU while the GPU does the rest — the split is a performance constraint, not a portable design.
- [ ] All evidence comes from one machine (8GB M1, 68GB/s); other hardware is untested.
- [ ] The 2+2 generation sample shows the model learns but is far from useful output at 5500 steps.
- [ ] The project stops when the author's laptop is needed for work; sustained training depends on other people's machines.
