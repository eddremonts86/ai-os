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

## Tech Stack

Chosen from the title's one fixed fact — the implementation language is Rust.

- **Rust core:** reader, evaluator and environment handling.
- **Rust test suite:** evaluator semantics pinned by tests.
- **REPL binary:** a thin read-eval-print loop over the library crate.
- **Library boundary:** the evaluator exposed as a crate for embedding.
- **CI:** cargo build plus test runs on every change.

## Architecture

- **Reader:** source text becomes an s-expression AST.
- **Evaluator:** AST plus environment yields values — closures, conditionals, quoting.
- **REPL:** the interactive loop wired to the library.
- **Embedding boundary:** host applications call the evaluator through the crate API.

## Milestones

1. **M0 — Walking skeleton.** Reader, minimal evaluator and a REPL with a few builtins.
2. **M1 — Real core.** Closures, conditionals, quoting and a usable standard core.
3. **M2 — Embedding.** A host Rust application runs Scheme snippets through the crate.
4. **M3 — Public release.** A sample conformance suite runs and its results are published.

## Risks

- **Scope creep** toward full standards conformance.
- **Evaluator bugs** that surface only in larger programs.
- **Expectation mismatch:** community standards for a "Scheme implementation" may exceed the author's goals.
