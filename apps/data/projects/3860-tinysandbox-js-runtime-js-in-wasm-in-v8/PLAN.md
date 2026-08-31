---
id: "3860"
slug: tinysandbox-js-runtime-js-in-wasm-in-v8
title: Tinysandbox-JS-Runtime - JS in WASM in v8
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49500882"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [Rust, WebAssembly, Embedded v8 JavaScript runtime, Per-isolate sandboxing, Cloudflare Workers support, WASM size optimization]
---
# Tinysandbox-JS-Runtime - JS in WASM in v8

## Tech Stack

- **Rust:** the single crate shipping the shell, coreutils, filesystem and JS runtime.
- **WebAssembly:** the runtime compiles to WASM for every target.
- **Embedded v8 JavaScript runtime:** the JS engine inside the sandbox.
- **Per-isolate sandboxing:** each JS context isolated with measured overhead.
- **Cloudflare Workers support:** the WASM build runs in Workers.
- **WASM size optimization:** 4 MiB to 1 MiB baseline, per-isolate around 0.69 MiB.

## Architecture

- **Core crate:** a sandbox with shell, builtins, filesystem backends and the JS runtime.
- **WASM build:** a single binary per target (browser, Workers, Convex v8 actions).
- **Isolate manager:** per-isolate execution contexts with bounded overhead.
- **Host capability layer:** fetch and filesystem mounts as explicit capabilities, not ambient access.
- **Language bindings:** Rust and TypeScript APIs over the same core.

## Milestones

1. **M0 — Portability.** The JS runtime loads in the browser demo and in Workers.
2. **M1 — Size discipline.** Baseline at 1 MiB and per-isolate around 0.69 MiB, CI-enforced.
3. **M2 — Target parity.** Convex v8 actions and NodeJS paths verified with the same tests.
4. **M3 — Isolation evidence.** Escape-attempt tests and capability documentation published.

## Risks

- **Feature growth will push against the size budget:** a size-regression CI gate is needed.
- **Platform WASM limitations** may force target-specific code paths.
- **Sandbox security rests on v8 and WASM boundaries:** any escape invalidates the pitch.
- **Multi-target testing** is expensive and easy to let rot.
