---
id: "3494"
slug: we-built-open-openrouter-that-turns-usage-into-a-better
title: We built open OpenRouter that turns usage into a better model
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49471407"
category: show-hn
date: "2026-08-27"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# We built open OpenRouter that turns usage into a better model

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hi HN, we built an open source model gateway. It's a single place to manage our own self hosted, frontier, and open source models in one place.It’s is rust native, built for concurrency, and implements all the config quirks across models and providers (streaming formats, tool calls, model parameters, rate limits, and different error behavior).The gateway adds under 1 ms for BYOK requests and under 2 ms when Experiential supplies the provider key. It has every major inference provider, and 1000+ models refreshed daily via a codex agent that opens a PR.Compared to other similar projects we’re open source, take no markup, allow you to mix local models with a marketplace, and use your traffic to (opt in) train you a model. Simple routing doesn’t warrant a 10% token markup.The way we do this is given standardized OTel traces, we mine representative real tasks, use text world models to simulate rollouts for various models, apply an LLM judge, and fit a nearest neighbor classifier on top of an embedding of a prompt to decide the optimal model for each request. Usually this can map out a better pareto curve on cost/quality than just calling single models but it’s not perfect.Using these simulations we can also do things like suggesting cache hit optimizations, new model suggestions, and training models.It’s open source, so you can deploy it on your own infrastructure, use our hosted version with 0 markup, or read how we design for maximum availability on our website.

**One-liner:** _[Define the single sentence that explains why this product exists.]_

## Target Users

_Not written yet — `ai-os plans enrich` fills this section._

## Jobs To Be Done

_Not written yet — `ai-os plans enrich` fills this section._

## Success Metrics

_Not written yet — `ai-os plans enrich` fills this section._

## Pricing & Monetization

_TODO:_ define model (freemium / subscription / one-time / marketplace fee).

## Competitive Landscape

_Not written yet — `ai-os plans enrich` fills this section._

## Risks & Open Questions

- [ ] Validate problem with 5 user interviews before MVP
- [ ] Confirm willingness to pay
- [ ] Define compliance scope (GDPR, payments, etc.)

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49471407) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
