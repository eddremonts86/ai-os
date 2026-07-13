---
name: env-config-iaworkspace
description: Environment configuration pattern for the iaWorkSpace workspace — Port Allocation Map, local/clerk/hybrid AUTH_MODE, 7 canonical sections of .env, default admin credentials, shared workspace-postgres DB, standalone/docker profiles. Applies to workspace apps or any multi-app setup with shared infra.
license: Internal
---

# Env Config — iaWorkSpace Pattern

`.env` convention and service configuration for iaWorkSpace workspace apps. Single source of truth for naming, defaults, and ports.

## 7 canonical sections of `.env`

Mandatory order (left to right in the file):

### 1. Application

```bash
NODE_ENV=development
APP_PORT=3000
APP_URL=http://localhost:3000
LOG_LEVEL=info
```

### 2. Database

```bash
DATABASE_URL=postgresql://<user>:***@localhost:5432/<dbname>
DATABASE_POOL_SIZE=10
DB_USER=geo
DB_PASSWORD=geolocal
DB_NAME=geo_dashboard
```

### 3. Authentication

```bash
# local | clerk | hybrid
AUTH_MODE=local
VITE_AUTH_MODE=local                  # mandatory mirror for frontend
SHOULD_USE_CLERK_PROVIDER=             # deprecated, use AUTH_MODE

# Better Auth
BETTER_AUTH_SECRET=<openssl rand -base64 32>
BETTER_AUTH_URL=http://localhost:3000

# Clerk (if AUTH_MODE=clerk)
CLERK_PUBLISHABLE_KEY=pk_test_xxx
CLERK_SECRET_KEY=sk_test_xxx
```

### 4. Default Admin

```bash
DEFAULT_ADMIN_EMAIL=edd_admin@local.com
DEFAULT_ADMIN_PASSWORD=Passw0rd!234   # ⚠️ dev only; rotate in prod
DEFAULT_ADMIN_NAME=Edd Admin
```

**Important:** these values are also in the root `iaWorkSpace/.env`, not only in each app.

### 5. AI Local

```bash
OLLAMA_BASE_URL=http://localhost:11435
OLLAMA_MODEL=llama3.2
LLAMA_CPP_BASE_URL=http://localhost:8080/v1
LMSTUDIO_BASE_URL=http://localhost:1234/v1
```

### 6. AI Cloud

```bash
MINIMAX_API_KEY=*** key>
MINIMAX_BASE_URL=https://api.minimaxi.chat/v1
OPENAI_API_KEY=sk-...                  # optional
ANTHROPIC_API_KEY=sk-ant-...           # optional
```

### 7. Observability

```bash
SENTRY_DSN=
SENTRY_ENVIRONMENT=development
SENTRY_TRACES_SAMPLE_RATE=0.1
```

### App-specific (after the 7)

```bash
# e.g.: geo-dashboard
SCRAPE_SCHEDULE=true
SCRAPE_INTERVAL_HOURS=6
PLAYWRIGHT_BROWSERS_PATH=/ms-playwright

# e.g.: builderhunt
GITHUB_TOKEN=
REDDIT_CLIENT_ID=
RESEND_API_KEY=

# e.g.: budget-app
STRIPE_SECRET_KEY=
STRIPE_WEBHOOK_SECRET=
```

## Port Allocation Map

| App | Port | Local domain |
|---|---|---|
| edd-remonts-dashboard | 3000 | `profile.eduardoinerarte.local` |
| geo-dashboard | 3001 | `geo.eduardoinerarte.local` |
| voice-prompt-cleaner | 5173 | `voice.eduardoinerarte.local` |
| hola-eduardo | 3000 | `hola.eduardoinerarte.local` |
| builderhunt | 3000 | `builderhunt.eduardoinerarte.local` |
| budget-app | 3000 | `budget.eduardoinerarte.local` |
| countdown-timer | 3000 | `countdown.eduardoinerarte.local` |
| edd-app-template | 3000 | `template.eduardoinerarte.local` |
| tanstack-template | 3000 | `tanstack.eduardoinerarte.local` |
| openclaw | 18789 | `127.0.0.1:18789` |
| opencode | 4096 | `127.0.0.1:4096` |
| open-design | 7456 | `127.0.0.1:7456` |
| open-webui | 3010 | `127.0.0.1:3010` |
| ollama | 11435 | `127.0.0.1:11435` |
| llama-cpp | 8080 | `127.0.0.1:8080` |
| lmstudio | 1234 | `127.0.0.1:1234` |
| workspace-postgres | 5432 | `127.0.0.1:5432` |
| chromadb | 8000 | `127.0.0.1:8000` |
| Traefik dashboard | 8080 | `traefik.eduardoinerarte.local` |

**Rules:**
- Web apps use 3000 by default, and only increment when there is a conflict.
- Shared services (postgres, ollama) have fixed ports.
- Traefik dashboard on 8080 (same as llama-cpp host-side, but Traefik in prod fleet, llama-cpp in local dev — different compose file).

