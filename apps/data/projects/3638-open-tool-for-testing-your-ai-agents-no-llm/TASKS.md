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

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/3638-open-tool-for-testing-your-ai-agents-no-llm/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Scaffold the Python package with the Click-based `weir gauge` command and the JSONL parser for OTel GenAI spans
- [ ] Build the witness-path data structure from the parsed spans with stable ordering
- [ ] Implement the miss-detection that triggers the post's "exit nonzero in ci" rule on a missing expected step
- [ ] Implement the observability-score rule with documented thresholds so a regression is itself a CI failure
- [ ] Handle the OTel GenAI span truncation failure mode with a clear error rather than a partial witness
- [ ] Add the `--sample` mode backed by a checked-in fixture trace with a documented expected output
- [ ] Expose a Python library entry point for embedding the evaluator in an existing test suite
- [ ] Add CI that asserts byte-identical output for the fixture corpus on every run
- [ ] Add CI that asserts the evaluator never invokes a model anywhere in the code path
- [ ] Document the trace-shape contract for agent authors so they know what spans the evaluator expects
- [ ] Add a Docker CI image that runs the test suite and the fixture checks in a hermetic environment
- [ ] Write the user-facing copy that names the no-LLM-loop contract as the differentiator

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-28_
