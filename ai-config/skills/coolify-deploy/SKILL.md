---
name: coolify-deploy
description: Deploy apps to Coolify (self-hosted PaaS) — multi-service compose, env sync, post-deploy hooks, health checks, and the DEFAULT push-to-deploy setup (a GitHub Actions workflow that triggers Coolify via API). Applies to deploying any docker-compose app to a VPS managed by Coolify.
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

**DEFAULT: set up push-to-deploy via GitHub Actions.** Whenever asked to deploy
(or to set up deploys) for a Coolify app, the default is to wire a GitHub
Actions workflow that triggers a Coolify deployment on every push to the
deploy branch — do this unless the user explicitly says not to auto-deploy.
Prefer this over Coolify's dashboard "Automatic Deployment" toggle: the toggle
needs the GitHub-App webhook wired and can't be reliably enabled via the public
API, whereas the workflow below is fully reproducible and lives in the repo.

`.github/workflows/deploy.yml`:

```yaml
name: Deploy to Coolify
on:
  push:
    branches: [main]
  workflow_dispatch:
permissions:
  contents: read
concurrency:
  group: coolify-deploy
  cancel-in-progress: false
jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Trigger deployment
        id: trigger
        run: |
          resp=$(curl -fsS -X POST \
            -H "Authorization: Bearer ${{ secrets.COOLIFY_API_TOKEN }}" \
            -H "Accept: application/json" \
            "${{ secrets.COOLIFY_API_URL }}/api/v1/applications/${{ secrets.COOLIFY_APP_UUID }}/start")
          echo "$resp"
          uuid=$(printf '%s' "$resp" | node -e 'let d="";process.stdin.on("data",c=>d+=c).on("end",()=>{try{process.stdout.write(JSON.parse(d).deployment_uuid||"")}catch{process.stdout.write("")}})')
          echo "deployment_uuid=$uuid" >> "$GITHUB_OUTPUT"
      - name: Wait for deployment to finish
        if: steps.trigger.outputs.deployment_uuid != ''
        run: |
          uuid="${{ steps.trigger.outputs.deployment_uuid }}"
          for i in $(seq 1 40); do
            sleep 10
            status=$(curl -fsS -H "Authorization: Bearer ${{ secrets.COOLIFY_API_TOKEN }}" \
              "${{ secrets.COOLIFY_API_URL }}/api/v1/deployments/$uuid" \
              | node -e 'let d="";process.stdin.on("data",c=>d+=c).on("end",()=>{try{process.stdout.write(JSON.parse(d).status||"?")}catch{process.stdout.write("?")}})')
            echo "poll $i: $status"
            case "$status" in
              finished|success) exit 0 ;;
              failed|error|cancelled) echo "::error::Deployment $status"; exit 1 ;;
            esac
          done
          echo "::error::timeout"; exit 1
```

Set the three repo secrets from the project's `.env` (do not print values):

```bash
set -a; . ./.env; set +a
REPO=<owner>/<repo>
printf '%s' "$COOLIFY_API_URL"   | gh secret set COOLIFY_API_URL   --repo "$REPO"
printf '%s' "$COOLIFY_API_TOKEN" | gh secret set COOLIFY_API_TOKEN --repo "$REPO"
printf '%s' "$COOLIFY_APP_UUID"  | gh secret set COOLIFY_APP_UUID  --repo "$REPO"
```

Endpoints (verified against the live Coolify v4 API): trigger is
`POST /api/v1/applications/<uuid>/start` (NOT `/deploy`); poll with
`GET /api/v1/deployments/<deployment_uuid>` until status is `finished`.

**Security caveat:** if the Coolify instance is HTTP-only (raw IP, no TLS), the
bearer token travels unencrypted from the runners. Flag this; once Coolify has
an HTTPS domain, just update the `COOLIFY_API_URL` secret. Confirm placing the
token in GitHub secrets before doing it.

Manual fallbacks (one-off, not the default):

```bash
# Dashboard: click "Deploy"
# API one-shot:
curl -X POST "$COOLIFY_API_URL/api/v1/applications/<uuid>/start" -H "Authorization: Bearer $COOLIFY_API_TOKEN"
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