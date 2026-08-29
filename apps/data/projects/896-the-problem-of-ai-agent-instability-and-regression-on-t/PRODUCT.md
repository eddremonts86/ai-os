---
id: "896"
slug: the-problem-of-ai-agent-instability-and-regression-on-t
title: The problem of AI agent instability and regression on the path from prototype to stable product
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/ai/bacfrvck91-the-problem-of-ai-agent-instability-and"
  captured: "2025-10-12"
category: ai
date: "2025-10-12"
tags: [AI, Dev]
country: USA
wtp:
  raw: "5000–9000 rubles ($50–$90)"
  currency: USD
  min: 50
  max: 90
  period: month
  mrrMid: 70
tech: [Python SDK, FastAPI, Postgres, LLM-as-judge scoring with human override, prompt version store, GitHub Actions integration]
---
# The problem of AI agent instability and regression on the path from prototype to stable product

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

Change a prompt and find out immediately which previously-working scenarios just broke. The suite of cases you already fixed by hand becomes a regression test, the hard-to-formalise cases carry a stored human verdict, and the climb from a prototype's 80% to the 95-98% that retains users becomes a measured number instead of a two-to-four-week experiment.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Developer building an AI agent (Andrey) | Eight years in development, hits the same wall every project: fixing one scenario with a prompt change breaks others, and there is no way to see it happen. |
| Team shipping a serious B2B AI product | Cannot ship 80% stability to a paying customer, and by his account these are the teams with resources for quality. |
| Builder of multi-agent pipelines | Instability accumulates across sequential agents, so per-agent stability decides whether the chain works at all. |
| The end user of the agent | For outputs that resist formalisation, he names the user as the ultimate source of truth — their complaint is the real test signal. |

## Jobs To Be Done

1. **Functional job** — Know what a prompt change broke before shipping it, across every scenario that previously passed.
2. **Emotional job** — Stop the demoralising loop he describes: fix one thing, break another, spend two to four weeks per project, and sometimes abandon a complex idea because the wall is known in advance.
3. **Social job** — Be able to tell a B2B customer what the agent's stability actually is, with the evidence behind the number.

## Success Metrics

- **Regressions caught before deploy:** scenarios that newly fail on a prompt change and are fixed before shipping. This is the product's whole purpose and the failure he describes most concretely.
- **Time from prompt change to verdict:** measured against his stated baseline of two-to-four-week experiment cycles per project.
- **Measured stability trajectory:** per-agent pass rate over the suite across versions, showing whether a project is actually moving from 80% toward the 95-98% he says retention requires.
- **Suite growth from real failures:** scenarios added from user-reported problems, since the user is the source of truth for outputs no rule can score.
- **Judge agreement with human verdicts:** how often the automated judge matches the human on the same case. This bounds how far the product can be trusted without a person in the loop, and it must be visible rather than assumed.
- **Multi-agent chain coverage:** share of scenarios evaluated across a full agent sequence rather than one prompt call, since compounding instability is his stated worst case.

## Pricing & Monetization

He names 5000-9000 rubles ($50-$90) for a solution, and adds that the problem is critical for serious B2B products with resources for quality. He does not state whether that is monthly or one-time, so the figure is recorded as the range he gave; a per-developer monthly subscription in that band is the reading consistent with a tool used continuously, but the period is an inference rather than his word. The hard consequence either way: a regression run costs real inference, so the margin depends on whether the customer brings their own model key.

## Competitive Landscape

He lists what he tried, which is the honest competitive set:

- **Fixed seeds and removed temperature** — reduce variance without preventing regression. He did both; the problem remained.
- **Formalising responses** — works where the output can be formalised, which he notes is the easier case; image and code generation resist it.
- **Hand-written parser tests** — he wrote them. They cover the parser, not the prompt's behaviour across scenarios.
- **Fine-tuning** — tried and rejected as expensive.
- **Prompt evaluation platforms** — the category his guess points at (A/B testing prompts plus a feedback system), which he either has not found or has not found sufficient; he states he does not know what the solution looks like.
- **Abandoning the feature** — his documented fallback: in some cases it was easier to give up complex ideas knowing the problem in advance. That is the real competitor, and it costs nothing.

## Risks & Open Questions

- [ ] Confirm whether $50-$90 is monthly or one-time. He gives the range without a period, and the business model differs entirely between the two.
- [ ] Establish how a suite tolerates non-determinism. He already removed temperature and it did not solve the problem, so pass/fail must be defined over variance rather than exact output.
- [ ] For image and code generation, decide what an automated judge can honestly score and where a human verdict is mandatory. He names these as much harder than parsing.
- [ ] Inference cost per regression run against a $50-$90 price point. A suite of a few hundred scenarios run on every prompt change is the whole cost structure.
- [ ] Multi-agent evaluation: define how a failure is attributed to one agent in a chain when instability compounds across the sequence.
- [ ] He says explicitly that he does not know what the solution looks like. His guess (A/B testing prompts plus feedback) is a hypothesis worth building against, not a specification — the scope here follows from his described failures, and should be validated with him before it is trusted.
- [ ] Existing eval platforms cover part of this. Establish what he actually tried and why it did not stick, before assuming the category is empty.

---

_Source:_ [ProblemHunt](https://problemhunt.pro/en/ai/bacfrvck91-the-problem-of-ai-agent-instability-and) · **Category:** ai · **Tags:** AI,Dev
