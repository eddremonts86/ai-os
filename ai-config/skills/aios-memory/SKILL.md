---
name: aios-memory
description: Operate, repair and inspect the AI-OS memory stack — graphiti temporal memory on FalkorDB, Ollama (local LLM + embeddings), codebase-memory-mcp AST index, grepai semantic search, and the scheduled reindex. Use when the user asks about memory status, indexing a project, semantic code search, the knowledge graph, or a memory tool that is down.
version: 0.2.0
---

# aios-memory

Operate the AI-OS persistent memory stack. One CLI, no daemon, no API keys, all
local-first. Designed for a single developer with many local projects under
`$(dirname "$AI_OS_ROOT")`.

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
ai-os memory reindex [path]      # refresh codebase-memory-mcp index over a single project
ai-os memory bootstrap [--refresh]   # first-time / on-demand: start the whole stack + auto-index every project under ~/Projects/ (see setup/ai-os-bootstrap.sh)
```

Periodic reindex of every git project next to ai-os (6x/day at 00/04/08/12/16/20):
`memory/cron-reindex.sh`, scheduled by the launchd agent `ai.os.reindex`
(`bash memory/launchd/install-reindex.sh [--status|--uninstall]`); on Windows the task "AI-OS reindex"
(`memory/windows/ai-os-tasks.ps1 [install|status|uninstall]`, logs in `~/.ai-os/logs`). Skips `/inHold/`
by default (`AI_OS_REINDEX_SKIP`); root is `AI_OS_PROJECTS_DIR` (default: the
directory that contains ai-os). Also refreshes grepai's ai-os index.

When to read and write graphiti during normal work is a rule, not part of this
skill: `rules/always_do.md` "Use the memory stack". In Claude Code the SessionStart hook
`setup/hooks/claude-session-memory.py` (wired by `setup/wire-memory-hook.py`) preloads
the repo's facts; `ai-os health` reports memories recorded per group in the last 7 days.

There is no session-sync subcommand — an earlier draft advertised one
(`sync-sessions`) before it was implemented; it was removed rather than shipped
half-working (P0-2 in `outputs/2026-07-12-ai-os-full-audit.md`). Do not
reference it.

## Underlying stack (don't expose to user unless asked)

| Layer | Tool | Port | Container | Notes |
|---|---|---|---|---|
| Graph DB | FalkorDB (Docker) | redis 6390, web 3300 | `ia-os-falkordb` | OpenCypher, Web UI at 3300, pinned image `v4.18.11`. All AI-OS containers are prefixed `ia-os-*` and live under a single `ia-os` Docker Compose project (`memory/docker-compose.yml` with `name: ia-os`) so they group together in the Docker dashboard. |
| Embeddings | Ollama + nomic-embed-text | 11500 | **Mac**: native `brew install ollama` by default (Apple Silicon Metal GPU accel, which containers can't reach). **Windows**: Docker by default (`ia-os-ollama` container, opt-in Compose profile `ollama-docker` in `memory/docker-compose.yml`) — `choco install ollama` needs admin and was unreliable without it. Set `$env:OLLAMA_NATIVE = "1"` before `install-windows.ps1` to force native instead. Either way it's the same port (11500), so grepai/codebase-memory-mcp never know or care which backend is running. `ai-os memory start/stop` auto-detect the Docker path via `memory/falkordb/ollama-data/` (a bind-mount dir that only exists if that profile was ever started — `docker ps` alone doesn't work here since `compose down` removes containers, losing that signal). |
| Code AST index | codebase-memory-mcp | (stdio) | 158 langs, sub-ms, checksum-verified download |
| Semantic search | grepai | (stdio) | uses Ollama |
| Chat UI | open-webui (Docker) | 3301 | `ia-os-open-webui` | **Opt-in** (`docker compose --profile chat up -d open-webui`; ~1.5 GB idle, so off by default). Talks to the native Ollama daemon above via `host.docker.internal:11500`, not the embedder-only `nomic-embed-text` — it's for `llm/router.mjs`'s chat model (`qwen3:14b`, see `llm/README.md`). No login wall (`WEBUI_AUTH=False`) — acceptable since it's bound to `127.0.0.1` only. |
| Graph memory | graphiti | HTTP 8021 | `ia-os-graphiti-mcp` | Custom image `ai-os/graphiti-mcp:minimax-standalone` (custom-`api_url` support). Started by `ai-os memory start`. Extraction LLM = host Ollama (`GRAPHITI_LLM_MODEL`, default gemma) since 2026-11-05 — MiniMax returned `402 insufficient balance`; override the three `GRAPHITI_LLM_*` vars in the compose to use a hosted model. `add_memory` is async (~1–5 min per episode locally; output capped by `GRAPHITI_LLM_MAX_TOKENS`, default 4096); check `docker logs ia-os-graphiti-mcp` for `Successfully processed episode`. Verified end-to-end 2026-11-05 |

**Ports are intentionally OUTSIDE 3000-3050** (app dev servers commonly use that range).

## Files in this skill's surface

- `$AI_OS_ROOT/ai-os` — top-level dispatcher (routes `ai-os memory|loop|bootstrap` to the right script). Symlinked at `~/.local/bin/ai-os`.
- `$AI_OS_ROOT/memory/ai-os-memory.sh` — the memory-stack CLI (entry point)
- `$AI_OS_ROOT/memory/docker-compose.yml` — **unified** compose: `name: ia-os` so all services group under one header in the Docker Desktop dashboard (like any compose project). Defines `ia-os-falkordb`, `ia-os-graphiti-mcp`, `ia-os-ollama` (opt-in profile), and the internal `ia-os-net` network.
- `$AI_OS_ROOT/memory/cron-reindex.sh` — 6x/day periodic reindex (launchd agent `ai.os.reindex`)
- `$AI_OS_ROOT/memory/launchd/install-reindex.sh` — installs/checks that agent
- `$AI_OS_ROOT/memory/falkordb/data/` — FalkorDB persistence (mounted at `/var/lib/falkordb/data`, RDB + AOF)
- `$AI_OS_ROOT/memory/falkordb/ollama-data/` — only exists if the `ollama-docker` profile was ever started; `ai-os memory start` ignores it when native Ollama already answers :11500
- `$AI_OS_ROOT/memory/graphiti/config.yaml` — Graphiti config (LLM via `GRAPHITI_LLM_*`, no key needed for local Ollama)
- `$AI_OS_ROOT/memory/graphiti/Dockerfile.standalone.minimal` — the custom build (rebuilds the local `ai-os/graphiti-mcp:minimax-standalone` image)
- `$AI_OS_ROOT/setup/ai-os-bootstrap.sh` — first-time / on-demand bring-up of the whole stack + auto-indexing
- `$AI_OS_ROOT/setup/README-bootstrap.md` — full user-facing doc for the bootstrap + cron
- `$AI_OS_ROOT/ai-config/mcp/{codebase-memory-mcp,graphiti,grepai}.yaml` — MCPs
- `$AI_OS_ROOT/setup/install-mac.sh` — section 9b installs everything (Mac)
- `$AI_OS_ROOT/setup/install-windows.ps1` — section 7b installs the same stack (Windows)
- `$AI_OS_ROOT/setup/verify.sh` — section 5b verifies everything (Mac)
- `$AI_OS_ROOT/dev-env/.env.example` — port assignments
- `$AI_OS_ROOT/archive/2026-07-03-persistent-memory-phase-1.md` — the original phase 1 plan (completed, archived)

## Failure modes

Start with `ai-os health` — it exercises every layer (graph query, extraction log,
LLM structured output, Ollama version, grepai search, cbm index, reindex age, all MCP
handshakes, API tokens, CI) and names the broken one. It also runs at 09:30/15:30 via
the launchd agent `ai.os.health` and raises a macOS notification on any FAIL
(`bash memory/launchd/install-health.sh --status` shows the last report).


- **`FalkorDB container not running`** → run `ai-os memory start` (idempotent).
- **Graph empty after a restart** → check the mount: `docker inspect ia-os-falkordb` must show `/var/lib/falkordb/data` (it was `/data` until 2026-11-05, which lost every write).
- **`add_memory` never shows up** → `docker logs ia-os-graphiti-mcp | grep -E "Failed to process|402|ERROR"`; a hosted LLM out of credit fails every episode.
- **`Ollama API :11500 not reachable`** → check if another process grabbed 11434; OLLAMA_HOST env may be needed.
- **`codebase-memory-mcp not installed`** → run `bash "$AI_OS_ROOT/setup/install-mac.sh"` (or `install-windows.ps1` on Windows).
- **`grepai query fails`** → check `OLLAMA_URL` is reachable; check `ollama list` has `nomic-embed-text`.

## Acceptance

- `ai-os memory status` returns all-green with colored output.
- `ai-os memory browse` opens `http://localhost:3300` in a browser.
- `ai-os memory query "where is the Spec+Verifier loop?"` returns ranked files in <200ms.
- `ai-os memory bootstrap` brings the full stack up + indexes every project under `~/Projects/` in one shot.

## Related

- `using-superpowers` — superpowers router (always load first)
- `verification-before-completion` — required gate after any stack change
- `brainstorming` — for spec/design questions about extending memory
- `setup/README-bootstrap.md` — full user-facing doc for `ai-os memory bootstrap` + cron
