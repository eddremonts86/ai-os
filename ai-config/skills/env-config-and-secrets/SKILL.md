---
name: env-config-and-secrets
description: Gestión de configuración por entorno (.env, .env.example, varlock) + secrets type-safe. Patrón iaWorkSpace para evitar secrets hardcoded, sincronizar env vars con Coolify/Hetzner, y validar tipos en runtime.
license: Internal
---

# Env Config & Secrets

## Principios

1. **Nunca secrets en código.** `git grep -E "(api[_-]?key|token|password)\s*[:=]\s*['\"][a-zA-Z0-9]" --include="*.ts"` debería dar 0.
2. **`.env` real es gitignored.** `.env.example` con placeholders sí está committed.
3. **Frontend solo `VITE_*`** — lo demás es server-only.
4. **Type-safe en runtime** con varlock o zod schemas.
5. **Validar en startup** — fallar fast si falta env required.

## Estructura estándar

```
project/
├── .env                  # gitignored, real values
├── .env.example          # committed, placeholders + docs
├── .env.development      # gitignored, dev-specific (opcional)
├── .env.production       # gitignored, prod-specific (opcional)
├── .env.test             # gitignored, test fixtures
└── src/config/env.ts     # type-safe loader
```

## .env.example — el template

```bash
# .env.example — committed al repo

# ─── App ───
NODE_ENV=development
APP_PORT=3000
APP_URL=http://localhost:3000
LOG_LEVEL=info

# ─── Database ───
DATABASE_URL=postgresql://user:pass@localhost:5432/dbname
DATABASE_POOL_SIZE=10

# ─── Redis ───
REDIS_URL=redis://localhost:6379

# ─── Auth ───
JWT_SECRET=replace-with-random-32-chars-min
JWT_EXPIRES_IN=7d
SESSION_COOKIE_DOMAIN=localhost

# ─── External APIs ───
STRIPE_SECRET_KEY=sk_test_replace
STRIPE_WEBHOOK_SECRET=whsec_replace
SENDGRID_API_KEY=SG.replace
CLOUDINARY_API_KEY=replace
CLOUDINARY_API_SECRET=replace

# ─── Observability ───
SENTRY_DSN=https://replace@sentry.io/123
OTEL_EXPORTER_OTLP_ENDPOINT=http://localhost:4317

# ─── Feature flags ───
FEATURE_NEW_DASHBOARD=false
FEATURE_BETA_ACCESS=false
```

## Carga type-safe

### Opción 1: zod (simple, ubiquitous)

```ts
// src/config/env.ts
import { z } from 'zod';

const envSchema = z.object({
  NODE_ENV: z.enum(['development', 'test', 'production']).default('development'),
  APP_PORT: z.coerce.number().int().positive().default(3000),
  APP_URL: z.string().url(),
  DATABASE_URL: z.string().url(),
  REDIS_URL: z.string().url().optional(),
  JWT_SECRET: z.string().min(32, 'JWT_SECRET must be at least 32 chars'),
  STRIPE_SECRET_KEY: z.string().startsWith('sk_'),
  SENTRY_DSN: z.string().url().optional(),
  FEATURE_NEW_DASHBOARD: z.coerce.boolean().default(false),
});

export type Env = z.infer<typeof envSchema>;

function loadEnv(): Env {
  const parsed = envSchema.safeParse(process.env);
  if (!parsed.success) {
    console.error('❌ Invalid environment variables:');
    console.error(parsed.error.flatten().fieldErrors);
    process.exit(1);
  }
  return parsed.data;
}

export const env = loadEnv();
```

```ts
// src/server.ts
import { env } from './config/env';

app.listen(env.APP_PORT);
// env.STRIPE_SECRET_KEY is `string` (not `string | undefined` because required)
```

### Opción 2: varlock (más seguro, runtime injection)

```bash
# Install
pnpm add @varlock/secret-loader

# .env.schema (varlock format)
# @defaultServerSecret=false
DATABASE_URL=postgresql://user:pass@localhost:5432/dbname
JWT_SECRET=replace-with-random-32-chars-min # @type=secret, @minLength=32
STRIPE_SECRET_KEY=sk_test_xxx               # @type=secret
```

```ts
// src/config/env.ts
import '@varlock/secret-loader';  // enables runtime injection
import { env } from 'virtual:varlock';

export { env };
```

Varlock benefits:
- Schema validation antes de que el código corra.
- Encrypts secrets at rest.
- Auto-injects en build time.
- Detecta `.env` no commiteados.

## Sincronización con Coolify

```bash
# Subir .env a Coolify dashboard
node scripts/coolify/sync-env.mjs --app mi-app

# O via API directamente
curl -X POST https://coolify.example.com/api/v1/applications/<uuid>/envs \
  -H "Authorization: Bearer $COOLIFY_TOKEN" \
  -H "Content-Type: application/json" \
  -d "$(cat .env | jq -R -s 'split("\n") | map(select(length > 0) | split("=") | {(.[0]): .[1:] | join("=")}) | add')"
```

