---
id: "4200"
slug: a-dedicated-hub-to-find-test-and-serve-llm-adapters
title: "A dedicated hub to find, test, and serve LLM adapters"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49509163"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# A dedicated hub to find, test, and serve LLM adapters

## Problem

Foundational-model fine-tunes (LoRA adapters) live on Hugging Face, in Discord threads, and on individual creators' sites, with no single place to discover them, no consistent playground to test them side-by-side, and no one-click path to a serverless endpoint. The poster's site (aptai.dev) presents itself as a "centralized adapter registry for foundation models": discover production-ready fine-tunes, test them in the browser, and deploy them to serverless API endpoints in one click. The page shows 191 adapters already listed (Garnet Code on Llama-3-8B, Orchid Roleplay on Mistral-7B, Lucid Prose, Meridian Reasoner on Qwen-2-7B, Amber Dialogue, Emerald Classify on Phi-3-mini, Sapphire Instruct on Gemma-2B, Amethyst Story, Ruby Logic, Obsidian Chat, Citrus Summary, Cobalt Swap, Garnet Agent v2). The serving layer uses warm GPU pools with sub-millisecond adapter swaps (no container cold starts). The router is OpenAI-compatible, so OpenHands, AutoGen, CrewAI, and Aider connect with zero code rewrites. A 70/30 revenue share rewards creators, weights never leave managed endpoints, and creators set per-1M-token pricing.

## Objective

Be the canonical registry and serverless serving layer for production-ready LLM adapters, so creators can publish a fine-tune, developers can test it in a side-by-side playground, and both can route real traffic to a one-click OpenAI-compatible endpoint.

## Target Users

- LLM adapter creators who want a marketplace and a hosting layer with a revenue share
- Developers building AI features who want to A/B test fine-tunes against base models before paying for traffic
- Agent framework users (OpenHands, AutoGen, CrewAI, Aider) who need an OpenAI-compatible endpoint
- Indie hackers running lean stacks who want to avoid GPU provisioning

## MVP Scope

- Adapter registry with search, filters, trending, and base-model facets
- Side-by-side playground (adapter vs base model) in the browser
- One-click deploy to a serverless OpenAI-compatible endpoint
- Live adapter endpoints dashboard with throughput, swap latency, and VRAM
- LoRA fine-tuning studio with advanced controls (rank, alpha, target modules, scheduler)
- Creator revenue share with 70/30 split and on-chain token accounting
- Waitlist for early access; available November

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Adapters are served on managed endpoints; weights are never exposed for public download
- OpenAI-compatible router only; no proprietary protocol
- Creators set pricing; AptAI enforces the 70/30 split
- Waitlist gating; not generally available yet