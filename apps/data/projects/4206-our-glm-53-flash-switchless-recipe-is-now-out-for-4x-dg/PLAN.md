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

## Tech Stack

- Four NVIDIA DGX Spark nodes (GB10, `sm_121`) cabled in a closed RoCE ring
- 0.4–0.5 m Amphenol 100G QSFP28 DACs (dual-rail per node)
- vLLM container image `radixark/vllm-glm53-flash:dflash2` with TP4 serve arguments
- Patched NCCL 2.30.7 with the `skip-tree-connect` change, `LD_PRELOAD`-ed into every container
- DFlash2 speculative drafter (`incoai`)
- GLM-5.3-Flash (NVFP4) weights from `LibertAIDAI/GLM-5.3-Flash-NVFP4`
- Bash scripts: `fabric-setup.sh`, `rank-launcher.sh`, `gate.sh`
- Docs: `recipe.md`, `fabric.md`, `switches.md`, `long-context.md`, `gotchas.md`
- MIT licence; Coolify / Docker not required

## Architecture

Four nodes form a closed ring. Pair edges join two nodes of a pair; cross edges join pairs. The non-adjacent hop (A→D) is relayed through a neighbour (B or C), with the routes and `DOCKER-USER` forwarding applied by `fabric-setup.sh`. NCCL uses both RoCE rails for collectives; only the bootstrap rides the 1 GbE management LAN. Workers launch headless in rank order 3→2→1, then the head (rank 0) opens the API on `:8000`. The serve runs `--max-num-seqs 6`, KV pool 786,432 tokens (3.0× the served window), KV bf16, DFlash `num_speculative_tokens: 7`, parsers, `max-model-len 262144`. The head exposes a standard OpenAI-compatible API; the model id is `glm-5.3-flash`.

## Milestones

1. Stage weights, drafter, patched NCCL, and image on every node (per `docs/recipe.md` §1)
2. Edit the site variables at the top of `fabric-setup.sh`, `rank-launcher.sh`, `gate.sh`
3. Apply the ring fabric every boot and after docker churn
4. Launch workers in rank order 3→2→1 headless
5. Launch head (rank 0) and watch warmup
6. Run `gate.sh` and do not announce serving until the gate passes
7. Point an OpenAI-compatible client at `http://<head-node>:8000/v1`

## Risks

- Patched NCCL must track upstream; a regression will silently mis-shape collectives
- DGX Spark supply chain may starve the recipe of hardware
- Ring fabric scripts edit variables at the top; a mistake here will route traffic to the wrong neighbour
- DFlash2 drafter upgrade path is not specified in the source