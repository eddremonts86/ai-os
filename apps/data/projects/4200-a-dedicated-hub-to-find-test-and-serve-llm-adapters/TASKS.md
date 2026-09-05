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

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/4200-a-dedicated-hub-to-find-test-and-serve-llm-adapters/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] React + TypeScript registry UI with search, filters, and trending facets
- [ ] Side-by-side playground with adapter-vs-base prompts
- [ ] TanStack Start API for deploy, account, and billing flows
- [ ] SQLite + Drizzle schema for adapters, deployments, and payouts
- [ ] Serverless endpoint allocation in a managed vLLM pool
- [ ] LoRA fine-tuning studio with rank, alpha, target modules, scheduler
- [ ] Creator payout with 70/30 split
- [ ] Waitlist gating and early-access queue

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production
- [ ] GPU pool auto-scaling and on-call for vLLM incidents