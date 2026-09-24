# SPEC.md — Jinfer – AI inference engine for the JVM. AI in a jar

## Problem

Hi HN,
Some would call AI on the JVM quixotic. And so, Quixotic AI was born.<p>jinfer is an inference engine for the JVM: chat, vision, audio, embeddings, reranking, and TTS. No Python runtime, no ONNX, no Docker containers, no sidecar process, no IPC. Finally, AI in a jar.<p>The stack underneath is built for the JVM rather than bolted onto it:<p><pre><code>    toknroll: pure-Java tokenizers, zero dependencies
    gguf &#x2F; safetensors: read and write llama.cpp and HuggingFace model formats
    jam: quantized matmul kernels, competitive with llama.cpp on CPU
    jota: Tensor API targeting Java, C, CUDA, HIP, Metal, OpenCL, and Mojo
</code></pre>
It ships with integrations for Spring AI and LangChain4j, and is compatible with GraalVM Native Image for low-overhead, self-contained binaries with millisecond startup.<p>This is an early release (CPU only): I&#x27;d especially like feedback on the API surface.<p>Site: <a href="https:&#x2F;&#x2F;qxotic.ai" rel="nofollow">https:&#x2F;&#x2F;qxotic.ai</a>
Repo: <a href="https:&#x2F;&#x2F;github.com&#x2F;qxoticai&#x2F;qxotic" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;qxoticai&#x2F;qxotic</a>

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49708628)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-15T06:42:32Z

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
