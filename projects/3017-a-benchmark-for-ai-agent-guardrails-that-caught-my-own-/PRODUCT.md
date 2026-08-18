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

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

An open benchmark suite that runs a curated set of adversarial prompts and tool calls against an agent guardrail and surfaces the regressions the guardrail lets through, sold on the founder's claim that the suite caught a real failure mode in their own plugin. The deliverable is reproducible from a clone, so an agent author can wire the harness into CI and treat regressions as a failing build.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Agent-plugin authors | Need a regression suite that proves their guardrail still blocks the cases it blocked last release. |
| Agent framework maintainers | Want a public artifact that demonstrates the platform's safety surface is operational, not just promised. |
| Security researchers | Want a shared scenario corpus so different guardrails can be compared on identical prompts. |
| Show HN readers | Drawn to the self-deprecating "it caught my own plugin" story and likely to star, fork, and contribute scenarios. |
| Enterprise AI platform teams | Need a neutral test set they can run against vendor-supplied guardrails before signing a contract. |

## Jobs To Be Done

1. **Functional job** — Run my guardrail against a known-bad scenario corpus and produce a pass/fail report I can attach to a release PR.
2. **Emotional job** — Replace "we'll catch it in prod" with a green CI badge that says the guardrail was actually exercised.
3. **Social job** — Be the author of the suite other agent maintainers cite when arguing their guardrail is real.

## Success Metrics

- **Adoption:** Number of distinct external repos that vendor the harness into their CI workflow, scraped from GitHub search six months after Show HN.
- **Coverage:** Scenario count and category count in the corpus, with the explicit goal of breaking past the initial 30 prompts.
- **Reference coverage:** Number of guardrails with a published baseline run against the corpus at the version the suite ships with.
- **Engagement:** Issue and PR count on the harness repo as a proxy for community contribution.

## Pricing & Monetization

The source is a Show HN post about an open-source repo. No commercial framing is present. The MVP ships under a permissive license with no paid tier. TODO: source names no monetization

## Competitive Landscape

The source does not name competing benchmarks. Adjacent surfaces exist — academic prompt-injection suites and the safety evals inside frameworks like LangChain and Anthropic's Claude evaluations — but the founder's framing is the agent-plugin layer, which is narrower than any of those. TODO: source names no alternatives

## Risks & Open Questions

- The harness only measures what the scenarios cover; an empty scenario category is indistinguishable from a perfect guardrail in that category.
- The brief gives no number for the failure the founder's own plugin exhibited, so a "regression caught" headline cannot be quantified.
- Adapters for non-Python guardrails (Node, Go, Rust) are not described; the MVP will assume Python unless the source repo says otherwise.
- The MVP depends on community scenarios to stay current; without active maintenance the suite will go stale and the badge will stop meaning anything.
