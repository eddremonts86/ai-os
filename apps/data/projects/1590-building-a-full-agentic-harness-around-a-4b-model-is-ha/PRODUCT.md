---
id: "1590"
slug: building-a-full-agentic-harness-around-a-4b-model-is-ha
title: Building a full agentic harness around a 4B model is hard
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49359341"
category: show-hn
date: "2026-08-19"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Building a full agentic harness around a 4B model is hard

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Around 3 months ago, we were thinking why none of the iPhone apps running an LLM are built as a full harness (as in inference + agentic loop + context management + tools + MCP servers and etc.). It became more interesting when we noticed even the new Siri is not fully on device (and not available in EU for that matter).Having built a few agentic products around a custom harness in the past, we thought this shouldn't be that hard. well, we underestimated how "dumb" a 4B model can be, especially when it comes to tool calling. :DWe tried 8 different models and we settled on Qwen 3.5 4B and we used every trick we knew to make this model behave. well, it works!It's not gonna win in any intelligence or speed benchmark, but it can do actual useful work and it really is an on device, private, full agentic harness. That said, you can still connect your OpenRouter or OpenAI API keys if that's what you prefer.Please go check it out :) You need an iPhone 15 pro or above.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49359341) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
