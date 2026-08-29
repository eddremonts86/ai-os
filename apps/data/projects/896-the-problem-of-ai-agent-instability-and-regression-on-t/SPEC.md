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

## Problem

Andrey has eight years in development. His account of building AI agents and automation tools is precise: the first 80% of the result is easy to reach, and that is enough to attract users, but retaining them requires 95-98% stability. The path from 80% to 95% is very difficult and beyond that almost impossible. The mechanism he names is regression by prompt edit — fixing one scenario by changing a prompt breaks others, which he calls a classic regression, like in programming. His example is an automatic resume parser: the prototype is simple, stabilising it is extremely difficult. He notes that parsing at least yields a somewhat formalisable response, while image generation or code generation are much harder, and for outputs that resist formalisation the ultimate source of truth is the user. In multi-agent systems the instability of several sequential agents accumulates, leading to very poor results. He is explicit that he does not know what the solution looks like, guessing at some kind of A/B testing for prompts plus a feedback system. What he has tried is listed: fixing a seed in GPT, formalising responses, removing temperature, endlessly changing prompts, writing tests for parsers, and fine-tuning models, which turned out expensive. Experiments took two to four weeks per project, and in some cases it was easier to abandon complex ideas knowing the problem in advance. He values a solution at 5000-9000 rubles ($50-$90) and says the problem is critical for serious B2B products that have resources for quality.

## Objective

Give a developer changing an agent prompt the same safety net a developer changing code has: run the edited prompt against every scenario that previously worked, show which ones broke before the change ships, and turn the user-judgement cases into stored expectations so the two-to-four-week manual experiment cycle becomes a test run.

## Target Users

- Primary: developers building AI agents and automation tools who have a working prototype at roughly 80% and cannot get it to the 95-98% that retains users. Andrey is the archetype: eight years of experience, several projects, the same wall in each one.
- Secondary: teams shipping serious B2B AI products, which he names as where the problem is critical because they have resources for quality and cannot ship an unstable agent to a paying customer.
- Tertiary: builders of multi-agent pipelines, where his stated compounding effect makes per-agent stability the deciding factor for the whole chain.

## MVP Scope

- Scenario suite per agent: inputs plus the expected outcome, built up from the cases the developer has already fixed by hand.
- Prompt versioning where every change is a diff against a known-good version, and no version is deployable without a run against the suite.
- Regression run on prompt change: execute the whole suite, report which scenarios newly fail. This is the thing he says he lacks — his fixes break other scenarios and he finds out later.
- Comparison between two prompt versions on the same suite, side by side, which is his own guess at the answer (A/B testing prompts).
- Judgement handling for outputs that resist formalisation: an automated judge where a rule is possible, and a human verdict where it is not, with the verdict stored so the case becomes a permanent test.
- Feedback capture that turns a real user-reported failure into a new scenario, since he identifies the user as the ultimate source of truth for hard-to-formalise outputs.
- Per-agent stability figure over the suite, so the 80%-to-95% climb becomes a number instead of a feeling.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Price is stated at $50-$90 (5000-9000 rubles), which caps what the platform can spend on model calls per customer. A regression suite runs many scenarios per prompt change, so the inference bill is the product's main cost and it belongs to the platform unless the customer supplies their own key.
- The tools he already tried must not be re-sold to him: fixed seeds, removed temperature, formalised responses, parser tests and fine-tuning are all named as attempted and insufficient. Fine-tuning specifically was rejected as expensive.
- For outputs that are difficult to formalise, he states the ultimate source of truth is the user. Any automated judge is therefore an approximation, and the product must be honest about which verdicts are machine-made.
- Multi-agent chains compound instability by his account, so scenario evaluation has to work over a sequence of agents and not only a single prompt call.
- His projects span parsing, image generation and code generation, and he ranks them by difficulty in that order. A product that only handles formalisable outputs solves the easiest third of his problem.
- Non-determinism is the environment, not a bug to remove. He already removed temperature and it was not enough, so the suite must tolerate variance across runs rather than expecting identical output.

## Out of Scope

- Fine-tuning as the fix. He tried it and found it expensive.
- A prompt-writing assistant. His problem is not authoring prompts, it is knowing what a prompt change broke.
