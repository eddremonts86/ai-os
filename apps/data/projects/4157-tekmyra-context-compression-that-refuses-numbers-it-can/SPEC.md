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

## Problem

LLM pipelines routinely feed long contexts through a compressor to fit them into smaller windows. Most compressors either silently truncate, paraphrase away content, or emit a smaller file with no way for the caller to know what was lost. The poster's framing of TekMyra is the inverse: a compressor that proves nothing protected was lost before it emits, and refuses to publish a number when it cannot. Refusals count against the published ratios, so the headline figure is not papered over by cases where the compressor gave up.

The source is the GitHub repository for `laconiq-ai/tekmyra`. It describes an open-core Python library (Apache-2.0, package name `tekmyra-core`, import name `tekmyra`) that ships the compression and verification path: routing, the codecs, the learned selector, protected-span detection, the safety merge, and the verifier. The trained model artifacts are deliberately not in the repository and are published as a separate release asset whose SHA-256 is printed in the release notes, so the user can verify the bundle they are downloading matches the digest before extracting.

The repository publishes concrete numbers it stands behind: on `long_context_v1` (40 fixtures, 26 reached, 14 refused) the reached-fixture mean compression ratio is 0.2929 with locked-span coverage 704/704, and a corpus-level +48.44% / prose-route +70.40% gain over a stated baseline. The repository also pins those fixtures by byte content (`test_long_context_corpus_bytes_are_pinned` in the ratchet suite), so the figures cannot drift silently when the fixtures are touched. A separate `verify_open_core.py` rebuilds the published surface from an allowlist, proves every closed module is unimportable, runs the suite inside the built tree, and refuses to print a number if any of that fails.

The source names the actor (engineers running context-compression pipelines for LLM calls), the pain (the published compression ratio is not trustworthy because the compressor silently drops content), and the missing thing (a compressor whose published number excludes the cases where it gave up). It does not name a specific deployment, a specific vertical, or a specific cost figure.

## Objective

Build the TekMyra open-core path: a Python library that compresses long contexts for LLM pipelines, marks protected spans as untouchable, refuses when it cannot preserve them, and reports only the ratios it can defend — counting refusals against the headline number rather than hiding them.

## Target Users

- Engineers running LLM pipelines that compress long contexts to fit a smaller window and need a trustworthy compression ratio to budget model calls.
- Teams whose downstream callers audit the compressor (legal, compliance, security review) and need a verifiable receipt that nothing protected was lost.
- Library maintainers who want a compressor whose published numbers cannot drift silently: the byte-pinned fixtures and the `verify_open_core.py` allowlist gate are designed for this audience.
- Open-core contributors who need a clear allowlist boundary between the open path (codecs, verifier, fixtures, contracts) and the commercial half (trained model artifacts).
- Researchers comparing compressors on a shared corpus, who want a fixture set whose bytes are pinned so reruns are reproducible.

## MVP Scope

- A Python library `tekmyra-core` (import name `tekmyra`) that exposes the routing, codecs, learned selector, protected-span detection, safety merge, and verifier.
- A protected-span detector that identifies spans the compressor must not touch (named entities, code blocks, identifiers the caller marked protected) and routes them around any compression step.
- A safety merge that combines compressed and protected spans and a structural check that catches anything that slipped through.
- A verifier that proves nothing protected was lost before the pipeline emits, and refuses to publish a ratio when it cannot.
- An `apply --allow-rules-only` mode that runs the rules-only path when no trained model artifact is available and records that as a rules-only run, which cannot emit a headline compression ratio.
- A reference artifact bundle published as a release asset with a printed SHA-256, fetched and digest-checked before extraction.
- A fixture set under `benchmarks/fixtures/{synthetic, long_context_v1}` whose bytes are pinned by `test_long_context_corpus_bytes_are_pinned`.
- A `verify_open_core.py` script that rebuilds the published surface from the allowlist, proves every closed module is unimportable, runs the suite inside the built tree, and refuses to print a number if any step fails.
- A benchmark CLI (`python -m tekmyra.benchmark compressor --fixture-dir …`) that emits the per-route table for the synthetic and `long_context_v1` corpora.
- A `scripts/payload_manifest.py` internal check that proves every published file was derived from the private source at a stated commit.
- Documentation at `tekmyra.ai` with the technical paper (`tekmyra.ai/tekmyra-paper.html` and PDF) and the PyPI page for `tekmyra-core`.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The trained model artifact is never in the repository. The reference bundle is a separate release asset whose SHA-256 is printed in the release notes and must be checked before extraction.
- The published compression ratio counts only reached fixtures. Refused fixtures are reported alongside the ratio and reduce the headline figure; they are not hidden.
- Fixtures are byte-pinned. Editing a fixture without updating the ratchet test fails the test suite on purpose.
- The open-core boundary is an explicit allowlist. A closed module cannot be importable in a build that is supposed to be open core; `verify_open_core.py` proves this before any number is printed.
- Statements the compressor cannot represent faithfully are refused, not guessed. The safety merge catches the cases that still slip through, mostly as a safety net.
- The library declares a zero network dependency at runtime. Nothing in any phase calls out, and no key, no account, and no external API is required to run a benchmark.
- The published number is reproducible. Anyone can rerun the benchmark CLI against the pinned fixtures and reach the same per-route table, or the suite fails by design.
