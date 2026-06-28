---
name: containers-architecture
description: Architecture of the 3 agent containers (openclaw + opencode + open-design) + shared infra (postgres, chromadb, ollama, llama-cpp, open-webui). Applies to local iaWorkSpace setup on Mac with Docker Desktop.
license: Internal
---

# Containers Architecture

## Overview

Local setup on Mac with Docker Desktop. Personal AI stack + dev tools + database. Orchestrated by root `docker-compose.yml` (project name: `iaws-dev`).

```
┌─────────────────────────────────────────────────────────────────┐
│ Host (Mac)                                                       │
│                                                                  │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐             │
│  │  openclaw   │  │  opencode   │  │ open-design │  ← agents    │
│  │  :18789     │  │  :4096      │  │  :7456      │             │
│  └─────────────┘  └─────────────┘  └─────────────┘             │
│                                                                  │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐             │
│  │  ollama     │  │  llama-cpp  │  │  lmstudio   │  ← LLM runtimes│
│  │  :11435     │  │  :8080      │  │  :1234      │             │
│  └─────────────┘  └─────────────┘  └─────────────┘             │
│                                                                  │
│  ┌─────────────┐  ┌─────────────┐                ┌────────────┐ │
│  │ open-webui  │  │  chromadb   │  workspace-    │   noir     │ │
│  │  :3010      │  │  :8000      │  postgres:5432 │  (CLI)     │ │
│  └─────────────┘  └─────────────┘                └────────────┘ │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

## Naming conventions

- **Project name:** `iaws-dev` (fixed, in `docker-compose.yml`).
- **Container names:** `workspace-{tools|ia|db}-{name}` or simple names.
- **Bind mounts:** `./docker/<service>/data/` (gitignored, host-visible).
- **Named volumes:** only for DB engines (`workspace_postgres_data`, etc.).

## Bind mount convention (critical)

| Container | Mount | Reason |
|---|---|---|
| `opencode` | `.:/workspace` | Standard |
| `open-design` | `.:/workspace` | Standard |
| `noir` | `.:/workspace` | Standard |
| `openclaw` | `.:/workspace/repo` | **Upstream image owns `/workspace`** |

Rule: if the upstream image uses `/workspace`, mount the repo at `/workspace/repo` (sub-path).

## Services — summary

### Agent containers (3)

**openclaw** — personal assistant "Lúa" with web UI + Telegram. Custom build extending `ghcr.io/openclaw/openclaw:2026.4.29`. Includes: hcloud CLI, Docker CLI, sudo NOPASSWD.
- Port: `127.0.0.1:18789:18789`
- Mounts: `.:/workspace/repo`, `~/.ssh:/home/node/.ssh:ro`, `/var/run/docker.sock` (root-equivalent!), `docker/openclaw/config:/home/node/.openclaw`
- Critical env: `OPENCLAW_GATEWAY_TOKEN`, `TELEGRAM_BOT_TOKEN`, `MINIMAX_API_KEY`, `COOLIFY_API_URL/TOKEN`, `HETZNER_API_TOKEN`, `GH_TOKEN`, `CONDUCTOR_IP`
- Documented trade-off: docker socket + sudo is acceptable for local personal assistant, **NOT in multi-tenant prod**.

**opencode** — headless coding agent (OpenAI-compatible API).
- Port: `127.0.0.1:4096:4096`
- Image: `node:22-bookworm-slim` + `npx opencode-ai@latest serve`
- Mounts: `.:/workspace`, `docker/opencode/config:/root/.config/opencode`
- Critical env: `MINIMAX_API_KEY`, `GH_TOKEN`, `COOLIFY_*`

**open-design** — visual design system generator (daemon + Next.js UI).
- Port: `127.0.0.1:${OD_PORT:-7456}:${OD_PORT:-7456}` (default 7456)
- Multi-stage build that clones upstream from GitHub at build time
- Mounts: `.:/workspace`, `docker/open-design/data:/var/lib/open-design` (gitignored), `.:/.agents:/workspace/.agents:ro`
- Critical env: `OD_API_TOKEN` (required, fail-fast), `MINIMAX_API_KEY`, `OPENCODE_BIN=/usr/local/bin/opencode`

### LLM runtimes (3)

**ollama** — local LLM (llama3, mistral, etc.).
- Port: `127.0.0.1:11435:11434` (host port 11435 avoids collision with native ollama)
- Mount: `./docker/models/ollama:/root/.ollama`
- **⚠️ OLLAMA_ORIGINS=*** — acceptable locally, risky on LAN.

**llama-cpp** — GGUF server.
- Port: `127.0.0.1:8080:8080`
- Mount: `./docker/models/llama:/models` (if no .gguf, sleep infinity)
- Platform: linux/amd64 only

**lmstudio** — functional alias of LocalAI (OpenAI-compatible).
- Port: `127.0.0.1:1234:8080`
- Mount: `./docker/models/lmstudio:/models` + reuse read-only `./docker/models/llama:/models/gguf:ro`

### Frontend (1)

**open-webui** — chat UI for Ollama.
- Port: `3010:8080` (**⚠️ no 127.0.0.1 bind** — accessible on LAN)
- Image: `ghcr.io/open-webui/open-webui:main`
- Named vol: `workspace_open_webui_data`
- **⚠️ WEBUI_SECRET_KEY=open-webui-dev-secret** — hardcoded dev.

### Storage (2)

**workspace-postgres** — Postgres 16 + PostGIS multi-arch.
- Port: `127.0.0.1:5432:5432`
- Image: `imresamu/postgis:16-3.4-alpine`
- Named vol: `workspace_postgres_data`
- Default dev creds: `postgres/postgres/postgres` — change in prod

**chromadb** — vector DB.
- Port: `8000:8000` (**⚠️ no 127.0.0.1 bind** — accessible on LAN)
- Named vol: `workspace_chroma_data`
- `ANONYMIZED_TELEMETRY=FALSE`

### Security (1)

**noir** — OWASP Noir scanner (CLI, no daemon).
- No exposed ports, invoked as: `docker compose run --rm noir <args>`

## Main commands

```bash
# Bring everything up
pnpm containers:up

