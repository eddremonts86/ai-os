---
name: env-config-iaworkspace
description: Patrón de configuración de entorno del workspace iaWorkSpace — Port Allocation Map, AUTH_MODE local/clerk/hybrid, 7 secciones canónicas de .env, default admin credentials, DB compartido workspace-postgres, profiles standalone/docker. Aplica a apps del workspace o cualquier setup multi-app con shared infra.
license: Internal
---

# Env Config — iaWorkSpace Pattern

Convención de `.env` y configuración de servicios para apps del workspace iaWorkSpace. Single source of truth para naming, defaults y ports.

## 7 secciones canónicas de `.env`

Orden obligatorio (de izquierda a derecha en el archivo):

### 1. Application

```bash
NODE_ENV=development
APP_PORT=3000
APP_URL=http://localhost:3000
LOG_LEVEL=info
```

### 2. Database

```bash
DATABASE_URL=postgresql://<user>:<password>@localhost:5432/<dbname>
DATABASE_POOL_SIZE=10
DB_USER=geo
DB_PASSWORD=geolocal
DB_NAME=geo_dashboard
```

### 3. Authentication

```bash
# local | clerk | hybrid
AUTH_MODE=local
VITE_AUTH_MODE=local                  # mirror obligatorio para frontend
SHOULD_USE_CLERK_PROVIDER=             # deprecated, usar AUTH_MODE

# Better Auth
BETTER_AUTH_SECRET=<openssl rand -base64 32>
BETTER_AUTH_URL=http://localhost:3000

# Clerk (si AUTH_MODE=clerk)
CLERK_PUBLISHABLE_KEY=pk_test_xxx
CLERK_SECRET_KEY=sk_test_xxx
```

### 4. Default Admin

```bash
DEFAULT_ADMIN_EMAIL=edd_admin@local.com
DEFAULT_ADMIN_PASSWORD=Passw0rd!234   # ⚠️ solo dev; rotar en prod
DEFAULT_ADMIN_NAME=Edd Admin
```

**Importante:** estos valores también en `iaWorkSpace/.env` raíz, no solo en cada app.

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
OPENAI_API_KEY=sk-...                  # opcional
ANTHROPIC_API_KEY=sk-ant-...           # opcional
```

### 7. Observability

```bash
SENTRY_DSN=
SENTRY_ENVIRONMENT=development
SENTRY_TRACES_SAMPLE_RATE=0.1
```

### App-specific (después de las 7)

```bash
# ej: geo-dashboard
SCRAPE_SCHEDULE=true
SCRAPE_INTERVAL_HOURS=6
PLAYWRIGHT_BROWSERS_PATH=/ms-playwright

# ej: builderhunt
GITHUB_TOKEN=
REDDIT_CLIENT_ID=
RESEND_API_KEY=

# ej: budget-app
STRIPE_SECRET_KEY=
STRIPE_WEBHOOK_SECRET=
```

## Port Allocation Map

| App | Puerto | Dominio local |
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

**Reglas:**
- Apps web usan 3000 default, incrementan solo si hay conflicto.
- Servicios compartidos (postgres, ollama) tienen puertos fijos.
- Traefik dashboard en 8080 (mismo que llama-cpp host-side, pero Traefik en fleet prod, llama-cpp en dev local — distinto compose file).

## DB compartido: workspace-postgres

**Single Postgres container para todas las apps del workspace.**

```yaml
# docker-compose.yml (raíz)
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

Cada app crea su propia DB + role:

```sql
-- db-init en compose.d/<app>.yml
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
- DB name: `snake_case` (ej. `geo_dashboard`, `edd_remonts_dashboard`, `budget_app`)
- Role: `snake_case` (ej. `geo`, `budget`, `template`)
- Password: `<name>local` (ej. `geolocal`, `budgetlocal`, `templatelocal`) — solo dev

## AUTH_MODE variants

### local (default)

Usa Better Auth con DB propia. Default admin seeded al boot.

```bash
AUTH_MODE=local
VITE_AUTH_MODE=local
BETTER_AUTH_SECRET=<openssl rand -base64 32>
```

### clerk

Usa Clerk para todo (sign-up, sign-in, session, user mgmt). Backend solo valida JWT.

```bash
AUTH_MODE=clerk
VITE_AUTH_MODE=clerk
CLERK_PUBLISHABLE_KEY=pk_test_xxx
CLERK_SECRET_KEY=sk_test_xxx
```

### hybrid

Mejor Auth para app users + Clerk para admin users. Necesita lógica custom en middleware.

```bash
AUTH_MODE=hybrid
VITE_AUTH_MODE=hybrid
BETTER_AUTH_SECRET=<openssl rand -base64 32>
CLERK_PUBLISHABLE_KEY=pk_test_xxx
CLERK_SECRET_KEY=sk_test_xxx
DEFAULT_ADMIN_PROVIDER=clerk        # vs 'local'
```

**Importante:** `VITE_AUTH_MODE` mirror de `AUTH_MODE` — el frontend lee `VITE_*` para mostrar/ocultar UI elements.

## Auth file naming (variable)

Cada app puede tener su archivo de auth setup con nombre distinto:

| App | Archivo | DB tables |
|---|---|---|
| edd-remonts-dashboard | `src/lib/better-auth.ts` | `auth_users`, `auth_accounts` |
| geo-dashboard | `src/lib/server.ts` | `users`, `accounts` |
| others | `src/lib/auth.ts` | `user`, `account` |

Convención iaWorkSpace:
- File: `<feature>/auth.ts` o `<feature>/better-auth.ts` o `<feature>/server.ts`
- Tables: `<app>_users/<app>_accounts` o `users/accounts`

Mantener consistencia **dentro** de la app, no cross-app.

## Docker profiles

El `docker-compose.yml` raíz soporta 2 profiles:

### standalone (default)

```bash
docker compose --profile standalone up -d
# Levanta: postgres + openclaw + opencode + open-design
# NO: ollama, llama-cpp, lmstudio, open-webui, chromadb
```

Usa el container workspace-postgres + AI runtimes nativos (Ollama Desktop, LM Studio, etc.) instalados en Mac.

### ai

```bash
docker compose --profile ai up -d
# Levanta TODO incluyendo AI runtimes en containers
```

Para cuando querés AI 100% containerizado (CI, demos).

```bash
# Default (no profile)
docker compose up -d
# = standalone
```

## Setup scripts

```bash
# Inicializar DB + seed admin (cross-app)
node scripts/db/create-db.ts geo_dashboard geo geolocal
pnpm db:up
pnpm db:migrate
pnpm db:seed:admin

