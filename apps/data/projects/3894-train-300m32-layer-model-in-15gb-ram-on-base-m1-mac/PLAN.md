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

## Tech Stack

- **Rust:** the single implementation language, built with cargo.
- **RWKV-8 Heron:** the model architecture, with 1-bit ROSA activations.
- **Metal compute shaders:** the GPU-resident LN, QKV, CMix and head.
- **CPU-side ROSA SAM:** the logged ~604MB per-step working set.
- **BinaryConnect-style token-sum STE and clipped SGD:** the training recipe at lr 0.005.
- **safetensors:** checkpoint storage and loading.

## Architecture

- The token stream is compacted to u16 before training (156 MiB in the logged run).
- Compute is split: layer norms, QKV, CMix and head on the Metal GPU; ROSA SAM on the CPU.
- Clipped SGD with StopGradBits: QKV frozen, window-mean CE on FP16.
- A checkpoint is emitted every 500 steps to safetensors.
- A generate path loads a checkpoint and decodes with temperature and top-p sampling.

## Milestones

1. **M0 — Reproducible train run:** the posted command and config produce the logged step shapes and RSS.
2. **M1 — Generate path hardened:** checkpoint loading, sampling, documented output quality.
3. **M2 — External testing:** recruited testers run on their own hardware and report numbers and failures.
4. **M3 — The named gaps:** a first multi-stage pretraining pipeline step, and triage of the suspected training bugs.

## Risks

- Bandwidth-bound: 68GB/s makes every step cost about 28s; nothing in software removes that wall.
- The CPU/GPU split is delicate and likely the first thing to break on other hardware.
- Bug surface: the author flags possible training bugs; finding them may invalidate the headline numbers.
- Solo-maintainer risk: the project advances when the author's laptop is free.
