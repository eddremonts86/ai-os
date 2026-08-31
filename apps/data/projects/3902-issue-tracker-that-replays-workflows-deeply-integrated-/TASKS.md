---
id: "3902"
slug: issue-tracker-that-replays-workflows-deeply-integrated-
title: "Issue tracker that replays workflows, deeply integrated with the code [video]"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49496437"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [Git-native storage, event sourcing, deterministic state log, time-travel replay UI, agent workflow tracing, static site deployment]
---
# Issue tracker that replays workflows, deeply integrated with the code [video]

## Phase 0: Scaffold

- [x] Read the Show HN post and the linked demo
- [x] Write SPEC.md, PRODUCT.md, PLAN.md and TASKS.md
- [x] Scaffold the issue store as Git-tracked files
- [x] Define the event schema for state changes

## Phase 1: Core

- [ ] Append an event on every issue mutation
- [ ] Derive issue state by folding the event log
- [ ] Build the replay player with scrub controls
- [ ] Render state at arbitrary points in the log

## Phase 2: Deploy

- [ ] Add tracing hooks for agent workflows
- [ ] Build multi-agent demo scenarios
- [ ] Polish the public showcase site
- [ ] Collect feedback from teams running agentic workflows
