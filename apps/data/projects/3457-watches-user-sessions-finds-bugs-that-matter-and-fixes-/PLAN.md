---
id: "3457"
slug: watches-user-sessions-finds-bugs-that-matter-and-fixes-
title: "Watches user sessions, finds bugs that matter, and fixes them"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49466704"
category: show-hn
date: "2026-08-27"
tags: [Show HN, Observability, Agent, Open Source]
tech: [TypeScript, PostgreSQL, ClickHouse, OpenTelemetry, Docker Compose]
---
# Watches user sessions, finds bugs that matter, and fixes them

## Tech Stack

- **Backend:** TypeScript + Node.js for the ingestion API, web UI, and the agent runtime.
- **OLTP store:** PostgreSQL for projects, users, issue records, and PR-tracking state.
- **Event / recording store:** ClickHouse for high-cardinality error, console-log, and network events; object storage for session recording blobs.
- **Telemetry capture:** OpenTelemetry-compatible SDK in the browser; same SDK shape on the server when/if needed.
- **Packaging:** single Docker Compose file for self-host, with one command to bring the stack up.
- **Agent surface:** an MCP server speaking the same JSON-RPC contract used by Claude Code, exposing the "issues affecting users" query.

## Architecture

The browser SDK ships a small snippet that captures errors, console logs, network requests, and session recordings. Capture goes to the ingestion API, which fans writes into ClickHouse (events) and object storage (recordings), then projects an "issue" view in Postgres. Sessions are replayed through the web UI.

The agent is wired to both the issue view and the recording store: it ranks by distinct users affected, watches recordings for the frustration signals Abhishek named (rage clicks, dead clicks, abandoned forms), reads the host repo for context, and proposes fixes. A fix is gated on a verification step; only PRs whose verification passes reach GitHub.

The MCP server is a thin facade over the issue view and the ranked list. Claude Code (or any MCP-aware client) calls into it and drives the resolution loop end-to-end.

## Milestones

1. **M0 — Single Docker Compose file.** Web UI + ingestion API + Postgres + ClickHouse + recording storage all up with one `docker compose up`.
2. **M1 — Captures land in the issue view.** Errors, console logs, network, session recordings all visible per project.
3. **M2 — Frustration-signal detection.** Rage-click, dead-click, and abandoned-form detector runs on uploaded recordings and links the resulting signal to the issue view.
4. **M3 — Agent + verification gate.** Agent reads the host repo, proposes a fix, runs verification locally, only opens a PR on green.
5. **M4 — MCP server.** The "what broke for users this week" tool is reachable from Claude Code end-to-end.

## Risks

- **Verification-gate quality** — if the verifier false-positives, the headline claim ("only opens a PR if it can verify the fix") collapses; ship with conservative defaults and track gate precision as a public signal.
- **Session-recording PII handling** — rage-click detection is only as credible as the redaction story behind it; ship redaction defaults and document the policy.
- **Host-repo context size and cost** — feeding the agent the full repo is expensive; pick a context strategy (grep-first, embeddings, or both) before promising deep project understanding.
- **Self-host operational cost** — ClickHouse + object storage + Postgres on a single host can be made to work, but the resource budget must be honest in the docs.
