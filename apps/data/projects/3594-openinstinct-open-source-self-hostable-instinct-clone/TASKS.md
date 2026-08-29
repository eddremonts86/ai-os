---
id: "3594"
slug: openinstinct-open-source-self-hostable-instinct-clone
title: "OpenInstinct – open-source, self-hostable Instinct clone"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49479314"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [Eve (agent framework), Linq (iMessage), Kernel (browser use / credential injection), Postgres, Vercel AI Gateway, Google Workspace connector]
---
# OpenInstinct – open-source, self-hostable Instinct clone

## Phase 0: Scaffold

- [x] Capture problem from HackerNews + write SPEC.md skeleton
- [ ] Pick the OSS license and write CONTRIBUTING + SECURITY policy stubs
- [ ] Single-host install plan: Postgres + Eve + Kernel + Linq + Vercel AI Gateway wired together
- [ ] Vault Postgres schema: cards, logins, personal information, with encryption-at-rest keys managed outside the DB
- [ ] Decide the credential-injection contract between the vault and Kernel (what gets injected, what gets redacted in logs)
- [ ] Decide the model gateway fallback story (Vercel AI Gateway today; local model gateway documented as the future)
- [ ] Beta-warning banner copy for the README and the operator UI

## Phase 1: Core

- [ ] Eve durable agent runtime: task lifecycle (created → running → succeeded / failed / needs-input), Postgres-backed
- [ ] Linq iMessage channel: inbound messages become tasks, task status is mirrored back into the iMessage thread
- [ ] Kernel browser-use layer: launch authenticated sessions from vault credentials; record every step for replay
- [ ] Vercel AI Gateway: model-agnostic Eve config, swap providers without code changes
- [ ] Google Workspace connector (Gmail read at minimum, so the subscription-cleanup task is reachable)
- [ ] Vault UI: list / add / edit / delete entries; per-entry scope (what the agent is allowed to do with it)
- [ ] Three example tasks reproducible end-to-end on a clean install: theatre tickets, golf grip trainer, subscription cleanup
- [ ] Self-host quick-start: documented single-host install that brings the whole stack up
- [ ] Connector contract published, so the community can add connectors beyond Google Workspace
- [ ] Docs: install + beta warning + contributor onboarding + the three example tasks as worked walkthroughs

## Phase 2: Deploy

- [ ] Public GitHub repo with the stack, the connectors, and the docs in one tree
- [ ] Demo videos / GIFs for each of the three post example tasks (theatre tickets, golf grip trainer, subscription cleanup)
- [ ] Beta call for contributors on HackerNews and adjacent channels, pointing at the issue tracker
- [ ] First wave of community-contributed connectors landed and documented
- [ ] Post-mortem at the end of beta: false-positive / false-negative task outcomes, vault-leak incidents, install friction, connector reliability
