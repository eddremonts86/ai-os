---
id: "3869"
slug: bentopdf-hyper-compress-and-kura
title: "BentoPDF, Hyper Compress and Kura"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49499829"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [WebAssembly, PDF object editing, Compression engine, PDF/A conversion, Preflight validation, C API]
---
# BentoPDF, Hyper Compress and Kura

## Phase 0: Scaffold

- [x] Read the Show HN capture and record the three tools, their surfaces and the stated benchmarks
- [x] Write SPEC.md (this document)
- [x] Scaffold the monorepo with the native core and WASM build pipeline
- [x] Stand up the benchmark harness on the conversion corpus

## Phase 1: Core

- [ ] Reproduce zero crashes, zero timeouts and the 0.05-second median on the corpus
- [ ] Ship BentoPDF browser editing with round-trip checks
- [ ] Publish Hyper Compress comparative benchmarks

## Phase 2: Deploy

- [ ] Publish the Kura conformance matrix per standard suite
- [ ] Release CLI, C API, npm, Docker and WASM builds for all three tools
- [ ] Collect tester feedback from the Show HN thread and triage it
