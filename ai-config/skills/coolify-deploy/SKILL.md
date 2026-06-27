---
name: coolify-deploy
description: Deploy de apps a Coolify (self-hosted PaaS) — compose multi-service, env sync, post-deploy hooks, health checks. Aplica al deploy de cualquier docker-compose app a un VPS gestionado por Coolify.
license: Internal
---

# Coolify Deploy

Coolify es un PaaS self-hosted (alternativa a Vercel/Heroku) que corre sobre tu VPS. Soporta Docker compose, automatic HTTPS via Traefik, DBs (Postgres/Redis/MySQL), y deploys desde Git.

## Arquitectura

```
Coolify Dashboard (UI web)
   ↓ provisiona
Docker Compose stacks en /data/coolify/
   ↓ expuesto via
Traefik (reverse proxy + Let's Encrypt)
   ↓ resuelve a
<app>.<domain>.com
```

## Setup inicial

```bash
# Instalar Coolify en VPS Hetzner
# (se hace una vez via SSH al server)
curl -fsSL https://cdn.coollabs.io/coolify/install.sh | bash

# Acceder a dashboard
# https://<server-ip>:8000  (cambiar password en primer login)
```

## Deploy de una app nueva

### 1. Estructura esperada en repo

```
mi-app/
├── docker-compose.yml          # servicios a deployar
├── Dockerfile                  # si necesitás build custom
├── .env.example                # placeholders
├── .env                        # gitignored, real values
└── coolify/                    # opcional, config específica
    └── post-deploy.sh
```

### 2. `docker-compose.yml` compatible Coolify

```yaml
# Las imágenes pueden venir de registry o build local
services:
  app:
    build:
      context: .
      dockerfile: Dockerfile
    image: mi-app:latest
    restart: unless-stopped
    environment:
      - NODE_ENV=production
      - DATABASE_URL=${POSTGRES_URL}     # refs a secrets
      - REDIS_URL=${REDIS_URL}
    depends_on:
      - postgres
    labels:
      - "traefik.enable=true"
      - "traefik.http.routers.app.rule=Host(`mi-app.example.com`)"
      - "traefik.http.routers.app.entrypoints=websecure"
      - "traefik.http.routers.app.tls.certresolver=letsencrypt"
      - "traefik.http.services.app.loadbalancer.server.port=3000"

  postgres:
    image: postgres:16-alpine
    restart: unless-stopped
    environment:
      - POSTGRES_DB=${POSTGRES_DB}
      - POSTGRES_USER=${POSTGRES_USER}
      - POSTGRES_PASSWORD=${POSTGRES_PASSWORD}
    volumes:
      - postgres_data:/var/lib/postgresql/data
    labels:
      - "traefik.enable=false"           # NO expuesto públicamente

volumes:
  postgres_data:
```

**Reglas:**
- `restart: unless-stopped` siempre.
- Labels Traefik obligatorios para routing público.
- DBs internas con `traefik.enable=false`.
- Secrets solo via env vars referenciadas.

### 3. Crear app en Coolify dashboard

1. Dashboard → "+ New" → "Resource" → "Application" o "Docker Compose".
2. **Source:** Git repo (GitHub/GitLab/self-hosted) + branch.
3. **Build Pack:** Dockerfile o `docker-compose`.
4. **Port:** el interno del container (ej `3000`).
5. **Domain:** configurar dominio + DNS A record al server.

### 4. Sync env vars

**Manual via dashboard:** Application → Environment Variables → pegar de `.env.example` con valores reales.

**Script automático (iaWorkSpace pattern):**

```bash
# scripts/coolify/sync-env.mjs
# Lee .env local y lo sube a Coolify via API
node scripts/coolify/sync-env.mjs --app mi-app
```

API endpoint: `POST /api/v1/applications/<uuid>/envs` con bearer token.

### 5. Deploy

```bash
# Manual desde dashboard: click "Deploy"
# O via API:
curl -X POST https://coolify.example.com/api/v1/deploy?uuid=<app-uuid> \
  -H "Authorization: Bearer ${COOLIFY_TOKEN}"

# Auto-deploy en push: configurar webhook en GitHub
# Dashboard → Application → Webhooks → copy URL
```

## Comandos útiles

