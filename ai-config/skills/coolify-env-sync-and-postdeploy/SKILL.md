---
name: coolify-env-sync-and-postdeploy
description: Sincronización idempotente de env vars a Coolify + setup de post_deployment_command para migrations/seeds. Cubre scripts/coolify/sync-env.mjs y set-post-deploy.mjs. Aplica a cualquier deploy en Coolify v4 con build_pack=dockerfile o dockercompose.
license: Internal
---

# Coolify Env Sync & Post-Deploy

## sync-env.mjs — sync de .env a Coolify

### Uso básico

```bash
# Pre-flight: dry-run para ver qué se va a cambiar
node scripts/coolify/sync-env.mjs --app mi-app --dry-run

# Sync real
node scripts/coolify/sync-env.mjs --app mi-app

# Sync desde archivo específico
node scripts/coolify/sync-env.mjs --app mi-app --file .env.production

# Solo vars específicas
node scripts/coolify/sync-env.mjs --app mi-app --keys DATABASE_URL,REDIS_URL,SENTRY_DSN

# Todas las apps
node scripts/coolify/sync-env.mjs --all --dry-run

# Por UUID directo
node scripts/coolify/sync-env.mjs --uuid abc-123-def
```

### Variables requeridas

```bash
# .env (raíz)
COOLIFY_API_URL=http://<server-ip>:8000
COOLIFY_API_TOKEN=...  # generado en Coolify dashboard
```

### Deny-list inamovible

Estas variables **NUNCA** se sincronizan (gestionadas por Coolify o críticas para deploy):

```js
const DENY_LIST = [
  'DATABASE_URL',
  'NODE_ENV',
  'PORT',
  'BETTER_AUTH_URL',
  'BETTER_AUTH_SECRET',
  'COOLIFY_API_TOKEN',
  'COOLIFY_API_URL',
  'GH_TOKEN',
];
```

Razón: Coolify maneja internamente DB connection, el build process usa valores específicos, y secrets críticos los gestiona el operador manualmente.

### Idempotencia

- **POST** si la var NO existe en Coolify → la agrega.
- **PATCH** si existe pero cambió el valor → actualiza.
- **NUNCA DELETE** → preserva vars que Coolify necesita o el operador agregó manualmente.

### Output esperado

```
[mi-app] Syncing 12 env vars (3 added, 9 updated, 25 preserved)
✓ Added: SENTRY_DSN
✓ Updated: REDIS_URL (changed)
✓ Updated: API_TIMEOUT (changed)
✓ Preserved: NODE_ENV (deny-list)
✓ Preserved: DATABASE_URL (deny-list)
---
Deploy required to apply changes. Run:
  curl -X POST https://coolify.example.com/api/v1/deploy?uuid=<uuid>
```

### Importante: requiere redeploy

Las env vars en Coolify se cargan al iniciar el container. Tras sync, hay que re-desplegar:

```bash
# Trigger deploy via API
curl -X POST "https://coolify.example.com/api/v1/deploy?uuid=<app-uuid>" \
  -H "Authorization: Bearer ${COOLIFY_API_TOKEN}"
```

O desde dashboard: Application → "Deploy".

## set-post-deploy.mjs — post_deployment_command

### Por qué se necesita

Coolify v4 con `build_pack=dockerfile` **ignora** `docker-compose.prod.yml` → el servicio `migrator` definido ahí es código muerto en prod.

Solución: usar `post_deployment_command` nativo de Coolify, que corre vía `docker exec` sobre el container `app` ya deployed.

### Uso básico

```bash
# Auto-detect container y command
node scripts/coolify/set-post-deploy.mjs --app mi-app

# Container custom
node scripts/coolify/set-post-deploy.mjs --app mi-app --container api

# Command custom
node scripts/coolify/set-post-deploy.mjs --app mi-app \
  --command "pnpm db:migrate && pnpm cache:clear"

# Dry-run
node scripts/coolify/set-post-deploy.mjs --app mi-app --dry-run

# Todas las apps
node scripts/coolify/set-post-deploy.mjs --all
```

### Auto-detección

Si no se pasa `--command`, el script infiere según `package.json`:

```js
// Auto-detect priority:
// 1. db:migrate script exists? → use: pnpm db:migrate && (pnpm db:seed:admin || true) && (pnpm db:seed:portfolio || true)
// 2. migrate script exists? → use: pnpm migrate && (pnpm seed:admin || true)
// 3. otherwise → skip (no command to set)
```

### Comportamiento por build_pack

