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

## Tech Stack

- **Python SDK as the primary surface:** the developer instruments their existing agent rather than rebuilding it inside a platform. A resume parser that already works at 80% must be testable where it lives, or the tool becomes another migration nobody finishes.
- **FastAPI + Postgres:** scenarios, prompt versions, runs, per-scenario outcomes, human verdicts and judge scores. Postgres because the central query is temporal — which scenarios passed on version N and fail on version N+1 — and that is a join, not a search.
- **Prompt version store with content hashing:** every prompt is an immutable version with a diff against its predecessor. This is what makes regression attributable at all: without a stable identity per prompt, a failure cannot be tied to a change.
- **LLM-as-judge with human override, and the distinction always visible:** rule-based assertions where the output is formalisable, a judge where it is not, and a stored human verdict that outranks both. He names the user as the ultimate source of truth for hard-to-formalise outputs, so the architecture cannot pretend a judge is one.
- **Repeated sampling per scenario:** each scenario runs several times and passes on a threshold, not on one exact match. He already fixed seeds and removed temperature and the instability remained, so tolerating variance is the design premise rather than a fallback.
- **GitHub Actions integration:** prompt changes arrive in pull requests, and the regression result belongs on the diff. This is where a code developer already expects a test signal.

## Architecture

The unit is a scenario: an input, the agent configuration it runs against, and an expected outcome expressed at the strongest level available — an assertion where the output is formalisable, a judge rubric where it is not, a stored human verdict where neither works. Scenarios accumulate from three sources: cases the developer fixed by hand, cases captured from production traces, and cases created from user-reported failures.

A prompt change opens a **run**. The suite executes with repeated sampling per scenario, and each scenario resolves to pass, fail or unstable — that third state matters, because a scenario passing three times in five is information the developer needs rather than a rounding error. The run diffs against the last known-good version and reports the set that newly fails. That set is the product: it is precisely what he lacks when a prompt fix silently breaks other scenarios.

Multi-agent chains are modelled as sequences, and a scenario may span the whole sequence. Per-step outcomes are recorded alongside the end-to-end result, so a chain failure can be attributed to the step that degraded instead of to the pipeline as a whole. This directly addresses his statement that instability accumulates across sequential agents.

Feedback closes the loop: a user-reported failure becomes a scenario with a human verdict attached, and from then on it is a permanent test. That is the mechanism by which the ultimate source of truth he identifies gets into the regression suite instead of staying in a support thread.

## Milestones

1. **M0 — Scenario model and prompt versioning.** Immutable prompt versions, scenario schema supporting assertion, rubric and human-verdict expectations. End of week 3.
2. **M1 — Regression run on the formalisable case.** A resume-parser-shaped suite with assertions, repeated sampling, and the newly-failing set reported against the previous version. His own example, solved first. End of week 6.
3. **M2 — Unstable as a first-class outcome.** Threshold-based pass criteria and per-scenario stability reporting across runs. End of week 8.
4. **M3 — Judge plus human verdict.** LLM-as-judge for non-formalisable outputs, human override, judge-versus-human agreement measured and shown. End of week 11.
5. **M4 — Version comparison.** Two prompt versions side by side on one suite — his own guess at the answer, built as he described it. End of week 13.
6. **M5 — Chains.** Multi-agent scenarios with per-step attribution of the failure. End of week 16.
7. **M6 — Feedback capture and CI.** User-reported failure to stored scenario, GitHub Actions check on prompt-changing pull requests. End of week 19.
8. **M7 — Validation with the author.** Run a real project of his through the suite and compare against his two-to-four-week manual baseline. End of week 22.

## Risks

- **Inference cost against a $50-$90 price.** Repeated sampling across a few hundred scenarios on every prompt change is the cost structure of the entire product, and it scales with exactly the behaviour the product encourages. Bring-your-own-key is likely not optional at this price; the period of the stated figure is also unconfirmed, which makes the margin doubly uncertain.
- **The judge is an approximation of the thing he says is authoritative.** He states the ultimate source of truth for hard-to-formalise outputs is the user. An automated judge is therefore always a proxy, and if its verdicts are presented with the same weight as a human's, the suite will encode confident wrongness and be worse than no suite.
- **Scenario authoring is the adoption barrier.** The suite is only as good as its cases, and building it is work the developer has to do while already behind. If cases cannot be captured largely from production traces, the tool asks for the effort it promises to save.
- **Non-determinism resists a binary verdict.** A scenario that passes sometimes is neither passing nor failing. Getting this taxonomy wrong — collapsing unstable into fail — produces noisy runs that developers learn to ignore, which is how test suites die.
- **Attribution in chains is genuinely hard.** When instability compounds across sequential agents, a late failure may originate three steps earlier. Per-step recording helps and does not fully solve it, so chain attribution should be presented as evidence rather than as a diagnosis.
- **Image and code generation may not be scoreable at useful precision.** He ranks these as much harder than parsing. If the judge cannot score them reliably, the product covers the easiest part of his problem and the hardest part stays manual.
- **The solution shape is his guess, not his requirement.** He says plainly that he does not know what the solution looks like, and offers A/B testing plus feedback as a hypothesis. Everything scoped here derives from his described failures; it should be checked with him before being treated as settled.
- **The category is not empty.** Prompt-evaluation platforms exist. He either did not find them or did not find them sufficient, and which of those it is changes the plan entirely — the first is a distribution problem, the second is a product one.
