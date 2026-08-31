---
id: "3894"
slug: train-300m32-layer-model-in-15gb-ram-on-base-m1-mac
title: "Train 300M/32-Layer Model in 1.5GB RAM on Base M1 Mac"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49497451"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [Rust, RWKV-8 Heron, 1-bit ROSA activations, Metal compute shaders, BinaryConnect training, safetensors checkpoints]
---
# Train 300M/32-Layer Model in 1.5GB RAM on Base M1 Mac

## Problem

Ullis is the author's own small-model training project, posted as a follow-up to an earlier Show HN. Searching for an architecture light enough to train on a 2020 MacBook Pro M1 with 8GB RAM and 68GB/s memory bandwidth, he rejected KAN and Hyena as too resource-heavy and settled on RWKV-8 Heron with 1-bit ROSA activations. The headline result: a model with roughly 272 million parameters, 32 layers and a 2048-token context training inside a 1.5GB memory footprint. His logs show the run: a resident set around 1.63GB, about 28 seconds per step, roughly 73 tokens per second, with layer norms, QKV, CMix and head on the Metal GPU while the ROSA SAM stays on the CPU because it proved more efficient there. After 5500 steps on a Claude Opus distillation dataset — a multi-stage pretraining pipeline is not implemented yet — generation output is coherent but early: his 2+2 prompt produces confident nonsense. He could not keep his main work laptop running training around the clock, so the project stops at this modest result; he explicitly asks for testers, domain experts and any feedback. The code is at https://github.com/Vladislav-Kalinkin/ullis.

## Objective

Turn Ullis from a solo proof into a reproducible, tested tool: anyone on a low-RAM M1-class Mac should be able to run the documented training command and see the same order of results. The author names his own gaps — no multi-stage pretraining pipeline, possible training bugs, no external testing — and those become the roadmap.

## Target Users

- ML tinkerers on base-spec Apple Silicon laptops who cannot afford cloud GPU time.
- Researchers interested in RWKV, 1-bit activations and memory-bounded training.
- The testers and domain experts the author explicitly recruits for feedback.

## MVP Scope

- The train command reproducible from the posted config: data file, run dir, 20000 steps, lr 0.005, checkpoint every 500, 150 MiB BPE training budget.
- The generate command serving the posted safetensors checkpoint.
- The CPU ROSA SAM / GPU Metal split as logged, documented and rerunnable.
- A README that reproduces the posted logs as verification.

## Constraints

- All performance numbers are the author's own hardware and logs; they are evidence, not general benchmarks.
- The author flags that some training algorithms may contain bugs; the MVP treats his logs as the baseline to reproduce, not as validated truth.
- Training was stopped early because his work laptop cannot run 24/7; long-horizon results are explicitly out of scope for now.
- The project is a solo effort developed alongside an LLM assistant; external validation is the named next step.

## Design Direction

See `DESIGN.md` for this project's design tokens.
