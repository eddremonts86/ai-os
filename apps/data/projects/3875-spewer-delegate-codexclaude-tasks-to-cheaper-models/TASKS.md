---
id: "3875"
slug: spewer-delegate-codexclaude-tasks-to-cheaper-models
title: Spewer – Delegate Codex/Claude tasks to cheaper models
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49499265"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [Model routing, Codex CLI integration, Claude Code integration, Task classification rules, Cost ledger, Escalation fallback]
---
# Spewer – Delegate Codex/Claude tasks to cheaper models

## Phase 0: Scaffold

- [x] Read the capture and confirm the bare GitHub link plus title claim
- [x] Write SPEC.md (this document)
- [x] Scaffold the delegation tool and stub one Codex or Claude hook
- [x] Pick one cheaper-model provider for the first delegation path

## Phase 1: Core

- [ ] Implement the delegation path end to end on a sample task
- [ ] Add routing rules and the per-task cost ledger
- [ ] Build verification with auto-escalation back to the frontier model

## Phase 2: Deploy

- [ ] Run real sessions and publish savings benchmarks
- [ ] Support the second agent surface (Codex or Claude)
- [ ] Document the routing policy so users can tune it
