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

> Product brief for the open-source token-efficiency linter linked from the Show HN post.

## Value Proposition

A developer can lint their LLM prompts the way they lint code: catch token waste, repeated boilerplate, and bloat before it ships, with findings that surface in CI and in the editor. The rules, the tokenizer integration, and the CLI are all open source.

**One-liner:** ESLint for LLM prompts — find the token waste before it costs you.

## Target Users

| Stakeholder | Why they care |
|---|---|
| LLM application developers | Want to catch prompt inefficiency at write time, not in the next month's bill. |
| Agent builders | Ship prompts that grow by accretion; need a refactor-pass surface that is not manual. |
| Platform / DevEx teams | Want a CI green/red signal for prompt efficiency on every change. |
| Cost-conscious founders | Want a tool that pays for itself by surfacing the prompt that doubled the bill. |

The source frames the user as the developer, not the end user of any single LLM app.

## Jobs To Be Done

1. **Functional job** — Scan LLM prompts in code or as files and emit findings (severity, location, rule) that surface in CI and in the editor.
2. **Functional job** — Count tokens against the tokenizer for the provider being billed, not against a generic approximation.
3. **Functional job** — Ship a starter rule set that catches the common offenders without the user writing a config file first.
4. **Emotional job** — Stop being surprised by the bill: make token cost a first-class lint signal.

## Success Metrics

- **Activation:** install → run on a sample repo → see findings, in under 5 minutes, with no config file required.
- **CI integration:** zero-config run on a typical LLM-app repo produces a non-empty finding list when the prompts are wasteful, and a clean run when they are not.
- **Editor integration:** findings show up in the developer's editor via standard problem-matcher formats.
- **Coverage:** the README states which tokenizers are supported and which providers they map to.

The post does not state a revenue target. The project is shipped as an open-source tool.

## Pricing & Monetization

The post does not name a price or business model. The "open-sourced" framing in the title and the "linter" category both signal a free, developer-first tool. Any monetization (a hosted version, a paid rule pack) would be a post-MVP addition and is out of scope for this plan.

## Competitive Landscape

- **ESLint / RuboCop / general linters** — excellent at code style, but unaware of token cost or prompt structure.
- **Token-counting CLIs** (tiktoken-based tools, Anthropic's count-tokens API) — count tokens accurately but do not flag patterns.
- **Hosted prompt-analytics SaaS** — give dashboards and historical cost curves, but require uploading prompts and a vendor relationship.

The project's differentiator is the explicit "linter for prompts" framing: a developer-tool that runs locally, fits in CI, and gives actionable findings, not a hosted dashboard.

## Risks & Open Questions

- [ ] The post does not name the supported tokenizers or providers; the README must state which ones are tested and which are best-effort.
- [ ] Token count is provider-specific; a finding of "X tokens saved" must be tied to a specific tokenizer, not a generic approximation.
- [ ] False positives erode trust quickly; the rule set must be conservative by default and let users tune severity, not the other way around.
- [ ] Auto-fix suggestions are tempting but easy to get wrong (rewrites that change semantics); the MVP should be honest about which rules can safely auto-fix and which cannot.
- [ ] Lint rules age as provider APIs change; the project needs a clear deprecation story for rules tied to a specific API surface.