## Shared DB: workspace-postgres

**Single Postgres container for all workspace apps.**

```yaml
# docker-compose.yml (root)
services:
  workspace-postgres:
    image: imresamu/postgis:16-3.4-alpine
    ports:
      - "127.0.0.1:5432:5432"
    environment:
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: postgres
      POSTGRES_DB: postgres
    volumes:
      - workspace_postgres_data:/var/lib/postgresql/data
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U postgres"]
      interval: 10s
      timeout: 5s
      retries: 5
```

Each app creates its own DB + role:

```sql
-- db-init in compose.d/<app>.yml
DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname='geo') THEN
    CREATE ROLE geo LOGIN PASSWORD 'geolocal';
  END IF;
END $$;

CREATE DATABASE geo_dashboard OWNER geo;
GRANT ALL PRIVILEGES ON DATABASE geo_dashboard TO geo;
```

**Naming convention:**
- DB name: `snake_case` (e.g. `geo_dashboard`, `edd_remonts_dashboard`, `budget_app`)
- Role: `snake_case` (e.g. `geo`, `budget`, `template`)
- Password: `<name>local` (e.g. `geolocal`, `budgetlocal`, `templatelocal`) — dev only

## AUTH_MODE variants

### local (default)

Uses Better Auth with its own DB. Default admin seeded on boot.

```bash
AUTH_MODE=local
VITE_AUTH_MODE=local
BETTER_AUTH_SECRET=<openssl rand -base64 32>
```

### clerk

Uses Clerk for everything (sign-up, sign-in, session, user mgmt). Backend only validates the JWT.

```bash
AUTH_MODE=clerk
VITE_AUTH_MODE=clerk
CLERK_PUBLISHABLE_KEY=pk_test_xxx
CLERK_SECRET_KEY=sk_test_xxx
```

### hybrid

Better Auth for app users + Clerk for admin users. Requires custom logic in middleware.

```bash
AUTH_MODE=hybrid
VITE_AUTH_MODE=hybrid
BETTER_AUTH_SECRET=<openssl rand -base64 32>
CLERK_PUBLISHABLE_KEY=pk_test_xxx
CLERK_SECRET_KEY=sk_test_xxx
DEFAULT_ADMIN_PROVIDER=clerk        # vs 'local'
```

**Important:** `VITE_AUTH_MODE` mirrors `AUTH_MODE` — the frontend reads `VITE_*` to show/hide UI elements.

## Auth file naming (variable)

Each app may have its own auth setup file with a different name:

| App | File | DB tables |
|---|---|---|
| edd-remonts-dashboard | `src/lib/better-auth.ts` | `auth_users`, `auth_accounts` |
| geo-dashboard | `src/lib/server.ts` | `users`, `accounts` |
| others | `src/lib/auth.ts` | `user`, `account` |

iaWorkSpace convention:
- File: `<feature>/auth.ts` or `<feature>/better-auth.ts` or `<feature>/server.ts`
- Tables: `<app>_users/<app>_accounts` or `users/accounts`

Maintain consistency **within** the app, not cross-app.

## Docker profiles

The root `docker-compose.yml` supports 2 profiles:

### standalone (default)

```bash
docker compose --profile standalone up -d
# Brings up: postgres + openclaw + opencode + open-design
# NOT: ollama, llama-cpp, lmstudio, open-webui, chromadb
```

Uses the workspace-postgres container + native AI runtimes (Ollama Desktop, LM Studio, etc.) installed on the Mac.

### ai

```bash
docker compose --profile ai up -d
# Brings up EVERYTHING including AI runtimes in containers
```

For when you want 100% containerized AI (CI, demos).

```bash
# Default (no profile)
docker compose up -d
# = standalone
```

## Setup scripts

```bash
# Initialize DB + seed admin (cross-app)
node scripts/db/create-db.ts geo_dashboard geo geolocal
pnpm db:up
pnpm db:migrate
pnpm db:seed:admin

# Or for a specific app
cd apps/geo-dashboard
pnpm db:migrate
pnpm db:seed:admin
```

## Required variables per provider

| Provider | Vars | Notes |
|---|---|---|
| Postgres | `DATABASE_URL` | Required |
| Ollama | `OLLAMA_BASE_URL` | `http://ollama:11434` (compose DNS) or `http://localhost:11435` (host) |
| LM Studio | `LMSTUDIO_BASE_URL` | `http://host.docker.internal:1234/v1` from container |
| llama.cpp | `LLAMA_CPP_BASE_URL` | `http://llama-cpp:8080/v1` |
| ChromaDB | `CHROMADB_URL` | `http://chromadb:8000` |
| Clerk | `CLERK_PUBLISHABLE_KEY` + `CLERK_SECRET_KEY` | Both required |
| Better Auth | `BETTER_AUTH_SECRET` + `BETTER_AUTH_URL` | `SECRET` min 32 chars |
| Sentry | `SENTRY_DSN` | Production only |
| Stripe | `STRIPE_SECRET_KEY` + `STRIPE_WEBHOOK_SECRET` | |
| GitHub | `GITHUB_TOKEN` or `GH_TOKEN` | scope: `repo` |

