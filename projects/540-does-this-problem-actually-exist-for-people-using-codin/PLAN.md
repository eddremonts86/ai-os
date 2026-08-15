---
id: "540"
slug: does-this-problem-actually-exist-for-people-using-codin
title: Does this problem actually exist for people using coding agents daily?
status: draft
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1voa7mx/does_this_problem_actually_exist_for_people_using/"
category: saas
date: "2026-08-14"
---
# Does this problem actually exist for people using coding agents daily?

## Tech Stack

- **Ingest:** local git indexer that walks commit messages, PR titles, PR descriptions, PR review comments, and (optionally) merged branch topology. A separate connector ingests Slack threads and Notion pages if the user opts in.
- **Decision store:** SQLite by default for solo projects, Postgres for team-mode. Embeddings live in the same DB using `sqlite-vss` or `pgvector` respectively.
- **Query surface:** a `repobrain` CLI, a local REST server (read-only), and an MCP server so Claude Code / Cursor can call it as a tool.
- **Decision-write UI:** a TUI + a `repobrain suggest` command that surfaces candidate decisions extracted from a recent merged PR for human confirmation before they land in the store.
- **Sync (team mode):** end-to-end encrypted blob per project; the server never sees plaintext.

## Architecture

`repobrain init` runs once per repo: it builds an index from git + PR sources, embeds the candidate "decision-shaped" chunks (rejections, conventions, "why we did X"), and writes the store locally. `repobrain query ""` returns the top-k chunks with file + commit refs so the agent or human can cite them. The MCP server exposes the same query as an MCP tool, so an agent's pre-action prompt can include `repobrain query("how do we handle payment errors?")` and read the cited decision before editing code.

```
Claude Code / Cursor agent
        │ MCP tool call
        ▼
repobrain MCP server ──▶ SQLite/pgvector decision store
        ▲
        │ index jobs
        │
git history ──▶ PR descriptions/comments ──▶ (opt) Slack/Notion ──▶ embeddings
```

The wedge is durability: a chat history is a log, but a decision store is what survives the next agent session and the next hire.

## Milestones

1. **M0 — Local MVP.** `repobrain init` + `repobrain query` against a single repo, SQLite only. End of week 3.
2. **M1 — MCP server.** Expose query as an MCP tool so Claude Code can call it. End of week 6.
3. **M2 — Suggest-from-PR.** Mine recent merged PRs for candidate decisions; require human confirmation before persistence. End of week 9.
4. **M3 — Slack/Notion ingest (opt-in).** End of week 13.
5. **M4 — Team mode + E2EE sync + Postgres backend.** End of week 18.

## Risks

- **Indexing cost on large repos.** A repo with 100k commits will be slow to embed on first run. Mitigation: incremental indexer keyed by commit SHA, full re-index only when the embedding model changes.
- **Embedding-model churn.** Switching models invalidates the store. The store should keep `model_id` per chunk and `repobrain reindex` should be a first-class command, not a side effect.
- **Decision extraction quality.** A regex-based "is this a decision?" detector will produce both false positives (a one-off comment) and false negatives (a convention buried in code review). The `suggest` UI must be explicit that nothing lands without human confirmation; if the team trusts the auto-suggest, the trust is misplaced.
- **The OP explicitly questions whether the pain is real.** The product must avoid building a solution in search of a problem — every milestone is gated on user-reported signal that `repobrain query` was actually consulted before an action.
