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

## Problem

The capture for this plan is a URL — runmat.com/blog/adding-and-extending-integer-support-for-matlab-code-in-runmat — and a title that states the change the post describes: "Adding and Extending Integer Support for MATLAB Code in RunMat." RunMat is named in the post's footer as "an independent, modern runtime for MATLAB-syntax source code" by Dystr, explicitly not affiliated with, endorsed by, or sponsored by The MathWorks, Inc., and the post is a release-note-style account of extending the runtime's handling of MATLAB's eight integer classes.

The blog post is specific about the scope of the change. MATLAB defines eight fixed-width integer classes (int8, int16, int32, int64, uint8, uint16, uint32, uint64) for values that need to be stored exactly within a fixed range: identifiers, counters, image channels, packed data, file formats, hardware interfaces. MATLAB-syntax code's default numeric class is `double`, and the post is explicit that a 64-bit `double` "cannot represent every 64-bit integer" — above 2^53 distinct whole numbers can produce the same stored value. The post therefore treats the eight integer classes as a precision contract the runtime has to honour: "the runtime to preserve the stored value and its class everywhere the value travels."

The post then names the specific gap RunMat is filling. MATLAB's documented builtin surface accepts integers for some functions and some arguments but not others — some builtins accept all eight classes as data, others accept integers only as a dimension, index or option, and many numerical functions document their data inputs as floating-point only. The post gives a concrete example: MATLAB's `corr` does not support `uint16` inputs, so a program must wrap the data in `double(...)` solely to satisfy the input contract. RunMat's extension removes that requirement for the forms it covers.

The audit numbers in the post are specific and quotable. The integer capability audit concludes with "1,476 integer-related forms audited across 787 builtins; 632 forms extended beyond MATLAB; 379 builtins with at least one extended integer form; 43% of the audited surface includes a RunMat extension." The 632 forms are described in three buckets: 327 forms added across statistics, probability, signal processing, transforms, interpolation, optimisation and other numerical areas where the input data was previously required to be `double`; 222 forms where integers are exact controls (dimensions, counts, indices, groups, flags, weights, options) decoded directly from their integer type and range-checked; and 83 forms that preserve integers through exact operations or add RunMat-specific behaviour (sparse matrices with integer payloads, integer coordinates in graphics, additional type selection in `randperm`, `"like"` and complex-axis forms in `meshgrid`, persistence of typed values through the transactional `data.*` APIs).

The post also names the configuration knob that controls the extension: `runmat.toml` with `[runtime.language] compat = "runmat"` enables all 632 extended forms in the default mode, while `compat = "matlab"` restricts the runtime to the documented MATLAB subset and rejects extension-only calls. The post is explicit that the toggle does not change the array representation or disable transparent runtime optimisations; it controls which language and builtin forms the program may use.

The plan treats the post's numbers and code paths as the source of truth and does not invent additional capability claims, benchmarks or feature-completeness assertions the post does not state. The MATLAB language facts the post relies on — eight integer classes, default `double`, the 2^53 boundary — are general, verifiable language facts and are stated as such rather than as RunMat-specific claims.

## Objective

Extend RunMat, an independent MATLAB-syntax runtime by Dystr, so that the eight MATLAB integer classes — int8, int16, int32, int64, uint8, uint16, uint32, uint64 — are preserved through the compilation, persistence and supported device-transfer paths, and so that 632 builtin forms beyond MATLAB's documented integer surface accept those classes directly, with 379 builtins gaining at least one extended integer form. The extension is gated by a `runmat.toml` setting, `[runtime.language] compat = "runmat"` for the extended surface or `compat = "matlab"` for the documented MATLAB subset. The change does not alter the array representation or disable transparent runtime optimisations; it changes which language and builtin forms a program may call.

## Target Users

- MATLAB-syntax programmers who want to compute directly on integer arrays without wrapping every integer input in `double(...)` solely to satisfy an input contract.
- Engineers porting MATLAB code to RunMat who need a conservative mode (`compat = "matlab"`) that rejects extension-only calls and emits MATLAB-oriented error identifiers where supported.
- People working with sensor readings, image channels, file-format payloads and hardware interfaces where the integer class is part of the contract and the cost of going through `double` is real (especially above `flintmax`).
- Users of statistical, probability, signal-processing, transform, interpolation and optimisation functions in MATLAB-syntax code where the integer-data input was previously rejected by the documented builtin surface.
- Authors of RunMat builtin catalogues and capability audits who extend the integer surface incrementally and need the per-form capability catalogue to record which classes each form accepts.
- Maintainers of code that uses the transactional `data.*` persistence APIs where the post promises typed-value persistence through save and load.
- Users of the browser sandbox and the CLI who want the same code to run in both, with the post's runnable example working as described in the default mode.

## MVP Scope

- Type-preserving handling of the eight MATLAB integer classes through reshape, indexing, assignment, concatenation, compilation, save and load, and supported device transfers.
>- Default-mode extension of the 632 forms the post names, with the per-form capability catalogue recording which classes each form accepts and what it does with them.
- A `compat = "runmat"` mode (the default) that enables all 632 extended forms and a `compat = "matlab"` mode that rejects extension-only calls and uses MATLAB-oriented error identifiers where supported.
- A runnable example in the post (`corr(uint16(x), int32(y))`) that returns a `double` result without an explicit `cast` in `runmat` mode and is rejected in `matlab` mode.
- A capability audit script that records the integer-related forms, the count of extended forms, and the per-builtin coverage, so a future change to the surface can be measured against the post's 1,476 / 632 / 379 / 43% baseline.
- Integration tests that exercise host semantics, compiled execution, persistence, provider behaviour, WGPU execution, compatibility policy, static source checks and generated-catalogue synchronisation, in the shape the post describes for the merged integration history.
>- A CLI path (`runmat mixed-integers.m`) and a browser sandbox path so the same code runs in both, matching the post's stated surfaces.
- A clear statement that RunMat is not affiliated with MathWorks and that MATLAB is a registered trademark of The MathWorks, Inc.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The eight integer classes the post names are the eight MATLAB namesakes (int8, int16, int32, int64, uint8, uint16, uint32, uint64); the plan does not invent additional classes or rename them.
- The mandatory MATLAB language fact in the post — that a `double` cannot represent every 64-bit integer, with the boundary at 2^53 — is general and verifiable, but any further arithmetic-pedagogy claim the post does not make is not invented here.
- The audit numbers — 1,476 forms audited, 632 forms extended, 379 builtins with at least one extended form, 43% of the audited surface extended — are the post's; the plan does not invent newer numbers.
- The three-bucket breakdown — 327 forms for numerical inputs that previously required `double`, 222 forms for exact controls, 83 forms for exact-operation preservation and RunMat-specific behaviour — is the post's; the plan does not re-bucket the numbers.
- The configuration surface is `[runtime.language] compat = "runmat"` or `compat = "matlab"` in `runmat.toml`; the plan does not invent a third mode or a per-form override that the post does not promise.
- `matlab` mode rejects extension-only calls and uses MATLAB-oriented error identifiers where supported; the plan does not promise that every error identifier matches MATLAB's exactly.
- The compatibility toggle does not change the array representation or disable transparent runtime optimisations; the plan does not promise that it does.
- RunMat is not affiliated with, endorsed by, or sponsored by The MathWorks, Inc., and MATLAB is a registered trademark of The MathWorks, Inc.; the trademark line travels with every public surface and deliverable, matching the post's footer.
- The plan does not promise feature-completeness against MATLAB, specific benchmark numbers, or production-readiness statements the post does not state.
