---
name: ai-os-memory
description: Operate and inspect the AI-OS persistent memory stack (FalkorDB graph DB, Ollama embeddings, codebase-memory-mcp AST index, grepai semantic search, graphiti temporal memory). Use when the user asks about memory status, indexing a project, querying code semantically, browsing the graph, or syncing Hermes sessions.
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
- User wants Hermes sessions in the graph → `ai-os memory sync-sessions`

## Subcommands (canonical)

```bash
ai-os memory status              # colored status of FalkorDB + Ollama + MCPs
ai-os memory browse              # open FalkorDB Web UI in default browser
ai-os memory start               # docker compose up -d
ai-os memory stop                # docker compose down (data preserved)
ai-os memory logs                # tail FalkorDB logs
ai-os memory query "question"    # semantic search via grepai
ai-os memory reindex [path]      # refresh codebase-memory-mcp index
ai-os memory sync-sessions [days] # ingest ~/.hermes/sessions/*.db
```

## Underlying stack (don't expose to user unless asked)

| Layer | Tool | Port | Notes |
|---|---|---|---|
| Graph DB | FalkorDB (Docker) | redis 6390, web 3300 | OpenCypher, Web UI at 3300 |
| Embeddings | Ollama + nomic-embed-text | 11500 | Apple Silicon, free |
| Code AST index | codebase-memory-mcp | (stdio) | 158 langs, sub-ms, 24,615★ |
| Semantic search | grepai | (stdio) | 1,770★, uses Ollama |
| Graph memory | graphiti-core[falkordb] | (stdio) | bi-temporal, 28,294★ |

**Ports are intentionally OUTSIDE 3000-3050** (Edd's other apps use that range).

## Files in this skill's surface

- `~/Projects/ai-os/memory/ai-os-memory.sh` — the CLI (entry point)
- `~/Projects/ai-os/memory/falkordb/docker-compose.yml` — FalkorDB
- `~/Projects/ai-os/ai-config/mcp/{codebase-memory-mcp,graphiti,grepai}.yaml` — MCPs
- `~/Projects/ai-os/setup/install-mac.sh` — section 9b installs everything
- `~/Projects/ai-os/setup/verify.sh` — section 5b verifies everything
- `~/Projects/ai-os/dev-env/.env.example` — port assignments
- `~/Projects/ai-os/specs/2026-07-02-persistent-memory-phase-1.md` — the full plan

## Failure modes

- **`FalkorDB container not running`** → run `ai-os memory start` (idempotent).
- **`Ollama API :11500 not reachable`** → check if another process grabbed 11434; OLLAMA_HOST env may be needed.
- **`codebase-memory-mcp not installed`** → run `bash ~/Projects/ai-os/setup/install-mac.sh`.
- **`grepai query fails`** → check `OLLAMA_URL` is reachable; check `ollama list` has `nomic-embed-text`.

## Acceptance

- `ai-os memory status` returns all-green with colored output.
- `ai-os memory browse` opens `http://localhost:3300` in a browser.
- `ai-os memory query "where is the Spec+Verifier loop?"` returns ranked files in <200ms.

## Related

- `using-superpowers` — superpowers router (always load first)
- `verification-before-completion` — required gate after any stack change
- `brainstorming` — for spec/design questions about extending memory
