---
id: "4157"
slug: tekmyra-context-compression-that-refuses-numbers-it-can
title: "TekMyra – context compression that refuses numbers it can't defend"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49512415"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# TekMyra – context compression that refuses numbers it can't defend

## Value Proposition

A context compressor for LLM pipelines whose published ratio excludes the cases where it gave up. The compressor routes text through the codecs and the learned selector, marks protected spans as untouchable, runs a safety merge, and emits only when the verifier can prove nothing protected was lost. When the verifier cannot, the compressor refuses, the refusal is counted against the headline figure, and the pipeline continues with the uncompressed fallback.

The numbers in the source are real and pinned. On `long_context_v1` the reached-fixture mean compression ratio is 0.2929 with locked-span coverage 704/704, and 14 of 40 fixtures were refused rather than silently truncated. The byte-pinned fixtures (`test_long_context_corpus_bytes_are_pinned`) and `verify_open_core.py` make the figures reproducible from a fresh clone, which is what the source is selling — not a marketing ratio, an audited one.

**One-liner:** A Python context compressor for LLM pipelines that proves nothing protected was lost before it emits, refuses when it cannot, and reports only the ratios it can defend.

## Target Users

| Stakeholder | Why they care |
|---|---|
| LLM pipeline engineers | Need a compression ratio they can budget against, with refusals surfaced so the model call's token math is honest. |
| Compliance / legal / security reviewers | Need a verifiable receipt that protected spans (identifiers, named entities, code blocks) were not lost in compression. |
| Library maintainers | Want byte-pinned fixtures and an allowlist gate so published numbers cannot drift when the codebase changes. |
| Open-core contributors | Need a clear boundary between the open path (codecs, verifier, fixtures) and the commercial half (trained artifacts). |
| Researchers | Want a reproducible benchmark on a shared corpus with refused cases called out separately. |

## Jobs To Be Done

1. **Functional job** — Compress a long context into a smaller one and get back a defended ratio, not a guess.
2. **Functional job** — Mark protected spans (identifiers, code blocks, named entities) as untouchable, and have the compressor route them around any compression step.
3. **Functional job** — Receive an explicit refusal (not a silently truncated string) when the compressor cannot preserve the protected spans, and continue the pipeline with the uncompressed fallback.
4. **Emotional job** — Stop the feeling that a published compression ratio is marketing copy rather than a measurement.
5. **Social job** — Be the engineer whose downstream caller can audit the compressor and accept its output on the evidence, not on a vendor's claim.

## Success Metrics

- **Refusal share** — share of input fixtures the compressor refused rather than compressed. The source publishes both the reached-fixture ratio and the refusal count; the headline figure is not the ratio alone.
- **Locked-span coverage** — share of protected spans that survived compression untouched. The source publishes 704/704 on `long_context_v1` as the audited floor.
- **Reproducibility** — share of benchmark reruns (same commit, same fixture bytes) that produce the same per-route table. A drift is a failure of the ratchet test by design.
- **Verifier pass rate** — share of compressed outputs that pass the structural check after the safety merge. The verifier refuses when this is not 1.0.
- **Open-core boundary integrity** — share of `verify_open_core.py` runs that succeed. A failure here is a build that must not print a number.
- **Time-to-defended-ratio** — wall-clock time from input to a verifier-approved compressed output on `long_context_v1` fixtures, since the verifier is on the critical path.

## Pricing & Monetization

The source describes an open-core split. The compression and verification path (routing, codecs, learned selector, protected-span detection, safety merge, verifier, fixtures, contracts, test suite) is Apache-2.0 on GitHub and PyPI as `tekmyra-core`. The trained model artifact is the commercial half, published as a separate release asset with a printed SHA-256, so a paid artifact is what the user downloads after they trust the open path. The source does not name a price for the artifact bundle, a tier, or a subscription shape. Any future monetization has to be measured against the published number (compression ratio, locked-span coverage, refusal share) and against whether buying the artifact shortens the rules-only path — neither is named in the source, so the plan does not invent them.

## Competitive Landscape

- **Generic context compressors (the names the source does not provide)** — publish a headline ratio without separating reached from refused fixtures, and offer no verifier the caller can rerun.
- **LLM provider-side truncation** — drop content silently when the input overflows the window, and report no metric for what was lost.
- **Vector-store RAG** — moves long context out of the prompt entirely, but changes what the model is reasoning over (top-k passages, not the full document) and cannot answer a question that requires a span that was not retrieved.
- **Hand-rolled chunking + per-chunk summarisation** — works on small inputs, fails on long inputs the same way the source describes: chunks split mid-tag or mid-sentence and the downstream summary hides what was lost.

The post names no specific incumbent, so no further comparison is claimed here.

## Risks & Open Questions

- [ ] Confirm the refuse-rather-than-guess behaviour is what pipeline engineers actually want. A refusal is the right answer for an audited compressor, but it is also a cost: the pipeline falls back to the uncompressed input. The metric is the share of inputs that trigger a refusal, and the open question is whether pipeline owners accept that share as the cost of an honest ratio.
- [ ] Define the protected-span detector's contract: which spans are protected by default (named entities, code blocks, identifiers in a caller-supplied allowlist), and which the caller must mark explicitly.
- [ ] Decide how the safety merge handles a partial overlap between a protected span and a compressed region, since the merger is the safety net the verifier relies on.
- [ ] Validate the rules-only path is useful as a standalone mode. `--allow-rules-only` records an explicitly rules-only run and cannot emit a headline ratio; the open question is whether pipeline owners use this mode for cold-start or only as a fallback.
- [ ] Pin the release-asset digest workflow: a SHA-256 mismatch on the trained artifact must fail loudly and not be quietly retried.
- [ ] Confirm the `verify_open_core.py` allowlist stays the boundary as the commercial half grows. A closed module that becomes importable from the open build invalidates every published number from that build.
- [ ] Decide the corpus policy as fixtures are added. Byte-pinning is the source's reproducibility claim; expanding the corpus without updating the ratchet test silently invalidates the existing numbers.
