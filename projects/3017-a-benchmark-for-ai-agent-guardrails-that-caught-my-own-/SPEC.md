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

## Problem

https://github.com/couldbeme/holdline

Show HN submission linking to an open-source harness for benchmarking guardrails on AI coding agents; the founder reports that running their own agent plugin against the suite surfaced regressions in the plugin itself.

---

## Objective

The MVP delivers an open benchmark harness that exercises a set of agent-plugin guardrails against a curated scenario suite and surfaces regressions the guardrails let through. The founder's headline claim is that running the suite against their own agent plugin caught a real failure mode, which is the evidence the MVP needs to demonstrate. The harness ships as a runnable repo that another agent author can clone, point at their own plugin or system under test, and produce a pass/fail report keyed to the scenario set. The first cut focuses on guardrails for code-writing agents — tool-call validation, secret-leak detection, and unsafe shell commands — because the linked repo title is "holdline" and the framing is "things my plugin should have stopped".

## Target Users

1. **Agent-plugin authors** who maintain guardrail middleware (tool filters, output validators, action allow-lists) and want a regression suite they can run in CI before each release.
2. **Agent framework maintainers** who need to demonstrate to users that the platform's safety surface is real, not just documented.
3. **Security researchers** reviewing AI agent deployments who want a shared scenario corpus so different guardrails can be compared on the same prompts.
4. **Show HN readers** drawn to a self-deprecating benchmark story ("it caught my own plugin") who will star, fork, and submit new scenarios.
5. **Enterprise AI platform teams** evaluating guardrail vendors and need a neutral test set rather than vendor-supplied marketing benchmarks.

## MVP Scope

- A scenario corpus of at least 30 adversarial prompts and tool-call sequences covering the three guardrail categories the brief implies: tool-call validation, secret leak detection, and unsafe shell execution.
- A runner that loads a guardrail under test (as a Python module, CLI, or HTTP service) and replays each scenario through it, recording pass/fail and the guardrail's verdict.
- A report generator that emits a per-scenario table and an aggregate pass-rate metric, so a CI run can fail the build on regression.
- A documented baseline of the founder's own plugin running against the corpus, so other authors have a known reference to beat or regress against.
- A README that explains how to add a new scenario, how to point the runner at a new guardrail, and how to read the output.
- An MIT or Apache-2.0 LICENSE file so a corporate user can adopt the harness without legal review.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The MVP will not judge "correctness" of an agent's underlying answer; it judges whether the guardrail stopped a known-bad action, which is a narrower claim.
- The MVP will not bundle every guardrail product on the market; the runner exposes a small adapter interface and ships one reference adapter.
- The MVP will not score leaderboards; the brief is about catching regressions in the founder's own plugin, not about ranking third-party guardrails.
- The MVP will not host a live leaderboard service; reports are produced locally from a repo clone, which keeps the benchmark auditable and offline-friendly.
- The MVP will not include network-exfiltration or social-engineering scenarios; the brief is scoped to agent-plugin safety and expanding it would dilute the signal.
