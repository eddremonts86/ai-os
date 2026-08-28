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

## Tech Stack

- Python because the Snowflake connector is Python-first and the team (data engineers) already works in Python.
- Textual for the TUI framework; it gives keybindings, scrollable widgets, and a sane async story for the slow Snowflake queries.
- The official Snowflake Connector for Python to issue the read-only metadata queries.
- `keyring` for cross-platform credential storage with env-var fallback.
- A small in-process cache so the list view does not re-query Snowflake on every keystroke.

## Architecture

- A connection module reads creds from `keyring` (or env vars as fallback), opens a Snowflake session, and exposes a thin async query helper.
- A metadata service issues the read-only queries: `SHOW TASKS`, the task-history view, and the schedule/warehouse joins.
- A list screen renders the task table with a virtualised widget; a detail screen renders one task with its last N runs.
- Keybindings: arrows for movement, `/` for filter, `Enter` for drill-in, `r` for refresh, `q` for quit.
- A connection-status banner at the top of every screen so a failed connection is visible at a glance.

## Milestones

1. Snowflake session bootstrap from `keyring`/env, with a clear error banner on failure.
2. Task list query and a Textual table widget showing the columns.
3. Filter (`/`) and refresh (`r`) keybindings.
4. Task detail screen with last-N-runs table.
5. Read-only guard: the app refuses to send any non-`SELECT` statement.
6. Packaged as a `pipx`-installable CLI with a single entry point.

## Risks

- The `SHOW TASKS` query is the long pole; on accounts with thousands of tasks it can take seconds. Pagination or a default filter is necessary.
- `keyring` on headless Linux requires a Secret Service; the app must document this and offer a clean env-var fallback.
- TUI rendering on Windows Terminal can mis-render some Unicode box characters; the design must pick characters that render reliably.
- A future "execute task" feature would change the read-only contract; the architecture should not make it trivial to add.
