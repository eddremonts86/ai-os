---
id: "3445"
slug: go-binsync-go-binary-patches-up-to-67-smaller-than-bsdi
title: go-binsync – Go binary patches up to 67× smaller than bsdiff
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49470232"
category: show-hn
date: "2026-08-27"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# go-binsync – Go binary patches up to 67× smaller than bsdiff

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ This project is a little performance-optimization experiment focused on reducing the size of Go binary patches, which can be useful for quick incremental updates of live services.When a Go program grows by a few bytes through an incremental change, a bunch of related references and offsets throughout the compiled binary end up changing that makes general-purpose binary-diff encoders inefficient: `zstd --patch-from` produces a 530kb patch for a one-line change in a 30MB binary. bsdiff improves upon this (150KB patch) thanks to a delta compression algorithm that can handle relative offsets.go-binsync goes a step further for Go binaries by borrowing an idea from Courgette, the technique Google uses to ship Chrome updates: read the structure the compiler left behind, predict the expected results from that structure, and send only the correction. Courgette gets that structure by disassembling; go-binsync gets more detailed Go-specific structure from additional metadata embedded in every compiled Go binary.The end result is a 2,262-byte patch for the one-line change, or a 67× improvement over the bsdiff result. (For a less synthetic result, a Prometheus 3.13.1 - 3.13.2 patch is still 28× smaller.)Still just a proof of concept (no CGO, no debug symbols, amd64 only) but I thought others might find the initial results interesting. I think this predictive-encoding approach could be generalized beyond Go binaries to efficient compression in other domains where some kind of specialized predictive structure is available.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49470232) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
