---
name: prod-deploy-verification
description: Pre-flight verification de 12 checks antes de deployar a producción (Coolify, Hetzner, cualquier VPS). Patrón iaWorkSpace via scripts/deploy/preflight-deploy.mjs. Aplica antes de CUALQUIER deploy a prod.
license: Internal
---

# Prod Deploy Verification

## Por qué

Deploys a producción fallan por las mismas 12 razones. Detectarlas ANTES evita:
- Downtime innecesario
- Rollbacks manuales a las 3am
- DB migrations rotas
- Secrets filtrados

## Los 12 checks (orden de ejecución)

### 1. **lockfile** — package manager consistente
```bash
# Verifica que el lockfile existe y está commited
test -f pnpm-lock.yaml || test -f package-lock.json || test -f yarn.lock
git ls-files --error-unmatch pnpm-lock.yaml >/dev/null 2>&1
```

### 2. **deps** — dependencias instaladas sin vulns críticas
```bash
pnpm install --frozen-lockfile
pnpm audit --prod --audit-level=high  # 0 high/critical required
```

### 3. **Dockerfile** — build context válido
```bash
test -f Dockerfile
docker build --no-cache -t test-build .   # dry run
```

### 4. **env** — variables requeridas presentes
```bash
# Compare .env.example vs .env (sin valores, solo keys)
diff <(grep -oE '^[A-Z_]+' .env.example | sort) \
     <(grep -oE '^[A-Z_]+' .env | sort)
```

### 5. **compose** — docker-compose syntax válido
```bash
docker compose config --quiet    # exit 0 = OK
```

### 6. **health** — endpoint de healthcheck responde
```bash
curl -fsS http://localhost:3000/health || exit 1
```

### 7. **db-migrations** — migrations pendientes o rotas
```bash
pnpm prisma migrate status       # o equivalente
# No debe haber "drift" o migrations sin aplicar
```

### 8. **secrets** — no secrets hardcoded
```bash
# Scan con trufflehog, gitleaks, o grep
grep -rE "(api[_-]?key|token|password)\s*[:=]\s*['\"][a-zA-Z0-9]" --include="*.ts" --include="*.js" src/
```

### 9. **headers** — security headers en config
```bash
# Verificar CSP, X-Frame-Options, etc. en nginx/traefik/Caddy config
grep -E "Content-Security-Policy|X-Frame-Options|X-Content-Type-Options" prod/traefik/dynamic/
```

### 10. **cors** — CORS config sin wildcards
```bash
# No debe haber Access-Control-Allow-Origin: *
grep -rE "Access-Control-Allow-Origin.*\*" src/ nginx.conf
```

### 11. **build** — build pasa sin warnings críticos
```bash
pnpm build 2>&1 | tee build.log
test -f dist/index.html
```

### 12. **size** — bundle size dentro de límites
```bash
test $(stat -f%z dist/index.js 2>/dev/null || stat -c%s dist/index.js) -lt 500000  # 500KB
```

## Script completo (iaWorkSpace pattern)

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
  // ... resto
}
```

## Uso

```bash
# Single app, all checks
node scripts/deploy/preflight-deploy.mjs --app mi-app

# Solo algunos checks
node scripts/deploy/preflight-deploy.mjs --app mi-app --check lockfile,deps,compose

# Todas las apps
node scripts/deploy/preflight-deploy.mjs --all

# Pre-commit hook
# .husky/pre-commit: ! node scripts/deploy/preflight-deploy.mjs --app $(basename $PWD)
```

## Gate de release

**Regla iaWorkSpace:** Pre-release gate es `pnpm audit` con 0 Critical y 0 High. Aplicar antes de:

```bash
pnpm audit              # root, cross-app
pnpm audit:mi-app       # single app
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

## Errores comunes detectados

| Check | Error típico | Fix |
|---|---|---|
| lockfile | `pnpm-lock.yaml` no commited | `git add pnpm-lock.yaml && git commit` |
| deps | `axios@0.20.0` con CVE | `pnpm update axios` |
| Dockerfile | `COPY . .` antes de `pnpm install` (context grande) | Multi-stage + `.dockerignore` |
| env | Falta `DATABASE_URL` en prod | Agregar a `.env` + sync a Coolify |
| compose | `version: '3'` (deprecated) | Quitar field `version` |
| health | `/health` no responde 200 | Agregar endpoint |
| db-migrations | Drift detected | `pnpm prisma migrate deploy` |
| secrets | `API_KEY = 'sk-...'` en código | Mover a `.env` + `import.meta.env.VITE_*` |
| headers | Falta CSP | Agregar middleware |
| cors | `Access-Control-Allow-Origin: *` | Usar origin whitelist |
| build | `TS2304: Cannot find name 'X'` | Fix types |
| size | Bundle > 1MB | Code-split + lazy load |

## Checklist manual pre-deploy

- [ ] Branch actualizado con `main`
- [ ] Tests pasando (`pnpm test`)
- [ ] Lint sin errores (`pnpm lint`)
- [ ] Typecheck (`pnpm typecheck`)
- [ ] Audit limpio (`pnpm audit`)
- [ ] Pre-flight 12 checks pasan
- [ ] DB migrations probadas en staging
- [ ] Env vars sincronizadas con Coolify
- [ ] DNS configurado (si es dominio nuevo)
- [ ] Slack/Discord notif configurada para post-deploy
- [ ] Rollback plan claro (último tag estable)

## Post-deploy verification

```bash
# Smoke tests
curl -fsS https://mi-app.example.com/health
curl -fsS https://mi-app.example.com/api/version

# Check logs
ssh hetzner "docker logs --tail 100 mi-app-app-1"

# Check metrics
# Grafana / Sentry / Uptime Kuma
```

## Recursos

- `scripts/deploy/preflight-deploy.mjs` — script canónico
- `scripts/deploy/preflight-apply.sh` — versión bash legacy
- `.githooks/pre-commit` — auto-run en commit
- [iaWorkSpace AGENTS.md](../eddremonts86/iaWorkSpace/AGENTS.md) sección "Pre-deploy verification"