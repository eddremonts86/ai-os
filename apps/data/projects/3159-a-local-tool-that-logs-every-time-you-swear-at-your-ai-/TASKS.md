---
id: "3159"
slug: a-local-tool-that-logs-every-time-you-swear-at-your-ai-
title: A local tool that logs every time you swear at your AI coding assistant
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49447045"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
---
# A local tool that logs every time you swear at your AI coding assistant

## Phase 0: Scaffold

- [ ] Pick language and CLI scaffolding
- [ ] Keystroke/terminal-based detector (no audio)
- [ ] Pluggable word list (config file)
- [ ] Append-only JSONL log
- [ ] Weekly summary print-out
- [ ] README documenting the privacy model
- [ ] No design system; CLI only

## Phase 1: Core

Implement local detector, append-only log file, weekly summary print-out.

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify (or chosen host)
- [ ] Verify in production
