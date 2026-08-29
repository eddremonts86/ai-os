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

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

An extension to RunMat — an independent MATLAB-syntax runtime by Dystr — that preserves MATLAB's eight integer classes through compilation, persistence and supported device transfers, and that enables 632 builtin forms beyond MATLAB's documented integer surface, with 379 builtins gaining at least one extended integer form. The extension is gated by `runmat.toml`'s `[runtime.language] compat = "runmat"` (default, extended) versus `compat = "matlab"` (documented MATLAB subset, with extension-only calls rejected and MATLAB-oriented error identifiers where supported). The post's audit numbers — 1,476 forms audited, 632 forms extended, 379 builtins with at least one extended form, 43% of the audited surface extended — are the source for the value proposition.

The change does not alter the array representation or disable transparent runtime optimisations. RunMat is not affiliated with MathWorks, and the trademark line travels with the post.

**One-liner:** RunMat now preserves MATLAB's eight integer classes through compile, save, load and device transfer, and adds 632 extended builtin forms — including `corr(uint16(...))` without a `double(...)` wrapper — gated by a `compat` flag in `runmat.toml`.

## Target Users

| Stakeholder | Why they care |
|---|---|
| MATLAB-syntax programmers | Compute on integer arrays without `double(...)` solely to satisfy an input contract. |
| Code porters | A `compat = "matlab"` mode that rejects extension-only calls. |
| Sensor / image / hardware engineers | Integer class is part of the contract; above `flintmax` the loss through `double` is real. |
| Stats / signal / optimisation users | 327 forms accept integer data that MATLAB's documented surface rejects. |
| Capability-audit authors | The per-form catalogue records which classes each form accepts. |
| `data.*` persistence users | Typed values persist through the transactional APIs. |
| Browser-sandbox and CLI users | The same code runs in both, matching the post's stated surfaces. |

## Jobs To Be Done

1. **Functional job** — Run `corr(uint16(x), int32(y))` and get a `double` result without an explicit `cast` in the default mode.
2. **Functional job** — Restrict a project to the documented MATLAB subset with `compat = "matlab"` and have extension-only calls rejected with MATLAB-oriented error identifiers where supported.
3. **Functional job** — Preserve integer class through reshape, indexing, assignment, concatenation, compilation, save, load and supported device transfers.
4. **Functional job** — Persist typed integer values through the transactional `data.*` APIs.
5. **Emotional job** — Stop rewriting integer-typed code to add `double(...)` wrappers that exist only to satisfy an input contract.
6. **Social job** — Use a runtime that is explicit about its non-affiliation with MathWorks and that carries the trademark line in its footer.
7. **Emotional job** — Trust the per-form capability catalogue as the contract surface for what each builtin accepts.

## Success Metrics

- **Capability audit match** — share of post-audit integer-related forms whose behaviour still matches the catalogue the post describes.
- **Compat-mode rejection accuracy** — share of extension-only calls rejected under `compat = "matlab"` that the catalogue marks as extension-only.
- **Type preservation through persistence** — share of `save` / `load` round-trips that preserve integer class.
- **Compat-mode error-identifier coverage** — share of errors raised in `matlab` mode that carry a MATLAB-oriented identifier where supported.
- **Browser-sandbox and CLI parity** — share of post-shipped example runs that produce the same `double` result in the sandbox and in `runmat mixed-integers.m`.
- **Catalogue synchronisation** — share of generated catalogue entries that stay in sync with the runtime's actual behaviour.
- **Trademark-line presence** — share of public surfaces and deliverables that carry the MathWorks non-affiliation line.

## Pricing & Monetization

The post names no price, no tier and no hosted plan for the integer-extension feature itself; RunMat is described in the footer as a product of Dystr with download and cloud options, but the integer extension is a runtime capability, not a paid feature. What the architecture does fix is the cost shape: an opt-in `compat = "runmat"` mode that is the default, with the documented MATLAB subset available under `compat = "matlab"` for users who need it. Any future capability-tier model would have to be added in a way that does not split the integer surface across paid and free modes, since the per-form catalogue is the contract surface.

## Competitive Landscape

- **MATLAB (MathWorks)** — the namesake the post positions against; RunMat is explicit about non-affiliation and the trademark line travels with every public surface.
>- **Octave** — the long-standing open-source MATLAB-syntax interpreter; RunMat's positioning is a modern runtime with GPU execution and a documented per-form capability catalogue.
>- **Julia** — the general-purpose scientific language referenced in the related-posts section; the post positions RunMat as a path for MATLAB-syntax code rather than a Julia replacement.
- **Domain-specific runtimes (NumPy, PyTorch)** — the broader scientific-computing ecosystem the post is part of; the differentiator is the MATLAB-syntax surface specifically.

The post names no direct competitor in the integer-extension space, and no further comparison is claimed here.

## Risks & Open Questions

- [ ] Confirm the catalogue entry for each of the 632 extended forms stays in sync with the runtime's actual behaviour, since the catalogue is the contract surface.
- [ ] Decide the policy for an integer input that exceeds the target builtin class's range, since range-checked exact controls are part of the post's framing.
- [ ] Establish the error-identifier coverage in `matlab` mode, since the post promises MATLAB-oriented identifiers "where supported" and the boundary has to be honest.
- [ ] Verify the WGPU execution path preserves integer class through supported device transfers, since the post names WGPU as part of the integration coverage.
- [ ] Audit the `compat = "matlab"` rejection list to make sure every rejected call is one the post marks as extension-only.
- [ ] Confirm the transactional `data.*` persistence round-trips integer class for every supported storage backend.
- [ ] Decide the policy on `double`-to-integer conversion when the `double` cannot represent the integer exactly, since the post names this as the loss the integer extension exists to avoid.
