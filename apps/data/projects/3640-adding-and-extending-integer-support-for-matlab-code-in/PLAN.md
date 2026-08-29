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

## Tech Stack

- **Rust** as the runtime language, matching the repository layout the post references (`crates/runmat-runtime`, `crates/runmat-builtins`).
>- **Native IR** as the intermediate representation the runtime compiles to, so the type-preservation contract the post describes is visible at the IR level.
>- **wgpu** for GPU execution of supported operations on integer arrays, matching the post's mention of WGPU execution in the integration coverage.
>- **TOML (`runmat.toml`)** as the configuration surface for the `[runtime.language] compat` setting.
>- **MATLAB-syntax parser** with the type-aware path that preserves integer class through compilation.
>- **Browser sandbox (WASM)** so the same code runs in the browser, matching the post's runnable example.
- **A capability audit script** that records the integer-related forms, the count of extended forms and the per-builtin coverage, so a future change can be measured against the post's 1,476 / 632 / 379 / 43% baseline.

## Architecture

RunMat's runtime is a Rust workspace with crates for the language front end, the IR and the builtins. The integer extension touches three places: the type-aware compilation path that preserves the eight integer classes, the per-builtin implementation in `runmat-builtins` that decides whether a form accepts an integer class, and the compatibility layer in `runmat-runtime` that gates which forms are reachable under each `compat` setting.

The type-preserving path is the load-bearing piece. Reshape, indexing, assignment, concatenation, compilation, save, load and supported device transfers all carry the integer class through without an implicit `double(...)` conversion. The class changes only when the program requests it (`double(uint64_array)`) or when a function reaches a documented mathematical boundary with a different output class — for example, `corr(uint16(x))` returns a `double` because correlation is a floating-point calculation, but the conversion happens at the boundary the post identifies rather than at the input.

The compatibility layer reads `[runtime.language] compat` from `runmat.toml` and rejects extension-only calls under `compat = "matlab"`. The rejection uses MATLAB-oriented error identifiers where supported. The toggle does not change the array representation or disable transparent runtime optimisations; it controls which language and builtin forms the program may call.

The per-form capability catalogue in `crates/runmat-builtins/src/catalog/integer.rs` is the contract surface: for each of the 632 extended forms it records which classes the form accepts and what it does with them. A generated-catalog synchronisation check in CI keeps the catalogue in sync with the runtime's actual behaviour, so a form whose behaviour drifts from its catalogue entry fails the build rather than a reader.

The integration coverage the post names — host semantics, compiled execution, persistence, provider behaviour, WGPU execution, compatibility policy, static source checks, generated-catalog synchronisation — is exercised by tests in the merged integration history the post links. The capability audit script produces a comparable audit number for the post-change state, so a future extension can be measured against the post's 1,476 / 632 / 379 / 43% baseline.

## Milestones

1. **M1 — Type-preserving compilation** — the eight integer classes preserved through the front end and the IR, with a test that catches an implicit `double(...)` conversion.
2. **M2 — Per-builtin extension** — the 632 forms in the three buckets the post names, with a per-form catalogue entry recording classes accepted.
3. **M3 — Persistence and device transfer** — typed integer values through `data.*` and WGPU, with a round-trip test per storage backend.
4. **M4 — Compatibility layer** — `compat = "runmat"` enables all 632 extended forms, `compat = "matlab"` rejects extension-only calls with MATLAB-oriented error identifiers where supported.
5. **M5 — Capability catalogue** — the per-form catalogue with the generated-catalog synchronisation check in CI.
6. **M6 — Audit script** — a script that emits the integer-related form count, the extended-form count, the per-builtin coverage and the comparable audit number.
7. **M7 — Browser sandbox and CLI parity** — the same code runs in both, with the post's `corr(uint16(x), int32(y))` returning `0.6000` in default mode and being rejected in `matlab` mode.
8. **M8 — Trademark audit** — CI that asserts the MathWorks non-affiliation line is present on every public surface and deliverable.

## Risks

- **Catalogue drift** — the per-form catalogue is the contract surface; a form whose behaviour drifts from its catalogue entry breaks the post's promise that the catalogue records what each form does.
- **Implicit `double(...)` regressions** — a code path that quietly introduces a `double` conversion defeats the type-preservation contract the post is built around; the test has to be strict.
- **Compat-mode error-identifier gaps** — `matlab` mode promises MATLAB-oriented identifiers "where supported"; the boundary has to be honest and the gaps reported.
- **Persistence backend divergence** — a `data.*` round-trip that loses the integer class for some backends would split the persistence contract the post describes.
- **WGPU coverage gaps** — supported device transfers are the post's stated surface; an operation that loses class through WGPU breaks the contract.
- **Audit number drift** — a future change that quietly shifts the 1,476 / 632 / 379 / 43% numbers without re-baselining the audit makes the post's claim unfalsifiable.
- **Trademark line drift** — a deliverable that drops the MathWorks non-affiliation line misrepresents the post's footer; the audit has to enforce it.
