---
name: prod-deploy-verification
description: Pre-flight verification of 12 checks before deploying to production (Coolify, Hetzner, any VPS). iaWorkSpace pattern via scripts/deploy/preflight-deploy.mjs. Apply before ANY deploy to prod.
license: Internal
---

# Prod Deploy Verification

## Why

Production deploys fail for the same 12 reasons. Detecting them EARLY avoids:
- Unnecessary downtime
- Manual rollbacks at 3am
- Broken DB migrations
- Leaked secrets

## When the laptop and CI disagree, CI is right

A local gate can go green on a state CI does not have: a warm `tsc` result, an artefact from an
earlier run, a file that exists on this machine and in no checkout. A clean CI checkout has none of
that, which is the entire reason it is worth running.

The failure this comes from: a pre-push hook failed `typecheck`, then the same command passed locally
twice in a row, so the first failure got written off as flaky. It was not — CI failed on it again with
the real message (`TS7016`, a missing declaration file), and the two local greens were the wrong
answer. Nearly an hour went to trusting the convenient result.

- A gate that fails once and then passes with no change in between has **not** been explained. Get
  the actual error before deciding it was noise.
- Do not report a local green as evidence for something CI is about to check. Report it as "local
  green, CI pending".
- When they disagree, the clean checkout wins. Reproduce CI's conditions rather than re-running yours
  until it agrees with you.

The same applies to a test suite: a failure you cannot reproduce may be a real ordering or pollution
bug, or the repository moving under you — check `git log` before concluding "flaky".

## The 12 checks (execution order)

### 1. **lockfile** — consistent package manager
```bash
# Verify the lockfile exists and is committed
test -f pnpm-lock.yaml || test -f package-lock.json || test -f yarn.lock
git ls-files --error-unmatch pnpm-lock.yaml >/dev/null 2>&1
```

### 2. **deps** — installed dependencies without critical vulns
```bash
pnpm install --frozen-lockfile
pnpm audit --prod --audit-level=high  # 0 high/critical required
```

### 3. **Dockerfile** — valid build context
```bash
test -f Dockerfile
docker build --no-cache -t test-build .   # dry run
```

### 4. **env** — required variables present
```bash
# Compare .env.example vs .env (values not, just keys)
diff <(grep -oE '^[A-Z_]+' .env.example | sort) \
     <(grep -oE '^[A-Z_]+' .env | sort)
```

### 5. **compose** — valid docker-compose syntax
```bash
docker compose config --quiet    # exit 0 = OK
```

### 6. **health** — healthcheck endpoint responds
```bash
curl -fsS http://localhost:3000/health || exit 1
```

### 7. **db-migrations** — pending or broken migrations
```bash
pnpm prisma migrate status       # or equivalent
# No "drift" or unapplied migrations should exist
```

### 8. **secrets** — no hardcoded secrets
```bash
# Scan with trufflehog, gitleaks, or grep
grep -rE "(api[_-]?key|token|password)\s*[:=]\s*['\"][a-zA-Z0-9]" --include="*.ts" --include="*.js" src/
```

### 9. **headers** — security headers in config
```bash
# Verify CSP, X-Frame-Options, etc. in nginx/traefik/Caddy config
grep -E "Content-Security-Policy|X-Frame-Options|X-Content-Type-Options" prod/traefik/dynamic/
```

### 10. **cors** — CORS config without wildcards
```bash
# Must not contain Access-Control-Allow-Origin: *
grep -rE "Access-Control-Allow-Origin.*\*" src/ nginx.conf
```

### 11. **build** — build passes without critical warnings
```bash
pnpm build 2>&1 | tee build.log
test -f dist/index.html
```

### 12. **size** — bundle size within limits
```bash
test $(stat -f%z dist/index.js 2>/dev/null || stat -c%s dist/index.js) -lt 500000  # 500KB
```

## Complete script (iaWorkSpace pattern)

