---
id: "3017"
slug: a-benchmark-for-ai-agent-guardrails-that-caught-my-own-
title: A benchmark for AI agent guardrails that caught my own plugin
status: enriched
source:
  name: manual
  url: "https://news.ycombinator.com/item?id=49338963"
category: show-hn
date: "2026-08-17"
tags: [Show HN, Product, Problem]
---
# A benchmark for AI agent guardrails that caught my own plugin

## Tech Stack

- **Harness core:** Python with pytest as the runner, since pytest already gives scenario-as-test ergonomics, fixtures for the guardrail under test, and a JUnit-XML output that CI systems consume natively.
- **Scenario corpus:** YAML files in a `scenarios/` tree, grouped by guardrail category (tool-call validation, secret-leak detection, unsafe shell execution); YAML is the cheapest human-editable container that diffs cleanly in PR review.
- **Reference adapter:** A small Python class `GuardrailAdapter` that wraps the guardrail under test; the founder's own plugin ships one of these so the baseline run works out of the box.
- **Report generator:** A pure-Python script that reads the pytest JUnit-XML output and writes a Markdown table plus an aggregate pass-rate, so the artifact can land directly in a PR comment.
- **Packaging:** A `pyproject.toml` and a `make bench` target so a contributor can clone, install, and reproduce a baseline run with one command.
- **License:** MIT (or Apache-2.0 if the founder has a preference); a permissive license is the difference between "interesting repo" and "vendored into a corporate CI".

## Architecture

```
[ scenarios/*.yaml ] ---> [ pytest runner ] ---> [ JUnit XML ]
                                              |
                                              v
                            [ GuardrailAdapter (founder's plugin or external) ]
                                              |
                                              v
                                  [ report.py --> Markdown table ]
```

The runner loads every YAML scenario, instantiates the configured adapter, replays each scenario through the guardrail, and asserts that the guardrail produced the expected verdict (block vs allow). JUnit XML is the lingua franca for CI, so the same artifact drives a GitHub Actions status check and a human-readable Markdown summary.

## Milestones

1. **M0 — Scenario corpus v0:** Write 30 YAML scenarios across the three guardrail categories the brief implies, each with a known-bad input and the expected verdict, and validate them by hand against the founder's plugin.
2. **M1 — Reference adapter:** Implement the `GuardrailAdapter` interface and ship one adapter for the founder's own plugin so `make bench` produces a real baseline run on a fresh clone.
3. **M2 — Pytest runner + JUnit output:** Wire the scenarios into pytest so a contributor can run `pytest scenarios/` and get machine-readable results, with a stable schema for the verdict field.
4. **M3 — Markdown report:** Write `report.py` that consumes the JUnit XML and emits a per-category pass-rate table suitable for a PR comment or a release-note attachment.
5. **M4 — CI integration:** Add a GitHub Actions workflow that runs the harness on push and posts the Markdown summary as a PR comment, so the harness is genuinely useful in CI rather than just runnable locally.

## Risks

- **Scenario coverage gap** — the harness is only as honest as its corpus; a category with three prompts looks the same as a category with thirty. Mitigation: publish a coverage matrix per release and gate the suite on a minimum count per category.
- **Adapter drift** — agent frameworks ship breaking changes; a stale adapter will produce spurious passes. Mitigation: pin adapter versions in CI and surface the framework version in every report row.
- **"It caught my own plugin" is not reproducible from a clone unless the plugin is in the repo.** Mitigation: ship the founder's plugin (or a redaction of it) in `examples/` so the headline is checkable.
- **Community contribution asymmetry** — without active triage, scenario PRs pile up unreviewed and the suite loses trust. Mitigation: define a review SLA in the CONTRIBUTING file and rotate maintainers.
