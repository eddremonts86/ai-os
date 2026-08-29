---
id: "3653"
slug: hacker-news-client-with-claude-code-and-codex-integrati
title: Hacker News Client with Claude Code and Codex Integration
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49483436"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [Tauri, Rust, TypeScript, React, Hacker News API (Firebase), Claude Code CLI, Codex CLI, SQLite (local)]
---
# Hacker News Client with Claude Code and Codex Integration

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

Rundown is a cross-platform desktop app that turns a Hacker News post and its comment thread into a cited rundown the user can read quickly, with each bit hyperlinked back to the comment it was pulled from, and a chat surface for asking the post or the whole thread a question. The chat is wired to Claude Code and Codex, the user's own locally installed coding-agent CLIs, so the user's existing subscription and credentials are the runtime.

The product's value is the citation design. A summary without citations is just another summary; a summary that links every bit back to the source comment is something the reader can verify and trust, which is what using a local agent on a long thread is for.

**One-liner:** Rundown turns a Hacker News post and its comments into a cited rundown with links back to each source comment, and lets you chat with the post or the whole thread through Claude Code or Codex.

## Target Users

| Stakeholder | Why they care |
|---|---|
| HN readers | They find useful threads but do not have time to read every comment. |
| Knowledge workers | They treat a long HN thread as a research artifact and want a cited summary. |
| Power users | They want to ask follow-up questions of a long thread through their own coding-agent CLI. |
| Researchers and writers | They cite HN threads and want the citation to be a real link, not a paraphrase. |
| Cross-platform users | They want a desktop tool rather than a web page that requires an account. |

## Jobs To Be Done

1. **Functional job** — Get the interesting bits of a long HN thread in a readable order without reading every comment.
2. **Functional job** — Click any bit of the rundown and land on the source comment, so the summary is verifiable.
3. **Functional job** — Ask the post or the thread a follow-up question through Claude Code or Codex.
4. **Functional job** — Return to a previously read rundown without re-fetching the thread.
5. **Emotional job** — Stop feeling guilty about skipping long HN threads.
6. **Social job** — Show that a coding-agent CLI is useful outside the codebase, on long-form text the user already cares about.

## Success Metrics

- **Citation precision** — share of rundown bits whose hyperlink resolves to the correct comment ID, since the citation design is the product's value.
- **Read latency** — time from entering a post URL to a complete rundown being visible, since long waits defeat the purpose.
- **Comment coverage** — share of the post thread's interesting comments surfaced by the rundown, against a stated comment-depth budget.
- **Chat latency** — time from sending a chat message to a response, dominated by the local CLI.
- **Local-store hit rate** — share of re-opened rundowns served from the local SQLite cache rather than re-fetched.
- **Runner availability** — share of sessions where at least one of Claude Code or Codex is installed and the chat works.

## Pricing & Monetization

The post names no price, no tier and no business model. The architecture fixes a specific cost shape regardless: the chat integration is metered by the user's own Claude Code or Codex subscription, the local store is per-user on disk, and there is no hosted inference to recoup. Any future monetisation would therefore be either a per-month tier that unlocks deeper comment coverage or a one-time paid build with bundling, never a per-thread fee, because the user is the only customer.

## Competitive Landscape

- **Hacker News' own site** — shows every comment but does not summarise, so the user reads the whole thread or skips it.
- **Hosted HN summary services** — summarise but do not link back to specific comments, so the summary is unverifiable.
- **Coding-agent CLIs used against HN** — possible but require the user to paste the thread and craft the prompt themselves.
- **Read-later apps with HN integration** — save a thread but do not summarise or chat with it; the post names none specifically, and no competitor is named in the capture, so no further comparison is claimed here.

## Risks & Open Questions

- [ ] Confirm the comment-depth budget so the rundown stays fast and bounded.
- [ ] Establish the citation schema so every rundown bit resolves to the correct HN comment ID.
- [ ] Decide the default runner (Claude Code or Codex) and how the user switches between them.
- [ ] Handle the case where neither Claude Code nor Codex is installed and surface that clearly in the UI.
- [ ] Verify the chat surface works against both runners, since the integration is the product's main claim.
- [ ] Document the local-store schema so a user can find a previous rundown without re-fetching the thread.