```javascript
// scripts/deploy/preflight-deploy.mjs
#!/usr/bin/env node
import { execSync } from 'node:child_process';
import { readFileSync, existsSync, statSync } from 'node:fs';
import { resolve } from 'node:path';

const APP = process.argv.find(a => a.startsWith('--app='))?.split('=')[1]
  || process.argv[process.argv.indexOf('--app') + 1];
const ALL = process.argv.includes('--all');
const CHECKS = (process.argv.find(a => a.startsWith('--check='))?.split('=')[1] || '')
  .split(',').filter(Boolean);

const REQUIRED_CHECKS = [
  'lockfile', 'deps', 'Dockerfile', 'env', 'compose', 'health',
  'db-migrations', 'secrets', 'headers', 'cors', 'build', 'size'
];

function check(name, fn) {
  if (CHECKS.length && !CHECKS.includes(name)) return;
  process.stdout.write(`[${name}] `);
  try {
    fn();
    console.log('✓');
  } catch (e) {
    console.log('✗');
    console.error(`  └─ ${e.message}`);
    process.exitCode = 1;
  }
}

if (ALL) {
  // Iterate apps/*
  const apps = execSync('ls apps/', { encoding: 'utf-8' }).trim().split('\n');
  for (const app of apps) {
    console.log(`\n=== ${app} ===`);
    process.chdir(`apps/${app}`);
    runChecks();
  }
} else {
  console.log(`\n=== ${APP} ===`);
  runChecks();
}

function runChecks() {
  check('lockfile', () => {
    const lockfiles = ['pnpm-lock.yaml', 'package-lock.json', 'yarn.lock'];
    if (!lockfiles.some(f => existsSync(f))) throw new Error('no lockfile');
  });
  check('deps', () => {
    execSync('pnpm install --frozen-lockfile', { stdio: 'pipe' });
    const audit = execSync('pnpm audit --json --prod', { encoding: 'utf-8' });
    const parsed = JSON.parse(audit);
    if (parsed.metadata?.vulnerabilities?.high > 0 || parsed.metadata?.vulnerabilities?.critical > 0) {
      throw new Error('high/critical vulns');
    }
  });
  // ... rest
}
```

## Usage

```bash
# Single app, all checks
node scripts/deploy/preflight-deploy.mjs --app my-app

# Only some checks
node scripts/deploy/preflight-deploy.mjs --app my-app --check lockfile,deps,compose

# All apps
node scripts/deploy/preflight-deploy.mjs --all

# Pre-commit hook
# .husky/pre-commit: ! node scripts/deploy/preflight-deploy.mjs --app $(basename $PWD)
```

## Release gate

**iaWorkSpace rule:** Pre-release gate is `pnpm audit` with 0 Critical and 0 High. Apply before:

```bash
pnpm audit              # root, cross-app
pnpm audit:my-app       # single app
pnpm suggest            # audit + suggested diffs
pnpm fix                # audit + auto-apply LOW/MEDIUM
```

## Health check patterns

### Node/Express
```ts
app.get('/health', (req, res) => {
  res.json({ status: 'ok', uptime: process.uptime() });
});

app.get('/ready', async (req, res) => {
  try {
    await db.ping();
    await redis.ping();
    res.json({ status: 'ready' });
  } catch (e) {
    res.status(503).json({ status: 'not ready', error: e.message });
  }
});
```

### TanStack Start
```ts
// app/routes/health.tsx
export const Route = createFileRoute('/health')({
  server: {
    handlers: {
      GET: async () => Response.json({ status: 'ok' }),
    },
  },
});
```

## Common errors detected

