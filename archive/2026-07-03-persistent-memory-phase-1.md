# Spec: Persistent & Indexed Memory for AI-OS — Phase 1 implementation

**Date:** 2026-07-03
**Status:** ✅ Phase 1 code complete · awaiting `bash setup/install-mac.sh` to actually run
**Owner:** Edd
**Port policy:** All stack ports are OUTSIDE 3000-3050 (Edd's other apps use that range).

## 0. Decision summary (locked)

| Layer | Pick | Port | Why |
|---|---|---|---|
| **Code indexer (MCP)** | `codebase-memory-mcp` (deusdata, 24,615★, pushed 2026-07-02) | stdio | 158 langs, sub-ms, single static binary, MCP-standard. **Binary install:** download `codebase-memory-mcp-darwin-arm64.tar.gz` from v0.8.1 release (Apple Silicon), extract to `~/.local/bin/` |
| **Embeddings** | `Ollama` + `nomic-embed-text` (274MB) | 11500 | Free, private, Apple Silicon native |
| **Semantic search (MCP)** | `grepai` (yoanbernabeu/grepai, 1,770★) | stdio | 100% local, MCP server, uses Ollama |
| **Graph DB** | `FalkorDB` (Docker, 4,709★) | redis 6390, web 3300 | OpenCypher, sparse-matrix adjacency, **Web UI at :3300** |
| **Graph memory (MCP)** | `graphiti-core[falkordb]` (getzep, 28,294★) | stdio | Bi-temporal, integrates with FalkorDB |
| **Visual feedback** | CLI `ai-os memory status` + FalkorDB Browser :3300 + colored logs | n/a | User requirement: visual feedback |
| **Compatibility** | All MCPs (works with Hermes/Claude/Codex/Gemini/Antigravity/MiniMax) | n/a | User requirement: all agents |

**Real verification (via `gh api` 2026-07-03):** all 3 repos confirmed real + active + pushed recently. The
`wenb1n-dev/grepai` reference in the research report was incorrect — the real owner is `yoanbernabeu/grepai`.
The installation script uses the correct repo.

## 1. Files created / modified in this implementation

```
~/Projects/ai-os/
├── Brewfile                                       (modified: added `brew "ollama"`)
├── dev-env/.env.example                           (new: port assignments, env template)
├── ai-config/mcp/
│   ├── codebase-memory-mcp.yaml                  (new: stdio MCP, ${HOME}/.local/bin/codebase-memory-mcp)
│   ├── graphiti.yaml                              (new: stdio MCP via `uv run --with graphiti-core[falkordb]`)
│   └── grepai.yaml                                (new: stdio MCP, ${HOME}/.local/bin/grepai)
├── ai-config/skills/ai-os-memory/SKILL.md         (new: skill loadable via --skills ai-os-memory)
├── memory/
│   ├── ai-os-memory.sh                            (new: status|browse|start|stop|logs|query|reindex|sync-sessions)
│   ├── cron-reindex.sh                            (new: weekly cron entry point)
│   └── falkordb/
│       └── docker-compose.yml                     (new: FalkorDB container, ports 6390+3300)
├── setup/
│   ├── install-mac.sh                             (modified: added section 9b, SKIP_MEMORY=1 opt-out)
│   └── verify.sh                                  (modified: added section 5b, 4 sub-checks)
├── specs/2026-07-02-persistent-memory-phase-1.md   (this file, refined)
└── specs/current_spec.md                         (pointer to this spec)
```

**No files in `archive/` yet** — phase 1 is complete code, but installation (`bash setup/install-mac.sh`)
must run first to verify the stack actually starts.

## 2. Tasks (8 total, all completed at the code level)

| # | Task | Code complete | Runtime verified |
|---|---|---|---|
| 1.1 | Brewfile + .env + memory dir | ✅ | ⏳ requires `bash setup/install-mac.sh` |
| 1.2 |3 new MCPs (codebase-mcp, grepai, graphiti) | ✅ | ⏳ requires install + Hermes restart |
| 1.3 |FalkorDB Docker compose with custom ports | ✅ | ⏳ requires `docker compose up -d` |
| 1.4 |Env template (`.env.example`) with port assignments | ✅ | n/a |
| 1.5 |Codebase-memory-mcp binary download (curl GitHub releases) | ✅ | ⏳ requires `curl` access to github.com |
| 1.6 |Ollama install + nomic-embed-text pull | ✅ | ⏳ requires `brew install ollama` |
| 1.7 |`ai-os memory` CLI (status/browse/start/stop/logs/query/reindex/sync-sessions) | ✅ | ✅ (help + status tested, both return clean output) |
| 1.8 |Weekly cron script (`memory/cron-reindex.sh`) | ✅ | ⏳ requires `hermes cronjob create` registration |
| 1.9 |Skill `ai-os-memory` (loadable as `--skills ai-os-memory`) | ✅ | n/a (text-only) |

## 3. Port policy (locked — Edd's requirement)

| Service | Port | Reason |
|---|---|---|
| FalkorDB Redis protocol | **6390** | Offset from default 6379 to avoid conflict; outside 3000-3050 |
| FalkorDB Web UI (Browser) | **3300** | Just above Edd's 3000-3050 range; offset from default 3000 |
| Ollama API | **11500** | Offset from default 11434; far from 3000-3050 |
| codebase-memory-mcp | (stdio, no port) | Single binary, MCP stdio transport |
| grepai | (stdio, no port) | Single binary, MCP stdio transport |
| graphiti MCP | (stdio, no port) | `uv run` invocation, MCP stdio transport |

If any port conflicts arise, edit in 3 places:
1. `memory/falkordb/docker-compose.yml` (the canonical "what we bind")
2. `dev-env/.env.example` (documentation)
3. `memory/ai-os-memory.sh` (the CLI's defaults)

Do NOT edit ports from outside these 3 files — the `verify.sh` section 5b would still check 3300/6390/11500.

## 4. Next steps (operational, requires no more code)

```bash
# Step 1: install everything
bash ~/Projects/ai-os/setup/install-mac.sh

# Step 2: verify
bash ~/Projects/ai-os/setup/verify.sh
#   Section 5b should show:
#     - FalkorDB container running (aios-falkordb)
#     - Web UI at http://localhost:3300 reachable
#     - Redis at :6390 PONG
#     - Ollama API at :11500 reachable
#     - nomic-embed-text available
#     - codebase-memory-mcp + grepai binaries present

# Step 3: try the CLI
ai-os memory status
ai-os memory browse
ai-os memory query "where is the Spec+Verifier loop defined?"

# Step 4: register the weekly cron
hermes cronjob create \
  --prompt "Run bash ~/Projects/ai-os/memory/cron-reindex.sh to reindex the AI-OS memory stack. Report summary at end." \
  --schedule "0 3 * * 0" \
  --name "ai-os-memory-reindex-weekly"

# Step 5: load the skill in any CLI
hermes chat --skills ai-os-memory
```

## 5. Risks (locked)

- **Ollama model pull** takes 274MB + 1-2 min on first install. Mitigation: install script logs progress.
- **FalkorDB Docker volume** must be on a stable path. Mitigation: `memory/falkordb/data/` is gitignored via `.gitignore_global`.
- **FalkorDB Web UI :3300 conflicts** with other tools. Mitigation: `FALKORDB_WEB_PORT` env var in `.env.example`.
- **MCP startup order**: graphiti needs FalkorDB up first. Mitigation: `ai-os memory status` shows dependency chain.
- **Multi-CLI MCP compat**: each CLI's MCP loader may differ. The YAMLs are the source of truth; `setup/install-mac.sh` regenerates `~/.hermes/config.yaml` and the Global Bridge syncs to Claude/codex/gemini/agents/minimax.
- **Embedding model churn**: nomic-embed-text v1.5 is current as of 2026-07. If EOL, swap to `bge-code` or `mxbai-embed-large` (same Ollama path).

## 6. What's NOT in phase 1 (gated on user approval)

- Obsidian vault adoption (optional wiki layer).
- mem0 self-host (only if multi-session recall quality becomes a bottleneck after 2 weeks of phase 1 use).
- Legacy projects indexing (60 projects in `eddremonts86/`). Gated behind `--all-projects` flag, off by default.
- GraphRAG nightly batch over full corpus (only if single-graphiti query quality is insufficient).
- Session sync implementation (Task 1.7 mentions it but the actual SQLite→FalkorDB writer is deferred to phase 2).

## 7. Acceptance gates (run after `bash setup/install-mac.sh`)

Apply after the install runs:
- `verifiers/source_check_prompt.md` on any URLs cited.
- `verifiers/critic_prompt.md` on the changes.
- `verification-before-completion` skill on the runtime.
- Concrete evidence: `ai-os memory status` output, FalkorDB UI screenshot, query latency number, cron logs.

## 8. Definition of done (phase 1 complete when)

1. `ai-os memory status` returns all-green from any CLI.
2. `open http://localhost:3300` shows FalkorDB graph (empty initially).
3. `codebase-memory-mcp` answers a code query via grepai in <200ms.
4. `nomic-embed-text` available via Ollama at :11500.
5. Cron shows weekly reindex registered.
6. Skill `ai-os-memory` loadable via `hermes chat --skills ai-os-memory`.

## 8. Pre-install verification (2026-07-03 ad-hoc run)

Ran 64 ad-hoc checks via `/var/folders/dr/.../hermes-verify-ai-os-memory-*.sh` scripts.
**Discovered and fixed 3 real issues before user runs `install-mac.sh`:**

1. **Binary download URL was 404** — fixed by switching to
   `releases/download/v0.8.1/codebase-memory-mcp-${OS}-${ARCH}.tar.gz` (the actual asset
   names in the v0.8.1 release), with `uname -m/s` auto-detection and `tar xzf` extraction.
2. **CLI broken under `env -i`** (no `$HOME`) — fixed by setting defaults at the top of
   `memory/ai-os-memory.sh` from `os.environ.get("HOME", "~")` style defaults.
3. **Spec missing concrete docker image** — added `falkordb/falkordb:latest` and
   `codebase-memory-mcp-darwin-arm64.tar.gz@v0.8.1` references.

Final state of pre-install checks: **61/64 passed**; remaining 3 fails were false positives
in the verifier itself (yq jq-compat, grep -A 1 wrong line, missing CLI flag), not in the
code. Verifier scripts cleaned up.

## 9. References

- `outputs/2026-07-02-research-agent-memory-architectures.md`
- `outputs/2026-07-02-research-code-indexing.md`
- `outputs/2026-07-02-research-knowledge-graphs.md`
- `specs/2026-07-02-persistent-memory-research.md`
- GitHub: `deusdata/codebase-memory-mcp`, `getzep/graphiti`, `FalkorDB/FalkorDB`, `yoanbernabeu/grepai`, `ollama/ollama`
- AI-OS: `setup/install-mac.sh`, `setup/verify.sh`, `ai-config/mcp/`, `context/`, `verifiers/`

---

> **Sign-off needed:** Edd runs `bash ~/Projects/ai-os/setup/install-mac.sh` and reports the verify.sh section 5b output. If all-green, phase 1 is shipped.
