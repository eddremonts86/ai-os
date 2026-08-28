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

## Problem

Snowflake tasks — scheduled SQL jobs — are visible in the web console and via SQL, but inspecting the live state of one (last run, next run, current state, warehouse, schedule) means either opening the console, running a hand-written query against `INFORMATION_SCHEMA`, or scrolling the task history in a UI that is slow on large accounts. A terminal UI that lists tasks, shows their last/next run, and drills into one task's run history covers the daily ops loop without a browser.

## Objective

Ship a terminal application that lists every task in the current Snowflake account/warehouse context, lets the operator filter and drill into one task, and shows its last runs with status and duration — all without leaving the terminal.

## Target Users

- Data engineers and analytics engineers who live in the terminal and want to skip the Snowflake web console for the daily task-check.
- Data platform on-call engineers who need to answer "what was the last state of task X?" without writing SQL each time.

## MVP Scope

- A task list view: task name, schedule, warehouse, last run state, last run timestamp.
- Keyboard navigation: arrow keys to move, `/` to filter by name, `Enter` to drill into one task.
- A task detail view: full schedule, last N runs with state and duration, owner, and the SQL definition (read-only).
- Connection configuration via the standard Snowflake creds in the environment or a config file; credentials are read from `keyring` and never stored in plaintext.
- A "refresh" keybinding that re-queries the task metadata on demand.
- Out of scope: editing tasks, creating tasks, executing tasks on demand, multi-account switching.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The app is read-only: it never issues `ALTER TASK` or any write against the account.
- Credentials are loaded from `keyring` or environment variables only; the app does not write them to disk in plaintext.
- Each visible query is bounded (e.g. last 50 runs) so the app does not pull thousands of rows over a slow link.
- The app must degrade gracefully if Snowflake is unreachable: show a clear connection error, do not crash.
