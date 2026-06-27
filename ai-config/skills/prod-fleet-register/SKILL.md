---
name: prod-fleet-register
description: Patrón para registrar apps en fleet Traefik + mkcert + /etc/hosts local. Aplica cuando añadís una nueva app al meta-repo iaWorkSpace o cualquier setup multi-app con reverse proxy local Traefik.
license: Internal
---

# Prod Fleet Register

## Cuándo usar

- Añadir nueva app a un fleet local con Traefik + certs mkcert.
- Generar `compose.d/<app>.yml` desde `stack.config.mjs`.
- Setup de `/etc/hosts` con marcadores idempotentes.
- Configurar wildcard cert + DNS local.

## Setup inicial (una vez por máquina)

### 1. Instalar mkcert + root CA

```bash
brew install mkcert
mkcert -install    # instala root CA local en system trust store
```

Esto permite que el browser confíe en `*.eduardoinerarte.local` sin warnings.

### 2. Generar wildcard cert

```bash
cd prod/certs/
mkcert "*.eduardoinerarte.local" "eduardoinerarte.local"
# Genera: _wildcard.eduardoinerarte.local.pem + -key.pem
```

Renombrar a lo que Traefik espera:
```bash
mv _wildcard.eduardoinerarte.local.pem wildcard.eduardoinerarte.local.pem
mv _wildcard.eduardoinerarte.local-key.pem wildcard.eduardoinerarte.local-key.pem
```

### 3. Setup de /etc/hosts (idempotente)

```bash
# scripts/prod/setup.sh
# Marcadores >>> iaworkspace-prod >>> y <<< iaworkspace-prod <<<
HOSTS_MARKER_START=">>> iaworkspace-prod >>>"
HOSTS_MARKER_END="<<< iaworkspace-prod <<<"

# Genera bloque nuevo
generate_hosts_block() {
  cat <<EOF
$HOSTS_MARKER_START
127.0.0.1 traefik.eduardoinerarte.local
127.0.0.1 app1.eduardoinerarte.local
127.0.0.1 app2.eduardoinerarte.local
$HOSTS_MARKER_END
EOF
}

# Si ya existe, reemplaza solo entre marcadores
# Si no existe, append
sudo /bin/bash -c "
  if grep -q '$HOSTS_MARKER_START' /etc/hosts; then
    # Reemplazar bloque entre marcadores
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

### 4. Red externa de Docker

```bash
docker network create iaws-prod   # externa, persistente
```

## Registrar nueva app

### Paso 1: Generar secrets

```bash
# BETTER_AUTH_SECRET (32 bytes base64)
openssl rand -base64 32

# DB password (16 bytes hex)
openssl rand -hex 16
```

### Paso 2: Editar `prod/stack.config.mjs`

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
    // ... apps existentes ...
    {
      name: 'mi-nueva-app',
      host: 'mi-app',  // → mi-app.eduardoinerarte.local
      port: 3000,
      db: {
        user: 'mi_app',
        password: '<openssl rand -hex 16>',
        name: 'mi_app',
      },
      auth: {
        mode: 'local',  // o 'clerk' | 'hybrid'
        secret: '<openssl rand -base64 32>',
      },
      migratorTarget: 'builder',  // o 'build' | 'prod'
      migratorCmd: 'pnpm db:migrate && (pnpm db:seed:admin || true)',
      deployable: true,
    },
  ],
};
```

### Paso 3: Generar compose overlay

```bash
node scripts/prod/generate-compose.mjs
# Genera prod/compose.d/mi-nueva-app.yml con:
#   - servicio mi-nueva-app
#   - servicio mi-nueva-app-migrator (one-shot)
#   - servicio mi-nueva-app-db-init (one-shot, crea role/db)

# Genera prod/traefik/dynamic/routes.yml con:
#   - router para mi-app.eduardoinerarte.local → mi-nueva-app:3000
```

### Paso 4: Crear `.env.production.local.example` en app

```bash
# apps/mi-nueva-app/.env.production.local.example
DATABASE_URL=postgresql://mi_app:<db_password>@postgres:5432/mi_app
NODE_ENV=production
PORT=3000
BETTER_AUTH_SECRET=<generated>
BETTER_AUTH_URL=https://mi-app.eduardoinerarte.local
VITE_BETTER_AUTH_URL=https://mi-app.eduardoinerarte.local
```

El usuario copia a `.env.production.local` (gitignored) con valores reales.

### Paso 5: Levantar

```bash
node scripts/prod/up.sh mi-nueva-app
# o todos
node scripts/prod/up.sh

# Verificar
node scripts/prod/status.sh
node scripts/prod/urls.sh
open https://mi-app.eduardoinerarte.local
```

## Estructura del overlay generado

