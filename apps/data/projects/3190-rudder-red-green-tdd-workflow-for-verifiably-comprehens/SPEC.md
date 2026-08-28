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

## Problem

Rudder is a local Codex/Claude Code plugin that captures your specs and your coding agent session history to force your agent to rewrite unit tests exclusively from your expressed intent. This turns unit test coverage into a proxy for what percent of the code actually comes from decisions you've made and lets you see how much of your agent's generated code is uncovered by your spec. After showing you an initial coverage percentage, Rudder prompts you with targeted questions to increase coverage to your goal target and runs a red-green test driven development flow to get you up to your goal. Hitting coverage is the equivalent of saying "My decisions in chat conversation cover X% of the code here."It's fully open source and free to use, made for spec driven developers and vibecoders alike. Let me know what you guys think!

## Objective

Build a local Codex/Claude Code plugin that ingests the user's specs plus the agent's session history, rewrites the unit tests to come only from the user's expressed intent, reports the resulting line-coverage percentage as a proxy for "how much of the agent-generated code came from a decision I actually made", then asks targeted questions to push that number up to the user's goal before running a red-green TDD flow to get there.

## Target Users

1. Spec-driven developers who write down intent before coding and want a number that tells them how much of the agent's output is actually covered by decisions they made in the chat.
2. Vibecoders who do not write formal specs but still want feedback on how much of the agent-generated code is backed by something they actually said.

## MVP Scope

- Local Codex or Claude Code plugin that reads the project's spec and the current agent session history from disk.
- A test-rewriter that strips unit tests back down to assertions grounded only in expressed intent (no tests inferred from implementation).
- A coverage report that uses the rewritten tests as the basis for "what percent of the code is covered by your intent".
- A targeted-questions loop that surfaces the highest-leverage gaps and asks the user one question at a time until the user-chosen coverage goal is reached.
- A red-green TDD loop that turns the answered questions into new tests, runs them, fails them, and hands the failing test back to the agent so it can implement to pass.
- Open-source distribution; no account, no hosted backend.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Runs locally; do not require a hosted backend or a login.
- The unit-test rewriter must only use the user's expressed intent — code, prompts to the agent, or comments are not intent, and tests derived from them should be marked accordingly.
- The coverage number is a proxy for "intent coverage", not a claim about correctness or completeness of the implementation.
- Compatible with both Codex and Claude Code in the MVP; do not lock the project to a single agent harness.
