---
name: ai-os-memory
description: Operate and inspect the AI-OS persistent memory stack (FalkorDB graph DB, Ollama embeddings, codebase-memory-mcp AST index, grepai semantic search). Use when the user asks about memory status, indexing a project, querying code semantically, or browsing the graph. Graphiti temporal memory is opt-in (separate compose file, not started by `ai-os memory start`) and requires a real OPENAI_API_KEY for actual knowledge-graph operations — its Docker deployment passed a structural smoke test but do not present it as fully verified with real data.
version: 0.1.0
---

# ai-os-memory

Operate the AI-OS persistent memory stack. One CLI, no daemon, no API keys, all
local-first. Designed for a single developer with many local projects under
`~/Projects/`.

## When to use

- User asks "is the memory stack running?" → `ai-os memory status`
- User wants to see the graph / open the Web UI → `ai-os memory browse`
- User asks "where is X defined?" semantically → `ai-os memory query "..."`
- User wants to start/stop the stack → `ai-os memory start|stop|logs`
- User wants to index a new project → `ai-os memory reindex <path>`

## Subcommands (canonical)

```bash
ai-os memory status              # colored status of FalkorDB + Ollama + MCPs
ai-os memory visualize           # open FalkorDB UI + cbm UI (if running) + grepai status
ai-os memory browse              # open FalkorDB Web UI in default browser
ai-os memory start               # docker compose up -d
ai-os memory stop                # docker compose down (data preserved)
ai-os memory logs                # tail FalkorDB logs
ai-os memory query "question" [path]   # semantic search via grepai
ai-os memory search "question" [path]  # same as query, falls back to cbm if grepai isn't running
ai-os memory reindex [path]      # refresh codebase-memory-mcp index
```

There is no session-sync subcommand — an earlier draft advertised one
(`sync-sessions`) before it was implemented; it was removed rather than shipped
half-working (P0-2 in `outputs/2026-07-12-ai-os-full-audit.md`). Do not
reference it.

## Underlying stack (don't expose to user unless asked)

| Layer | Tool | Port | Notes |
|---|---|---|---|
| Graph DB | FalkorDB (Docker) | redis 6390, web 3300 | OpenCypher, Web UI at 3300, pinned image `v4.18.11` |
| Embeddings | Ollama + nomic-embed-text | 11500 | Cross-platform (Mac + Windows), free |
| Code AST index | codebase-memory-mcp | (stdio) | 158 langs, sub-ms, checksum-verified download |
| Semantic search | grepai | (stdio) | uses Ollama |
| Graph memory | graphiti | HTTP 8021 | **Opt-in** (`ai-config/mcp/graphiti.yaml`, `enabled: true`) — runs `zepai/knowledge-graph-mcp:1.0.2-standalone` via `memory/graphiti/docker-compose.yml`, separate from `ai-os memory start`. Structural deployment passed a smoke test 2026-07-12 (container starts, connects to FalkorDB, HTTP health check OK); real knowledge-graph operations need a real `OPENAI_API_KEY` exported before `docker compose up -d` in that directory |

**Ports are intentionally OUTSIDE 3000-3050** (Edd's other apps use that range).

## Files in this skill's surface

- `~/Projects/ai-os/memory/ai-os-memory.sh` — the CLI (entry point)
- `~/Projects/ai-os/memory/falkordb/docker-compose.yml` — FalkorDB
- `~/Projects/ai-os/memory/graphiti/docker-compose.yml` — Graphiti MCP (opt-in, needs a real OPENAI_API_KEY)
- `~/Projects/ai-os/ai-config/mcp/{codebase-memory-mcp,graphiti,grepai}.yaml` — MCPs
- `~/Projects/ai-os/setup/install-mac.sh` — section 9b installs everything (Mac)
- `~/Projects/ai-os/setup/install-windows.ps1` — section 7b installs the same stack (Windows)
- `~/Projects/ai-os/setup/verify.sh` — section 5b verifies everything (Mac)
- `~/Projects/ai-os/dev-env/.env.example` — port assignments
- `~/Projects/ai-os/archive/2026-07-03-persistent-memory-phase-1.md` — the original phase 1 plan (completed, archived)

## Failure modes

- **`FalkorDB container not running`** → run `ai-os memory start` (idempotent).
- **`Ollama API :11500 not reachable`** → check if another process grabbed 11434; OLLAMA_HOST env may be needed.
- **`codebase-memory-mcp not installed`** → run `bash ~/Projects/ai-os/setup/install-mac.sh` (or `install-windows.ps1` on Windows).
- **`grepai query fails`** → check `OLLAMA_URL` is reachable; check `ollama list` has `nomic-embed-text`.

## Acceptance

- `ai-os memory status` returns all-green with colored output.
- `ai-os memory browse` opens `http://localhost:3300` in a browser.
- `ai-os memory query "where is the Spec+Verifier loop?"` returns ranked files in <200ms.

## Related

- `using-superpowers` — superpowers router (always load first)
- `verification-before-completion` — required gate after any stack change
- `brainstorming` — for spec/design questions about extending memory
