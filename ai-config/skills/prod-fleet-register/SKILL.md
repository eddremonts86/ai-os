---
name: prod-fleet-register
description: Pattern for registering apps in Traefik + mkcert + /etc/hosts local fleet. Applies when adding a new app to the iaWorkSpace meta-repo or any multi-app setup with local Traefik reverse proxy.
license: Internal
---

# Prod Fleet Register

## When to use

- Add a new app to a local fleet with Traefik + mkcert certs.
- Generate `compose.d/<app>.yml` from `stack.config.mjs`.
- Setup `/etc/hosts` with idempotent markers.
- Configure wildcard cert + local DNS.

## Initial setup (once per machine)

### 1. Install mkcert + root CA

```bash
brew install mkcert
mkcert -install    # installs root CA locally in the system trust store
```

This lets the browser trust `*.eduardoinerarte.local` without warnings.

### 2. Generate wildcard cert

```bash
cd prod/certs/
mkcert "*.eduardoinerarte.local" "eduardoinerarte.local"
# Generates: _wildcard.eduardoinerarte.local.pem + -key.pem
```

Rename to what Traefik expects:
```bash
mv _wildcard.eduardoinerarte.local.pem wildcard.eduardoinerarte.local.pem
mv _wildcard.eduardoinerarte.local-key.pem wildcard.eduardoinerarte.local-key.pem
```

### 3. /etc/hosts setup (idempotent)

```bash
# scripts/prod/setup.sh
# Markers >>> iaworkspace-prod >>> and <<< iaworkspace-prod <<<
HOSTS_MARKER_START=">>> iaworkspace-prod >>>"
HOSTS_MARKER_END="<<< iaworkspace-prod <<<"

# Generates new block
generate_hosts_block() {
  cat <<EOF
$HOSTS_MARKER_START
127.0.0.1 traefik.eduardoinerarte.local
127.0.0.1 app1.eduardoinerarte.local
127.0.0.1 app2.eduardoinerarte.local
$HOSTS_MARKER_END
EOF
}

# If it already exists, replace only between markers
# If it does not exist, append
sudo /bin/bash -c "
  if grep -q '$HOSTS_MARKER_START' /etc/hosts; then
    # Replace block between markers
    sed -i '' '/$HOSTS_MARKER_START/,/$HOSTS_MARKER_END/c\\
$(generate_hosts_block | sed 's/$/\\/')
' /etc/hosts
  else
    cat >> /etc/hosts <<EOF2

$(generate_hosts_block)
EOF2
  fi
"
```

### 4. External Docker network

```bash
docker network create iaws-prod   # external, persistent
```

## Register a new app

### Step 1: Generate secrets

```bash
# BETTER_AUTH_SECRET (32 bytes base64)
openssl rand -base64 32

# DB password (16 bytes hex)
openssl rand -hex 16
```

### Step 2: Edit `prod/stack.config.mjs`

```javascript
// prod/stack.config.mjs
export default {
  network: 'iaws-prod',
  sharedDb: {
    serviceName: 'postgres',
    adminPassword: 'postgreslocal',
    port: 5432,
  },
  proxy: {
    image: 'traefik:v3.5',
    dashboard: true,
  },
  apps: [
    // ... existing apps ...
    {
      name: 'my-new-app',
      host: 'my-app',  // → my-app.eduardoinerarte.local
      port: 3000,
      db: {
        user: 'my_app',
        password: '<openssl rand -hex 16>',
        name: 'my_app',
      },
      auth: {
        mode: 'local',  // or 'clerk' | 'hybrid'
        secret: '<openssl rand -base64 32>',
      },
      migratorTarget: 'builder',  // or 'build' | 'prod'
      migratorCmd: 'pnpm db:migrate && (pnpm db:seed:admin || true)',
      deployable: true,
    },
  ],
};
```

### Step 3: Generate compose overlay

```bash
node scripts/prod/generate-compose.mjs
# Generates prod/compose.d/my-new-app.yml with:
#   - my-new-app service
#   - my-new-app-migrator service (one-shot)
#   - my-new-app-db-init service (one-shot, creates role/db)

# Generates prod/traefik/dynamic/routes.yml with:
#   - router for my-app.eduardoinerarte.local → my-new-app:3000
```

### Step 4: Create `.env.production.local.example` in app

```bash
# apps/my-new-app/.env.production.local.example
DATABASE_URL=postgresql://my_app:***@postgres:5432/my_app
NODE_ENV=production
PORT=3000
BETTER_AUTH_SECRET=<generated>
BETTER_AUTH_URL=https://my-app.eduardoinerarte.local
VITE_BETTER_AUTH_URL=https://my-app.eduardoinerarte.local
```

The user copies it to `.env.production.local` (gitignored) with real values.

### Step 5: Bring it up

```bash
node scripts/prod/up.sh my-new-app
# or all
node scripts/prod/up.sh

# Verify
node scripts/prod/status.sh
node scripts/prod/urls.sh
open https://my-app.eduardoinerarte.local
```

## Structure of the generated overlay

