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

## Value Proposition

A small, readable Rust runtime that runs JavaScript across threads — workers, shared memory, atomics — without the surface area of a production engine. Built to be read, modified, and stress-tested for the multi-threaded story specifically.

## Target Users

- Runtime hackers and language implementers who want a small Rust reference for multi-threaded JS.
- JavaScript engine contributors comparing designs against a working alternative.
- Researchers and prototype builders who need an embeddable, modifiable JS runtime.

## Jobs To Be Done

- When I am learning how a JS runtime implements workers and shared memory, I want to read a small Rust codebase end-to-end so I can see every layer.
- When I am writing a paper or prototype that needs a modifiable runtime, I want one with a permissive source so I can fork it.
- When I am testing a parallel algorithm in JS, I want a runtime that actually exercises the multi-threaded primitives so my test means what I think it means.

## Success Metrics

- Number of ECMAScript features the runtime handles (proxy for breadth, not a conformance score).
- Number of concurrency tests passing under a model checker (`loom` or `shuttle`) with no spurious interleavings.
- Lines of Rust code in the runtime, with a target that reflects "small enough to read".
- Number of GitHub forks, as a "people are reading it" signal.

## Competitive Landscape

JS runtimes (Deno, Bun) exist, but the source does not name any direct competitor that focuses on multi-threaded JavaScript written in Rust.

## Risks & Open Questions

- A "small Rust runtime" is in tension with "handles enough of ECMAScript to be useful"; the boundary has to be drawn honestly.
- Garbage collection is the hardest part of any JS runtime; mark-and-sweep across threads is a research problem on its own.
- The test suite is the contract; without property-based or model-checked tests, multi-threaded bugs will be silent.
- Whether to integrate with any host (WASM, an embeddable crate API) at MVP or stay CLI-only.
