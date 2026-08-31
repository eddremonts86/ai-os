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

## Value Proposition

Run MoE models far larger than your RAM on a machine you already own. Moe-Direct exploits what makes MoE models different — only some experts fire per token — by tiering the checkpoint across SSD, RAM and VRAM and caching only the experts in use, so a 122B model becomes runnable on a 32GB desktop. The poster's own numbers set expectations honestly: Qwen3.5-122B decodes at 5.59–5.69 tok/s on his rig, about 2.3x faster than plain mmap; Kimi K2.6 at 1.03 tok/s. It is early-stage, Windows-only for now, and looking for testers rather than users.

**One-liner:** MoE models far larger than your RAM, decoded on a consumer desktop via SSD/RAM/VRAM expert tiering.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Local-inference enthusiasts | 100B+ MoE models on a 32GB-class machine instead of a 30B ceiling. |
| Early-stage testers | The poster explicitly asks for usability feedback and testing participation. |
| Inference-tooling developers | A working counterexample to the assumption that checkpoints must fit in memory. |

The post describes no commercial market; the audience is hobbyists and researchers.

## Jobs To Be Done

1. **Functional job** — Load a MoE checkpoint far larger than RAM and decode tokens.
2. **Functional job** — Cache only the experts a token needs, tiered across SSD/RAM/VRAM.
3. **Functional job** — Beat the naive baseline: the poster reports ~2.3x over plain mmap on Qwen3.5-122B.
4. **Emotional job** — Reclaim the feeling of possibility: bigger models, the hardware you already have.

## Success Metrics

- **Models runnable:** a 122B-class MoE decodes on the 32GB/RAM reference rig — the poster's Qwen3.5-122B result.
- **Decode speed:** reported per model and environment (1.03 tok/s Kimi K2.6; 5.59–5.69 tok/s Qwen3.5-122B), vs. the mmap baseline.
- **External reproduction:** at least one tester reproduces a result on their own hardware — the stated next validation step.
- **Platform coverage:** Linux and macOS test environments exist (currently absent; Windows only).

## Pricing & Monetization

None stated. The project is an early-stage research-style tool seeking testers. Monetization is out of scope for the MVP.

## Competitive Landscape

The post does not name competitors. The landscape is local-inference runtimes (llama.cpp-class tools) and quantized-model approaches, where the usual answer to "model bigger than RAM" is mmap-based offloading; the poster's own baseline is "plain mmap for the same binary", which Moe-Direct beats by ~2.3x on his rig. The differentiator is exploiting MoE sparsity specifically rather than treating the model as monolithic.

## Risks & Open Questions

- [ ] Early stage by the author's own admission: "far from the intended stage of practical use", no external usability review, many problems unaddressed.
- [ ] Windows-only today; Linux and macOS test environments do not exist yet, which excludes most of the local-inference community from trying it.
- [ ] Single-rig evidence: both speed claims come from one machine (32GB RAM, RTX 5080, Gen5 NVMe); nothing is known about other hardware.
- [ ] Expert-cache hit rates depend on the prompt; worst-case routing could thrash between SSD and RAM and collapse the speedup.
- [ ] No licensing, roadmap or maintenance story appears in the post.