# O para una app específica
cd apps/geo-dashboard
pnpm db:migrate
pnpm db:seed:admin
```

## Variables requeridas por provider

| Provider | Vars | Notas |
|---|---|---|
| Postgres | `DATABASE_URL` | Required |
| Ollama | `OLLAMA_BASE_URL` | `http://ollama:11434` (compose DNS) o `http://localhost:11435` (host) |
| LM Studio | `LMSTUDIO_BASE_URL` | `http://host.docker.internal:1234/v1` desde container |
| llama.cpp | `LLAMA_CPP_BASE_URL` | `http://llama-cpp:8080/v1` |
| ChromaDB | `CHROMADB_URL` | `http://chromadb:8000` |
| Clerk | `CLERK_PUBLISHABLE_KEY` + `CLERK_SECRET_KEY` | Ambos requeridos |
| Better Auth | `BETTER_AUTH_SECRET` + `BETTER_AUTH_URL` | `SECRET` min 32 chars |
| Sentry | `SENTRY_DSN` | Solo producción |
| Stripe | `STRIPE_SECRET_KEY` + `STRIPE_WEBHOOK_SECRET` | |
| GitHub | `GITHUB_TOKEN` o `GH_TOKEN` | scope: `repo` |

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

**Reglas:**
- DB y AI runtimes: solo 127.0.0.1.
- Agents (openclaw, opencode, open-design): 127.0.0.1.
- Web UIs (open-webui, chromadb): accesibles en LAN por diseño (collaboration features).

## Naming de volumes

| Volume | Mount | Servicio |
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

**Convención:**
- Named volumes para DB engines (persistentes, easier backup).
- Bind mounts para configs y modelos (host-visible, easy edit).

## Errores comunes

1. ❌ Olvidar `VITE_AUTH_MODE` mirror → frontend no muestra UI correcta.
2. ❌ DB name sin snake_case → queries con quoting fallan.
3. ❌ DB password sin sufijo `local` → no matches el patrón de `db-init`.
4. ❌ Puerto 3001 ocupado por otra app → cambiar `APP_PORT`.
5. ❌ `OLLAMA_BASE_URL=http://localhost:11434` desde container → usar `http://ollama:11434` (compose DNS) o `http://host.docker.internal:11435` (host).
6. ❌ Postgres creds cambiadas pero no regeneradas las DBs de apps → connection refused.
7. ❌ Frontend lee `process.env.X` → debe ser `import.meta.env.VITE_X`.
8. ❌ `BETTER_AUTH_SECRET` < 32 chars → app falla al boot.
9. ❌ DBs sin owner correcto → app no puede crear tablas.
10. ❌ Multi-profile activado por error → conflictos de port.

## Verificación

```bash
# Validar config completa
pnpm doctor                # workspace root

# DB connectivity
docker exec workspace-postgres pg_isready -U postgres

# App-specific
cd apps/geo-dashboard
pnpm doctor                # si existe

# Env vars cargadas
node -e "console.log(Object.keys(process.env).filter(k => k.includes('DATABASE') || k.includes('AUTH') || k.includes('MINIMAX')).sort())"

# Bind mount correcto
docker exec openclaw ls /workspace/repo | head
docker exec opencode ls /workspace | head
docker exec open-design ls /workspace | head
```

## Recursos

- Skill relacionada: `containers-architecture` — setup de containers
- Skill relacionada: `env-config-and-secrets` — patterns generales de .env
- Skill relacionada: `iaworkspace-patterns` — overview
- `.env.example` raíz — template canónico
- `prod/stack.config.mjs` — referencia de apps con DB
- [iaWorkSpace AGENTS.md](../eddremonts86/iaWorkSpace/AGENTS.md) — reglas duras