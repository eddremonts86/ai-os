---
id: "3796"
slug: moe-direct-moe-models-far-larger-than-your-ram-on-a-con
title: "Moe-Direct – MoE Models far larger than your RAM, on a consumer desktop"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49492409"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
tech: [MoE expert caching, SSD/RAM/VRAM tiering, on-demand expert loading, consumer inference engine, Windows test rig]
---
# Moe-Direct – MoE Models far larger than your RAM, on a consumer desktop

## Problem

The poster wanted to run large models on his own machine — 32GB RAM, an RTX 5080 and a Gen5 NVMe SSD — and found the practical ceiling was around 30B parameters. His insight: mixture-of-experts (MoE) models use only some experts per token rather than all of them, so the whole checkpoint does not need to reside in memory. Moe-Direct implements exactly that: instead of living entirely in RAM or VRAM, the model is spread across three tiers — SSD, RAM and VRAM — with only the necessary experts cached in RAM, making models "far larger than your RAM" usable on a consumer desktop. The poster reports his own decode results: Kimi K2.6 at 1.03 tok/s, and Qwen3.5-122B at 5.59–5.69 tok/s — about 2.3 times better than plain mmap for the same binary. He is explicit about maturity: the project is "far from the intended stage of practical use", has not had external usability review or testing, and currently only runs on Windows because Linux and macOS test environments do not exist yet. He is asking for feedback and testers.

## Objective

Turn the expert-tiering idea into a usable consumer inference path: load MoE checkpoints far larger than RAM by caching only the experts a token needs, and validate it with external testers. The MVP is the current Windows build made reproducible — measurements, setup steps and failure modes documented — with Linux/macOS test environments as the named next step.

## Target Users

- Local-model enthusiasts on consumer hardware (32GB-class RAM, one consumer GPU, NVMe) who want to run 100B+ MoE models.
- Tinkerers willing to accept early-stage software and report decode speeds and failures — the audience the poster explicitly asks for.
- Developers of local-inference tooling evaluating whether expert-tiering beats mmap-based offloading.

## MVP Scope

- Three-tier model placement: SSD, RAM and VRAM, with on-demand expert caching in RAM.
- Decode on the poster's reference rig, with reproducible numbers for Kimi K2.6 (1.03 tok/s) and Qwen3.5-122B (5.59–5.69 tok/s).
- A Windows build testers can install, with the known limitations stated.
- Baseline comparison against plain mmap for the same binary (the 2.3x claim).

## Constraints

- Honesty about stage: the poster says the project is early and far from practical use; the MVP is a testable prototype, not a product.
- Windows-only for now: Linux and macOS test environments are explicitly missing, not deliberately excluded.
- Performance claims must be reported as the poster's own environment numbers, not generalized benchmarks.
- Consumer-hardware target: the design premise is SSD/RAM/VRAM tiering on a single desktop, not datacenter-scale serving.

## Design Direction

See `DESIGN.md` for this project's design tokens.
