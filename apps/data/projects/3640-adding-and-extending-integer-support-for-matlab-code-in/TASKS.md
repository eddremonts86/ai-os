---
id: "3640"
slug: adding-and-extending-integer-support-for-matlab-code-in
title: Adding and Extending Integer Support for MATLAB Code in RunMat
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49480815"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [Rust, wgpu (GPU execution), Native IR, MATLAB-syntax parser, TOML (runmat.toml), Browser sandbox (wasm)]
---
# Adding and Extending Integer Support for MATLAB Code in RunMat

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/3640-adding-and-extending-integer-support-for-matlab-code-in/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Add the type-preserving compilation path that keeps the eight integer classes through reshape, indexing, assignment, concatenation, compilation, save, load and supported device transfers
- [ ] Extend the 632 forms in the three buckets the post names, with a test per form that asserts the class of the result
- [ ] Author the per-form capability catalogue in `crates/runmat-builtins/src/catalog/integer.rs` recording which classes each form accepts
- [ ] Implement the `[runtime.language] compat` toggle that rejects extension-only calls under `matlab` with MATLAB-oriented error identifiers where supported
- [ ] Add the persistence round-trip test for typed integer values through every supported `data.*` backend
- [ ] Add the WGPU execution test for supported device transfers on integer arrays
- [ ] Build the capability audit script that emits the integer-related form count, the extended-form count and the per-builtin coverage
- [ ] Wire the generated-catalog synchronisation check in CI so a catalogue drift fails the build
- [ ] Implement the runnable example from the post (`corr(uint16(x), int32(y))`) and verify it returns the documented `double` result in default mode and is rejected in `matlab` mode
- [ ] Verify the same code runs in the browser sandbox and via `runmat mixed-integers.m` with the same result
- [ ] Add CI that asserts the MathWorks non-affiliation line is present on every public surface and deliverable
- [ ] Re-baseline the audit number after the extension so the post's 1,476 / 632 / 379 / 43% baseline has a documented successor

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-28_
