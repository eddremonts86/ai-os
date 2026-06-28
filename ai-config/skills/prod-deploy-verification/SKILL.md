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