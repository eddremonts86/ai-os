---
name: ai-os-memory
description: Operate and inspect the AI-OS persistent memory stack (FalkorDB graph DB, Ollama embeddings, codebase-memory-mcp AST index, grepai semantic search). Use when the user asks about memory status, indexing a project, querying code semantically, or browsing the graph. Graphiti temporal memory is opt-in (separate compose file, not started by `ai-os memory start`), uses MiniMax (not OpenAI) as its LLM via a custom-built image (`ai-os/graphiti-mcp:minimax-standalone`), and is VERIFIED WORKING with real data as of 2026-07-13 — `add_memory`/`search_nodes`/`search_memory_facts`/`get_episodes` all confirmed against a live FalkorDB graph. Known caveat: `add_memory` has a non-trivial failure rate (MiniMax occasionally returns malformed/wrong-shape JSON during entity extraction) — retrying the same call usually succeeds. `search` reranking still needs a real `OPENAI_API_KEY` for the hardcoded cross-encoder, though testing found `search_nodes`/`search_memory_facts` work fine without one for typical result sizes.
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
ai-os memory reindex [path]      # refresh codebase-memory-mcp index over a single project
ai-os memory bootstrap [--refresh]   # first-time / on-demand: start the whole stack + auto-index every project under ~/Projects/ (see setup/ai-os-bootstrap.sh)
```

For periodic reindex of every project (cron, 6x/day at 00/04/08/12/16/20) see
`memory/cron-reindex.sh` — installed via system crontab by `setup/`. Full docs in
`setup/README-bootstrap.md`.

There is no session-sync subcommand — an earlier draft advertised one
(`sync-sessions`) before it was implemented; it was removed rather than shipped
half-working (P0-2 in `outputs/2026-07-12-ai-os-full-audit.md`). Do not
reference it.

## Underlying stack (don't expose to user unless asked)

| Layer | Tool | Port | Container | Notes |
|---|---|---|---|---|
| Graph DB | FalkorDB (Docker) | redis 6390, web 3300 | `ia-os-falkordb` | OpenCypher, Web UI at 3300, pinned image `v4.18.11`. All AI-OS containers are prefixed `ia-os-*` and live under a single `ia-os` Docker Compose project (`memory/docker-compose.yml` with `name: ia-os`) so they group together in the Docker dashboard — same pattern as the `builderhunt` project. |
| Embeddings | Ollama + nomic-embed-text | 11500 | **Mac**: native `brew install ollama` by default (Apple Silicon Metal GPU accel, which containers can't reach). **Windows**: Docker by default (`ia-os-ollama` container, opt-in Compose profile `ollama-docker` in `memory/docker-compose.yml`) — `choco install ollama` needs admin and was unreliable without it. Set `$env:OLLAMA_NATIVE = "1"` before `install-windows.ps1` to force native instead. Either way it's the same port (11500), so grepai/codebase-memory-mcp never know or care which backend is running. `ai-os memory start/stop` auto-detect the Docker path via `memory/falkordb/ollama-data/` (a bind-mount dir that only exists if that profile was ever started — `docker ps` alone doesn't work here since `compose down` removes containers, losing that signal). |
| Code AST index | codebase-memory-mcp | (stdio) | 158 langs, sub-ms, checksum-verified download |
| Semantic search | grepai | (stdio) | uses Ollama |
| Graph memory | graphiti | HTTP 8021 | **Opt-in** (`ai-config/mcp/graphiti.yaml`, `enabled: true`) — runs a custom-built `ai-os/graphiti-mcp:minimax-standalone` image (NOT the pinned `zepai/knowledge-graph-mcp` — that image lacks custom-`api_url` support needed for MiniMax), defined in the unified `memory/docker-compose.yml` under the `ia-os` project. LLM provider is MiniMax (not OpenAI), verified end-to-end with real data 2026-07-13: `add_memory` writes an episode + extracts entities/facts into FalkorDB; `search_nodes`/`search_memory_facts`/`get_episodes` all read back correctly. Caveat: `add_memory` fails outright on a meaningful fraction of calls (MiniMax occasionally returns malformed or wrong-shape JSON during extraction) — retry the same call if it doesn't show up. `search` reranking (a separate, hardcoded-OpenAI code path) needs a real `OPENAI_API_KEY` to fully succeed, though `search_nodes`/`search_memory_facts` worked fine without one in testing |

**Ports are intentionally OUTSIDE 3000-3050** (Edd's other apps use that range).

## Files in this skill's surface

- `~/Projects/ai-os/ai-os` — top-level dispatcher (routes `ai-os memory|loop|bootstrap` to the right script). Symlinked at `~/.local/bin/ai-os`.
- `~/Projects/ai-os/memory/ai-os-memory.sh` — the memory-stack CLI (entry point)
- `~/Projects/ai-os/memory/docker-compose.yml` — **unified** compose: `name: ia-os` so all services group under one header in the Docker Desktop dashboard (like `builderhunt`). Defines `ia-os-falkordb`, `ia-os-graphiti-mcp`, `ia-os-ollama` (opt-in profile), and the internal `ia-os-net` network.
- `~/Projects/ai-os/memory/cron-reindex.sh` — 6x/day periodic reindex (called by system crontab)
- `~/Projects/ai-os/memory/falkordb/data/` — FalkorDB persistence
- `~/Projects/ai-os/memory/falkordb/ollama-data/` — only exists if the `ollama-docker` profile was ever started
- `~/Projects/ai-os/memory/graphiti/config.yaml` — Graphiti config (real `MINIMAX_API_KEY` required; see STATUS note for full history)
- `~/Projects/ai-os/memory/graphiti/Dockerfile.standalone.minimal` — the custom build (rebuilds the local `ai-os/graphiti-mcp:minimax-standalone` image)
- `~/Projects/ai-os/setup/ai-os-bootstrap.sh` — first-time / on-demand bring-up of the whole stack + auto-indexing
- `~/Projects/ai-os/setup/README-bootstrap.md` — full user-facing doc for the bootstrap + cron
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
- `ai-os memory bootstrap` brings the full stack up + indexes every project under `~/Projects/` in one shot.

## Related

- `using-superpowers` — superpowers router (always load first)
- `verification-before-completion` — required gate after any stack change
- `brainstorming` — for spec/design questions about extending memory
- `setup/README-bootstrap.md` — full user-facing doc for `ai-os memory bootstrap` + cron
