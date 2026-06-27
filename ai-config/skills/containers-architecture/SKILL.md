---
name: containers-architecture
description: Arquitectura de los 3 agent containers (openclaw + opencode + open-design) + infra compartida (postgres, chromadb, ollama, llama-cpp, open-webui). Aplica al setup local de iaWorkSpace en Mac con Docker Desktop.
license: Internal
---

# Containers Architecture

## Overview

Setup local en Mac con Docker Desktop. Stack de IA personal + herramientas de desarrollo + base de datos. Orquestado por `docker-compose.yml` raíz (project name: `iaws-dev`).

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

## Convenciones de naming

- **Project name:** `iaws-dev` (fijo, en `docker-compose.yml`).
- **Container names:** `workspace-{tools|ia|db}-{name}` o nombres simples.
- **Bind mounts:** `./docker/<service>/data/` (gitignored, host-visible).
- **Named volumes:** solo para DB engines (`workspace_postgres_data`, etc.).

## Bind mount convention (crítico)

| Container | Mount | Razón |
|---|---|---|
| `opencode` | `.:/workspace` | Standard |
| `open-design` | `.:/workspace` | Standard |
| `noir` | `.:/workspace` | Standard |
| `openclaw` | `.:/workspace/repo` | **Upstream image owns `/workspace`** |

Regla: si la imagen upstream usa `/workspace`, montar el repo en `/workspace/repo` (sub-path).

## Servicios — resumen

### Agent containers (3)

**openclaw** — asistente personal "Lúa" con UI web + Telegram. Build propio extendiendo `ghcr.io/openclaw/openclaw:2026.4.29`. Incluye: hcloud CLI, Docker CLI, sudo NOPASSWD.
- Puerto: `127.0.0.1:18789:18789`
- Mounts: `.:/workspace/repo`, `~/.ssh:/home/node/.ssh:ro`, `/var/run/docker.sock` (¡root-equivalente!), `docker/openclaw/config:/home/node/.openclaw`
- Env crítica: `OPENCLAW_GATEWAY_TOKEN`, `TELEGRAM_BOT_TOKEN`, `MINIMAX_API_KEY`, `COOLIFY_API_URL/TOKEN`, `HETZNER_API_TOKEN`, `GH_TOKEN`, `CONDUCTOR_IP`
- Trade-off documentado: docker socket + sudo es aceptable para asistente personal local, **NO en multi-tenant prod**.

**opencode** — agente headless de coding (OpenAI-compatible API).
- Puerto: `127.0.0.1:4096:4096`
- Image: `node:22-bookworm-slim` + `npx opencode-ai@latest serve`
- Mounts: `.:/workspace`, `docker/opencode/config:/root/.config/opencode`
- Env crítica: `MINIMAX_API_KEY`, `GH_TOKEN`, `COOLIFY_*`

**open-design** — generador visual de design systems (daemon + Next.js UI).
- Puerto: `127.0.0.1:${OD_PORT:-7456}:${OD_PORT:-7456}` (default 7456)
- Build multi-stage que clona upstream de GitHub en build-time
- Mounts: `.:/workspace`, `docker/open-design/data:/var/lib/open-design` (gitignored), `.:/.agents:/workspace/.agents:ro`
- Env crítica: `OD_API_TOKEN` (requerido, fail-fast), `MINIMAX_API_KEY`, `OPENCODE_BIN=/usr/local/bin/opencode`

### LLM runtimes (3)

**ollama** — LLM local (llama3, mistral, etc.).
- Puerto: `127.0.0.1:11435:11434` (puerto host 11435 evita colisión con ollama nativo)
- Mount: `./docker/models/ollama:/root/.ollama`
- **⚠️ OLLAMA_ORIGINS=*** — aceptable local, riesgo en LAN.

**llama-cpp** — servidor GGUF.
- Puerto: `127.0.0.1:8080:8080`
- Mount: `./docker/models/llama:/models` (si no hay .gguf, sleep infinity)
- Platform: linux/amd64 only

**lmstudio** — alias funcional de LocalAI (OpenAI-compatible).
- Puerto: `127.0.0.1:1234:8080`
- Mount: `./docker/models/lmstudio:/models` + reuse read-only `./docker/models/llama:/models/gguf:ro`

### Frontend (1)

**open-webui** — chat UI para Ollama.
- Puerto: `3010:8080` (**⚠️ sin bind 127.0.0.1** — accesible en LAN)
- Image: `ghcr.io/open-webui/open-webui:main`
- Vol named: `workspace_open_webui_data`
- **⚠️ WEBUI_SECRET_KEY=open-webui-dev-secret** — hardcoded dev.

### Storage (2)

