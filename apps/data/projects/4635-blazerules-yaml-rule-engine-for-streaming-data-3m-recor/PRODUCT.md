---
id: "4635"
slug: blazerules-yaml-rule-engine-for-streaming-data-3m-recor
title: "BlazeRules – YAML rule engine for streaming data, 3M records/SEC"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49534550"
category: show-hn
date: "2026-09-02"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# BlazeRules – YAML rule engine for streaming data, 3M records/SEC

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ https://blazerules.dev I initially wanted to make a sub-millisecond log parser in C++ but that blew into a embeddable decision engine, that can run YAML defined rules on incoming data.
The rules are executed in a vectorized format on incoming data by reprojecting into a columnar format first, if it's not already. Depending on the payload size and rules complexity, the performance goes from 200K records/s to more than million records/sec, in terms of througput this would be around 200 MiB/s to 3 GiB/s on average.Rules can be sql expressions too, or onnx models (numeric), window ops and quite a few more operations are supported.It's comparable to DuckDB but for streaming data and on the fly decisions.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49534550) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
