---
id: "3727"
slug: tokensift-an-open-sourced-token-efficiency-linter-for-l
title: "Tokensift, an open-sourced token-efficiency linter for LLM prompts"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49487500"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
tech: [Node.js, TypeScript, LLM tokenizers, ESLint-style CLI, OpenAI/Anthropic tokenizer support]
---
# Tokensift, an open-sourced token-efficiency linter for LLM prompts

## Tech Stack

- **CLI runtime:** Node.js + TypeScript — chosen for the maturity of the JavaScript tokenizer ecosystem (tiktoken-style implementations, easy distribution via npm) and parity with the ESLint developer experience.
- **Tokenizer integration:** vendor-supported tokenizers for the providers the linter claims to support (the README lists them). Each rule's token-count finding must cite which tokenizer was used.
- **Rule engine:** an ESLint-shaped rule architecture: a config file, a starter rule set, and per-rule severity that defaults to warn or error.
- **Output formats:** both human-readable (terminal table with file:line) and machine-readable (SARIF or a JSON shape) so findings flow into CI and into editors via standard problem-matchers.
- **Distribution:** an npm-installable CLI (`npx tokensift …` or a globally-installed binary), published alongside the repo at github.com/ritenv/tokensift.

## Architecture

```
┌────────────┐    ┌────────────┐    ┌────────────┐    ┌────────────┐
│ Source     │───▶│ Parser     │───▶│ Rule       │───▶│ Findings   │
│ (files,    │    │ (extract   │    │ engine     │    │ (terminal  │
│  stdin,    │    │  prompt    │    │ (per       │    │  + SARIF   │
│  dir)      │    │  strings)  │    │  provider) │    │  + JSON)   │
└────────────┘    └────────────┘    └────────────┘    └────────────┘
                                              │
                                              ▼
                                       ┌────────────┐
                                       │ Tokenizer  │
                                       │ (per       │
                                       │  provider) │
                                       └────────────┘
```

The parser isolates prompt-shaped strings from source files; the rule engine fires findings against those strings with the chosen tokenizer; the formatter emits the result.

## Milestones

1. **M0 — Provider and rule agreement.** Lock the supported tokenizers / providers and the starter rule set. These are repo-level decisions, not product features.
2. **M1 — Working CLI + starter rules.** A runnable CLI that emits findings on a sample repo, with at least the common offenders (repeated boilerplate, long system prompts, redundant context).
3. **M2 — Output formats + CI integration.** Human-readable and SARIF / JSON output, plus a documented problem-matcher for at least one editor.
4. **M3 — Config and tuning.** A config file that lets users tune rule severity, opt out of rules, and pin the tokenizer per provider.

## Risks

- **Tokenizer drift.** Provider tokenizers evolve; the linter must pin versions or surface the version used in each finding.
- **False positives.** Over-eager rules quickly become noise; severity defaults must be conservative.
- **Auto-fix temptation.** Auto-rewriting prompts is risky; the MVP should be honest about which rules can deterministically fix and which can only flag.
- **Provider scope.** Supporting every provider is unbounded; the README must state the supported list and the path for adding more.
- **Lint-rule aging.** Provider APIs change; rules tied to a specific API surface need a clear deprecation story, or they rot silently.
