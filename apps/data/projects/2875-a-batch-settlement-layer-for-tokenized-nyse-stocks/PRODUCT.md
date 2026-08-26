---
id: "2875"
slug: a-batch-settlement-layer-for-tokenized-nyse-stocks
title: A batch settlement layer for tokenized NYSE stocks
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49442721"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# A batch settlement layer for tokenized NYSE stocks

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ The original intention was just to introduce a time dimension to solve the blockchain trilemma. Now it has turned into 312 Rust crates and 2.8 million lines of Rust code (about 2 million lines in production, about 400,000 lines in standalone test directories, and about 600,000 lines in in‑src test modules).Perhaps it’s just a huge ball of mud.The whitepaper that matches this ball of mud is also a huge ball of mud:
https://www.niumeta.com/en/developers/architectureThis doesn’t seem to be a public chain, nor a consortium chain—but it is definitely secure, decentralized, and its performance is up to standard. I gave it a name: Zero-Trust Network. Also a huge ball of mud.6 seconds per block is actually quite slow—how can this support high‑frequency order‑book trading?In reality, high‑frequency order placement and cancellation still happen on centralized servers; only the final settlement is settled on the decentralized system at a 6‑second tick.That seems workable, because you don’t need to open an account with a broker, you don’t need to pay broker trading fees, and you can trade 24/7.That said, the code is written, but we don’t have enough hardware and network resources to test and optimize it properly. For now, it’s just boasting

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49442721) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
