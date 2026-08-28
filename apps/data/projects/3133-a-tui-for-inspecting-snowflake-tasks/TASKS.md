---
id: "3133"
slug: a-tui-for-inspecting-snowflake-tasks
title: A TUI for Inspecting Snowflake Tasks
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49449412"
  captured: "2026-08-26"
category: show-hn
date: "2026-08-26"
tags: [Show HN, TUI, Snowflake, Data, DevOps]
tech: [Python, Textual, Snowflake Connector, keyring]
---
# A TUI for Inspecting Snowflake Tasks

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/3133-a-tui-for-inspecting-snowflake-tasks/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment
- [ ] Confirm the Snowflake connector works against a dev account
- [ ] Document the credential flow: `keyring` first, env vars as fallback

## Phase 1: Core

- [ ] Connection module: `keyring` lookup with env-var fallback, clear error banner on failure
- [ ] Task list query (`SHOW TASKS`) with a Textual virtualised table
- [ ] Filter binding (`/`) and refresh binding (`r`)
- [ ] Task detail screen: full schedule, last N runs with state and duration
- [ ] Read-only guard: app refuses to issue non-`SELECT` statements
- [ ] Connection-status banner at the top of every screen
- [ ] Packaged CLI entry point installable via `pipx`

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-26_
