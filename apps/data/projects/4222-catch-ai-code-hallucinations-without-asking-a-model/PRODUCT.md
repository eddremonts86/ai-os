---
id: "4222"
slug: catch-ai-code-hallucinations-without-asking-a-model
title: Catch AI code hallucinations without asking a model
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49507199"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Catch AI code hallucinations without asking a model

## Value Proposition

A Python library that catches the fabrications in AI-written code — packages that were never published, methods that were never written, arguments no function accepts — and the code that contradicts its own stated examples. Every verdict is named precisely and grounded in the Python interpreter or a package registry; no language model is asked anything. The library has zero runtime dependencies and refuses to use "hallucination" or "lying" as a verdict, because each name is a claim the user can check.

The library is honest about its scope: the verdict classes (IMPORT, ATTR, CALL, EXAMPLE) map to interpreter/registry facts, not to a model's second opinion. A fabrication outside the table is not in the library's scope; a finding the user cannot check is not in the library's scope; a claim the library cannot ground is a bug, not a verdict.

**One-liner:** A zero-dependency Python library that catches the things that do not exist in AI-written code by asking the Python interpreter and the package registry, never another model.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Engineers reviewing AI-written code | Need a tool that names the fabrication as a fact about the world, not a model's opinion. |
| Coding-agent maintainers | Want a post-write check the agent can call before the code is applied, with zero runtime dependencies and zero model calls. |
| Open-source contributors | Want a library they can drop into a CI step on a Python project without adding dependencies to the lockfile. |
| Library maintainers | Want a tool that catches the case where an AI's docstring example contradicts the function the docstring documents. |
| Security reviewers | Need an auditable verdict (line number, verdict class, identifier, claim) rather than a probability score from another model. |

## Jobs To Be Done

1. **Functional job** — Run a Python file through `hedgemony` and get back a per-file report naming the fabrications, the line numbers, the verdict classes, the offending identifiers, and a recommendation.
2. **Functional job** — Drop `hedgemony` into a CI step without adding runtime dependencies to the project's lockfile.
3. **Functional job** — Catch the case where an AI's docstring example contradicts the code it documents, with the verdict class `EXAMPLE` and the offending example.
4. **Emotional job** — Stop the feeling that an AI's fabrications are caught by a model's opinion, which has the same failure mode as the original mistake.
5. **Social job** — Be the team whose AI-written code is reviewed by a tool that names the fabrication as a fact about the world, not by a tool that guesses.

## Success Metrics

- **Verdict-class coverage** — share of fabrications the library can ground against the verdict-class table (`IMPORT`, `ATTR`, `CALL`, `EXAMPLE`). A finding outside the table is a bug, not a verdict.
- **Per-file report coverage** — share of runs that emit a per-file report with line numbers, verdict classes, offending identifiers, and a recommendation. A run without a report is a setup failure.
- **Zero runtime dependency** — share of releases whose install requires nothing beyond the Python interpreter and a package registry. A release that pulls a model SDK is a scope failure.
- **Zero model calls** — share of runs that make no network calls to a language model API. A run that calls a model is a "second opinion" failure and violates the source's point.
- **Docstring-example contradiction detection rate** — share of docstring examples that contradict the code the docstring documents, that the library catches. A contradiction the library misses is a coverage gap.
- **Fabrication-per-100-lines rate** — the per-file metric the README demonstrates (the example: 2 fabrications in 21 lines = 9.5 per 100 lines). The metric is the per-file rate the reviewer reads.
- **CI integration rate** — share of projects that run `hedgemony` in CI without adding it as a runtime dependency. The library is a dev tool, not a runtime tool.

## Pricing & Monetization

The source names no fee, no tier, and no commercial plan. The library is published to PyPI under SSPL-1.0 (a copyleft license that requires anyone offering the library as a network service to publish the source). The source is explicit that the library is a verification tool, not a service. Any future monetization has to be measured against the verdict-class coverage and the zero-runtime-dependency guarantee, because those are the metrics the source ties to the library's value proposition.

## Competitive Landscape

- **LLM-as-judge tools (the names the source does not provide)** — use a model to score another model's output, with the same failure mode as the original mistake.
- **Static analysers (the names the source does not provide)** — catch syntax errors and type errors, do not catch a package that does not exist on PyPI or an attribute that does not exist on an object.
- **Manual code review** — catches fabrications when the reviewer runs the code, but does not scale to the volume of AI-written code a single reviewer can read.
- **Test-driven development** — catches fabrications when the test fails, but does not name the fabrication as a fact about the world; a test that does not exercise the offending line misses the fabrication.

The post names no specific incumbent, so no further comparison is claimed here.

## Risks & Open Questions

- [ ] Confirm the verdict-class table covers the fabrications an engineer actually sees in AI-written code. The source lists `IMPORT`, `ATTR`, `CALL`, `EXAMPLE`; the open question is whether other classes (e.g. `TYPE`, `CONST`, `OVERRIDE`) need to be added as the library's scope grows.
- [ ] Define the package-existence check's coverage. The library checks PyPI and the configured package indexes; the open question is whether private indexes and editable installs are in scope.
- [ ] Validate the docstring-example check is robust against examples that are illustrative rather than literal. The library runs the example and compares; the open question is whether an example that is "morally correct but not literally runnable" is a fabrication or a stylistic gap.
- [ ] Decide how the library handles a Python version mismatch. The interpreter's introspection is the source of truth for attribute existence; the open question is whether the library should pin to the project's Python version or the system's Python version.
- [ ] Establish a documented upgrade path when a verdict class is added. A new verdict class is a scope expansion; the open question is whether the existing per-file report format accommodates the new class without breaking changes.
- [ ] Confirm the SSPL-1.0 license is the right copyleft choice. The source states SSPL-1.0 explicitly; the open question is whether a network-service copyleft is the right boundary for a verification tool, or whether MIT/Apache would have been simpler.
- [ ] Define the policy on a finding the user disagrees with. The library names a fabrication and recommends a rewrite; the open question is whether the user can mark a finding as a false positive and have the library remember the mark.
