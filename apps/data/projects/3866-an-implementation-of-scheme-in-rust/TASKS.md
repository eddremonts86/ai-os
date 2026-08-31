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

## Phase 0: Scaffold

- [x] Read the capture and confirm the bare GitHub link plus title claim
- [x] Write SPEC.md (this document)
- [x] Scaffold the cargo workspace: library crate plus REPL binary
- [x] Implement the s-expression reader with tests

## Phase 1: Core

- [ ] Implement the evaluator core: environments, lambdas, conditionals, quoting
- [ ] Polish the REPL with readable error reporting
- [ ] Add the evaluator test suite covering core semantics

## Phase 2: Deploy

- [ ] Ship an embedding example: a host app runs Scheme scripts
- [ ] Run a sample conformance suite and publish results in the README
- [ ] Tag a release on the public repository
