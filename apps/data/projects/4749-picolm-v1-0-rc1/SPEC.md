# SPEC.md — PicoLM v1.0-rc1

## Problem

PicoLM is an LLM inference engine written in C99. It currently supports llama-2, GPT-2, Qwen 3.6&#x2F;3.8(+MoE) and Gemma-3n models. Significant amount of work went into CPU SIMD acceleration&#x2F;testing&#x2F;correctness, and wide cross-platform availability with constant testing to never lose portability (from DOS through OS&#x2F;X 10.4 to modernity). CUDA&#x2F;HIP is supported, and accelerated IMMA kernels are available. More work needs to be done on prompt processing speed, but text generation is quite fast already.<p>GGUFs are mmap()&#x27;ed, not preloaded, so it&#x27;s much more friendly to RAM usage than llama.cpp. External LE&#x2F;BE GGUF-&gt;FUGG utility available for the endian-handicapped.<p>OpenAI&#x2F;llama.cpp-compatible HTTP server, ready to use with harnesses.<p>Eye candy: optional live VNC visualization of the per-layer activation heatmap.<p>I do actual feature freeze and release cycles, unlike llama.cpp which did a grand total of zero in the past 3 years. In fact, v1.0-rc1 just got released.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49547323)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-03T08:19:54Z

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
