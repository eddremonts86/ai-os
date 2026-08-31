---
id: "3825"
slug: vibeguard-security-linter-for-ai-generated-code
title: VibeGuard – security linter for AI-generated code
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49494097"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
tech: [Tree-sitter AST parsing, security rule engine, hardcoded secret detection, SQL injection and JWT rule set, zero-config CLI, A-F grade reporter]
---
# VibeGuard – security linter for AI-generated code

## Tech Stack

Chosen for a zero-config scanner that must understand code structure without any project setup.

- **Tree-sitter AST parsing:** structural analysis across languages without depending on any IDE.
- **Security rule engine:** each rule (injection, secrets, JWT) implemented as a pattern over the AST.
- **Hardcoded secret detection:** entropy and pattern scans for keys, tokens and passwords in code.
- **SQL injection and JWT rule set:** the three named vulnerability classes plus the wider rule pack.
- **Zero-config CLI:** no config file required; defaults ship working.
- **A-F grade reporter:** aggregates rule hits into a letter grade per file and project.

## Architecture

- **Parser front end:** turns source into ASTs via tree-sitter.
- **Rule pack:** SQL injection, hardcoded secrets, JWT bypass and 15+ more, each with a severity.
- **Scanner:** walks ASTs, runs rules, collects findings with file and line.
- **Grader:** maps finding severity to an A–F grade.
- **Reporter:** prints findings and grade for CLI and review-tool consumption.

## Milestones

1. **M0 — Scanning core.** Parse a file, run SQL-injection and hardcoded-secret rules, print findings.
2. **M1 — Grade.** A–F per file and project, with the JWT bypass rule in the pack.
3. **M2 — Rule breadth.** The claimed 15+ additional rules land with tests.
4. **M3 — Zero-config polish.** Run on a directory with no setup and get a grade, in CI as well as locally.

## Risks

- **False positives:** AI-generated code is noisy; precision decides whether developers keep running it.
- **Rule coverage unknown:** only three rule classes are named; the rest is a count.
- **Language surface:** unstated in the capture; breadth costs engineering time.
- **Moving target:** assistants evolve, and so do the flaws they produce.
- **Trust:** a self-built security tool needs public validation before teams rely on its grades.
