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

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/3653-hacker-news-client-with-claude-code-and-codex-integrati/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Build the Tauri shell with cross-platform bundles for macOS, Windows and Linux
- [ ] Fetch a post and its comments from the Hacker News API by URL or post ID
- [ ] Generate a cited rundown with each bit hyperlinked back to the source comment
- [ ] Bound the comment-tree walk to a stated depth so the rundown is fast and bounded
- [ ] Implement the chat surface that routes to Claude Code CLI or Codex CLI as a subprocess
- [ ] Persist fetched posts and rundowns in a local SQLite store
- [ ] Add a small settings surface for the default runner and model
- [ ] Verify the citation links resolve to the correct comment ID in every rundown
- [ ] Handle the case where neither Claude Code nor Codex is installed and surface that clearly
- [ ] Document the supported comment depth and the token budget it implies

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-28_
