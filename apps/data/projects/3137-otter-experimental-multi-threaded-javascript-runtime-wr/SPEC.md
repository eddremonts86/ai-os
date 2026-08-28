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

## Problem

Existing JavaScript runtimes that ship a multi-threaded execution model — workers, SharedArrayBuffer, atomics — tend to be heavy: large runtimes, deep platform integration, and a stack of features that an experimental project does not need. Otter is an experimental Rust runtime that focuses on the multi-threaded story: a small, readable codebase that runs JavaScript across threads and exposes the primitives directly, without the production-runtime surface area.

## Objective

Ship a working JavaScript runtime in Rust that demonstrates multi-threaded execution — workers, shared memory, message passing — with a small enough surface to read end-to-end, and a test suite that exercises the concurrent behaviour.

## Target Users

- Runtime hackers and language implementers who want to read a small Rust runtime that handles threads.
- JavaScript engine contributors comparing designs with a working multi-threaded reference.
- Researchers writing papers or prototypes that need a modifiable, embeddable JS runtime.

## MVP Scope

- An ECMAScript parser and executor in Rust covering enough of the language to run representative multi-threaded scripts (functions, closures, async/await, typed arrays).
- A worker model: spawn a worker thread, pass messages by structured clone, terminate cleanly.
- Shared memory with `SharedArrayBuffer` and atomic operations on `Int32Array` views.
- A small test suite that runs the canonical "rayon-style" parallel sum and a "two workers, one shared counter" race test under `loom` or `shuttle`.
- A CLI that takes a JS file and runs it under the runtime.
- Out of scope: a full Node-compatible module system, a browser-like DOM, garbage-collector sophistication beyond mark-and-sweep.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The runtime is experimental; correctness on the test suite is the bar, not conformance to every ECMAScript edge case.
- The Rust codebase is intentionally small — a new reader can navigate it in one sitting. Adding a feature that doubles the size needs a clear motivation.
- Thread primitives are exposed with a typed Rust API, not as raw `unsafe` blocks handed out to the JS layer.
- All shared-memory writes go through the atomic operations the spec defines, not through ad-hoc locks.
