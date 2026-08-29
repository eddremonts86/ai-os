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

## Phase 0: Scaffold

- [x] Create the project folder under `apps/`
- [x] Initialise the git repo
- [x] Copiar `edd-app-template` → `apps/3727-tokensift-an-open-sourced-token-efficiency-linter-for-l/`
- [x] Write SPEC.md (this document)
- [x] Write DESIGN.md (tokens + visual direction)
- [x] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [x] Set up the development environment
- [x] Read github.com/ritenv/tokensift to confirm the URL-only framing and check for the supported-provider list

## Phase 1: Core

- [ ] Lock the supported tokenizers / providers; document the list in the README
- [ ] Implement the prompt-string extractor (handles strings in JS/TS, Python, standalone prompt files)
- [ ] Implement the starter rule set (repeated boilerplate, long system prompts, redundant context, etc.) with conservative defaults
- [ ] Implement human-readable and SARIF / JSON output
- [ ] Add a documented problem-matcher for at least one editor

## Phase 2: Deploy

- [ ] Publish the npm package and the github.com/ritenv/tokensift repo
- [ ] Document the config file format (rule severity, opt-out, tokenizer-per-provider)
- [ ] Verify a zero-config run on a sample LLM-app repo produces useful findings

---

_Generated automatically by Lúa on 2026-08-29_
