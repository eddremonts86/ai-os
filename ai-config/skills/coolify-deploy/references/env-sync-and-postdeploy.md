# Env sync and post-deploy work

Detail for the `coolify-deploy` skill: the iaWorkSpace `sync-env.mjs` / `set-post-deploy.mjs`
scripts, and the idempotent DB deploy orchestrator. Credentials, uuid resolution and the
"entrypoint, not `post_deployment_command`, for migrations" rule are in `../SKILL.md`; env API quirks
(`is_build_time` → 422, `is_preview` mirroring, hash-based verification) are in
[`env-config-and-secrets`](../../env-config-and-secrets/SKILL.md).

## Where post-deploy code runs

| Mechanism | When it runs | Failure mode | Use for |
|---|---|---|---|
| **Container entrypoint / CMD** | Before the app's main process, BEFORE the healthcheck | Non-zero exit → container exits → deploy fails. Atomic. | Migrations, schema setup, required seeds |
| **`post_deployment_command`** | After the healthcheck passes; the app is already serving traffic | Non-zero exit is logged, **deploy is NOT marked failed**, container keeps running | Optional seeds, cache warmup, deploy webhooks, image prune |

```
Build image → Start container (ENTRYPOINT/CMD: migrations) → Healthcheck pass
  → post_deployment_command (optional work only) → Deploy done
```

`post_deployment_command` runs via `docker exec` in the running container: it inherits the injected
env vars but no `.env` file. With `build_pack=dockercompose` it is **ignored entirely** — use a
`migrator` service in the compose file instead.

## sync-env.mjs — push a local .env to Coolify

```bash
node scripts/coolify/sync-env.mjs --app my-app --dry-run          # always first
node scripts/coolify/sync-env.mjs --app my-app
node scripts/coolify/sync-env.mjs --app my-app --file .env.production
node scripts/coolify/sync-env.mjs --app my-app --keys REDIS_URL,SENTRY_DSN
node scripts/coolify/sync-env.mjs --all --dry-run
node scripts/coolify/sync-env.mjs --uuid <uuid>
```

Idempotent: **POST** when the key is absent, **PATCH** when the value changed, **never DELETE**
(preserves vars Coolify or the operator added by hand).

Deny-list — never synced, managed by Coolify or the operator:

```js
const DENY_LIST = ['DATABASE_URL', 'NODE_ENV', 'PORT', 'BETTER_AUTH_URL',
  'BETTER_AUTH_SECRET', 'COOLIFY_API_TOKEN', 'COOLIFY_API_URL', 'GH_TOKEN'];
```

Env vars load at container start, so **a sync does nothing until you redeploy** (trigger endpoint
in `../SKILL.md`, `POST /api/v1/applications/<uuid>/start`). Parity check: a `--dry-run` that
reports 0 added / 0 updated.

## set-post-deploy.mjs — OPTIONAL work only

```bash
node scripts/coolify/set-post-deploy.mjs --app my-app                  # auto-detect
node scripts/coolify/set-post-deploy.mjs --app my-app --container api
node scripts/coolify/set-post-deploy.mjs --app my-app \
  --command "curl -fsS -X POST \$DEPLOY_WEBHOOK_URL && pnpm cache:warm"
node scripts/coolify/set-post-deploy.mjs --app my-app --dry-run
node scripts/coolify/set-post-deploy.mjs --all
```

Without `--command` it infers from `package.json`: `db:migrate` → `pnpm db:migrate && (pnpm
db:seed:admin || true) && (pnpm db:seed:portfolio || true)`; else `migrate` → `pnpm migrate &&
(pnpm seed:admin || true)`; else skip. That auto-detected migration command is legacy — prefer
moving migrations to the entrypoint. Sets `post_deployment_command` +
`post_deployment_command_container` for `build_pack=dockerfile` only. Wrap optional steps in
`|| true` so they cannot break the hook, and keep the hook idempotent.

## Pattern: one idempotent DB deploy orchestrator

For DB-backed apps, put all database bring-up into a single idempotent, **fail-loud** script
(e.g. `scripts/deploy/orchestrate.mjs`, run as `pnpm deploy:db`) instead of a bare
`pnpm db:migrate && …`. Ordered, forward-only (NEVER `drizzle-kit push`, drop, or reset):

1. **Wait for the database** (bounded retry loop) — the app often starts before the DB is ready.
2. **Ensure the database exists** (create-if-absent).
3. **Ensure extensions** (`CREATE EXTENSION IF NOT EXISTS vector`) — soft: warn, don't fail.
4. **Apply migrations** (`drizzle-kit migrate`).
5. **Provision / rotate passwords** for least-privilege roles that migrations create *without*
   passwords. Skipping this is the trap that silently breaks fresh deploys: the role exists but
   cannot authenticate, every DB page 500s, workers fail 100%. Read each password from its role
   connection URL and `ALTER ROLE … WITH PASSWORD`; restrict provisionable roles with a regex
   (e.g. `^myapp_[a-z]+$`) so a bad URL can never rotate a superuser/owner.
6. **Verify** every provisioned role can log in — fail early and loud.
7. **Seed** the default admin (best-effort, `--skip-seed`).

Non-negotiables: idempotent + forward-only (safe on every deploy, data preserved); read
`process.env` (optionally hydrate from `.env` locally — never `tsx --env-file=.env` in the
container); never log passwords or connection strings, only role names and step results; a
`--dry-run` that prints the plan.

Run it from the **entrypoint** (a bad migration fails the deploy). Running it as
`post_deployment_command` is acceptable only because it is fail-loud — and then you MUST
spot-check the live schema after any deploy that changed migrations.

## Common errors

1. ❌ No redeploy after `sync-env.mjs` → container keeps old vars.
2. ❌ `set-post-deploy.mjs` on a `dockercompose` app → hook silently not applied.
3. ❌ Critical var missing from the deny-list → secret leaks into Coolify.
4. ❌ Non-idempotent hook → second deploy fails ("duplicate key").
5. ❌ Hook calls a binary absent from the image (`python3`) or a container name with a typo → never runs.
6. ❌ Syncing development vars to production → prod app points at a `localhost` DB.
7. ❌ New Drizzle migration without regenerating the integrity guard (e.g.
   `drizzle/migration-hashes.json` + a test asserting the migration count) → CI fails on drift, or
   a drifted journal lets `drizzle-kit migrate` skip the migration in prod.

## Resources

- [Coolify post-deployment scripts](https://coolify.io/docs/knowledge-base/post-deployment-scripts)
- Related skill: `prod-deploy-verification` (project-local skill in iaWorkSpace) (pre-flight checks)