## Network access matrix

| Container | Host network | Compose network | External |
|---|---|---|---|
| workspace-postgres | 127.0.0.1:5432 | hostname: `postgres` | NO |
| ollama | 127.0.0.1:11435 | hostname: `ollama` | NO |
| llama-cpp | 127.0.0.1:8080 | hostname: `llama-cpp` | NO |
| lmstudio | 127.0.0.1:1234 | hostname: `lmstudio` | NO |
| openclaw | 127.0.0.1:18789 | hostname: `openclaw` | NO |
| opencode | 127.0.0.1:4096 | hostname: `opencode` | NO |
| open-design | 127.0.0.1:7456 | hostname: `open-design` | NO |
| open-webui | LAN:3010 | hostname: `open-webui` | YES ⚠️ |
| chromadb | LAN:8000 | hostname: `chromadb` | YES ⚠️ |

**Rules:**
- DB and AI runtimes: only 127.0.0.1.
- Agents (openclaw, opencode, open-design): 127.0.0.1.
- Web UIs (open-webui, chromadb): accessible on LAN by design (collaboration features).

## Volume naming

| Volume | Mount | Service |
|---|---|---|
| `workspace_postgres_data` | `/var/lib/postgresql/data` | postgres |
| `workspace_open_webui_data` | `/app/backend/data` | open-webui |
| `workspace_chroma_data` | `/data` | chromadb |
| `./docker/models/ollama` (bind) | `/root/.ollama` | ollama |
| `./docker/models/llama` (bind) | `/models` | llama-cpp |
| `./docker/models/lmstudio` (bind) | `/models` | lmstudio |
| `./docker/openclaw/config` (bind) | `/home/node/.openclaw` | openclaw |
| `./docker/opencode/config` (bind) | `/root/.config/opencode` | opencode |
| `./docker/open-design/data` (bind) | `/var/lib/open-design` | open-design |

**Convention:**
- Named volumes for DB engines (persistent, easier to back up).
- Bind mounts for configs and models (host-visible, easy to edit).

## Common errors

1. ❌ Forgetting `VITE_AUTH_MODE` mirror → frontend does not show correct UI.
2. ❌ DB name without snake_case → queries with quoting fail.
3. ❌ DB password without `local` suffix → does not match the `db-init` pattern.
4. ❌ Port 3001 occupied by another app → change `APP_PORT`.
5. ❌ `OLLAMA_BASE_URL=http://localhost:11434` from inside a container → use `http://ollama:11434` (compose DNS) or `http://host.docker.internal:11435` (host).
6. ❌ Postgres creds changed but app DBs not regenerated → connection refused.
7. ❌ Frontend reads `process.env.X` → must be `import.meta.env.VITE_X`.
8. ❌ `BETTER_AUTH_SECRET` < 32 chars → app fails on boot.
9. ❌ DBs without correct owner → app cannot create tables.
10. ❌ Multi-profile accidentally enabled → port conflicts.

## Verification

```bash
# Validate full config
pnpm doctor                # workspace root

# DB connectivity
docker exec workspace-postgres pg_isready -U postgres

# App-specific
cd apps/geo-dashboard
pnpm doctor                # if it exists

# Env vars loaded
node -e "console.log(Object.keys(process.env).filter(k => k.includes('DATABASE') || k.includes('AUTH') || k.includes('MINIMAX')).sort())"

# Bind mount correct
docker exec openclaw ls /workspace/repo | head
docker exec opencode ls /workspace | head
docker exec open-design ls /workspace | head
```

## AI-OS canonical local env (source of truth)

The merged master file for all projects is
**`$AI_OS_ROOT/dev-env/env-config/.env`** (default root `~/Projects/ai-os`). Read it
first whenever a task needs a real env value (DB URL, port, auth secret, LLM
endpoint/key, agent or infra token) before inventing, hardcoding, or asking. Its
committed placeholder twin is `$AI_OS_ROOT/dev-env/env-config/.env.example`. The real
`.env` is gitignored: use values in place, never echo/print/log/commit them
(see `rules/never_do.md`).

## Resources

- Related skill: `containers-architecture` — container setup
- Related skill: `env-config-and-secrets` — general .env patterns
- Related skill: `iaworkspace-patterns` — overview
- Root `.env.example` — canonical template
- `prod/stack.config.mjs` — apps reference with DB
- [iaWorkSpace AGENTS.md](../eddremonts86/iaWorkSpace/AGENTS.md) — hard rules