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

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/3137-otter-experimental-multi-threaded-javascript-runtime-wr/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment
- [ ] Stand up the Cargo workspace: `parser`, `executor`, `worker`, `runtime`, `test-harness`
- [ ] Confirm the `wasm32` build target installs cleanly

## Phase 1: Core

- [ ] Lexer, parser, and a tree-walking executor (functions, closures, async/await)
- [ ] Worker model: spawn, post-message via structured clone, terminate
- [ ] `SharedArrayBuffer` with `Int32Array` views and atomic operations
- [ ] CLI binary that loads a JS file and runs it
- [ ] Concurrency tests: parallel sum under `loom`, shared-counter race under `proptest` with a fixed seed
- [ ] `wasm32` build target and a small browser demo page
- [ ] README and PR template that respect the "small runtime" boundary

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-26_
