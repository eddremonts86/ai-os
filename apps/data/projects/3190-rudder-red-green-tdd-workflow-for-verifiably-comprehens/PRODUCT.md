---
id: "3190"
slug: rudder-red-green-tdd-workflow-for-verifiably-comprehens
title: Rudder – Red-Green TDD Workflow for Verifiably Comprehensive Specs
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49452359"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Rudder – Red-Green TDD Workflow for Verifiably Comprehensive Specs

## Value Proposition

Rudder is a local Codex/Claude Code plugin that captures your specs and your coding agent session history to force your agent to rewrite unit tests exclusively from your expressed intent. This turns unit test coverage into a proxy for what percent of the code actually comes from decisions you've made and lets you see how much of your agent's generated code is uncovered by your spec. After showing you an initial coverage percentage, Rudder prompts you with targeted questions to increase coverage to your goal target and runs a red-green test driven development flow to get you up to your goal. Hitting coverage is the equivalent of saying "My decisions in chat conversation cover X% of the code here."It's fully open source and free to use, made for spec driven developers and vibecoders alike. Let me know what you guys think!

**One-liner:** A local agent plugin that rewrites your unit tests from only the things you actually said, then uses coverage as a proxy for "how much of this code came from a decision I made", and walks you through targeted questions plus a red-green TDD loop until the proxy is where you want it.

## Target Users

- Primary: spec-driven developers who already write intent down before coding and want a number that tells them how much of the agent's output is covered by decisions they actually made.
- Secondary: vibecoders who do not write formal specs but still want a signal for how much of what the agent produced is grounded in something they said.

## Jobs To Be Done

1. Functional — rewrite unit tests so they reflect only expressed intent, run coverage, and surface the percentage of agent-generated code that is covered by those tests.
2. Emotional — replace the gut-feeling of "the agent went off-script somewhere" with a concrete number that says which parts of the code have no decision behind them.
3. Social — give the user a way to push coverage up by answering targeted questions, instead of staring at a diff they did not write and trying to spot the gaps.

## Success Metrics

- Coverage-as-intent percentage climbs toward the user-chosen goal target across a session of answered questions.
- Red-green loop: each new question produces a failing test that, after the agent's implementation pass, goes green.
- Not stated in the source: there is no published benchmark for "what a good coverage-as-intent number looks like".

## Pricing & Monetization

Free and open source per the source ("fully open source and free to use"). No hosted service is implied.

## Competitive Landscape

Not stated in the source. The poster describes the idea but does not name other tools that turn coverage into an intent-coverage proxy.

## Risks & Open Questions

- "Expressed intent" is a fuzzy boundary. Spec text is intent; ad-hoc chat prompts may or may not be; comments and code are explicitly not intent per the source.
- The coverage number is a proxy, not a correctness claim. Users may over-trust it and skip reviews because the number is high.
- Local plugin compatibility: Codex and Claude Code both change their session-history formats; the plugin needs to track those changes.
- The red-green loop depends on the agent producing a passing implementation when handed a failing test. That is the agent's job, not Rudder's, and the source does not promise any specific success rate.
