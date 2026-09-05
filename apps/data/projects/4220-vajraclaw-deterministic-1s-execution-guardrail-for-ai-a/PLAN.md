---
id: "4220"
slug: vajraclaw-deterministic-1s-execution-guardrail-for-ai-a
title: "VajraClaw – Deterministic <1µs execution guardrail for AI agents"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49507422"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---

# VajraClaw – Deterministic <1µs execution guardrail for AI agents

## Tech Stack

The gateway is C++ for the enforcement path and Go / Python / TypeScript for the higher layers; the surrounding docs site uses React + TypeScript on TanStack Start with SQLite/Drizzle for the policy catalogue. Coolify hosts the docs behind Docker.

## Architecture

A C++ enforcement path handles each Docker action in under a microsecond; Go / Python / TypeScript layers provide the W3C DID identity, the policy engine, and the integration adapters. The docs site is a TanStack Start app Coolify hosts behind Docker.

## Milestones

- M1 — Standalone gateway intercepts Docker actions.
- M2 — W3C DID identity layer per agent and per action.
- M3 — Sub-microsecond enforcement path.
- M4 — Documented integration with one agent runtime.
- M5 — Public release.

## Risks

- Determinism under load is a hard requirement; any race condition invalidates the headline claim.
- Docker-only is a real constraint; agents that do not run in Docker are not covered.
