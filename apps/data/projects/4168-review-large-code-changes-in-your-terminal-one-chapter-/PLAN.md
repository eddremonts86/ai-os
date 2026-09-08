---
id: "4168"
slug: review-large-code-changes-in-your-terminal-one-chapter-
title: "Review large code changes in your terminal, one chapter at a time"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49511126"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---

# Review large code changes in your terminal, one chapter at a time

## Tech Stack

The chosen stack — React, TypeScript, TanStack Start, SQLite with Drizzle ORM, Coolify, Docker — is the web/docs side (a thin docs site plus a server-side companion for hosting shared review links if needed). The TUI itself is a separate native binary; the stack is not changed here.

## Architecture

Native TUI binary that talks to git for the diff and to an optional agent skill for the narration. A small TanStack Start backend persists shared review links and per-chapter comments when the user opts into sharing. SQLite/Drizzle holds comment state. Coolify hosts the docs and the optional share endpoint behind Docker.

## Milestones

- M1 — Core TUI that walks a diff chapter by chapter.
- M2 — Agent skill that emits a guided-tour narration.
- M3 — Per-chapter comment capture.
- M4 — Round-trip: comments sent back to the agent.
- M5 — `revue diff` mode for no-narration review.

## Risks

- TUI ergonomics risk; mitigation is to test against real reviewers early.
- Agent skill quality risk; mitigation is to keep the narration optional and editable.
- Distribution risk (low discoverability); mitigation is to publish clear install instructions and a screencast.
