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

## Tech Stack

- React + TypeScript single-page app for the registry, playground, and dashboards
- TanStack Start as the Node.js API for search, deploy, and account flows
- SQLite + Drizzle ORM for adapter metadata, deployments, and billing records
- Coolify + Docker to self-host the registry and dashboards
- vLLM with multi-adapter serving on managed GPU pools (the actual inference plane)
- Unsloth-optimized kernels for fine-tuning
- OpenAI-compatible HTTP router at the edge for transparent adapter swaps
- Webhooks for creator payout and per-token billing

## Architecture

The registry is a relational store over adapters and base models, with a search index over titles and descriptions. The playground sends prompts to the router; the router mounts the chosen adapter in warm VRAM, returns a side-by-side comparison. The deploy pipeline allocates a slot in a managed GPU pool, configures the OpenAI-compatible endpoint, and registers the endpoint in the dashboard. Fine-tuning runs on Unsloth-optimized kernels with the LoRA hyperparameters set in the studio UI; finished adapters are published to the registry with the creator's per-token price.

## Milestones

1. Adapter registry UI with search, filters, and trending facets
2. Side-by-side playground against the base model
3. Serverless endpoint deploy from a registered adapter
4. Live dashboard with throughput, swap latency, and VRAM
5. LoRA fine-tuning studio with rank, alpha, target modules, and scheduler
6. Creator payout flow with 70/30 split and on-chain accounting
7. Waitlist and early-access gating

## Risks

- GPU pool sizing must track demand; over-provisioning burns margin
- Adapter quality is a marketplace liability; need a review process
- OpenAI-compatible router must stay current with deprecations
- Creators may self-host once they have a paying audience