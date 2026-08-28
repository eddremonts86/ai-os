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

## Value Proposition

A terminal-native view of Snowflake tasks and their run history, so a data engineer can answer "is task X healthy?" with a single keystroke instead of opening the web console or writing SQL.

## Target Users

- Data engineers and analytics engineers who live in the terminal and only need to inspect, not edit, tasks.
- Data platform on-call engineers running quick checks during an incident.
- Snowflake admins auditing who owns which task and when each one last ran.

## Jobs To Be Done

- When I open my terminal in the morning, I want a single screen of every task in the account with last-run state so I can spot a failure before anyone reports it.
- When a task fails, I want to drill into its recent runs and see the duration so I can tell whether the failure is a one-off or a trend.
- When I am on call, I want to check a task's health without opening the web console so I can stay in the keyboard-driven incident flow.

## Success Metrics

- Number of distinct Snowflake accounts the TUI is configured against (proxy for adoption).
- Time from app launch to "all tasks listed" on a mid-size account, as a latency signal.
- Number of drill-downs per session (proxy for "people found a real use").

## Competitive Landscape

_Source does not name any competing product._ The post links the snowtask repo only; no comparable Snowflake TUI is named.

## Risks & Open Questions

- Snowflake's `INFORMATION_SCHEMA` for tasks is heavy on large accounts; the query path needs pagination or a hard cap to keep the TUI responsive.
- Credential handling in a TUI is a sharp edge; `keyring` integration must work on macOS, Linux, and Windows or the app must fall back to env vars with a clear warning.
- Read-only is the contract; if the codebase ever grows an "execute now" button, that has to be opt-in and clearly labelled.
- The post links a single repo; whether the tool will ship as a Python package, a `pipx install`-able CLI, or a single binary is undecided.
