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

## Phase 0: Scaffold

- [x] Read the Show HN post and extract the logged numbers and config
- [x] Write SPEC.md, PRODUCT.md, PLAN.md and TASKS.md
- [x] Clone the repository and verify the train command parses
- [x] Reproduce the posted command on the reference hardware as the baseline

## Phase 1: Core

- [ ] Reproduce the logged step shape: RSS around 1.6GB, about 28s per step, about 73 tok/s
- [ ] Verify the Metal/CPU split matches the logs (LN/QKV/CMix/head on GPU, ROSA SAM on CPU)
- [ ] Harden the generate path against the posted checkpoint
- [ ] Recruit testers from the Show HN thread for external reproduction

## Phase 2: Deploy

- [ ] Collect and triage external reports; isolate the suspected training bugs
- [ ] Begin the multi-stage pretraining pipeline the author says is missing
- [ ] Publish a results table per machine rather than single-rig claims
- [ ] Decide checkpoint and model naming for reproducibility
