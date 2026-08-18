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

## Tech Stack

Chosen for this problem:
- **Haskell** for the runner core — matches the author's existing implementation and gives a single static binary.
- **Language-specific runners** invoked via subprocess (Python, C++, Rust, Java, Go, TypeScript via Node, Swift) — the Haskell core just orchestrates compilation and execution.
- **JSON / YAML** for problem metadata and test fixtures, versioned alongside the learner's solution.
- **Git-friendly layout**: solutions and tests live in the user's repo; no central account required.

## Architecture

```
+------------------+    problem id    +---------------------+   subprocess   +-------------------+
|  Learner shell   | ---------------> |  openleetcode CLI   | -------------> |  Language runner  |
|  (terminal)      |                  |  (Haskell core)     |               |  (python3, cargo,  |
|                  | <--------------- |                     | <-----------  |   rustc, javac,   |
|                  |   pass/fail diff |                     |   stdout/stderr|   go run, tsc...) |
+------------------+                  +---------------------+                +-------------------+
                                              |
                                              v
                                      +--------------------+
                                      |  Problem + tests   |
                                      |  (JSON in repo)    |
                                      +--------------------+
```

The CLI looks up the problem by ID or title in the bundled metadata, finds the user's solution file, and shells out to the right language toolchain. Output is a clean pass/fail per test case with a unified diff on failure.

## Milestones

- **M1 (already done per the source):** ~1.4k problems, 7+ language runners, problem lookup by ID or title.
- **M2 (week 1–2):** unify the language-runner invocation behind one adapter interface so adding a new language is a small change.
- **M3 (week 3):** improved diff output on failure (unified diff, expected vs actual side-by-side).
- **M4 (week 4):** watch mode: re-run on file save.
- **M5 (week 5+):** explore adding problem types currently out of scope (system design, SQL, concurrency) only if there's user pull.

## Risks

- **Problem-set provenance.** The project bundles ~1.4k problems; staying within fair-use / problem-licence boundaries is a legal surface, not just a technical one.
- **Haskell-as-tooling.** Keeps the dependency surface small but raises the contribution bar. Worth tracking contributor experience explicitly.
- **Compiler availability across platforms.** Each language runner assumes the user's machine has the toolchain installed (rustup, javac, go, tsc); the CLI should detect missing toolchains and emit a clean error rather than a stack trace.
- **No monetization plan in the source.** Open-source sustainability is an open question.
