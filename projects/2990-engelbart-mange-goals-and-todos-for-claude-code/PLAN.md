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

## Tech Stack

Chosen for this problem:
- **TypeScript / Node.js** — Claude Code plugins are typically authored in TS.
- **Claude Code plugin SDK** for hooks and prompt injection.
- **SQLite** for the goals + TODOs ledger, versioned by session.
- **A minimal web UI** (HTMX + Alpine, or React) for editing and reviewing state.
- **Local-first** by default; an optional hosted sync is a future option, not v1.

## Architecture

```
+------------------+   session log   +----------------------+   inference   +-------------------+
|  Claude Code     | --------------> |  Engelbart plugin    | ------------> |  LLM (Claude)     |
|  session         |                 |  (Claude Code hook)  |               |  for goals/TODOs  |
|                  | <-------------- |                      | <----------   |  extraction       |
+------------------+ injected goals  +----------------------+               +-------------------+
                                          |
                                          v
                                  +--------------------+
                                  |  SQLite ledger     |
                                  |  goals, TODOs,     |
                                  |  per-session state |
                                  +--------------------+
                                          |
                                          v
                                  +--------------------+
                                  |  Web UI (local)    |
                                  |  edit + review     |
                                  +--------------------+
```

The plugin reads the session log, runs an LLM extraction to derive goals + TODOs, persists them in SQLite, and injects a compact summary back into the next Claude Code turn. The web UI lets the user edit or override the inferred state.

## Milestones

- **M1 (week 1):** Claude Code hook that reads session turns and writes a raw goals/TODOs extract to SQLite.
- **M2 (week 2):** inference layer that converts the raw extract into a curated goals + TODOs list.
- **M3 (week 3):** web UI for review/edit; user can correct the inference.
- **M4 (week 4):** context injection at the start of a new turn — Claude Code receives the goals/TODOs as a system-prompt preamble.
- **M5 (week 5+):** explore cross-tool support if the Claude Code hook abstraction is portable.

## Risks

- **Claude Code plugin API stability.** Plugins in this space break across Claude Code updates; Engelbart should be small, well-isolated, and easy to patch.
- **Inference quality.** Goals extracted from one conversation can be noisy; the user-editable UI is the mitigation, not the inference itself.
- **Privacy surface.** Shipping a web UI implies state leaves the user's machine unless explicitly local-first; default should be local-only.
- **Lock-in to one vendor's tool.** Out of scope for v1 per the source, but the architecture should not preclude porting to other agent harnesses later.
