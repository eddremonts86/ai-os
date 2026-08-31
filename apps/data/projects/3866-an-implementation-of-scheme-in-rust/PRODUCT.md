---
id: "3866"
slug: an-implementation-of-scheme-in-rust
title: An Implementation of Scheme in Rust
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49500050"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [Rust, Scheme runtime, S-expression reader, Evaluator with closures, REPL, Embedding library crate]
---
# An Implementation of Scheme in Rust

## Value Proposition

A Scheme implementation written in Rust: an interpreter you can read, run and embed. The value is twofold — a clear reference for people studying interpreters, and a memory-safe scripting candidate for Rust applications. The capture is a bare link, so the value here is the title's premise rather than a published feature list.

**One-liner:** A Scheme implementation in Rust — an interpreter you can read, run and embed.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Interpreter students | A readable reference implementation of a Lisp in Rust. |
| Rust application authors | A candidate scripting layer to embed. |
| Scheme community | Another implementation to test programs against. |

The capture names no segments; the rows follow from the project's nature.

## Jobs To Be Done

1. **Functional job** — Parse and evaluate Scheme programs from source.
2. **Functional job** — Provide an interactive REPL.
3. **Functional job** — Expose the evaluator as a Rust library for embedding.
4. **Emotional job** — Learn by building: the author's likely drive, honestly labeled as inference.

## Success Metrics

- **Conformance:** share of a standard Scheme test-suite sample passing.
- **REPL robustness:** sessions completed without evaluator crashes.
- **Embedding:** at least one host application scripts itself with rscheme.
- **Community signal:** stars, forks or issues on the repository.

## Pricing & Monetization

None stated. The capture is a bare repository link with no commercial terms.

## Competitive Landscape

The post names no competitors. The category is Scheme and Lisp implementations, spanning standards-conformant systems and teaching interpreters. Inside it, a Rust implementation differentiates on memory safety and embeddability rather than conformance, which the capture does not claim at all.

## Risks & Open Questions

- [ ] Bare-link capture: actual scope and completeness are unknown.
- [ ] Conformance creep: "an implementation of Scheme" invites unbounded scope.
- [ ] Single-author maintenance risk.
- [ ] Performance expectations may exceed what an interpreter delivers.