# Status
pnpm containers:status
docker compose ps

# Logs
docker compose logs -f openclaw
docker compose logs -f open-design

# Restart individual
docker compose restart opencode

# Rebuild after Dockerfile changes
docker compose build --pull openclaw
docker compose up -d openclaw

# Full backup
pnpm backup

# Open OpenClaw UI with token
pnpm containers:openclaw
# Configure open-design provider
pnpm od:provider ollama       # or 'opencode'
pnpm od:link                  # symlinks designs/<slug>/ → projects
pnpm od:migrate               # one-time legacy migrate
```

## Initial setup

```bash
# 1. Clone repo
git clone <repo>
cd iaWorkSpace

# 2. Full init
pnpm install                  # root tooling
node scripts/workspace/init.mjs
#   ↓ git submodule update --init
#   ↓ pnpm install in each app
#   ↓ docker compose pull (or build fallback)
#   ↓ docker compose up -d --build

# 3. Configure .env
cp .env.example .env
# Edit:
#   OPENCLAW_GATEWAY_TOKEN=<openssl rand -hex 32>
#   OD_API_TOKEN=<openssl rand -hex 32>
#   MINIMAX_API_KEY=<your key>
#   COOLIFY_API_URL/TOKEN=<your coolify>
#   GH_TOKEN=<your github token>

# 4. Verify
pnpm doctor

# 5. Open services
open http://127.0.0.1:18789   # openclaw
open http://127.0.0.1:7456    # open-design
```

## Build patterns

### Dockerfile openclaw (extends upstream)

```dockerfile
FROM ghcr.io/openclaw/openclaw:2026.4.29

USER root
RUN apt-get update && apt-get install -y \
    sudo bc jq curl wget git sqlite3 python3 python3-pip \
    make unzip zip ripgrep fd-find ca-certificates

# hcloud CLI
RUN curl -fsSL https://github.com/hetznercloud/cli/releases/latest/download/hcloud-linux-amd64.tar.gz \
    | tar -xz -C /usr/local/bin hcloud && chmod +x /usr/local/bin/hcloud

