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

## Problem

The Show HN post is URL-only: it points at [github.com/ritenv/tokensift](https://github.com/ritenv/tokensift) with the title "Tokensift, an open-sourced token-efficiency linter for LLM prompts" as the only inline content. Reading the title literally, the project is a linter — in the ESLint sense — applied to LLM prompts: it warns when a prompt is inefficient in token terms, so a developer can fix it before paying the per-token cost.

The underlying problem this responds to is that LLM prompts are easy to write wastefully and hard to audit. A repeated paragraph, a verbose system preamble, an unnecessarily long context block, or a tool description that runs on every turn all cost money and latency, and the cost is invisible at write time. Builders of agent systems in particular ship prompts that grow by accretion, and a refactor pass for token efficiency is usually manual. Tokensift positions itself as the lint step that catches this in CI.

The source does not name the supported model providers, the rules, the integration with editor tooling, or the output format. Those choices live in the repo, not in the post.

## Objective

Ship an open-source linter that scans LLM prompts (in code or as standalone files) and flags token-inefficient patterns, with an output format developers can act on in CI and in their editor. The MVP targets the "lint your prompts before they cost you" promise. It does not target a hosted SaaS, a paid rule pack, or a model-training service.

## Target Users

- LLM application developers who want to catch token waste before it ships, the way ESLint catches style issues before they ship.
- Agent builders shipping prompts that grow by accretion and need a refactor pass surface.
- Platform teams running CI on prompt-bearing code who want a green/red signal for prompt efficiency.

The post does not name enterprise or team use; the "linter" framing is developer-tool-first by construction.

## MVP Scope

- A CLI that scans a file, a directory, or stdin and emits token-efficiency findings with severity, location, and the rule that fired.
- A tokenizer-based token counter for the providers the linter supports (the post does not state which ones; the README should).
- A starter rule set: at least the common offenders — repeated boilerplate, overly long system prompts, redundant context, unnecessarily high sampling temperature comments in the prompt text, etc.
- An output format that works in CI: machine-readable for pipelines, human-readable for editors.

The MVP does not include a hosted dashboard, a paid rule marketplace, or auto-fix suggestions beyond what the rules can deterministically rewrite.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Open source: the rules, the tokenizer integration, and the CLI are all in the repo. No proprietary rule pack locked behind a SaaS.
- Deterministic and explainable: a finding must say which rule fired and why. "Saves tokens" without a reason is not a lint message.
- Provider-honest: the linter must state which tokenizer it uses for each provider; counting tokens against a model that is not the one being billed is misleading.
- CI-friendly: zero-config entry path so a developer can run it on a repo without writing a config file first.
- Editor-friendly output: the output format must support the common editors' problem-matchers so findings show up inline, not in a separate log dump.