```bash
# Logs (via SSH al server)
docker logs -f <container-name>
docker logs --tail 100 <container-name>

# Exec
docker exec -it <container-name> sh
docker exec -it postgres psql -U myuser mydb

# Restart individual
docker restart <container-name>

# Stats
docker stats

# Coolify CLI (si está instalado en el server)
coolify app list
coolify app logs <name>
coolify app restart <name>
```

## Post-deploy hooks

Configurar comando que se ejecuta post-deploy (ej: DB migrations, cache clear):

```yaml
# coolify config o docker-compose healthcheck
services:
  app:
    # ...
    healthcheck:
      test: ["CMD", "curl", "-f", "http://localhost:3000/health"]
      interval: 30s
      timeout: 10s
      retries: 3
      start_period: 40s
```

```bash
# Post-deploy manual (via iaWorkSpace script)
node scripts/coolify/set-post-deploy.mjs --app mi-app --command "pnpm db:migrate"
```

## HTTPS automático

Coolify configura Let's Encrypt automático via Traefik. Solo necesitás:

1. DNS A record apuntando al server.
2. Domain configurado en la app.
3. Puerto 80 abierto en firewall del VPS.

Para wildcard certs (subdominios múltiples): `*.example.com` con DNS challenge.

## Multi-service / compose fleet

Para orquestar múltiples apps (iaWorkSpace pattern: `prod/docker-compose.fleet.yml`):

```yaml
# docker-compose.fleet.yml en /prod/
services:
  traefik:
    image: traefik:v3.0
    # ... reverse proxy global

  app1:
    # ... expuesto en app1.example.com

  app2:
    # ... expuesto en app2.example.com

  postgres:
    # ... interno

  redis:
    # ... interno
```

Deploy con `docker compose -f docker-compose.fleet.yml up -d`.

## Backup y restore

```bash
# Backup DB
docker exec postgres pg_dump -U myuser mydb | gzip > backup-$(date +%Y%m%d).sql.gz

# Restore
gunzip -c backup-20260627.sql.gz | docker exec -i postgres psql -U myuser mydb

# Backup volume
docker run --rm -v postgres_data:/data -v $(pwd):/backup alpine \
  tar czf /backup/postgres_data.tar.gz /data
```

## Errores comunes

1. ❌ Olvidar `traefik.enable=false` en DB → expuesta públicamente.
2. ❌ Hardcodear secrets en compose → usar `${VAR}`.
3. ❌ No configurar healthcheck → Coolify marca como "healthy" sin verificar.
4. ❌ Port mismatch entre container y label Traefik → 404.
5. ❌ DNS no propagado → cert Let's Encrypt falla.
6. ❌ Coolify token leaked en commit → revocar y reemitir.
7. ❌ No cleanup de imágenes dangling → disk full.
8. ❌ Compose con `version: '3'` (deprecated) → usar compose spec v2 sin version.

## Patrones iaWorkSpace

- **Stack config central:** `prod/stack.config.mjs` define TODOS los servicios del fleet.
- **Apps individuales:** `prod/compose.d/<app>.yml` — uno por app, incluido por stack.
- **Traefik routes:** `prod/traefik/dynamic/routes.yml` — routing declarativo.
- **Register new app:** `node scripts/prod/register-app.mjs --name mi-app --domain mi-app.example.com`
- **Generate compose:** `node scripts/prod/generate-compose.mjs` compila fleet + compose.d en `docker-compose.fleet.yml`.
- **Status check:** `pnpm containers:status` + `node scripts/prod/status.sh`.

## Variables de entorno típicas

```bash
# .env
POSTGRES_DB=myapp_prod
POSTGRES_USER=myapp
POSTGRES_PASSWORD=<generated-32-chars>
COOLIFY_TOKEN=<from-dashboard>
COOLIFY_API_URL=https://coolify.example.com/api/v1
DOMAIN=example.com
LETSENCRYPT_EMAIL=admin@example.com
```

## Recursos

- [Coolify docs](https://coolify.io/docs)
- [Coolify API reference](https://coolify.io/docs/api)
- [Traefik docs](https://doc.traefik.io/traefik/)
- [Docker compose spec](https://docs.docker.com/compose/compose-file/)