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

## Value Proposition

Discover production-ready LLM adapters, test them side-by-side with their base model in a browser playground, and deploy them to a serverless OpenAI-compatible endpoint in one click — with a 70/30 revenue share for creators.

## Target Users

- LLM adapter creators looking for distribution and a hosting layer
- Developers comparing fine-tunes before committing traffic
- Agent-framework users (OpenHands, AutoGen, CrewAI, Aider)
- Indie hackers avoiding GPU provisioning

## Jobs To Be Done

- When I want to find a fine-tuned model, I want a searchable registry with filters by base model so I do not have to scroll Hugging Face
- When I want to know if an adapter is real, I want a side-by-side playground against its base model so I can verify before I route traffic
- When I am ready to ship, I want a one-click deploy to a serverless endpoint with no GPU setup
- When I publish an adapter, I want a 70% revenue share and per-token pricing I control

## Success Metrics

- 191 adapters registered at launch; target 1,000 within 90 days
- Median adapter swap latency under 1.5 ms
- 5% of registered adapters receive real traffic within the first quarter

## Pricing & Monetization

Creators set price per 1M tokens. AptAI keeps 30% of inference revenue. End users see the per-request cost; creators see their payout. Some endpoints (e.g. 0.85 ms TTFT for embeddings) indicate aggressive per-token pricing.

## Competitive Landscape

- Hugging Face — distribution, no managed serverless
- Replicate, Modal, RunPod — GPU provisioning, no adapter marketplace
- OpenRouter, OpenPipe — multi-model routing, different model ownership model
- LoRA Hub experiments — academic, no commercial serving

## Risks & Open Questions

- Creators may route around the marketplace once they have an audience
- Adapter quality control is implicit; no clear safety review process
- Pricing transparency vs competitor pressure on margin
- IP protection claim ("weights never exposed for download") is hard to verify