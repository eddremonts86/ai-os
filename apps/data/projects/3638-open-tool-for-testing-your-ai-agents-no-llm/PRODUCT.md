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

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A deterministic, LLM-free evaluator that takes an OpenTelemetry GenAI trace export and produces machine-checkable evidence of what an AI agent did, including a witness path through the trace and an observability score. The install-and-run path is `pip install weir-scan` followed by `weir gauge your-export.jsonl` (or `weir gauge --sample`), and the analysis loop is deterministic in the engineering sense: the same input produces the same output on every run.

The post's own framing of the value is explicit: agent evals, observability, security testing and CI, with the LLM-free claim as the differentiator against the LLM-judge-as-evaluator pattern. The post's operational rule — "don't put an llm on that check. exit nonzero in ci, not just print" — is the contract the value proposition rests on.

**One-liner:** Weir turns an AI agent's OpenTelemetry GenAI trace into a deterministic, CI-checkable witness of what the agent did, with no LLM in the analysis loop.

## Target Users

| Stakeholder | Why they care |
|---|---|
| AI-agent engineers | A unit test that runs in CI without an LLM judge, so evals are reproducible. |
| Observability engineers | An observability score derived from the trace, not from a human reading it. |
| Security teams | Reproducible evidence of agent behaviour during a security test. |
| Eval-team engineers | Machine-checkable evals that scale with CI rather than with reviewers. |
| Agent-framework maintainers | A vendor-neutral evaluator that operates on a standard trace format. |
| Agent-eval community | A non-LLM alternative to the LLM-judge pattern. |
| Reviewers of the contract | A small, focused tool whose differentiator is the deterministic claim. |

## Jobs To Be Done

1. **Functional job** — Run a deterministic check on an agent's trace export as part of CI.
2. **Functional job** — Produce a witness path through the trace that explains what the agent did, in a shape that is stable across runs.
3. **Functional job** — Score the trace's observability so a regression in instrumentation is visible.
4. **Functional job** — Exit non-zero on a check failure rather than just printing a warning, so CI catches the failure.
5. **Emotional job** — Replace "the LLM judge said it was fine" with "the deterministic check passed".
6. **Social job** — Have a reproducible artefact to point at when arguing with a reviewer about what an agent did in production.
7. **Emotional job** — Trust a small tool whose contract is a deterministic claim, not a probabilistic one.

## Success Metrics

- **Determinism** — share of identical-input runs that produce byte-identical output, which is the property the contract depends on.
- **CI exit code on failure** — share of check failures that exit non-zero rather than just printing, which the post names explicitly.
- **Witness path completeness** — share of expected steps that appear in the witness when the trace contains them.
- **Observability score stability** — variance of the observability score across runs of the same trace, expected to be zero.
- **Latency** — wall-clock time for a `weir gauge` run on a typical trace, so the evaluator does not become a CI bottleneck.
- **Trace-shape coverage** — share of OTel GenAI span shapes the evaluator handles, so agent authors know what their trace has to look like.
- **No-LLM-loop audit** — share of evaluator code paths that do not invoke any model, as a CI check on the contract itself.

## Pricing & Monetization

The post names no price, no tier and no hosted plan; the project is an open-source Python package (`weir-scan`) shipped under the "open tool" framing in the title. What the architecture does fix is the cost shape: a single Python package, a CLI that runs locally, and a CI integration the user operates themselves. Any future hosted offering would have to be priced per trace evaluated and would conflict with the "No LLM" contract unless the hosted service runs the same deterministic code the package runs.

## Competitive Landscape

- **LLM-judge eval frameworks** — the broader category the post positions itself against; the differentiator is the LLM-free analysis loop.
- **Agent observability platforms** — services that observe an agent's behaviour live; the source positions itself as a CI check on a recorded trace, not a live observer.
- **Replay and trace-debugging tools** — tools that replay an agent run for a human reviewer; the source's positioning is the machine-checkable alternative.
- **OTel-native trace tools** — the broader OpenTelemetry ecosystem that the project is built on top of; the source's positioning is the AI-agent-specific evaluator inside that ecosystem.

The post names no direct competitor in the same shape, and no further comparison is claimed here.

## Risks & Open Questions

- [ ] Confirm the deterministic-claim CI check, since the contract depends on the same-input-same-output property and a single non-determinism bug breaks the product.
- [ ] Confirm the failure-exit-code contract, since "exit nonzero in ci, not just print" is the operational rule the post names and a regression to print-only would violate it.
- [ ] Document the OTel GenAI truncation failure mode the post names ("otel genai spans truncate tool args past a size limit so the witness path just goes missing"), so agent authors know to size their spans accordingly.
- [ ] Decide the trace-shape contract for agent authors, since the evaluator is only useful for traces that carry the spans the witness path expects.
- [ ] Verify the `--sample` mode produces the documented output, since the sample is the entry point for users who do not yet have a trace.
- [ ] Audit the no-LLM-loop contract with a CI check, since a single model invocation introduced into the analysis loop would break the title claim.
- [ ] Decide the policy on multi-agent traces, since the post does not name them and the witness-path model may need extension for nested spans.
