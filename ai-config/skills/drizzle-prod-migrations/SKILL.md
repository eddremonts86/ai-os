---
name: drizzle-prod-migrations
description: Production migration runner for Drizzle ORM that handles custom SQL files, PL/pgSQL DO blocks, and the "metadata gap" (drizzle-kit silently no-ops on migrations missing from its journal). Use for any TanStack Start, Next.js, or Node service that uses Drizzle ORM with mixed generated + custom SQL migrations on Coolify / Docker / any container.
license: Internal
---

# Drizzle Production Migrations

## The problem

`drizzle-kit migrate` is the canonical Drizzle migration runner, but it has
a sharp edge that **silently breaks production deploys**:

> If a `.sql` file exists in `drizzle/` but is missing from
> `drizzle/meta/_journal.json` (Drizzle's metadata journal), `drizzle-kit
> migrate` skips it without any error or warning.

The "migrations applied successfully" line still prints, the deploy is
green, the container is healthy, and **the new table the feature depends
on is not in the DB**. The first user to hit the new feature gets a 500.

This happens often with **custom SQL migrations** — the kind you write
yourself for things drizzle-kit can't generate:

- `CREATE INDEX CONCURRENTLY` (drizzle-kit doesn't support this yet)
- PL/pgSQL `DO $$ ... $$;` blocks for conditional backfills
- Extensions and their config (`CREATE EXTENSION postgis`)
- Materialized views, triggers, RLS policies
- Custom column types and domains
- Anything that needs `IF NOT EXISTS` semantics across multiple statements

You write the `.sql` file, drop it in `drizzle/`, run `pnpm db:migrate`
locally — works fine. Drizzle-kit applies it once, marks it applied in
`__drizzle_migrations`, and forgets about it. The journal has no entry
for it because you never ran `drizzle-kit generate` to add it.

**In production, on a fresh DB**, drizzle-kit reads the journal, sees
no entry for the file, **silently skips it**, and the new table is
never created.

## Symptoms

- Production deploy is "successful" and green in Coolify.
- Container is healthy, `/api/health` returns 200.
- First user request that touches the new table → `relation "foo" does not exist` (Postgres error 42P01).
- The migration that supposedly added the table is not in
  `SELECT * FROM drizzle.__drizzle_migrations` on the live DB.
- The migration file IS on disk in the container
  (`docker exec <app> ls drizzle/`) but `drizzle-kit migrate` never
  applied it.

## The fix: custom runner that tracks applied files in its own table

Don't rely on `drizzle-kit migrate` for production. Write a small
`scripts/db/migrate-prod.mjs` (or `.ts`) that:

1. Tracks applied migrations in a **separate table** (`app_migrations`)
   that you own, not Drizzle's.
2. On every boot, lists the `drizzle/*.sql` files, sorts them
   alphabetically (Drizzle's convention), and applies any file not in
   `app_migrations`.
3. Uses a per-file try / catch with the standard "already exists"
   error codes (`42P07`, `42710`, `42P06`, `42P16`) so re-runs on a
   half-migrated DB are still safe.
4. Splits the SQL on `--&gt; statement-breakpoint` (Drizzle's
   convention) and tries each chunk independently — except for files
   that contain `DO $$ ... $$;` PL/pgSQL blocks, which must run whole.

The runner is called from the container's entrypoint, BEFORE the
server starts. It exits non-zero on any unrecoverable failure so
Coolify marks the deploy as failed.

### Full implementation (~80 lines)

```js
// scripts/db/migrate-prod.mjs
#!/usr/bin/env node
import { execFileSync } from 'node:child_process'
import { readFileSync, readdirSync } from 'node:fs'
import { fileURLToPath } from 'node:url'
import { dirname, join, resolve } from 'node:path'
import postgres from 'postgres'

const __dirname = dirname(fileURLToPath(import.meta.url))
const repoRoot = resolve(__dirname, '..', '..')
const drizzleDir = join(repoRoot, 'drizzle')

const databaseUrl = process.env.DATABASE_URL
if (!databaseUrl) { console.error('DATABASE_URL is not set'); process.exit(1) }

function run(label, command, args) {
  console.log(`\n── ${label} ──`)
  execFileSync(command, args, { stdio: 'inherit', cwd: repoRoot, env: process.env })
}

async function applySqlInOrder() {
  const files = readdirSync(drizzleDir)
    .filter(f => f.endsWith('.sql'))
    .sort()

  if (files.length === 0) { console.log('No .sql files — skipping.'); return }

  const sql = postgres(databaseUrl, { max: 1, prepare: false })
  try {
    await sql`
      CREATE TABLE IF NOT EXISTS app_migrations (
        name        text PRIMARY KEY,
        applied_at  timestamp NOT NULL DEFAULT now()
      )
    `

    for (const file of files) {
      const name = file.replace(/\.sql$/, '')
      const rows = await sql`
        SELECT EXISTS(SELECT 1 FROM app_migrations WHERE name = ${name}) AS exists
      `
      if (rows[0]?.exists) {
        console.log(`  · ${name} — already applied, skipping`)
        continue
      }

      const sqlText = readFileSync(join(drizzleDir, file), 'utf8')
      console.log(`  · ${name} — applying…`)

      // Try the whole file first — fastest path for fresh DBs and the
      // only safe way to apply PL/pgSQL DO blocks (splitting on `;` corrupts them)
      try {
        await sql.unsafe(sqlText)
        await sql`INSERT INTO app_migrations (name) VALUES (${name})
                   ON CONFLICT (name) DO NOTHING`
        console.log(`  ✓ ${name} — applied (whole file)`)
        continue
      } catch (err) {
        const code = err && err.code
        const isAlreadyExists =
          code === '42P07' || // duplicate_table
          code === '42710' || // duplicate_object
          code === '42P06' || // duplicate schema
          code === '42P16'    // duplicate_index
        if (!isAlreadyExists) throw err   // PL/pgSQL file: can't safely split
        console.log(`  · ${name} — partial, falling back to per-statement`)
      }

      // Fallback: split on `--&gt; statement-breakpoint` and execute each chunk
      const chunks = sqlText
        .split(/-->\s*statement-breakpoint/)
        .map(s => s.trim()).filter(s => s.length > 0)

      let applied = 0, skipped = 0
      for (const chunk of chunks) {
        try { await sql.unsafe(chunk); applied++ }
        catch (err) {
          const code = err && err.code
          if (code === '42P07' || code === '42710' || code === '42P06' || code === '42P16') {
            skipped++; continue
          }
          throw err
        }
      }
      await sql`INSERT INTO app_migrations (name) VALUES (${name})
                 ON CONFLICT (name) DO NOTHING`
      console.log(`  ✓ ${name} — applied (${applied} new, ${skipped} skipped)`)
    }
  } finally {
    await sql.end({ timeout: 5 })
  }
}

async function main() {
  console.log('▸ migrate-prod — production migration runner')
  console.log(`  DATABASE_URL = ${maskUrl(databaseUrl)}`)

  // 1. Ensure target database exists (idempotent CREATE DATABASE)
  run('1/3 create-db', 'pnpm', ['exec', 'tsx', 'scripts/db/create-db.ts'])

  // 2. Apply all SQL migrations in order
  await applySqlInOrder()

  // 3. Bookkeeping (custom TS that depends on schema being up)
  run('3/3 seed-admin', 'pnpm', ['exec', 'tsx', 'scripts/db/seed-admin.ts'])

  console.log('\n✅  migrate-prod finished')
}

function maskUrl(url) {
  try { const u = new URL(url); if (u.password) u.password = '***'; return u.toString() }
  catch { return '(unparseable)' }
}

main().catch(err => { console.error('\n❌  migrate-prod failed:', err); process.exit(1) })
```

### Container entrypoint

```sh
#!/bin/sh
# scripts/docker-app-entrypoint.sh
set -eu

echo "[startup] running production migrations…"
node scripts/db/migrate-prod.mjs       # exits non-zero on any failure

echo "[startup] starting production server on port ${PORT:-3000}…"
exec node server.prod.mjs              # only reached if migrations succeed
```

```dockerfile
# Dockerfile (excerpt)
FROM node:22-bookworm-slim AS prod
# ... copy artifacts ...
CMD ["sh", "scripts/docker-app-entrypoint.sh"]
```

### Coolify config

```bash
# `post_deployment_command` is left empty or used for optional work only.
# DO NOT put migrations here — it runs AFTER the healthcheck, and a
# failure here does not mark the deploy as failed (see
# coolify-env-sync-and-postdeploy for the full table).
post_deployment_command: ""
```

## Why the dual approach (whole-file + per-chunk fallback)?

| File type | Strategy | Why |
|---|---|---|
| Pure DDL (CREATE TABLE, CREATE INDEX, ALTER) | Whole file | One transaction, atomic, fastest |
| `IF NOT EXISTS` everywhere | Whole file | Always succeeds, even on partial application |
| `CREATE INDEX CONCURRENTLY` | Whole file | Can't be in a transaction; per-chunk would re-trigger CONCURRENTLY issues |
| PL/pgSQL `DO $$ ... $$;` blocks | Whole file | Splitting on `;` would corrupt the block; the `$$` quoting is a problem |
| Mixed (DDL + plain SQL without `IF NOT EXISTS`) | Per-chunk fallback | Skip `42P07` / `42710` / `42P06` / `42P16` errors individually |

The "try whole file first" pattern catches 95% of cases. The per-chunk
fallback is for files added over time that the original author didn't
write defensively enough — better to apply 9 out of 10 statements and
log the skip than to fail the whole migration and roll back the deploy.

## Defense in depth: 3 things to also do

1. **Always include a schema spot-check in your post-deploy verification.**
   See `prod-deploy-verification` for the table-list query. This catches
   the case where the runner itself has a bug.

2. **Test the new feature path with a real authenticated request** (see
   "Always verify in a real browser after deploying" in `coolify-deploy`).
   Even if the schema is correct, the server might be reading from a
   wrong column, or a FK might be missing.

3. **Periodically audit `app_migrations` vs `drizzle/` on disk**:

   ```sql
   SELECT name, applied_at FROM app_migrations ORDER BY name;
   ```

   ```bash
   # In a CI check (or manually):
   diff \
     <(docker exec <db> psql -U <user> -d <db> -tAc "SELECT name FROM app_migrations ORDER BY name") \
     <(ls drizzle/*.sql | sed 's|drizzle/||;s|\.sql$||' | sort)
   # No diff → every on-disk migration is in the table. Any diff → investigate.
   ```

## Common errors

1. ❌ Using `drizzle-kit migrate` as the only production runner → custom SQL files missing from the journal are silently skipped. Use `migrate-prod.mjs` (or equivalent) as the canonical runner.
2. ❌ Adding a custom `.sql` file to `drizzle/` without running `drizzle-kit generate` to update the journal → same silent-skip trap.
3. ❌ Putting `pnpm db:migrate` in `post_deployment_command` → runs AFTER the app is already serving traffic; a failure does not mark the deploy as failed. Run it from the entrypoint instead.
4. ❌ Splitting a `.sql` file on `;` to handle per-statement errors → corrupts PL/pgSQL `DO $$ ... $$;` blocks (the `$$` quoting contains semicolons). Split only on `--&gt; statement-breakpoint` and try the whole file first.
5. ❌ Trusting "migrations applied successfully" in the Coolify log as proof the schema is correct → always spot-check with `\dt` or a real feature-path test after a deploy that includes migrations.
6. ❌ Forgetting to add `idempotency: true` to `CREATE INDEX CONCURRENTLY` in a custom migration → second deploy fails with "relation already exists" or, worse, locks the table for too long.
7. ❌ Wrapping a PL/pgSQL `DO $$ ... $$;` block in a transaction → `DO` cannot run inside a transaction block. Whole-file execution is the only safe option; per-chunk will fail.

## Related skills

- `coolify-deploy` — entrypoint pattern, env injection, scraper app separation
- `coolify-env-sync-and-postdeploy` — why `post_deployment_command` is the wrong place for migrations
- `prod-deploy-verification` — schema spot-check, post-deploy real-browser verification
- `deployment-patterns` — idempotent seed orchestrator pattern (complementary to migrations)