```yaml
# prod/compose.d/mi-nueva-app.yml (generado)
services:
  mi-nueva-app:
    build: ../apps/mi-nueva-app
    target: prod
    container_name: iaws-prod-mi-nueva-app
    restart: unless-stopped
    env_file:
      - ../apps/mi-nueva-app/.env.production.local
    healthcheck:
      test: ["CMD", "node", "-e", "fetch('http://localhost:3000/api/health').then(r=>process.exit(r.ok?0:1))"]
      interval: 30s
      timeout: 10s
      retries: 3
      start_period: 40s
    networks:
      - iaws-prod
    depends_on:
      mi-nueva-app-migrator:
        condition: service_completed_successfully
    labels:
      - "traefik.enable=true"
      - "traefik.http.routers.mi-nueva-app.rule=Host(`mi-app.eduardoinerarte.local`)"
      - "traefik.http.routers.mi-nueva-app.entrypoints=websecure"
      - "traefik.http.routers.mi-nueva-app.tls=true"
      - "traefik.http.services.mi-nueva-app.loadbalancer.server.port=3000"

  mi-nueva-app-migrator:
    build: ../apps/mi-nueva-app
    target: builder
    container_name: iaws-prod-mi-nueva-app-migrator
    restart: no
    env_file:
      - ../apps/mi-nueva-app/.env.production.local
    command: ["sh", "-c", "touch .env && pnpm db:migrate && (pnpm db:seed:admin || true)"]
    networks:
      - iaws-prod
    depends_on:
      mi-nueva-app-db-init:
        condition: service_completed_successfully

  mi-nueva-app-db-init:
    image: postgres:16-alpine
    container_name: iaws-prod-mi-nueva-app-db-init
    restart: no
    networks:
      - iaws-prod
    environment:
      PGPASSWORD: postgreslocal
    command: >
      sh -c "
        psql -h postgres -U postgres -tc \"SELECT 1 FROM pg_roles WHERE rolname='mi_app'\" | grep -q 1 ||
          psql -h postgres -U postgres -c \"CREATE ROLE mi_app LOGIN PASSWORD 'mi_app_pwd'\";
        psql -h postgres -U postgres -tc \"SELECT 1 FROM pg_database WHERE datname='mi_app'\" | grep -q 1 ||
          psql -h postgres -U postgres -c \"CREATE DATABASE mi_app OWNER mi_app\";
      "
    depends_on:
      postgres:
        condition: service_healthy

networks:
  iaws-prod:
    external: true
```

## Patrones y reglas

- **Naming determinista:** `iaws-prod-<app>` para containers.
- **migratorTarget:** `builder` (full deps con tsx/drizzle-kit) o `build` (lean con solo deps runtime). Determinar según qué scripts corren las migrations.
- **Migrations idempotentes:** `pnpm db:migrate && (pnpm db:seed:admin || true)` — seeds opcionales con `|| true` para no romper deploy.
- **`exclude_from_hc: true`** para workers/scrapers que no exponen HTTP (evita que cuenten como unhealthy).
- **depends_on chain:** app → migrator (completed_successfully) → db-init (service_completed_successfully) → postgres (service_healthy).
- **Cert wildcard:** un solo cert cubre todos los subdominios.
- **/etc/hosts con marcadores:** permite re-correr setup sin duplicar entradas.

## Verificación post-register

```bash
# Containers
docker ps --filter "name=iaws-prod-mi-nueva-app" --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"

# Logs
node scripts/prod/logs.sh mi-nueva-app

# Smoke test
node scripts/prod/verify.sh mi-nueva-app
# o
curl -fsS https://mi-app.eduardoinerarte.local/api/health

# URL accesible
open https://mi-app.eduardoinerarte.local
```

## Errores comunes

1. ❌ Host duplicado en `stack.config.mjs` → `verify.sh` falla con "host already registered".
2. ❌ Olvidar `docker network create iaws-prod` → "network not found".
3. ❌ Cert wildcard no regenerado tras añadir dominio → browser warning.
4. ❌ `BETTER_AUTH_SECRET` en `.env.production.local` pero no commiteado `.env.production.local.example` → próximo dev no puede replicar.
5. ❌ `migratorTarget: prod` pero migrations usan `tsx` que solo está en devDeps → migrator falla.
6. ❌ DB password en stack.config.mjs pero `db-init` tiene otro hardcoded → role creation falla.
7. ❌ No commitear `prod/compose.d/<app>.yml` generado → tras rebuild, app no aparece.

## Rollback

```bash
# 1. Quitar de stack.config.mjs
# 2. Regenerar
node scripts/prod/generate-compose.mjs
# 3. (borra prod/compose.d/mi-nueva-app.yml y su entry en routes.yml)

# 4. Bajar containers
node scripts/prod/down.sh mi-nueva-app --clean

# 5. Limpiar DB (opcional)
docker exec iaws-prod-postgres psql -U postgres -c "DROP DATABASE mi_app;"
docker exec iaws-prod-postgres psql -U postgres -c "DROP ROLE mi_app;"

# 6. Quitar /etc/hosts entry
node scripts/prod/setup.sh  # regenera sin mi-nueva-app
```

## Recursos

- [mkcert](https://github.com/FiloSottile/mkcert)
- [Traefik file provider](https://doc.traefik.io/traefik/providers/file/)
- [Docker external networks](https://docs.docker.com/compose/networking/)
- Skill relacionada: `iaworkspace-patterns` (overview)
- Skill relacionada: `coolify-deploy` (mismo patrón pero en cloud)