# Docker CLI
RUN install -m 0755 -d /etc/apt/keyrings \
    && curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian bookworm stable" > /etc/apt/sources.list.d/docker.list \
    && apt-get update && apt-get install -y docker-ce-cli

# Sudo NOPASSWD (documented trade-off)
RUN echo "node ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/node && chmod 0440 /etc/sudoers.d/node

USER node
```

### Dockerfile open-design (multi-stage with upstream clone)

```dockerfile
# Stage 1: builder
FROM node:22-bookworm-slim AS builder
ARG OD_GIT_REPO=https://github.com/nexu-io/open-design.git
ARG OD_GIT_REF=main
ARG OPENCODE_VERSION=latest

RUN git clone --depth 1 --branch $OD_GIT_REF $OD_GIT_REPO /src
WORKDIR /src
RUN corepack enable && pnpm install --frozen-lockfile
RUN pnpm -r build
RUN NODE_ENV=production pnpm --filter web export
RUN pnpm deploy --prod --legacy /deploy

# Stage 2: runtime
FROM node:22-bookworm-slim
RUN corepack enable && npm install -g opencode-ai@$OPENCODE_VERSION \
    && ln -s $(which opencode-ai) /usr/local/bin/opencode

COPY --from=builder /deploy /opt/open-design
COPY --from=builder /src/apps/web/out /opt/open-design/apps/web/out

WORKDIR /opt/open-design
ENV NODE_ENV=production
ENV OD_DATA_DIR=/var/lib/open-design
ENV OD_EXTRA_CONFIG_DIR=/var/lib/open-design/extra-config
ENV OD_BIND_HOST=0.0.0.0
ENV OD_PORT=7456

EXPOSE 7456
HEALTHCHECK CMD node -e "fetch('http://localhost:7456/api/health').then(r=>process.exit(r.ok?0:1))"
CMD ["node", "/opt/open-design/apps/daemon/dist/cli.js", "--no-open"]
```

## Backup

```bash
# Full backup of container state
pnpm backup
# Equivalent to:
sh scripts/containers/backup.sh --include-secrets

# Restore
tar -xzf .backups/containers-<timestamp>.tar.gz -C .
```

Excludes (via `.backupignore`):
- `docker/*/data/secrets/`
- `*.log`
- `node_modules/`
- `.git/`

Includes:
- `docker/openclaw/config/`
- `docker/opencode/config/`
- `docker/open-design/data/` (without secrets)
- Named volumes (postgres, chromadb, open-webui)

## Common errors

1. ❌ Mounting repo at `/workspace` when upstream image uses that path → conflict with container files.
2. ❌ `docker compose up` before `pnpm install` → missing modules.
3. ❌ Empty `OD_API_TOKEN` → open-design fails with "OD_API_TOKEN required".
4. ❌ `docker/openclaw/config` not in `.gitignore` → accidental commit of tokens.
5. ❌ Not freeing port 5432 before bringing up → conflict with native Postgres.
6. ❌ `docker compose build` without `--pull` → outdated base image.
7. ❌ Reusing native `ollama` and container simultaneously → port conflict on 11434.
8. ❌ Backup without `--include-secrets` → restore loses critical config.
9. ❌ `OLLAMA_ORIGINS=*` on LAN → CSRF risk.
10. ❌ open-webui accessible on `0.0.0.0:3010` on public network → conversation leaks.

## Troubleshooting

```bash
# Container won't start
docker compose logs <service>
docker compose ps -a

# Port in use
lsof -i :<port>
# Free or change in docker-compose.yml

# Disk full (volumes growing)
docker system df
docker system prune -a --volumes  # ⚠️ deletes everything, backup first

# Network issue between containers
docker compose exec <service> ping <other-service>

# Rebuild from scratch
docker compose down -v
docker compose build --pull --no-cache
docker compose up -d
```

## Resources

- Docker Compose v2 docs
- openclaw image: `ghcr.io/openclaw/openclaw:2026.4.29`
- open-design repo: github.com/nexu-io/open-design
- mkcert for local certs
- Related skill: `iaworkspace-patterns` (overview)
- Related skill: `hetzner-cloud-cli` (for real VPS deploy)