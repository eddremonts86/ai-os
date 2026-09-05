---
id: "4332"
slug: abc-v01-a-teaching-language-grows-up-a-little
title: ABC v0.1 – A teaching language grows up a little
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49521713"
category: show-hn
date: "2026-09-01"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# ABC v0.1 – A teaching language grows up a little

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I just tagged the first release of ABC, a small C-like language I originally developed for my Introduction to High Performance Computing course.With v0.1, ABC is starting to grow a little beyond its original teaching purpose. It now has multiple backends, including LLVM, and initial x86-64 System V ABI support. As a first practical application, ABC can use raylib to build small graphical programs.The original idea behind ABC was to give students something simpler than C/C++ while keeping the parts that matter for understanding how programs actually map to a machine.During the course, students develop a simple RISC-like architecture and write their own compiler for it in ABC. This way they get to see the complete chain at least once:
hardware → instruction set → assembly → compiler → programming languageThat compiler eventually became self-hosting and is now called not-abc:
https://github.com/michael-lehn/not-abcABC itself has gradually grown beyond what was strictly necessary for the course. The LLVM backend makes it possible to generate native code, and the new ABI layer is a first step toward using existing C libraries and writing small real applications rather than just teaching examples.Currently, a subset of the x86-64 System V ABI is implemented. The ABI layer is designed so that other targets can be added; ARM is the obvious next one.
ABC v0.1 supports and has been tested with LLVM 17 through 22.Project:
https://github.com/michael-lehn/abc-llvmFeedback on the language, the teaching approach, the ABI implementation — or ideas for small applications that would be fun to build with ABC — is very welcome. :-)

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49521713) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