```javascript
// scripts/coolify/sync-env.mjs
#!/usr/bin/env node
import { readFileSync } from 'node:fs';
import { execSync } from 'node:child_process';

const APP = process.argv.find(a => a.startsWith('--app='))?.split('=')[1];
const ENV_FILE = process.argv.find(a => a.startsWith('--file='))?.split('=')[1] || '.env';

const COOLIFY_API = process.env.COOLIFY_API_URL;
const COOLIFY_TOKEN = process.env.COOLIFY_TOKEN;

// Get app UUID from Coolify
const apps = JSON.parse(execSync(`curl -fsS ${COOLIFY_API}/applications -H "Authorization: Bearer ${COOLIFY_TOKEN}"`));
const app = apps.find(a => a.name === APP);
if (!app) {
  console.error(`App ${APP} not found in Coolify`);
  process.exit(1);
}

// Parse .env
const envContent = readFileSync(ENV_FILE, 'utf-8');
const envVars = Object.fromEntries(
  envContent.split('\n')
    .filter(l => l && !l.startsWith('#'))
    .map(l => l.split('=').map(s => s.trim()))
);

// POST to Coolify
const response = await fetch(`${COOLIFY_API}/applications/${app.uuid}/envs`, {
  method: 'POST',
  headers: {
    'Authorization': `Bearer ${COOLIFY_TOKEN}`,
    'Content-Type': 'application/json',
  },
  body: JSON.stringify(envVars),
});

if (!response.ok) {
  console.error('Failed to sync env:', await response.text());
  process.exit(1);
}

console.log(`✓ Synced ${Object.keys(envVars).length} env vars to ${APP}`);
```

## Frontend (Vite)

```ts
// Acceder SOLO a VITE_* vars en client code
const apiUrl = import.meta.env.VITE_API_URL;
const isDev = import.meta.env.DEV;
const mode = import.meta.env.MODE;  // 'development' | 'production'

// Type-safety para custom vars
/// <reference types="vite/client" />

interface ImportMetaEnv {
  readonly VITE_API_URL: string;
  readonly VITE_SENTRY_DSN?: string;
  readonly VITE_FEATURE_NEW_DASHBOARD: string;  // Vite siempre las lee como string
}

interface ImportMeta {
  readonly env: ImportMetaEnv;
}

// Helper para booleanos
const isNewDashboardEnabled = import.meta.env.VITE_FEATURE_NEW_DASHBOARD === 'true';
```

`.env` para Vite:
```bash
VITE_API_URL=http://localhost:3000
VITE_SENTRY_DSN=
VITE_FEATURE_NEW_DASHBOARD=false
```

## Generación de secrets

```bash
# Random secrets
node -e "console.log(require('crypto').randomBytes(32).toString('base64url'))"
openssl rand -base64 32
openssl rand -hex 32

# UUID v4
node -e "console.log(crypto.randomUUID())"

# Password hash (bcrypt cost 12)
node -e "console.log(require('bcrypt').hashSync('mypassword', 12))"
```

## Rotation policy

| Secret type | Frecuencia | Cómo |
|---|---|---|
| `JWT_SECRET` | Cada 90 días (forzar logout all) | Manual via Coolify |
| `DATABASE_PASSWORD` | Cada 180 días | `ALTER USER ... WITH PASSWORD '...'` |
| API keys (Stripe, etc.) | Cada 365 días o ante breach | Dashboard del provider |
| `SESSION_COOKIE_SECRET` | Cada 180 días | Manual |
| SSH deploy keys | Cada 365 días | `ssh-keygen` + update |

## Secret storage best practices

1. **Production secrets:** Coolify dashboard (encrypted at rest).
2. **CI/CD secrets:** GitHub Actions secrets (encrypted, scoped).
3. **Local dev:** `.env` gitignored.
4. **Never:** Slack/Discord/email/Slack-channel.
5. **Audit:** `git log -p | grep -iE "secret|api[_-]?key|password"` antes de cada release.

## Detección de secrets en código

```bash
# gitleaks (recommended)
brew install gitleaks
gitleaks detect --source . --verbose

# trufflehog
pip install trufflehog
trufflehog filesystem .

# grep simple
grep -rE "(api[_-]?key|token|password|secret)\s*[:=]\s*['\"][a-zA-Z0-9_\-]{20,}" --include="*.ts" --include="*.js" --include="*.py" .

# Pre-commit hook
# .husky/pre-commit
! grep -rE "(api[_-]?key|token)\s*[:=]\s*['\"][a-zA-Z0-9_\-]{20,}" src/
```

## Errores comunes

1. ❌ Commit `.env` por error → rotar TODOS los secrets inmediatamente.
2. ❌ Hardcodear fallback `'dev-secret-key'` → usar `if (env.NODE_ENV === 'production') throw`.
3. ❌ `process.env.X!` (non-null assertion) → no-validates, falla en runtime tardío.
4. ❌ Secrets en logs (`logger.info('Connecting with', { password })`) → redact.
5. ❌ Frontend expone secret sin prefijo `VITE_` → Vite filtra automáticamente, pero cuidado.
6. ❌ `.env.example` con valores reales → usar placeholders (`replace-with-xxx`).
7. ❌ Sync manual de env a prod → automatizar con `sync-env.mjs`.
8. ❌ Rotar secret sin invalidar sesiones activas → force logout en auth.

## Checklist pre-deploy

- [ ] `.env.example` actualizado con TODAS las vars nuevas
- [ ] `.env` real NO en git (`git ls-files | grep -E "\.env$"` debe ser vacío)
- [ ] Secrets scan pasa (`gitleaks detect`)
- [ ] Type-safe loader funciona (`loadEnv()` exits 1 si falta required)
- [ ] Vars de prod sincronizadas con Coolify
- [ ] Vars de frontend solo `VITE_*`
- [ ] No secrets en logs (redact mode)
- [ ] Rotation policy documentada

## Recursos

- [Varlock](https://varlock.dev/)
- [zod](https://zod.dev/)
- [dotenv](https://github.com/motdotla/dotenv)
- [12-factor app config](https://12factor.net/config)