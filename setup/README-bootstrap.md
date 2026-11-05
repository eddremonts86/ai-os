# AI-OS memory stack — bootstrap, reindex, maintenance

The AI-OS memory stack (FalkorDB graph DB + Graphiti MCP + Ollama embeddings +
codebase-memory-mcp AST index + grepai semantic search) is a local-first, no-daemon
collection of processes. It is started on demand and re-indexed periodically.

## Containers (all in one `ia-os` Docker Compose project)

The unified `memory/docker-compose.yml` sets `name: ia-os` at the top level, so
every service below appears under a single **`ia-os`** header in the Docker
Desktop dashboard — same pattern as the `builderhunt` project. All containers
are also named `ia-os-*` to keep them grouped.

| Container              | Port            | Role                                      |
| ---------------------- | --------------- | ----------------------------------------- |
| `ia-os-falkordb`       | 6390 / 3300     | Graph DB (Redis wire + Web UI)            |
| `ia-os-graphiti-mcp`   | 8021            | Temporal knowledge graph MCP (opt-in)     |
| `ia-os-ollama`         | 11500           | Embeddings (Windows / opt-in only)        |
| `ia-os-net` (network)  | —               | Shared internal Docker network            |

> Ollama can run either way, and both publish `127.0.0.1:11500`, so nothing downstream
> cares which is up. Run **one**, never both.

| Shape | Bring up | Notes |
| --- | --- | --- |
| `ia-os-ollama` container | `docker compose -f memory/docker-compose.yml --profile ollama-docker up -d ollama` | Shows up in the Docker dashboard with the rest of `ia-os`. Image pinned by digest. |
| Host launchd service | `bash memory/launchd/install-ollama.sh` | No Docker needed. |

The container cannot reach the Metal GPU, which sounds decisive and is not: measured,
`nomic-embed-text` answers in **0.03 s either way**. It is a 137M-parameter embedder and the
GPU only pays off on generation. Pick whichever you would rather look at.

The host shape is a launchd service (`ai.os.ollama`), so it survives a reboot:

```bash
bash "$AI_OS_ROOT/memory/launchd/install-ollama.sh"            # install / repair
bash "$AI_OS_ROOT/memory/launchd/install-ollama.sh" --status    # loaded? answering? model?
```

Two traps it exists to avoid, both of which had already bitten:

- **`brew services start ollama` binds the wrong port.** Homebrew's plist sets
  `OLLAMA_FLASH_ATTENTION` and `OLLAMA_KV_CACHE_TYPE` but not `OLLAMA_HOST`, so Ollama
  comes up on its default 11434 while `memory/graphiti/config.yaml` and
  `memory/ai-os-memory.sh` both address 11500. Nothing falls back and nothing complains.
- **`nohup ollama serve &` does not survive a reboot.** That is what `install-mac.sh` used
  to do, which is why embeddings were dead while both containers stayed green.

`ai-os memory status` reports Ollama honestly — use it, not `docker ps`.

## First-time / on-demand setup: `ai-os-bootstrap.sh`

When you want to bring the stack up and index every project under `~/Projects/`,
run **one** command:

```bash
bash "$AI_OS_ROOT/setup/ai-os-bootstrap.sh"
# or, via the CLI wrapper:
ai-os memory bootstrap
```

It is **idempotent** — re-running it is safe and does the right thing each time:

1. Verifies Docker is reachable.
2. Hands `dev-env/env-config/.env` to `docker compose --env-file` (never sourced) for optional `GRAPHITI_LLM_*` overrides.
3. Starts `ia-os-falkordb` via `memory/docker-compose.yml` (unified) and waits
   for its healthcheck (max 30 s).
4. Starts `ia-os-graphiti-mcp` (LLM = host Ollama by default, no key needed); waits for `:8021/health`.
5. Ensures Ollama answers on `:11500` (installing the `ai.os.ollama` launchd service if
   not) and that `nomic-embed-text` is pulled.
6. Auto-indexes every project under `~/Projects/` via `codebase-memory-mcp
   index_repository`:
   - projects at depth 1 (`~/Projects/<name>/`) **and** depth 2
     (`~/Projects/<group>/<name>/`)
   - filtered to those with a `.git/` directory
   - skips the AI-OS repo itself (the toolchain) and `~/Projects/configs` (secrets)
   - skips projects that are already indexed (use `--refresh` to force)

