# SPEC.md — Spanda: Sub-microsecond LLM epistemic uncertainty in Rust

## Problem

We built an open-source sub-microsecond Rust engine and gateway for LLM epistemic uncertainty quantification and hallucination gating:<p>GitHub: https:&#x2F;&#x2F;github.com&#x2F;Adarshent&#x2F;Spnda
Python SDK: pip install spnda<p>Why we built this:
Semantic Entropy (Nature 2024) is great at detecting hallucinations, but the quadratic NLI cross-encoder bottleneck (90ms GPU overhead with DeBERTa) makes it unusable for real-time production serving.<p>We found that exact-match normalized entropy (R_sc) achieves the same discriminative AUROC on structured reasoning (GSM8K) while running in under 1 microsecond on CPU (760 nanoseconds).<p>Benchmarking against Python proxies:
- Kernel latency: 760 ns (Rust) vs 15 ms (Python)
- Memory RSS: ~3 MB vs 230 MB
- Cold start: 3.6 ms vs 1.17 s<p>Happy to answer any questions about the Rust implementation, the zero-GPU exact-match math, or the benchmark results!

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49663329)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-11T18:48:16Z

---

## Objective

Build a solution that addresses this problem clearly and at scale.

---

## Target Users

1. **[Primary user]** — the main user this serves
2. **[Secondary user]** — other relevant users

## MVP Scope

- Core functionality
- Leave out anything beyond the MVP

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Keep the MVP simple
- No unnecessary external dependencies
