---
id: "3160"
slug: vyukov-mpsc-queue-in-c20-with-a-six-claim-formal-memory
title: Vyukov MPSC queue in C++20 with a six-claim formal memory-model proof
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49447000"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
---
# Vyukov MPSC queue in C++20 with a six-claim formal memory-model proof

## Value Proposition

Drop the header into a C++20 project and rely on the formal claims in code review.

## Target Users

C++ systems programmers who want a bounded MPSC queue they can audit against an explicit memory-model argument.

## Jobs To Be Done

C++ systems programmers who want a bounded MPSC queue they can audit against an explicit memory-model argument.

## Success Metrics

Code review acceptance: at least one external reviewer signs off on the six-claim proof.
Benchmark: throughput on a producer-consumer workload vs a hand-written baseline.

## Competitive Landscape

_Source does not name any competing product._ The post links the mpsc-queue repo only; no other Vyukov MPSC queue with a six-claim formal proof is named.

## Risks & Open Questions

Formal claims are only as strong as the assumed memory model; reviewers must agree on the model first.
C++20 atomics semantics differ across compilers and ISAs; portability risks need explicit testing.
