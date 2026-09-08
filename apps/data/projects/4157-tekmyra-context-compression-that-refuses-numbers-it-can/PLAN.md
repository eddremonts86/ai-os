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

## Tech Stack

- **Python 3.11+** as the runtime, with the distribution name `tekmyra-core` and the import name `tekmyra`, matching the PyPI package and the source's stated minimum version.
- **Pytest** for the test suite (the ratchet test `test_long_context_corpus_bytes_are_pinned` and the rest), installed via `pip install -e '.[dev]'`.
- **Tree-sitter** is not the source's parser (the source describes a routing layer and the learned selector) but is in the same family of structured parsers and would fit a future protected-span detector extension; the MVP does not commit to a parser.
- **PyPI** for distribution, with a release-asset bundle for the trained artifact whose SHA-256 is printed in the release notes.
- **GitHub Releases** for the artifact bundle and for the paper (`tekmyra.ai/tekmyra-paper.html` and PDF) that documents the verifier and the protected-span contract.
- The corpus's web stack (React, TypeScript, TanStack Start, SQLite/Drizzle, Coolify, Docker) is not on the source's stack — the source is a Python library, not a web app. The frontmatter is the corpus's default and is not changed by this plan.

## Architecture

The library has one pipeline: input text → routing → codecs and learned selector → protected-span detection → safety merge → verifier → emit or refuse. The verifier is the gate: it proves nothing protected was lost before the pipeline emits, and it refuses to publish a number when it cannot.

Routing chooses between the codecs (rule-based) and the learned selector (the trained artifact). The codecs are the open-core path and can run without the artifact. The learned selector is the commercial half and is downloaded as a separate release asset whose SHA-256 must be checked before extraction. When the artifact is missing, the pipeline can be run in `--allow-rules-only` mode, which records an explicitly rules-only run and cannot emit a headline compression ratio.

Protected-span detection runs in parallel with the codecs. Spans the caller marks as protected (named entities, code blocks, identifiers in a caller-supplied allowlist) are routed around any compression step. The safety merge recombines the compressed and protected spans; the verifier checks that every protected span survived, that no extra content appeared, and that the structural shape is intact.

The verifier's pass/fail is the only output that matters. A pass emits the compressed text plus the per-route ratio; a fail emits a refusal and the pipeline continues with the uncompressed input. The published ratio counts only reached fixtures, and the refusal count is published alongside the ratio. The byte-pinned fixtures (`test_long_context_corpus_bytes_are_pinned`) bind the corpus content to a committed digest, so any change to a fixture is a deliberate change to the published numbers.

`verify_open_core.py` is the boundary gate. It rebuilds the published surface from the allowlist, proves every closed module is unimportable, runs the suite inside the built tree, and refuses to print a number if any step fails. The script and the benchmark CLI both read the same fixtures and the same verifier, so the audited number and the developer-local number come from the same code path.

`scripts/payload_manifest.py` is an internal check that the user cannot run against their clone: it proves every published file was derived from the private source at a stated commit, comparing each file byte-for-byte against the git blob it came from. It exists so the published surface has a receipt that is independent of the user's local checkout.

## Milestones

1. **M1 — Codecs and routing** — the rule-based codecs, the routing layer that chooses between codecs and the learned selector, the package layout (`tekmyra-core` distribution, `tekmyra` import).
2. **M2 — Protected-span detection and safety merge** — the protected-span detector, the safety merge that recombines compressed and protected spans, the structural check on the merged output.
3. **M3 — Verifier and refusal path** — the verifier that proves nothing protected was lost, the refusal contract, the per-route ratio output, the rules-only `--allow-rules-only` mode.
4. **M4 — Pinned fixture corpora** — `benchmarks/fixtures/synthetic` and `benchmarks/fixtures/long_context_v1`, byte-pinned by `test_long_context_corpus_bytes_are_pinned` so any edit fails the ratchet test.
5. **M5 — Benchmark CLI and `verify_open_core.py`** — `python -m tekmyra.benchmark compressor --fixture-dir …`, the `verify_open_core.py` allowlist rebuild and the closed-module unimportability proof.
6. **M6 — Trained artifact release path** — the separate release asset, the printed SHA-256 in the release notes, the fetch-and-check workflow before extraction, the `$TEKMYRA_ARTIFACT_ROOT` lookup so the artifact resolves from any working directory.
7. **M7 — `payload_manifest.py` and the published-surface receipt** — the internal check that proves every published file was derived from the private source at a stated commit.
8. **M8 — Documentation, paper, and PyPI release** — `tekmyra.ai` site, the technical paper (HTML and PDF), the PyPI page for `tekmyra-core`.

## Risks

- **Refusal cost surprise** — pipeline owners see a refusal as a failure and route around it, undoing the verifier's contract. Mitigation: publish the refusal share alongside the ratio and document the fallback to uncompressed input.
- **Protected-span detector drift** — a protected span is misclassified as ordinary content and silently compressed. Mitigation: the verifier is the safety net, and the verifier refuses on any mismatch; the structural check is documented as a backstop rather than the primary defence.
- **Safety merge overlap bug** — a compressed region overlaps a protected span and the merger cannot tell which side to keep. Mitigation: refuse on overlap, do not guess; the verifier is the gate.
- **Artifact SHA-256 mismatch** — a downloaded bundle does not match the printed digest. Mitigation: the fetch-and-check workflow fails loudly; no silent retry, no fallback to a previous artifact.
- **Open-core boundary creep** — a closed module becomes importable from the open build. Mitigation: `verify_open_core.py` rebuilds the surface from the allowlist on every run and refuses to print a number if any closed module is reachable.
- **Fixture edit silently invalidates numbers** — a contributor edits a fixture without updating the ratchet test. Mitigation: the ratchet test binds fixture bytes to a committed digest; the suite fails by design.
- **Rules-only path becomes the default for cost reasons** — pipeline owners skip the artifact to save money, and the headline ratio silently degrades. Mitigation: `--allow-rules-only` is recorded as a rules-only run and the benchmark CLI refuses to emit a headline ratio in that mode.