### Flags

| Flag             | Effect                                                       |
| ---------------- | ------------------------------------------------------------ |
| `--refresh`      | Re-index every project, even ones already in the index.      |
| `--only-start`   | Start the stack but skip indexing.                           |
| `--only-index`   | Skip stack start, only run indexing.                         |
| `--help`         | Print usage.                                                 |

### Examples

```bash
# First-time setup on a fresh machine
bash "$AI_OS_ROOT/setup/ai-os-bootstrap.sh"

# After a big batch of changes — reindex everything
bash "$AI_OS_ROOT/setup/ai-os-bootstrap.sh" --refresh

# Just bring the stack up (no indexing)
bash "$AI_OS_ROOT/setup/ai-os-bootstrap.sh" --only-start

# Just refresh the indexes (stack assumed running)
bash "$AI_OS_ROOT/setup/ai-os-bootstrap.sh" --only-index
```

> **The `ai-os memory` wrapper** is the preferred way to invoke these scripts
> once `ai-os` is on your PATH (the symlink `~/.local/bin/ai-os` points at the
> dispatcher `$AI_OS_ROOT/ai-os`):
>
> ```bash
> ai-os memory status     # same as bash "$AI_OS_ROOT/memory/ai-os-memory.sh" status
> ai-os memory bootstrap  # same as bash "$AI_OS_ROOT/setup/ai-os-bootstrap.sh"
> ai-os loop ...          # routes to $AI_OS_ROOT/memory/ai-os-loop.sh
> ```

## Scheduled reindex: launchd 6×/day

The launchd agent `ai.os.reindex` runs `memory/cron-reindex.sh` at 00:00, 04:00,
08:00, 12:00, 16:00, 20:00 (and catches up after sleep). It replaced a crontab entry
that pointed at the old machine's path and had not run since 2026-09-18. It:

- iterates the same set of projects as the bootstrap: git repos up to 3 levels
  below `AI_OS_PROJECTS_DIR` (default: the directory containing ai-os), minus
  `AI_OS_REINDEX_SKIP` (default `/inHold/`)
- re-indexes each (cheap on the index side; `codebase-memory-mcp` is
  content-addressed — ai-os takes ~1.3 s)
- refreshes grepai's index of ai-os
- writes a log to `memory/logs/cron-reindex-<timestamp>.log` and prunes logs
  older than 30 days

Install / check / remove the agent (install also runs it once and prints the summary):

```bash
bash memory/launchd/install-reindex.sh
bash memory/launchd/install-reindex.sh --status
bash memory/launchd/install-reindex.sh --uninstall
```

## What goes where

```
$AI_OS_ROOT/
├── ai-os                      # Top-level CLI dispatcher (routes memory|loop|bootstrap)
├── memory/
│   ├── ai-os-memory.sh        # Memory-stack CLI: status / start / stop / browse / reindex / bootstrap
│   ├── docker-compose.yml     # UNIFIED compose: `name: ia-os` — all services in one Docker project
│   │                          # Defines: ia-os-falkordb, ia-os-graphiti-mcp, ia-os-ollama (profile)
│   ├── cron-reindex.sh        # 6x/day reindex (launchd agent ai.os.reindex)
│   ├── ai-os-loop.sh          # Spec → Verifier → Environment loop
│   ├── falkordb/
│   │   ├── data/              # FalkorDB persistence (bind mount, absolute path in compose)
│   │   └── ollama-data/       # only exists if the ollama-docker profile was ever started
│   ├── graphiti/
│   │   ├── config.yaml        # Graphiti config; STATUS note has the full history
│   │   └── Dockerfile.standalone.minimal  # the custom build for the minimax-standalone image
│   └── logs/                  # bootstrap-* and cron-reindex-* logs (30-day retention)
└── setup/
    ├── ai-os-bootstrap.sh     # The first-time / on-demand setup script
    ├── README-bootstrap.md    # This file
    ├── install-mac.sh         # One-time installation
    ├── install-windows.ps1    # Windows counterpart
    └── verify.sh              # Post-install health check
```

## Quick health check

```bash
bash "$AI_OS_ROOT/memory/ai-os-memory.sh" status
```

Should print all green. If something is red, the message tells you what to do
(run the bootstrap, install a missing binary, etc.).
