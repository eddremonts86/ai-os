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

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/4157-tekmyra-context-compression-that-refuses-numbers-it-can/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Lay out the `tekmyra-core` distribution with the `tekmyra` import name and the Python 3.11+ minimum, matching the PyPI page and the source's stated version.
- [ ] Implement the rule-based codecs under `tekmyra/codecs/` and the routing layer that chooses between codecs and the learned selector.
- [ ] Implement the protected-span detector under `tekmyra/protected/` and the safety merge under `tekmyra/merge/`, with a structural check on the merged output.
- [ ] Implement the verifier under `tekmyra/verify/` that proves nothing protected was lost, refuses on mismatch, and emits the per-route ratio only on pass.
- [ ] Add the `--allow-rules-only` mode that records an explicitly rules-only run and cannot emit a headline ratio, so the open-core path stays measurable without the trained artifact.
- [ ] Build the `benchmarks/fixtures/synthetic` and `benchmarks/fixtures/long_context_v1` corpora and bind their bytes to a committed digest via `test_long_context_corpus_bytes_are_pinned` in the ratchet suite.
- [ ] Add `python -m tekmyra.benchmark compressor --fixture-dir …` that emits the per-route table for both corpora and reads the same fixtures the verifier reads.
- [ ] Add `verify_open_core.py` that rebuilds the published surface from the allowlist, proves every closed module is unimportable, runs the suite inside the built tree, and refuses to print a number on any failure.
- [ ] Wire the trained-artifact fetch-and-check workflow: download the release asset, print its SHA-256, compare it against the release notes, fail loudly on mismatch, and look up the extracted bundle via `$TEKMYRA_ARTIFACT_ROOT` from any working directory.
- [ ] Add `scripts/payload_manifest.py` that proves every published file was derived from the private source at a stated commit (internal check, not part of the user's run).
- [ ] Document the refusal contract: what a refusal means, what the pipeline should do with it, and the relationship between the reached-fixture ratio and the refusal count in the published table.
- [ ] Run an end-to-end test on the `long_context_v1` corpus: 40 fixtures, expect 14 refused and 26 reached, expect locked-span coverage 704/704, expect the reached-fixture mean ratio 0.2929, and expect `verify_open_core.py` to refuse to print a number if the open-core allowlist is broken.

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Publish `tekmyra-core` to PyPI with the import name `tekmyra`, the Apache-2.0 license, and the README that points at `tekmyra.ai` for the paper
- [ ] Publish the trained-artifact release asset on GitHub Releases with the printed SHA-256 in the release notes
- [ ] Publish the technical paper (HTML and PDF) at `tekmyra.ai/tekmyra-paper.html` and the public site at `tekmyra.ai`
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-31_
