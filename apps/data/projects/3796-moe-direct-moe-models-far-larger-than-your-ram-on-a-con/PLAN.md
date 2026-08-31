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

## Tech Stack

Chosen for the core insight — expert-level sparsity as the basis for memory tiering; the post describes the approach, not the code.

- **MoE expert caching:** only the experts a token needs are held in RAM; the rest stay on SSD until routed.
- **SSD/RAM/VRAM tiering:** the checkpoint is spread across the three tiers instead of residing entirely in memory.
- **On-demand expert loading:** routing decisions trigger expert swaps, making decode possible with far less than the full model in RAM.
- **Consumer inference engine:** a decode loop aimed at single-machine, single-GPU setups like the poster's rig.
- **Windows test rig:** the only currently supported environment (32GB RAM, RTX 5080, Gen5 NVMe on the poster's machine).

## Architecture

- **Storage tier (SSD, Gen5 NVMe):** the full checkpoint lives here as the slowest, largest tier.
- **Memory tier (RAM):** a cache holds the experts currently in use; eviction is driven by routing.
- **Compute tier (VRAM):** active expert computation on the GPU.
- **Decode loop:** per token, the router selects experts; misses are loaded from SSD into RAM, with the mmap baseline as the comparison point.

## Milestones

1. **M0 — Reproducible Windows build.** Setup and run steps documented; the poster's two model results are reproducible on the reference rig.
2. **M1 — Baseline honesty.** The ~2.3x-over-mmap comparison is measured with the same binary and reported per model.
3. **M2 — External testers.** At least one external user runs a decode and reports speed and failures.
4. **M3 — Platform expansion.** Linux and macOS test environments are created — the poster names them as missing, not as future ideas.

## Risks

- **Cache thrash:** worst-case routing patterns could bounce experts between SSD and RAM, destroying the speedup the design depends on.
- **Single-machine evidence:** all numbers come from one rig; other hardware may not reproduce them.
- **Windows-only isolation:** most local-inference users are on Linux/macOS; the project cannot get feedback from them yet.
- **Early-stage gaps:** the author lists "many problems that need to be addressed" without naming them — the roadmap is unknown.
- **No external validation:** usability and testing are explicitly unconducted; bugs that block first-time users are likely.
