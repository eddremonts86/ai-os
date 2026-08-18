---
id: "2989"
slug: openleetcode-local-leetcode-runner-where-tests-live-in-
title: Openleetcode – local LeetCode runner where tests live in the repo
status: enriched
source:
  name: manual
  url: "https://news.ycombinator.com/item?id=49337367"
category: show-hn
date: "2026-08-17"
tags: [Show HN, Product, Problem]
---
# Openleetcode – local LeetCode runner where tests live in the repo

## Problem

The author built a CLI that runs LeetCode-style solutions locally: write a solution in any supported language, run it through the CLI, and it identifies the problem by ID or title and executes the code against local test cases. The project currently covers about 1.4k problems and supports Python, C++, Rust, Java, Go, TypeScript, Swift, and others. It's still an MVP — system design, SQL, and concurrency problems are not supported yet. It's written in Haskell.

## Objective

Ship a local-first LeetCode runner that mirrors the practice experience but keeps the solutions and tests in the learner's own git repo, so progress is versioned and reviewable. Make it language-agnostic enough that the runner can stay out of the way of whatever stack the learner is practising.

## Target Users

1. **Self-taught developers prepping for interviews** who want a versioned history of their practice solutions, not a web dashboard that erases progress.
2. **Engineers practising in a non-mainstream language** (Rust, Swift, Haskell itself) who can't rely on LeetCode's hosted runners for their language.
3. **Coding bootcamps and study groups** who want shared test fixtures and a CLI that integrates with their existing git workflow.

## MVP Scope

- CLI that takes a problem ID or title and the path to a solution file.
- Local test runner that executes the solution against the project's bundled test cases.
- Support for ~1.4k problems across Python, C++, Rust, Java, Go, TypeScript, Swift (per the source).
- Output: pass/fail per test case, with a clear diff on failure.
- New problem types (system design, SQL, concurrency) deferred — explicitly out of scope per the source.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The author wrote it in Haskell. Reasonable to keep that choice unless polyglot language support becomes painful.
- Local-first: no account required, no submission to a hosted judge. The runner should work offline.
- Source post does not name a price. Treat as open source; monetization (if any) is a future decision.
