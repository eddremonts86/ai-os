---
id: "4206"
slug: our-glm-53-flash-switchless-recipe-is-now-out-for-4x-dg
title: "Our GLM-5.3 Flash Switchless recipe is now out for 4x DGX Sparks"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49508834"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Our GLM-5.3 Flash Switchless recipe is now out for 4x DGX Sparks

## Value Proposition

A reproducible, MIT-licensed recipe to serve GLM-5.3-Flash (NVFP4) at TP4 across four DGX Sparks on a switchless RoCE ring, with patched NCCL and the DFlash2 drafter — one OpenAI-compatible endpoint, no ToR switch, no supply-chain wait.

## Target Users

- Small AI teams of two engineers running daily coding-agent traffic
- Open-source maintainers replicating the recipe on their own DGX Sparks
- ML infrastructure engineers evaluating switchless-ring TP4 patterns
- Researchers studying NCCL behaviour without a switch

## Jobs To Be Done

- When I want to own my inference hardware, I want a recipe that ships on hardware I can buy today without waiting on a switch
- When the ring is up, I want one OpenAI-compatible endpoint on the head node so my existing OpenAI clients work
- When I tune the deployment, I want measured numbers (TTFT, tok/s, KV pool) instead of marketing claims

## Success Metrics

- 476 requests served and 17.5M tokens through the model in the reported run
- TTFT ~1–2 s on warm prefix-cache, 122K-token single prefill served
- Two concurrent users each retain ~73% of solo speed (the 27% cost is acceptable)

## Pricing & Monetization

MIT licence, free. Inference is self-hosted on the user's own hardware; no per-token charge.

## Competitive Landscape

- Closed LLM APIs (OpenAI, Anthropic) — pay per token, no own hardware
- RunPod, Lambda Labs — managed GPU rentals, no TP4 bring-your-own-fabric
- DGX Spark community recipes — none with a switchless-ring + DFlash2 + patched NCCL combo
- Sparkring / SIRCL — alternative ring fabric; the author explicitly states "this is not Sparkring under a different name"

## Risks & Open Questions

- Patched NCCL is a fork of NCCL 2.30.7; must track upstream changes
- DFlash2 drafter and weights come from upstream providers with their own licences
- DGX Spark supply chain itself is constrained — recipe is moot without the nodes
- Switchless ring does not scale past four nodes without re-cabling