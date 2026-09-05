---
id: "4177"
slug: slotstream-run-qwen38-flash-next-4-bit-on-a-low-memory-
title: "Slotstream, run Qwen3.8-Flash-Next 4-bit on a low-memory Mac"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49510441"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---

# Slotstream, run Qwen3.8-Flash-Next 4-bit on a low-memory Mac

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

Slotstream lets a 16GB Mac run Qwen3.8-Flash-Next 4-bit (a 125B model that would normally need 100GB+ RAM) by combining expert-offloading with SSD-streaming, with an auto-mode that picks the right speed/memory trade-off for your machine.

**One-liner:** Run Qwen3.8-Flash-Next 4-bit locally on a 16GB Mac.

## Target Users

Apple Silicon Mac owners who want a large local model without paying for GPU time. Adjacent: developers experimenting with local inference and tinkerers who prefer everything on-device.

## Jobs To Be Done

- When I want a large model locally, I want it to fit on my Mac so I do not need to rent GPUs.
- When the model is slow, I want auto-mode to pick the right trade-off so I do not have to tune.
- When a new release ships, I want an easy update so I stay current.

## Success Metrics

- Successful install and first-response time on a 16GB Mac.
- Tokens-per-second throughput at the default auto-mode setting.
- Memory headroom left for the rest of the system.
- Number of model versions supported beyond the initial 4-bit Qwen3.8-Flash-Next.

## Pricing & Monetization

Source does not state pricing or monetisation. Treat as a free developer tool unless the author publishes a model.

## Competitive Landscape

Other local-inference stacks (llama.cpp, Ollama, MLX-based runners) all run large models with offloading. Slotstream's differentiator is the focus on Qwen3.8-Flash-Next 4-bit specifically, the auto-mode default, and the macOS-native install.

## Risks & Open Questions

- SSD wear from constant streaming is a long-term risk; mitigation is to make SSD-vs-RAM trade-off visible to the user.
- Throughput depends on the Mac's SSD; mitigation is to ship honest benchmarks per machine class.
- Single-model focus risks obsolescence if Qwen3.8-Flash-Next falls out of favour; mitigation is to keep the runner generic enough to add more models.
