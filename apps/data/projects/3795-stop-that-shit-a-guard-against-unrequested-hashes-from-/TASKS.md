---
id: "3795"
slug: stop-that-shit-a-guard-against-unrequested-hashes-from-
title: Stop That Shit – a guard against unrequested hashes from coding agents
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49492705"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
tech: [Coding-agent hooks, advisory skill layer, host adapters (Codex/Claude Code/OpenCode/Hermes), local runtime metadata store, paired evals]
---
# Stop That Shit – a guard against unrequested hashes from coding agents

## Phase 0: Scaffold

- [x] Read the repository README to confirm covered paths, the four-question skill and the honesty contract
- [x] Write SPEC.md (this document)
- [x] Implement the hook guard for the documented paths on Codex and Claude Code
- [x] Implement the local runtime metadata store (checked action, context response, permission deny, hostEffect: unobserved)

## Phase 1: Core

- [ ] Implement the advisory skill with the four semantic questions and the skill-only install path
- [ ] Implement OpenCode and Hermes adapters against the shared decision interface
- [ ] Build the paired-eval harness (bad-case/good-case fixtures) and run a real Codex paired run
- [ ] Publish the case library and the EVIDENCE.md separation of tested vs. observed claims

## Phase 2: Deploy

- [ ] Ship per-harness packages (plugin/skill) with documented uninstall paths
- [ ] Grow the case library through the report → counter-example → reproduce → enforcement loop
- [ ] Track harness event-model changes so no adapter silently loses coverage

---

_Generated automatically by Lúa on 2026-08-29_