**workspace-postgres** — Postgres 16 + PostGIS multi-arch.
- Puerto: `127.0.0.1:5432:5432`
- Image: `imresamu/postgis:16-3.4-alpine`
- Vol named: `workspace_postgres_data`
- Default creds dev: `postgres/postgres/postgres` — cambiar en prod

**chromadb** — vector DB.
- Puerto: `8000:8000` (**⚠️ sin bind 127.0.0.1** — accesible en LAN)
- Vol named: `workspace_chroma_data`
- `ANONYMIZED_TELEMETRY=FALSE`

### Security (1)

**noir** — escáner OWASP Noir (CLI, sin daemon).
- No expone puertos, se invoca: `docker compose run --rm noir <args>`

## Comandos principales

```bash
# Levantar todo
pnpm containers:up

# Status
pnpm containers:status
docker compose ps

# Logs
docker compose logs -f openclaw
docker compose logs -f open-design

# Restart individual
docker compose restart opencode

# Re-build tras cambios en Dockerfile
docker compose build --pull openclaw
docker compose up -d openclaw

# Backup completo
pnpm backup

# Open OpenClaw UI con token
pnpm containers:openclaw

# Configurar open-design provider
pnpm od:provider ollama       # o 'opencode'
pnpm od:link                  # symlinks designs/<slug>/ → proyectos
pnpm od:migrate               # one-time migrate legacy
```

## Setup inicial

```bash
# 1. Clonar repo
git clone <repo>
cd iaWorkSpace

# 2. Init completo
pnpm install                  # root tooling
node scripts/workspace/init.mjs
#   ↓ git submodule update --init
#   ↓ pnpm install en cada app
#   ↓ docker compose pull (o build fallback)
#   ↓ docker compose up -d --build

# 3. Configurar .env
cp .env.example .env
# Editar:
#   OPENCLAW_GATEWAY_TOKEN=<openssl rand -hex 32>
#   OD_API_TOKEN=<openssl rand -hex 32>
#   MINIMAX_API_KEY=<tu key>
#   COOLIFY_API_URL/TOKEN=<tu coolify>
#   GH_TOKEN=<tu github token>

# 4. Verificar
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

# Sudo NOPASSWD (trade-off documentado)
RUN echo "node ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/node && chmod 0440 /etc/sudoers.d/node

USER node
```

### Dockerfile open-design (multi-stage con clone upstream)

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
# Backup completo de state de containers
pnpm backup
# Equivalente a:
sh scripts/containers/backup.sh --include-secrets

# Restore
tar -xzf .backups/containers-<timestamp>.tar.gz -C .
```

Excluye (vía `.backupignore`):
- `docker/*/data/secrets/`
- `*.log`
- `node_modules/`
- `.git/`

Incluye:
- `docker/openclaw/config/`
- `docker/opencode/config/`
- `docker/open-design/data/` (sin secrets)
- Volumes nombrados (postgres, chromadb, open-webui)

## Errores comunes

1. ❌ Montar repo en `/workspace` cuando la image upstream usa ese path → conflicto con archivos del container.
2. ❌ `docker compose up` antes de `pnpm install` → módulos faltantes.
3. ❌ `OD_API_TOKEN` vacío → open-design falla con "OD_API_TOKEN required".
4. ❌ `docker/openclaw/config` no en `.gitignore` → commit accidental de tokens.
5. ❌ No liberar puerto 5432 antes de levantar → conflicto con Postgres nativo.
6. ❌ `docker compose build` sin `--pull` → imagen base desactualizada.
7. ❌ Reusar `ollama` nativo y container simultáneamente → port conflict en 11434.
8. ❌ Backup sin `--include-secrets` → restore pierde config crítica.
9. ❌ `OLLAMA_ORIGINS=*` en LAN → CSRF risk.
10. ❌ open-webui accesible en `0.0.0.0:3010` en red pública → leak de conversaciones.

## Troubleshooting

```bash
# Container no arranca
docker compose logs <service>
docker compose ps -a

# Puerto ocupado
lsof -i :<port>
# Liberar o cambiar en docker-compose.yml

# Disk full (volumes crecen)
docker system df
docker system prune -a --volumes  # ⚠️ borra todo, backup primero

# Network issue entre containers
docker compose exec <service> ping <other-service>

# Rebuild from scratch
docker compose down -v
docker compose build --pull --no-cache
docker compose up -d
```

## Recursos

- Docker Compose v2 docs
- openclaw image: `ghcr.io/openclaw/openclaw:2026.4.29`
- open-design repo: github.com/nexu-io/open-design
- mkcert para certs locales
- Skill relacionada: `iaworkspace-patterns` (overview)
- Skill relacionada: `hetzner-cloud-cli` (para deploy en VPS real)