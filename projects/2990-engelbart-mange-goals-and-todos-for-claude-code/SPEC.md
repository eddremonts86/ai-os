---
id: "2990"
slug: engelbart-mange-goals-and-todos-for-claude-code
title: Engelbart – Mange Goals and TODOs for Claude Code
status: enriched
source:
  name: manual
  url: "https://news.ycombinator.com/item?id=49337325"
category: show-hn
date: "2026-08-17"
tags: [Show HN, Product, Problem]
---
# Engelbart – Mange Goals and TODOs for Claude Code

## Problem

The author kept losing the thread of what they were trying to build. As Claude Code chats compacted and projects grew more complex, the context about goals and TODOs got mixed up or dropped. They built Engelbart, an open-source Claude plugin that infers goals and TODOs from previous conversation turns, presents them via a web interface, and injects them back into the next Claude Code turns. The user can also update project goals directly.

## Objective

Ship an open-source companion to Claude Code that maintains a living map of "what we're trying to build" across compaction boundaries. End state: a developer can re-enter any conversation and the assistant already knows the goals, the TODOs, and where the previous session left off.

## Target Users

1. **Claude Code power users on long-running projects** whose chats compact and lose the original intent.
2. **Teams using Claude Code across multiple sessions** who want a shared, explicit goals ledger rather than scattered context.
3. **Developers building complex multi-step features** where the next session has to inherit knowledge the previous one had.

## MVP Scope

- Inference of goals + TODOs from past conversation turns.
- Web interface that surfaces the inferred state and lets the user edit it.
- Plugin integration that injects the goals/TODOs back into Claude Code's context at the start of a new turn.
- Persistence across compaction (state lives outside the chat).

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Source post does not name a price; treat as open source.
- Claude Code-specific for v1 (per the post); cross-tool support is out of scope unless the architecture allows it.
- Inference quality depends on Claude Code's session context; the plugin must be honest about what it can and cannot recover.
