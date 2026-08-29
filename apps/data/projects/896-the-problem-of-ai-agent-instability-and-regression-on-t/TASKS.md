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

## Phase 0: Scaffold

- [x] Capture the regression description, the attempted fixes and the stated price range from ProblemHunt
- [ ] FastAPI service with Postgres schema: scenarios, prompt versions, runs, outcomes, judge scores, human verdicts
- [ ] Python SDK that instruments an existing agent in place, without a migration
- [ ] Immutable prompt version store with content hashing and version diffs
- [ ] Write DESIGN.md (run report, newly-failing set, version comparison view)
- [ ] Confirm with the author whether the $50–$90 figure is monthly or one-time

## Phase 1: Core

- [ ] Scenario model supporting assertion, judge rubric and stored human verdict as expectation types
- [ ] Repeated sampling per scenario with a threshold-based pass rule, not exact-match
- [ ] Pass / fail / unstable as three distinct outcomes, with unstable surfaced rather than collapsed into fail
- [ ] Regression run: execute the suite on a prompt change and report the newly-failing set against the last known-good version
- [ ] Resume-parser-shaped reference suite as the first formalisable case, matching the author's own example
- [ ] Per-scenario stability history across versions, and a per-agent pass rate to track the 80%-to-95% climb
- [ ] LLM-as-judge scoring for outputs that resist assertions
- [ ] Human verdict that overrides the judge, with machine-made verdicts visibly labelled as such
- [ ] Judge-versus-human agreement measured and displayed, not assumed
- [ ] Side-by-side comparison of two prompt versions on one suite
- [ ] Multi-agent chain scenarios with per-step outcomes recorded for attribution
- [ ] Scenario capture from production traces, so building the suite is not manual authoring
- [ ] Feedback intake: a user-reported failure becomes a permanent scenario with a human verdict
- [ ] Per-run inference cost reporting, and bring-your-own-key support
- [ ] GitHub Actions check posting the regression result on prompt-changing pull requests

## Phase 2: Deploy

- [ ] Run one of the author's real projects through the suite and compare against his two-to-four-week manual baseline
- [ ] Set pricing once the period of the stated range is confirmed
- [ ] Deploy to Coolify
- [ ] Verify in production
