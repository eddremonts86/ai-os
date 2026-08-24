---
id: "2210"
slug: a-javascript-engine-written-in-c3-with-native-ts-suppor
title: a javascript engine written in C3 with native TS support
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49362874"
category: show-hn
date: "2026-08-19"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# a javascript engine written in C3 with native TS support

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hi HN! For the past three months I’ve been working on boomkat, a fully ES compatible, strict-only engine. It was written from scratch using the C3 language, with Duktape and QuickJS as reference engines.The engine passes 100% of test262 (subset, excluding legacy features, sloppy mode and proposal stage features), 10x faster than Duktape, matching QuickJS in performance, and can natively run TypeScript files including module support. Supports all modern JS features.It was built with a mix of several open-weight models and harnesses, with Claude Code as reviewer. I estimate 300+ hours of work, plus agents running nearly 24/7 for 12 weeks. 2000+ commits, all read (but not fully reviewed) by me. About €300 spent in total.As the README warns, this is not production-ready code, but I think it's at a state worth sharing. Surprisingly test262 still leaves a lot of surface uncovered, there are still small issues here and there but it runs a lot of real world code successfully (e.g. Zod).Would love to hear thoughts on the engine, implementation and development process.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49362874) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
