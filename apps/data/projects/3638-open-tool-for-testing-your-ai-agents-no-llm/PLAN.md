---
id: "3638"
slug: open-tool-for-testing-your-ai-agents-no-llm
title: Open tool for testing your AI Agents (No LLM)
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49480942"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [Python 3.11+, OpenTelemetry GenAI SDK, Click (CLI), JSON Schema, Pytest, Docker]
---
# Open tool for testing your AI Agents (No LLM)

## Tech Stack

- **Python 3.11+** as the runtime, matching the `pip install weir-scan` entry point the source states.
- **OpenTelemetry GenAI SDK** as the input trace format, since the source names OpenTelemetry GenAI as the input.
- **Click** as the CLI framework, because the surface is small (`weir gauge ` and `weir gauge --sample`) and Click keeps the binary small.
- **JSON Schema** for the witness-path and observability-score output shapes, so the contract is machine-checkable from the outside.
- **Pytest** for the test suite, with a fixture library of canned traces so the deterministic claim is itself testable.
- **Docker** for the CI image, so the evaluator runs in a hermetic environment and the deterministic claim survives a CI upgrade.

## Architecture

The package is one Python module with a small CLI front. The `weir gauge` command takes a JSONL file of OTel GenAI spans, parses each span into a normalised internal representation, builds a witness path through the spans, scores the trace's observability and emits a structured result. The analysis is pure: given the same input, the result is byte-identical.

The witness path is the central data structure. It is a graph of the steps the agent took, ordered by time, with the tool calls, the model invocations and the propagation between them. The evaluator checks the witness against the configured expectations and exits non-zero on a mismatch, following the post's operational rule.

The observability score is derived from the trace alone: which spans are present, how complete the tool-call arguments are, whether the propagation across steps is unbroken. The scoring rule is documented in the package so a regression in the score for a stable trace is itself a CI failure.

The OTel GenAI span truncation failure mode the post names is part of the runtime contract. When a span's tool arguments are truncated past the OTel size limit, the witness path can go missing for that step; the evaluator surfaces this as a clear failure rather than silently producing a partial witness. Agent authors who hit the failure can size their spans accordingly.

The `--sample` mode uses a small built-in trace so a new user can run `weir gauge --sample` and see the tool's output without first producing a trace of their own. The sample trace is checked into the repository and is itself a CI fixture, so the determinism claim applies to it.

The CI image is a single Python container with the package and the test suite installed. The CI step runs the test suite and runs `weir gauge` against a canned trace, asserting that the exit code is 0 and the output is byte-identical to a checked-in expectation.

## Milestones

1. **M1 — CLI skeleton** — Click-based `weir gauge` command, the JSONL parser for OTel GenAI spans, and the deterministic output path.
2. **M2 — Witness path** — the graph of steps, the ordering rule, and the miss-detection that triggers the post's "exit nonzero in ci" rule.
3. **M3 — Observability score** — the scoring rule over the trace's spans, documented so regressions are themselves CI failures.
4. **M4 — Truncation failure** — the surface for the OTel span truncation failure mode the post names, with a clear failure message rather than a partial witness.
5. **M5 — `--sample` mode** — the built-in sample trace and the documented output the user should see.
6. **M6 — Library API** — the Python entry point for embedding the evaluator in an existing test suite.
7. **M7 — Determinism CI** — the byte-identical-output check in CI, with a fixture corpus of canned traces.
8. **M8 — No-LLM-loop audit** — a CI grep that fails the build if any evaluator code path invokes a model.

## Risks

- **Determinism regressions** — the contract depends on the same-input-same-output property, and a single non-determinism bug (a hash map iteration order, a clock read, a network call) breaks the product.
- **OTel span truncation** — the failure mode the post names is a real one, and a silent partial witness would be worse than a clear failure.
- **Score-rule drift** — the observability score is a contract surface, and a rule change should be a breaking change rather than a quiet update.
- **LLM-leak risk** — a single model invocation introduced into the analysis loop would break the title claim and the contract; the audit has to be strict.
- **Trace-shape evolution** — OTel GenAI evolves, and the evaluator has to track the span shapes the embedders actually use.
- **Sample-trace drift** — the `--sample` output is a public contract surface, and a quiet change to the sample or the expected output is a regression.
- **Failure-message clarity** — "witness path just goes missing" is the post's complaint; the failure message has to be specific enough that the user knows what to fix, not just that something is wrong.
