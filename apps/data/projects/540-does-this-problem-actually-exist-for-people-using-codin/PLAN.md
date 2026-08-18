---
tags: ["saas", "developer-tools", "ai-agents", "knowledge-management"]
tech: ["Node.js", "TypeScript", "SQLite", "FTS5", "Model Context Protocol", "GitHub API"]
id: "540"
slug: does-this-problem-actually-exist-for-people-using-codin
title: Does this problem actually exist for people using coding agents daily?
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1voa7mx/does_this_problem_actually_exist_for_people_using/"
category: saas
date: "2026-08-14"
---
# Does this problem actually exist for people using coding agents

## Tech Stack

- **CLI:** Node.js + TypeScript, distributed via npm + a Homebrew tap.
- **Indexing:** ripgrep + a SQLite store with FTS5 for full-text queries.
- **Git / PR source:** `git log` for commits, the GitHub / GitLab API for PR descriptions and comments.
- **MCP server:** the official Model Context Protocol SDK, running as a long-lived process on `localhost`.
- **Local storage:** SQLite at `~/.repobrain/repo-hash.db`.
- **Cloud sync (Pro tier):** Postgres at Supabase, per-team encryption with libsodium.

## Architecture

Three components: the CLI (init, query, suggest, confirm), the MCP server (a thin wrapper around the CLI's query command that any MCP-compatible agent can call), and (for Pro) a cloud-sync daemon that pushes confirmed entries to a per-team Postgres database.

## Milestones

1. **M0 — Spec freeze.** SPEC.md + DESIGN.md + a single-repo `init` + `query` demo. End of week 1.
2. **M1 — Indexing + FTS5 query.** Git history, PR descriptions, PR comments. End of week 4.
3. **M2 — MCP server.** Registered with Claude Code / Cursor; queries respond in < 200ms. End of week 6.
4. **M3 — Suggestion engine.** Surface new PRs as candidate entries; human confirms. End of week 8.
5. **M4 — Cloud sync + team workspace (Pro).** End of week 12.

## Risks

- **Pain validation** — the source poster is explicitly asking if anyone feels this; the MVP must validate before the Pro tier ships.
- **Indexing accuracy** — the index must distinguish decisions from noise; a tag-based filter (`@repobrain`) is the simplest heuristic.
- **MCP server lifecycle** — long-lived processes on developer machines are flaky; a tmux / systemd unit is the workaround.
