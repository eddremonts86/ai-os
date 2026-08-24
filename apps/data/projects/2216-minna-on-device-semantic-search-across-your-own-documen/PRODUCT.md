---
id: "2216"
slug: minna-on-device-semantic-search-across-your-own-documen
title: Minna – On-device semantic search across your own documents (macOS)
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49362669"
category: show-hn
date: "2026-08-19"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Minna – On-device semantic search across your own documents (macOS)

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hi HN! Minna is a new tool geared towards people who have a knowledge base so big they forget where things are.- Chat answers are constrained to retrieved results. The model has to search your knowledge base first and cite the document it pulled from. It won't answer from outside your knowledge base which means you can trust the LLM instead of having to be weary about what it outputs.
- Hybrid retrieval — BM25 over an inverted index for exact and keyword matches, plus a vector index for semantic matches, results are fused using Reciprocal Ranked Fusion.
- Embeddings and inference both run on-device. Search uses bge-small-en and run on the neural engine. Chat uses Qwen3 4B running on MLX.
- Search latency is ~12 ms across 250 documents split into 30,000 chunks on Apple Silicon.What’s not done; OCR scanning on PDFs is limited, the app is currently Apple Silicon only, and there are some rough edges in the UI.It’s a TestFlight beta (apologies, but it is the cleanest distribution path right now): https://testflight.apple.com/join/6ZxKb2mm

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49362669) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