- **`build_pack=dockerfile`** → setea `post_deployment_command` y `post_deployment_command_container`. ✅ Funciona.
- **`build_pack=dockercompose`** → **ignora** `post_deployment_command`. ❌ No funciona; usar el servicio `migrator` del compose directamente.
- **Otros** → skip con warning.

### Cuándo corre el hook

```
Deploy start
  ↓
Build image (Dockerfile)
  ↓
Start container
  ↓
Healthcheck pass
  ↓
post_deployment_command ← AQUÍ
  ↓
Deploy done
```

**Importante:** hook corre **DESPUÉS** del healthcheck. Si el hook falla, el deploy se marca como failed pero el container queda corriendo con la versión vieja.

### Idempotencia del hook

Si el hook es idempotente (ej. migrations de Drizzle son idempotentes con `if not exists`), se puede re-ejecutar sin problemas. Si no, agregar guards:

```bash
# pnpm db:migrate && (pnpm db:seed:admin || true)
# ↑ el || true evita que un seed opcional rompa el deploy
```

### Output esperado

```
[mi-app] build_pack=dockerfile ✓
[mi-app] Setting post_deployment_command:
  pnpm db:migrate && (pnpm db:seed:admin || true)
[mi-app] Container: app (default)
✓ POST /api/v1/applications/<uuid> → 200
---
Test with:
  curl -X POST https://coolify.example.com/api/v1/deploy?uuid=<uuid>
  # Watch logs for post_deployment_command output
```

## Flujo completo recomendado

```bash
# 1. Desarrollo local
vim .env.production
pnpm dev  # test

# 2. Pre-deploy
node scripts/deploy/preflight-deploy.mjs --app mi-app --check lockfile,deps,env

# 3. Sync env (con dry-run primero)
node scripts/coolify/sync-env.mjs --app mi-app --dry-run
node scripts/coolify/sync-env.mjs --app mi-app

# 4. Asegurar post-deploy hook configurado
node scripts/coolify/set-post-deploy.mjs --app mi-app

# 5. Deploy
curl -X POST "https://coolify.example.com/api/v1/deploy?uuid=<uuid>" \
  -H "Authorization: Bearer ${COOLIFY_API_TOKEN}"

# 6. Watch logs
ssh root@<server-ip> "docker logs -f mi-app-app-1"

# 7. Verify
curl -fsS https://mi-app.example.com/api/health
```

## Scripts alternativos (npm scripts)

```json
// package.json
{
  "scripts": {
    "coolify:sync": "node scripts/coolify/sync-env.mjs --app $(basename $PWD)",
    "coolify:sync:dry": "node scripts/coolify/sync-env.mjs --app $(basename $PWD) --dry-run",
    "coolify:postdeploy": "node scripts/coolify/set-post-deploy.mjs --app $(basename $PWD)",
    "coolify:postdeploy:dry": "node scripts/coolify/set-post-deploy.mjs --app $(basename $PWD) --dry-run",
    "deploy:prod": "pnpm coolify:sync && pnpm coolify:postdeploy && curl -X POST ..."
  }
}
```

## Errores comunes

1. ❌ Olvidar redeploy tras `sync-env.mjs` → container sigue con vars viejas.
2. ❌ `set-post-deploy.mjs` en app con `build_pack=dockercompose` → hook no se aplica, migrator service se necesita en compose.
3. ❌ Deny-list no incluye var crítica → secret leak a Coolify.
4. ❌ Hook no idempotente → segundo deploy falla con "duplicate key" o similar.
5. ❌ Comando hook referencia binario no instalado en container (`python3` cuando no está) → hook falla silently.
6. ❌ `--keys` flag mal spelled → Coolify no acepta update parcial.
7. ❌ Sync en producción con vars de desarrollo por error → app en prod usa `localhost` DB.
8. ❌ `coolify:postdeploy` con container que no existe (typo) → hook nunca corre.

## Verificación

```bash
# Env sync correcto
node scripts/coolify/sync-env.mjs --app mi-app --dry-run
# Debe mostrar 0 added, 0 updated (todo en paridad)

# Hook configurado
node scripts/coolify/set-post-deploy.mjs --app mi-app --dry-run
# Debe mostrar el comando actual

# Hook ejecuta tras deploy
# En logs del container, buscar:
# [post-deployment] Running: pnpm db:migrate && ...
# [post-deployment] ✓ Migration complete
```

## Recursos

- [Coolify API docs](https://coolify.io/docs/api)
- [Coolify post_deployment_command](https://coolify.io/docs/knowledge-base/post-deployment-scripts)
- Skill relacionada: `coolify-deploy` (overview)
- Skill relacionada: `prod-deploy-verification` (pre-flight checks)