```yaml
# prod/compose.d/my-new-app.yml (generated)
services:
  my-new-app:
    build: ../apps/my-new-app
    target: prod
    container_name: iaws-prod-my-new-app
    restart: unless-stopped
    env_file:
      - ../apps/my-new-app/.env.production.local
    healthcheck:
      test: ["CMD", "node", "-e", "fetch('http://localhost:3000/api/health').then(r=>process.exit(r.ok?0:1))"]
      interval: 30s
      timeout: 10s
      retries: 3
      start_period: 40s
    networks:
      - iaws-prod
    depends_on:
      my-new-app-migrator:
        condition: service_completed_successfully
    labels:
      - "traefik.enable=true"
      - "traefik.http.routers.my-new-app.rule=Host(`my-app.eduardoinerarte.local`)"
      - "traefik.http.routers.my-new-app.entrypoints=websecure"
      - "traefik.http.routers.my-new-app.tls=true"
      - "traefik.http.services.my-new-app.loadbalancer.server.port=3000"

  my-new-app-migrator:
    build: ../apps/my-new-app
    target: builder
    container_name: iaws-prod-my-new-app-migrator
    restart: no
    env_file:
      - ../apps/my-new-app/.env.production.local
    command: ["sh", "-c", "touch .env && pnpm db:migrate && (pnpm db:seed:admin || true)"]
    networks:
      - iaws-prod
    depends_on:
      my-new-app-db-init:
        condition: service_completed_successfully

  my-new-app-db-init:
    image: postgres:16-alpine
    container_name: iaws-prod-my-new-app-db-init
    restart: no
    networks:
      - iaws-prod
    environment:
      PGPASSWORD: postgreslocal
    command: >
      sh -c "
        psql -h postgres -U postgres -tc \"SELECT 1 FROM pg_roles WHERE rolname='my_app'\" | grep -q 1 ||
          psql -h postgres -U postgres -c \"CREATE ROLE my_app LOGIN PASSWORD 'my_app_pwd'\";
        psql -h postgres -U postgres -tc \"SELECT 1 FROM pg_database WHERE datname='my_app'\" | grep -q 1 ||
          psql -h postgres -U postgres -c \"CREATE DATABASE my_app OWNER my_app\";
      "
    depends_on:
      postgres:
        condition: service_healthy

networks:
  iaws-prod:
    external: true
```

## Patterns and rules

- **Deterministic naming:** `iaws-prod-<app>` for containers.
- **migratorTarget:** `builder` (full deps with tsx/drizzle-kit) or `build` (lean with only runtime deps). Determine based on which scripts run the migrations.
- **Idempotent migrations:** `pnpm db:migrate && (pnpm db:seed:admin || true)` — optional seeds with `|| true` to avoid breaking deploys.
- **`exclude_from_hc: true`** for workers/scrapers that don't expose HTTP (prevents them from being counted as unhealthy).
- **depends_on chain:** app → migrator (completed_successfully) → db-init (service_completed_successfully) → postgres (service_healthy).
- **Wildcard cert:** a single cert covers all subdomains.
- **/etc/hosts with markers:** allows re-running setup without duplicating entries.

## Post-register verification

```bash
# Containers
docker ps --filter "name=iaws-prod-my-new-app" --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"

# Logs
node scripts/prod/logs.sh my-new-app

# Smoke test
node scripts/prod/verify.sh my-new-app
# or
curl -fsS https://my-app.eduardoinerarte.local/api/health

# Accessible URL
open https://my-app.eduardoinerarte.local
```

## Common errors

1. ❌ Duplicate host in `stack.config.mjs` → `verify.sh` fails with "host already registered".
2. ❌ Forgetting `docker network create iaws-prod` → "network not found".
3. ❌ Wildcard cert not regenerated after adding a domain → browser warning.
4. ❌ `BETTER_AUTH_SECRET` in `.env.production.local` but `.env.production.local.example` not committed → next dev cannot replicate.
5. ❌ `migratorTarget: prod` but migrations use `tsx` which is only in devDeps → migrator fails.
6. ❌ DB password in stack.config.mjs but `db-init` has a different hardcoded one → role creation fails.
7. ❌ Not committing generated `prod/compose.d/<app>.yml` → after rebuild, app does not appear.

## Rollback

```bash
# 1. Remove from stack.config.mjs
# 2. Regenerate
node scripts/prod/generate-compose.mjs
# 3. (deletes prod/compose.d/my-new-app.yml and its entry in routes.yml)

# 4. Bring down containers
node scripts/prod/down.sh my-new-app --clean

# 5. Clean up DB (optional)
docker exec iaws-prod-postgres psql -U postgres -c "DROP DATABASE my_app;"
docker exec iaws-prod-postgres psql -U postgres -c "DROP ROLE my_app;"

# 6. Remove /etc/hosts entry
node scripts/prod/setup.sh  # regenerates without my-new-app
```

## Resources

- [mkcert](https://github.com/FiloSottile/mkcert)
- [Traefik file provider](https://doc.traefik.io/traefik/providers/file/)
- [Docker external networks](https://docs.docker.com/compose/networking/)
- Related skill: `iaworkspace-patterns` (overview)
- Related skill: `coolify-deploy` (same pattern but in the cloud)