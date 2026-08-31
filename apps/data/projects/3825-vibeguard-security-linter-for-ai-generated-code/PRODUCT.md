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

## Value Proposition

A second opinion for AI-generated code. VibeGuard is a security linter that targets exactly what Copilot, Cursor and ChatGPT get wrong — the capture names SQL injection, hardcoded secrets and JWT bypass plus "15+ more" rules — and grades the result A–F so a developer knows whether the generated code is safe to ship. Zero configuration: run it, read the grade.

**One-liner:** A zero-config security linter that grades AI-generated code A–F and catches SQL injection, hardcoded secrets, JWT bypass and more.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Developers using Copilot, Cursor or ChatGPT | A security check on code their assistant produced. |
| Teams reviewing AI-written PRs | A grade and rule hits per diff, at review time. |
| Security-conscious engineers | A fast, zero-setup second opinion before merge. |

The post frames the users as anyone who gets code from an AI assistant and has to trust it.

## Jobs To Be Done

1. **Functional job** — Scan a codebase for the named vulnerability classes without configuration.
2. **Functional job** — Get an A–F grade that summarizes whether the code is safe to ship.
3. **Functional job** — Catch the mistakes assistants introduce: SQL injection, hardcoded secrets, JWT bypass.
4. **Functional job** — Fit into an existing review flow rather than requiring a new toolchain.

## Success Metrics

- **Rules shipped:** the three named classes plus the claimed 15+ more are detectable.
- **Zero-config hold:** a first scan runs with no setup file and produces a grade.
- **Signal quality:** findings are rule-cited (file and line) and low in obvious false positives.
- **Adoption:** developers run it on AI-generated code — the post names no numbers, so this is directional.

## Pricing & Monetization

None stated. The capture announces the tool's behavior, not a business model; no price, plan or license appears.

## Competitive Landscape

The post does not name competitors. The product sits in the static application security testing (SAST) category — linters and scanners for injection, secrets and auth flaws — where the stated differentiators are the AI-generated-code focus and the zero-config A–F grading, aimed at code assistants rather than at hand-written codebases.

## Risks & Open Questions

- [ ] The "15+ more" rules are unlisted; the real coverage surface is unknown from the capture.
- [ ] False positives are the standard failure mode of security linters, and AI-generated code is a high-noise corpus.
- [ ] No language or framework support is stated; the tool may cover only a narrow slice.
- [ ] Security scanners earn trust slowly; a self-graded A–F scale needs independent validation.
- [ ] AI assistants change behavior constantly; rule sets tuned today may miss tomorrow's mistakes.
