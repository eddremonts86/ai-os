---
id: "978"
slug: trivially-bypass-text-watermarks-by-requesting-a-base64
title: Trivially bypass text watermarks by requesting a Base64 response
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49333167"
category: ask-hn
date: "2026-08-17"
tags: [Ask HN, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Trivially bypass text watermarks by requesting a Base64 response

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Anthropic plans to release text watermarking based on SynthID, which modulates the PNRG behind the token choosing mechanism deterministically in a way that lets another tool later estimate whether text was written by AI.This is trivial to bypass that, it's current form:
1. Ask for the response/essay/email encoded in base64
2. Decode it using https://www.base64decode.org/While the encoded text will follow the watermarked distribution, the decoded text will not.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49333167) · **Category:** ask-hn · **Tags:** Ask HN,Problem
