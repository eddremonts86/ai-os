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

## Problem

Multi-node tensor parallelism normally needs a 100/400 GbE ToR switch on the fabric, and in 2026 the supply chain makes switches the longest lead-time on a four-node build. The poster's repo (alexellis/glm-5.3-flash-4x-dgx-spark-switchless) shows how to cable four NVIDIA DGX Spark (GB10 / `sm_121`) nodes into a switchless closed RoCE ring, each node wired straight to two neighbours, with non-adjacent hops relayed through a neighbour (`scripts/fabric-setup.sh` handles the routes and `DOCKER-USER` forwarding). The ring fabric uses dual-rail 0.4–0.5 m Amphenol 100G QSFP28 DACs, and the collectives run on patched NCCL 2.30.7 with a `skip-tree-connect` change `LD_PRELOAD`-ed into every container. The recipe serves GLM-5.3-Flash (NVFP4, 320B-A18B) at TP4 with the DFlash2 speculative drafter; one OpenAI-compatible endpoint on the head node's port 8000, 262K context window, ~45 tok/s on real agentic traffic. Measured numbers (TP4 only): 476 requests served, ~17.5M tokens (17.2M prompt, 297K completion), ~1–2 s TTFT on warm prefix-cache, deepest single prompt 122K tokens, two humans plus their coding agents daily, `--max-num-seqs 6`, KV pool 786,432 tokens.

## Objective

Publish a reproducible, contract-style recipe for serving GLM-5.3-Flash (NVFP4) at TP4 across four DGX Sparks on a switchless RoCE ring, so a small team can own its inference hardware without buying a switch and without the supply-chain lead time.

## Target Users

- Small AI teams running two engineers plus their coding agents daily who want to own the inference box
- Open-source maintainers replicating the recipe on their own four DGX Sparks
- ML infrastructure engineers evaluating TP4 deployment patterns without a ToR switch
- Anyone reading the repo to understand switchless-ring NCCL behaviour

## MVP Scope

- Fabric setup scripts (`scripts/fabric-setup.sh`) with the addressing template and MTU
- Rank launcher (`scripts/rank-launcher.sh`) for one rank in a container
- Correctness gate (`scripts/gate.sh`) — needle, tool-call, warm decode
- Head-node OpenAI-compatible endpoint on `:8000`, model id `glm-5.3-flash`
- Documentation in `docs/recipe.md`, `docs/fabric.md`, `docs/switches.md`, `docs/long-context.md`, `docs/gotchas.md`
- MIT licence; container image and weights are fixed, only the five site values are user-supplied

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Four DGX Spark nodes required (no fewer; no more without re-cabling)
- Switchless ring only — no ToR switch on the data path
- Container image and weights are fixed by the recipe; users only supply their node IPs, fabric scheme, interface names, hostnames, and Hugging Face token
- MIT-licensed, but the container image and weights come from upstream providers whose terms still apply