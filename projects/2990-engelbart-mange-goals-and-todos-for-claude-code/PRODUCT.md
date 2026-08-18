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

## Value Proposition

An open-source Claude Code plugin that infers your goals and TODOs from past conversation turns, surfaces them in a web interface, and injects them back at the start of the next turn. You stop re-explaining what you're building every time a chat compacts.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Claude Code power users on long-running projects | Stop losing intent when chats compact. |
| Teams sharing Claude Code across sessions | Want an explicit goals ledger, not scattered context. |
| Developers building complex multi-step features | Want the next session to inherit what the last one knew. |

## Jobs To Be Done

1. **Functional job** — keep a living map of "what we're trying to build" across compaction boundaries.
2. **Emotional job** — stop dreading the moment a useful chat compacts and the context evaporates.
3. **Social job** — be able to point a collaborator at the goals ledger when handing off.

## Success Metrics

- **Activation:** time from plugin install to first inferred goals/TODOs surfaced.
- **Retention:** weekly active developers using the plugin across multiple Claude Code sessions.
- **Quality:** self-reported confidence delta ("did the next session remember what we were doing?").

## Pricing & Monetization

The source post does not name a price. Treat as open source. Reasonable future paths: hosted goal storage with team plans, premium inference models, or GitHub Sponsors. Pricing is left as an open question.

## Competitive Landscape

- **Claude Code's own /compact and /clear commands** — manual and chat-scoped, no persistent goals ledger.
- **Planlog (project 678)** — agent plan coordination for dev teams; heavier (multi-agent), more about approval workflow than long-running memory.
- **Repobrain (project 540)** — persistent project memory for coding agents via git history + PRs + Slack/Notion indexing; Engelbart is conversation-scoped rather than repo-scoped.
- **Cursor's rules + project context** — IDE-bound and prompt-injected; less structured than a goals ledger.

## Risks & Open Questions

- [ ] Inference quality is bounded by Claude Code's session context; the plugin should make clear what it can and cannot recover.
- [ ] Claude Code plugin API stability: plugins in this space tend to break across Claude Code updates.
- [ ] Privacy: shipping a web interface means goals leave the user's machine; local-first mode is probably required.
- [ ] Cross-tool support: out of scope for v1 per the source, but the architecture should not lock it out.