| Check | Typical error | Fix |
|---|---|---|
| lockfile | `pnpm-lock.yaml` not committed | `git add pnpm-lock.yaml && git commit` |
| deps | `axios@0.20.0` with CVE | `pnpm update axios` |
| Dockerfile | `COPY . .` before `pnpm install` (large context) | Multi-stage + `.dockerignore` |
| env | Missing `DATABASE_URL` in prod | Add to `.env` + sync to Coolify |
| compose | `version: '3'` (deprecated) | Remove `version` field |
| health | `/health` not returning 200 | Add endpoint |
| db-migrations | Drift detected | `pnpm prisma migrate deploy` |
| secrets | `API_KEY = 'sk-...'` in code | Move to `.env` + `import.meta.env.VITE_*` |
| headers | Missing CSP | Add middleware |
| cors | `Access-Control-Allow-Origin: *` | Use origin whitelist |
| build | `TS2304: Cannot find name 'X'` | Fix types |
| size | Bundle > 1MB | Code-split + lazy load |

## Post-deploy: spot-check the live schema (the "Drizzle metadata gap" trap)

`drizzle-kit migrate` is the canonical way to apply Drizzle migrations, but
it has a sharp edge: **if a migration is missing from the
`__drizzle_migrations` journal, `drizzle-kit migrate` silently no-ops it**.
This happens when:

