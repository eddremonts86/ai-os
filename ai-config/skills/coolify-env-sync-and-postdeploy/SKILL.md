---
name: coolify-env-sync-and-postdeploy
description: Idempotent synchronization of env vars to Coolify + setup of post_deployment_command for migrations/seeds. Covers scripts/coolify/sync-env.mjs and set-post-deploy.mjs. Applies to any deploy on Coolify v4 with build_pack=dockerfile or dockercompose.
license: Internal
---

# Coolify Env Sync & Post-Deploy

## sync-env.mjs — sync from .env to Coolify

### Basic usage

```bash
# Pre-flight: dry-run to see what will change
node scripts/coolify/sync-env.mjs --app my-app --dry-run

# Real sync
node scripts/coolify/sync-env.mjs --app my-app

# Sync from specific file
node scripts/coolify/sync-env.mjs --app my-app --file .env.production

# Only specific vars
node scripts/coolify/sync-env.mjs --app my-app --keys DATABASE_URL,REDIS_URL,SENTRY_DSN

# All apps
node scripts/coolify/sync-env.mjs --all --dry-run

# By direct UUID
node scripts/coolify/sync-env.mjs --uuid abc-123-def
```

### Required variables

```bash
# .env (root)
COOLIFY_API_URL=http://<server-ip>:8000
COOLIFY_API_TOKEN=***  # generated in Coolify dashboard
```

### Immutable deny-list

These variables are **NEVER** synced (managed by Coolify or critical for deploy):

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

Reason: Coolify handles DB connection internally, the build process uses specific values, and critical secrets are managed by the operator manually.

### Idempotency

- **POST** if the var does NOT exist in Coolify → adds it.
- **PATCH** if it exists but value changed → updates.
- **NEVER DELETE** → preserves vars Coolify needs or the operator added manually.

### Expected output

```
[my-app] Syncing 12 env vars (3 added, 9 updated, 25 preserved)
✓ Added: SENTRY_DSN
✓ Updated: REDIS_URL (changed)
✓ Updated: API_TIMEOUT (changed)
✓ Preserved: NODE_ENV (deny-list)
✓ Preserved: DATABASE_URL (deny-list)
---
Deploy required to apply changes. Run:
  curl -X POST https://coolify.example.com/api/v1/deploy?uuid=<uuid>
```

### Important: requires redeploy

Env vars in Coolify are loaded when the container starts. After sync, you must redeploy:

```bash
# Trigger deploy via API
curl -X POST "https://coolify.example.com/api/v1/deploy?uuid=<app-uuid>" \
  -H "Authorization: Bearer ${COOLIFY_API_TOKEN}"
```

Or from dashboard: Application → "Deploy".

## set-post-deploy.mjs — post_deployment_command

### Why it's needed

Coolify v4 with `build_pack=dockerfile` **ignores** `docker-compose.prod.yml` → the `migrator` service defined there is dead code in prod.

Solution: use Coolify's native `post_deployment_command`, which runs via `docker exec` over the already-deployed `app` container.

### Basic usage

```bash
# Auto-detect container and command
node scripts/coolify/set-post-deploy.mjs --app my-app

# Custom container
node scripts/coolify/set-post-deploy.mjs --app my-app --container api

# Custom command
node scripts/coolify/set-post-deploy.mjs --app my-app \
  --command "pnpm db:migrate && pnpm cache:clear"

# Dry-run
node scripts/coolify/set-post-deploy.mjs --app my-app --dry-run

# All apps
node scripts/coolify/set-post-deploy.mjs --all
```

### Auto-detection

If `--command` is not passed, the script infers from `package.json`:

```js
// Auto-detect priority:
// 1. db:migrate script exists? → use: pnpm db:migrate && (pnpm db:seed:admin || true) && (pnpm db:seed:portfolio || true)
// 2. migrate script exists? → use: pnpm migrate && (pnpm seed:admin || true)
// 3. otherwise → skip (no command to set)
```

### Behavior by build_pack

- **`build_pack=dockerfile`** → sets `post_deployment_command` and `post_deployment_command_container`. Works.
- **`build_pack=dockercompose`** → **ignores** `post_deployment_command`. Does not work; use the `migrator` service from compose directly.
- **Others** → skip with warning.

### When the hook runs

```
Deploy start
  ↓
Build image (Dockerfile)
  ↓
Start container
  ↓
Healthcheck pass
  ↓
post_deployment_command ← HERE
  ↓
Deploy done
```

**Important:** hook runs **AFTER** the healthcheck. If the hook fails, the deploy is marked as failed but the container keeps running with the old version.

### Hook idempotency

If the hook is idempotent (e.g. Drizzle migrations are idempotent with `if not exists`), it can be re-run without issues. If not, add guards:

```bash
# pnpm db:migrate && (pnpm db:seed:admin || true)
# ↑ the || true prevents an optional seed from breaking the deploy
```

### Expected output

```
[my-app] build_pack=dockerfile ✓
[my-app] Setting post_deployment_command:
  pnpm db:migrate && (pnpm db:seed:admin || true)
[my-app] Container: app (default)
✓ POST /api/v1/applications/<uuid> → 200
---
Test with:
  curl -X POST https://coolify.example.com/api/v1/deploy?uuid=<uuid>
  # Watch logs for post_deployment_command output
```

## Recommended complete flow

```bash
# 1. Local development
vim .env.production
pnpm dev  # test

# 2. Pre-deploy
node scripts/deploy/preflight-deploy.mjs --app my-app --check lockfile,deps,env

# 3. Sync env (with dry-run first)
node scripts/coolify/sync-env.mjs --app my-app --dry-run
node scripts/coolify/sync-env.mjs --app my-app

# 4. Ensure post-deploy hook configured
node scripts/coolify/set-post-deploy.mjs --app my-app

# 5. Deploy
curl -X POST "https://coolify.example.com/api/v1/deploy?uuid=<uuid>" \
  -H "Authorization: Bearer ${COOLIFY_API_TOKEN}"

# 6. Watch logs
ssh root@<server-ip> "docker logs -f my-app-app-1"

# 7. Verify
curl -fsS https://my-app.example.com/api/health
```

## Alternative scripts (npm scripts)

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

## Common errors

1. ❌ Forgetting redeploy after `sync-env.mjs` → container keeps old vars.
2. ❌ `set-post-deploy.mjs` on app with `build_pack=dockercompose` → hook not applied, migrator service needed in compose.
3. ❌ Deny-list doesn't include critical var → secret leak to Coolify.
4. ❌ Hook not idempotent → second deploy fails with "duplicate key" or similar.
5. ❌ Hook command references binary not installed in container (`python3` when not present) → hook fails silently.
6. ❌ `--keys` flag misspelled → Coolify doesn't accept partial update.
7. ❌ Sync in production with development vars by mistake → prod app uses `localhost` DB.
8. ❌ `coolify:postdeploy` with container that doesn't exist (typo) → hook never runs.

## Verification

```bash
# Env sync correct
node scripts/coolify/sync-env.mjs --app my-app --dry-run
# Should show 0 added, 0 updated (all in parity)

# Hook configured
node scripts/coolify/set-post-deploy.mjs --app my-app --dry-run
# Should show current command

# Hook executes after deploy
# In container logs, look for:
# [post-deployment] Running: pnpm db:migrate && ...
# [post-deployment] ✓ Migration complete
```

## Resources

- [Coolify API docs](https://coolify.io/docs/api)
- [Coolify post_deployment_command](https://coolify.io/docs/knowledge-base/post-deployment-scripts)
- Related skill: `coolify-deploy` (overview)
- Related skill: `prod-deploy-verification` (pre-flight checks)