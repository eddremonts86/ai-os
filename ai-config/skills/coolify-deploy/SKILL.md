---
name: coolify-deploy
description: Deploy apps to Coolify (self-hosted PaaS) — multi-service compose, env sync, post-deploy hooks, health checks. Applies to deploying any docker-compose app to a VPS managed by Coolify.
license: Internal
---

# Coolify Deploy

Coolify is a self-hosted PaaS (alternative to Vercel/Heroku) that runs on your VPS. Supports Docker compose, automatic HTTPS via Traefik, DBs (Postgres/Redis/MySQL), and deploys from Git.

## Architecture

```
Coolify Dashboard (web UI)
   ↓ provisions
Docker Compose stacks at /data/coolify/
   ↓ exposed via
Traefik (reverse proxy + Let's Encrypt)
   ↓ resolves to
<app>.<domain>.com
```

## Initial setup

```bash
# Install Coolify on Hetzner VPS
# (done once via SSH to the server)
curl -fsSL https://cdn.coollabs.io/coolify/install.sh | bash

# Access dashboard
# https://<server-ip>:8000  (change password on first login)
```

## Deploying a new app

### 1. Expected repo structure

```
my-app/
├── docker-compose.yml          # services to deploy
├── Dockerfile                  # if you need custom build
├── .env.example                # placeholders
├── .env                        # gitignored, real values
└── coolify/                    # optional, app-specific config
    └── post-deploy.sh
```

### 2. Coolify-compatible `docker-compose.yml`

```yaml
# Images can come from a registry or local build
services:
  app:
    build:
      context: .
      dockerfile: Dockerfile
    image: my-app:latest
    restart: unless-stopped
    environment:
      - NODE_ENV=production
      - DATABASE_URL=${POSTGRES_URL}     # refs to secrets
      - REDIS_URL=${REDIS_URL}
    depends_on:
      - postgres
    labels:
      - "traefik.enable=true"
      - "traefik.http.routers.app.rule=Host(`my-app.example.com`)"
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
      - "traefik.enable=false"           # NOT exposed publicly

volumes:
  postgres_data:
```

**Rules:**

- `restart: unless-stopped` always.
- Traefik labels required for public routing.
- Internal DBs with `traefik.enable=false`.
- Secrets only via referenced env vars.

### 3. Create app in Coolify dashboard

1. Dashboard → "+ New" → "Resource" → "Application" or "Docker Compose".
2. **Source:** Git repo (GitHub/GitLab/self-hosted) + branch.
3. **Build Pack:** Dockerfile or `docker-compose`.
4. **Port:** the internal container port (e.g. `3000`).
5. **Domain:** configure domain + DNS A record pointing to the server.

### 4. Sync env vars

**Manually via dashboard:** Application → Environment Variables → paste from `.env.example` with real values.

**Automatic script (iaWorkSpace pattern):**

```bash
# scripts/coolify/sync-env.mjs
# Reads local .env and uploads to Coolify via API
node scripts/coolify/sync-env.mjs --app my-app
```

API endpoint: `POST /api/v1/applications/<uuid>/envs` with bearer token.

### 5. Deploy

```bash
# Manual from dashboard: click "Deploy"
# Or via API:
curl -X POST https://coolify.example.com/api/v1/deploy?uuid=<app-uuid> \
  -H "Authorization: Bearer ***"

# Auto-deploy on push: configure webhook in GitHub
# Dashboard → Application → Webhooks → copy URL
```

## Useful commands

```bash
# Logs (via SSH to the server)
docker logs -f <container-name>
docker logs --tail 100 <container-name>

# Exec
docker exec -it <container-name> sh
docker exec -it postgres psql -U myuser mydb

# Restart individual
docker restart <container-name>

# Stats
docker stats

# Coolify CLI (if installed on the server)
coolify app list
coolify app logs <name>
coolify app restart <name>
```

## Post-deploy hooks

Configure a command that runs post-deploy (e.g. DB migrations, cache clear):

```yaml
# coolify config or docker-compose healthcheck
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
# Manual post-deploy (via iaWorkSpace script)
node scripts/coolify/set-post-deploy.mjs --app my-app --command "pnpm db:migrate"
```

## Automatic HTTPS

Coolify configures Let's Encrypt automatically via Traefik. You only need:

1. DNS A record pointing to the server.
2. Domain configured on the app.
3. Port 80 open on the VPS firewall.

For wildcard certs (multiple subdomains): `*.example.com` with DNS challenge.

## Multi-service / compose fleet

To orchestrate multiple apps (iaWorkSpace pattern: `prod/docker-compose.fleet.yml`):

```yaml
# docker-compose.fleet.yml in /prod/
services:
  traefik:
    image: traefik:v3.0
    # ... global reverse proxy

  app1:
    # ... exposed at app1.example.com

  app2:
    # ... exposed at app2.example.com

  postgres:
    # ... internal

  redis:
    # ... internal
```

Deploy with `docker compose -f docker-compose.fleet.yml up -d`.

## Backup and restore

```bash
# Backup DB
docker exec postgres pg_dump -U myuser mydb | gzip > backup-$(date +%Y%m%d).sql.gz

# Restore
gunzip -c backup-20260627.sql.gz | docker exec -i postgres psql -U myuser mydb

# Backup volume
docker run --rm -v postgres_data:/data -v $(pwd):/backup alpine \
  tar czf /backup/postgres_data.tar.gz /data
```

## Common errors

1. ❌ Forgetting `traefik.enable=false` on DB → exposed publicly.
2. ❌ Hardcoding secrets in compose → use `${VAR}`.
3. ❌ Not configuring healthcheck → Coolify marks as "healthy" without verifying.
4. ❌ Port mismatch between container and Traefik label → 404.
5. ❌ DNS not propagated → Let's Encrypt cert fails.
6. ❌ Coolify token leaked in commit → revoke and reissue.
7. ❌ No cleanup of dangling images → disk full.
8. ❌ Compose with `version: '3'` (deprecated) → use compose spec v2 without version.

## iaWorkSpace patterns

- **Central stack config:** `prod/stack.config.mjs` defines ALL fleet services.
- **Individual apps:** `prod/compose.d/<app>.yml` — one per app, included by stack.
- **Traefik routes:** `prod/traefik/dynamic/routes.yml` — declarative routing.
- **Register new app:** `node scripts/prod/register-app.mjs --name my-app --domain my-app.example.com`
- **Generate compose:** `node scripts/prod/generate-compose.mjs` compiles fleet + compose.d into `docker-compose.fleet.yml`.
- **Status check:** `pnpm containers:status` + `node scripts/prod/status.sh`.

## Typical environment variables

```bash
# .env
POSTGRES_DB=myapp_prod
POSTGRES_USER=myapp
POSTGRES_PASSWORD=***
COOLIFY_TOKEN=***
COOLIFY_API_URL=https://coolify.example.com/api/v1
DOMAIN=example.com
LETSENCRYPT_EMAIL=admin@example.com
```

## Resources

- [Coolify docs](https://coolify.io/docs)
- [Coolify API reference](https://coolify.io/docs/api)
- [Traefik docs](https://doc.traefik.io/traefik/)
- [Docker compose spec](https://docs.docker.com/compose/compose-file/)