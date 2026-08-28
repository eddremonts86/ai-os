---
id: "3137"
slug: otter-experimental-multi-threaded-javascript-runtime-wr
title: "Otter: experimental multi-threaded JavaScript runtime written in Rust"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49449122"
  captured: "2026-08-26"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Rust, JavaScript, Runtime, Open-Source]
tech: [Rust, JavaScript, ECMAScript, Tokio, WebAssembly]
---
# Otter: experimental multi-threaded JavaScript runtime written in Rust

## Tech Stack

- Rust as the implementation language — the post is explicit about it and the runtime hacker audience expects it.
- An ECMAScript parser/executor in Rust, with a hand-rolled lexer/parser rather than a codegen-to-existing-AST pipeline so the codebase stays small.
- Tokio for the worker-thread pool; its `loom` integration is the model-checking harness for the concurrency tests.
- A `wasm32` build target so the runtime can be embedded in a browser for the WASM-hosted demo path.
- `cargo test` with `proptest` for property tests and `loom` for interleaving tests.

## Architecture

- A `Parser` crate turns JS source into an AST.
- An `Executor` crate walks the AST with a value stack and an environment chain.
- A `Worker` crate owns a thread, a small heap, and a message channel to the parent.
- A `SharedArrayBuffer` backing store is mmap'd and shared by reference between workers; access goes through atomic intrinsics.
- The `Runtime` binary is the CLI that loads a JS file, runs it on the main thread, and lets `new Worker(...)` spawn worker threads.
- A `test-harness` crate runs property tests against the executor and `loom`-based interleaving tests against the worker crate.

## Milestones

1. Lexer, parser, and a tree-walking executor that handles functions, closures, and async/await.
2. Worker model: spawn, post-message via structured clone, terminate.
3. `SharedArrayBuffer` with `Int32Array` views and atomic operations.
4. CLI binary that loads a JS file and runs it.
5. Concurrency tests: a parallel sum under `loom`, and a shared-counter race under `proptest` with a fixed seed.
6. `wasm32` build target and a small browser demo page.

## Risks

- A multi-threaded runtime without a model checker is a time bomb; the `loom` integration has to be load-bearing, not a nice-to-have.
- Garbage collection across workers is unsolved in the small-runtime regime; a refcount or arena may be the pragmatic compromise.
- ECMAScript feature creep is endless; the boundary has to be drawn in the README and respected in the PR template.
- The runtime's host API is the design surface that locks in commitments; a v0 that exposes too much is harder to remove than one that exposes too little.
