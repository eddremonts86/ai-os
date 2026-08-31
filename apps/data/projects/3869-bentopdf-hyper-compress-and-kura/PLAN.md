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

## Tech Stack

Chosen for one native core that ships everywhere; the post names surfaces, not languages.

- **Shared native core:** parsing, object editing, compression and validation in one engine.
- **WebAssembly build:** the browser builds for all three tools.
- **Language bindings:** CLI, C API, Node SDK and npm package.
- **Browser UI:** BentoPDF's editing surface.
- **Benchmark harness:** corpus ingest plus conversion, crash, timeout and fidelity telemetry.

## Architecture

- **Native core:** PDF parsing, object editing, compression and standards validation.
- **WASM layer:** browser builds of the same core, no upload path.
- **Bindings layer:** CLI, C, Node and npm interfaces over the core.
- **Benchmark pipeline:** the 30,677-conversion corpus runs through the harness and reports crashes, timeouts and medians.
- **Self-hosted service:** Docker image for server-side compression.

## Milestones

1. **M0 — Harness.** The benchmark harness reproduces the corpus run and its zero-crash, 0.05-second-median results.
2. **M1 — Editing.** BentoPDF edits text, images and objects in the browser with round-trip checks.
3. **M2 — Compression proof.** Hyper Compress comparative benchmarks versus other open-source compressors are published.
4. **M3 — Conformance matrix.** Kura's per-suite results are published; Docker and self-host releases ship.

## Risks

- **Reproducibility:** the poster's numbers may not hold on other machines.
- **Conformance breadth:** 11 PDF/A levels plus PDF/X, PDF/UA and e-invoicing invite regressions.
- **Sustainability:** no monetization stated; maintenance depends on one author.
