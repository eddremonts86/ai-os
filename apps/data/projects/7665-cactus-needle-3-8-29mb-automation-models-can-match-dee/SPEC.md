# SPEC.md — Cactus Needle 3: 8-29MB automation models can match DeepSeek V4 Flash

## Problem

Hey HN, Henry from Cactus here.<p>We submitted Needle 2 here a few weeks ago, and the feedback in the discussion thread was incredibly valuable, thanks! Thanks to all that feedback, we’ve been able to move quickly to release Needle 3 and I&#x27;d love to hear what you think again.<p>The key features:<p>1) Automation (tool calls &amp; structured JSON output): Needle still doesn&#x27;t chat by design, its quite challenging to pack general capacity into such small models, so we focus on tool calls and structured JSON. If no tool you declared fits the request, you get an empty list back (note for when playing with the demo).<p>2) Intelligence Laddering: Every layer (2 to 20) is a deployable subnetwork, so one set of weights, 25 to 121 million parameters at 2-bit, shipping as 8-29MB binaries. On a Raspberry Pi 5 it decodes at up to 4k tokens&#x2F;sec and prefills at up to 10k.<p>3) Monarch Hadamard MLP: replaces the dense FFN with three learnable Walsh-Hadamard-initialized Kronecker (Monarch) factor pairs interleaved with per-channel diagonal scales, fixed permutations, a SiLU nonlinearity, and a rank-8 input-conditioned gate, so each token gets a fully mixed nonlinear transform of its d_model channels at O(d√d) parameters and compute instead of the O(d²) a dense 4x-expansion MLP would cost.<p>4) Performance: On Mobile Actions (phone commands, scored on the exact call) the 20-layer model gets 86.0 through the shipped 2-bit binary; LFM2.5 1.2B is at 82.4, Qwen3.5 0.8B at 76.0, Apple&#x27;s on-device model at 57.6, all at f16. More results on the link, we do not win everywhere ofc.<p>5) Multilingual: Needle 3 now supports English, French, Spanish, German, Dutch, Italian, Polish, with more languages coming.<p>6) Finetuning: You can achieve DeepSeek v4 Flash grade performance on a narrow task with just 4L, stress on &quot;narrow task&quot;, we found that production users often prefer tuning before production.<p>7) Triggers: Grounding is a common challenge for tool call, at least for Needle 2, so we added support case-insensitive regular expressions matched against each request to gate false negatives.<p>8) Confidence: Every response also carries a calibrated confidence score, the minimum of a judgement on the finished call and its decode probability. Act above your threshold, show the call and ask below it, or escalate to a bigger model.<p>9) Supported Platforms: macOS, Linux on x86-64, ARM64, ARMv7, RISC-V and MIPS32, Windows x64 and ARM, Android, iOS, watchOS, tvOS, the browser as WebAssembly, and a WASI component.<p>Thanks for reading and as always, thoughts appreciated!

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49748553)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-18T00:11:44Z

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