- A migration is added to the `drizzle/` folder by hand (custom SQL the
  ORM didn't generate).
- The journal is out of sync with the file list (e.g. after a merge, a
  rename, or a rebase that didn't update the metadata).
- The migration was generated against a different schema and
  `drizzle-kit` rejected it from the journal even though the file is on
  disk.

The "migrations applied successfully" log line will print, the deploy
is marked green, the container is healthy, and **the new table the
feature depends on is not in the DB**. The first user to hit the new
feature gets a 500. The error is silent at deploy time and loud in
production — the worst possible combination.

**Defense (do all three):**

1. **Use a custom migration runner** (e.g. `scripts/db/migrate-prod.mjs`)
   that tracks applied migrations in its own `app_migrations` table and
   applies any `drizzle/*.sql` file not in that table, regardless of
   whether `drizzle-kit` knows about it. This catches the gap. See the
   `drizzle-prod-migrations` skill for the full pattern.

2. **Always include a schema spot-check in the verification step.** A
   one-line query that confirms the tables/columns your new feature
   depends on actually exist:

   ```bash
   # 13. schema-spot-check (new check)
   echo "[schema-spot-check] verifying expected tables…"
   EXPECTED_TABLES=("listings" "listing_properties" "scraping_sources" "users" "user_profiles")
   for t in "${EXPECTED_TABLES[@]}"; do
     n=$(docker exec <db-container> psql -U <user> -d <db> -tAc \
         "SELECT count(*) FROM information_schema.tables WHERE table_name = '$t'")
     [ "$n" -eq 1 ] || { echo "::error::missing table $t"; exit 1; }
   done
   ```

3. **Test the new feature path with a real authenticated request** (see
   "Always verify in a real browser after deploying" in `coolify-deploy`).
   Even if the schema is fine, the server might be reading from a wrong
   column, or a FK might be missing, and the only way to catch that is to
   run the actual user flow.

## Post-deploy: backfill mismatched rows with a one-shot SQL (don't re-seed)

When production data has a column that was added in a recent migration
but never populated for existing rows (e.g. `region` was `NOT NULL` from
the start, but old rows were inserted before the column existed, so
they're `NULL` even though the value is recoverable from another
column), the temptation is to wipe and re-seed. **Don't.** Re-seeding
destroys real user data and scraped data accumulated since the last
seed. Write a single `UPDATE` that backfills from the data you already
have:

```sql
-- Example: backfill listings.region from listing_translations
UPDATE listings l
SET region = lt.region
FROM listing_translations lt
WHERE lt.listing_id = l.id
  AND l.region IS NULL;

-- Always check the count after
SELECT count(*) FROM listings WHERE region IS NULL;  -- should be 0
```

For more complex cases (region derived from lat/lng + city, or category
derived from a join), a one-off `scripts/db/backfill-region.ts` is
appropriate — but it must have the same production guard as the rest of
your seeds (`if existing rows already have the new value, skip`).

**Verify the backfill with a count query before AND after**. The
"before" count tells you the scope of the problem; the "after" count
tells you the migration worked. If the "after" is still non-zero, the
JOIN missed rows (typo, wrong column name, NULL in the source). Repeat
until the count is 0.

### A backfill that loops must assert it is making progress

When the backfill is a script draining a set in batches — "select the rows that still need it,
fix them, repeat" — the loop's exit condition is that the write stops matching the predicate
that selected it. If the write does not do that, the loop never ends, and how it fails is the
problem: not an error, but a process that grows until the OOM killer takes it, with nothing in
the output pointing at the cause.

Make the invariant explicit:

```js
let before = await remaining()
for (;;) {
  const rows = await selectBatch()
  if (rows.length === 0) break
  for (const row of rows) await fix(row)

  const after = await remaining()
  if (after >= before) {
    throw new Error(`fixed ${rows.length} rows and ${after} still match (was ${before}) — the write does not satisfy the predicate that selected it`)
  }
  before = after
}
```

Guard the preconditions before opening the connection, too. If the transform is a no-op when
some environment variable is missing, every row stays selected and you get the same hang — refuse
up front with a message instead of discovering it as a crash twenty minutes later.

### `JSON.stringify` into a `jsonb` parameter encodes it twice

The bug that produced exactly that hang, with `postgres.js`:

```js
await sql.unsafe(`UPDATE t SET col = $1::jsonb WHERE id = $2`,
  [JSON.stringify(value), id])   // ❌ the driver serialises the string it was handed
                                 //    the column ends up holding a JSON *string* whose text is an object
                                 //    jsonb_exists(col,'k') finds no keys, and the predicate keeps matching

await sql.unsafe(`UPDATE t SET col = $1 WHERE id = $2`,
  [sql.json(value), id])         // ✅ pass the object
```

It is invisible in a status check — the UPDATE reports one row affected either time. Read a row
back and assert its **shape**, not just that the write happened:

```sql
SELECT jsonb_typeof(col) FROM t LIMIT 1;   -- 'object', not 'string'
```

### Prove a data script against a throwaway database before production

A one-shot script that rewrites rows deserves a rehearsal, and it costs about a minute:

```bash
docker run -d --rm --name probe -e POSTGRES_PASSWORD=probe -e POSTGRES_DB=probe \
  -p 55432:5432 postgres:18-alpine
# create the tables, seed rows in BOTH states — the ones needing the fix and the ones already fixed
DATABASE_MIGRATION_URL=postgres://postgres:probe@localhost:55432/probe node scripts/db/thing.mjs
docker stop probe
```

Seeding both states is the point: it proves the script fixes what it should **and leaves alone
what it should not**, which a production run cannot tell you afterwards. Then run it twice and
assert the second run is a no-op. Both bugs above were found this way, before touching real data.

## Manual pre-deploy checklist

- [ ] Branch up to date with `main`
- [ ] Tests passing (`pnpm test`)
- [ ] Lint without errors (`pnpm lint`)
- [ ] Typecheck (`pnpm typecheck`)
- [ ] Audit clean (`pnpm audit`)
- [ ] Pre-flight 12 checks pass
- [ ] DB migrations tested in staging
- [ ] Env vars synchronized with Coolify
- [ ] DNS configured (if new domain)
- [ ] Slack/Discord notification configured for post-deploy
- [ ] Clear rollback plan (last stable tag)

## Post-deploy verification

```bash
# Smoke tests
curl -fsS https://my-app.example.com/health
curl -fsS https://my-app.example.com/api/version

# Check logs
ssh hetzner "docker logs --tail 100 my-app-app-1"

# Check metrics
# Grafana / Sentry / Uptime Kuma
```

## Resources

- `scripts/deploy/preflight-deploy.mjs` — canonical script
- `scripts/deploy/preflight-apply.sh` — legacy bash version
- `.githooks/pre-commit` — auto-runs on commit
- [iaWorkSpace AGENTS.md](../eddremonts86/iaWorkSpace/AGENTS.md) "Pre-deploy verification" section