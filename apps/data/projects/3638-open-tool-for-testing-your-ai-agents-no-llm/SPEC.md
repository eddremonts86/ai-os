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

## Problem

The capture for this plan is a single GitHub URL — github.com/IdoGol24/weir — and the title "Open tool for testing your AI Agents (No LLM)". The repository's own framing, available from the project's launch post, is: "Weir turns OpenTelemetry GenAI traces into deterministic, machine-checkable evidence of what an AI agent actually did. Measure how observable your agent is, trace data flow across steps, and produce witness paths for CI and security testing - with no LLM in the analysis loop. Built for engineers working on agent evals, observability, security, and CI." That sentence is the contract this plan honours: the project is a deterministic unit test for AI agents that runs without an LLM in the analysis loop, takes OpenTelemetry GenAI traces as input, and emits witness paths that can be checked in CI.

The "No LLM" claim in the title is load-bearing. An evaluator that uses an LLM to judge an agent's behaviour is itself stochastic, so the evaluator's output cannot be a unit test in the engineering sense — it is another model. Weir's stated positioning is that the analysis loop is deterministic and machine-checkable, which is what makes its output usable in CI and as security-test evidence. The plan treats that positioning as the contract and refuses to soften it by implying any LLM-judge fallback.

The use cases named by the source are concrete: agent evals, observability, security testing and CI. Each of these depends on the analysis being reproducible, which is what the deterministic claim buys. The post also names a specific failure mode in the comment thread: "otel genai spans truncate tool args past a size limit so the witness path just goes missing", and the corresponding operational rule: "don't put an llm on that check. exit nonzero in ci, not just print." Both are quoted because they are in the source; the plan carries them into the operational contract rather than paraphrasing them into a generic CI-integration statement.

The installation surface is also in the source: `pip install weir-scan` and the command `weir gauge your-export.jsonl` (or `weir gauge --sample`). The plan treats those as the supported entry points and does not invent a hosted service, a web UI or a SaaS tier. The capture does not name a price, a hosted offering or a commercial model, and the plan does not invent one.

## Objective

Ship a deterministic, LLM-free evaluator that consumes OpenTelemetry GenAI traces emitted by an AI agent and produces machine-checkable evidence of what the agent did, including a witness path through the trace and an observability score. The tool runs in CI as a unit test would: it exits non-zero on a failure, it produces stable output for a stable trace, and the analysis loop never invokes an LLM. The install-and-run path is the one the source states: `pip install weir-scan` followed by `weir gauge your-export.jsonl` (or `weir gauge --sample`). The objective is the gap the post names, not a generic agent-eval platform.

## Target Users

- Engineers building AI agents who already emit OpenTelemetry GenAI traces and want a deterministic unit test that runs in CI without invoking another LLM.
- Observability and platform engineers who want to measure how observable an agent is from the trace data alone, rather than from a judge's subjective reading.
- Security teams who need reproducible evidence of what an agent did during a security test, where a stochastic evaluator would not be admissible.
- Eval-team engineers who want the agent's behaviour to be machine-checkable rather than human-checkable, so evals scale with CI rather than with reviewers.
- Open-source maintainers of agent frameworks who want a vendor-neutral way to test their agents' observable behaviour.
- Contributors to the agent-evaluation community who are working on the problem the post names (the LLM-judge-as-evaluator problem) and want a non-LLM alternative.
- Reviewers and readers who want a tool that does one thing well and whose contract is the deterministic claim.

## MVP Scope

- A Python package, `weir-scan`, installable via `pip install weir-scan`, that exposes a CLI and a library API.
- A `weir gauge` command that takes an OpenTelemetry GenAI trace export (a `.jsonl` file) and emits an observability score, a witness path through the trace, and a non-zero exit code when the trace fails the configured check.
- A `--sample` mode that operates on a small built-in sample trace so the tool can be tried without first emitting a trace.
- A check that fails (exit non-zero, not just print) when an expected step is missing from the witness path, matching the operational rule the post names.
- A trace-shape contract documented for agent authors, so an instrumented agent knows what spans to emit for `weir gauge` to be useful.
- Stable, deterministic output for a given input — the same trace file produces the same witness path and the same score on every run, which is what makes the output usable as CI evidence.
- A Python library entry point for embedding the evaluator in an existing test suite, so the CLI is not the only integration path.
- A test suite that exercises the evaluator against canned traces, so the deterministic claim is itself testable.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The "No LLM" claim in the title and the source's "no LLM in the analysis loop" statement are part of the contract; any feature that introduces an LLM into the analysis loop breaks the contract.
- The analysis must be deterministic: the same trace file produces the same output on every run, which is what makes CI and security-evidence use cases possible.
- The installation surface stated by the source is `pip install weir-scan` and `weir gauge your-export.jsonl`; the plan does not invent a hosted service, a web UI or a SaaS tier.
- The trace input is OpenTelemetry GenAI; the plan does not promise support for trace formats that are not in the source.
- The post's operational rule — "exit nonzero in ci, not just print" — is part of the contract for the failure path; a failure that prints but does not exit non-zero is not the behaviour the source promises.
- The post's named failure mode — "otel genai spans truncate tool args past a size limit so the witness path just goes missing" — is part of the realistic threat model; the plan flags it as a real failure mode rather than papering over it.
- The capture does not name a price, a hosted tier or a subscription model; the plan does not invent one.
- The "open tool" framing in the title means the package is open source and the CLI is the public surface; the plan respects that framing.
