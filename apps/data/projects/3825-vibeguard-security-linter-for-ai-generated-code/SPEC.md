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

## Problem

The capture announces a security linter built specifically for AI-generated code — one that "catches what Copilot, Cursor and ChatGPT get wrong" — with rules covering SQL injection, hardcoded secrets, JWT bypass and "15+ more", an A–F grading scale, and zero configuration. The poster positions the tool as the reviewer's second opinion on code an assistant wrote: the same assistants that produce the code do not reliably catch the security flaws in it, so VibeGuard grades the result before it ships.

## Objective

Ship a zero-config linter that scans AI-generated code, flags the named vulnerability classes (SQL injection, hardcoded secrets, JWT bypass) plus the rest of the 18+ rule set, and grades the code A–F so a developer can decide quickly whether to ship it.

## Target Users

- Developers who generate code with Copilot, Cursor or ChatGPT and review it themselves.
- Teams reviewing AI-written diffs in pull requests.
- Security-minded engineers who want a fast, no-setup second opinion.

## MVP Scope

- A zero-config CLI (or linter plugin) with no setup beyond running it.
- Rules for SQL injection, hardcoded secrets and JWT bypass, plus the remaining 15+ rules the post claims.
- An A–F grade per scanned file or project.
- Output that fits a code-review workflow: file, line, rule, grade.

## Constraints

- The "15+ more" rules are named only as a count; their exact list is not in the capture.
- Zero config is a stated property; anything requiring per-project setup would break the pitch.
- Static analysis of AI code is a false-positive game; precision is the product risk, not a feature.
- The capture names no languages, runtimes or integrations.

## Design Direction

See `DESIGN.md` for this project's design tokens.
