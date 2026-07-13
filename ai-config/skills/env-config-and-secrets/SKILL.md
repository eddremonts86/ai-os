---
name: env-config-and-secrets
description: Per-environment configuration management (.env, .env.example, varlock) + type-safe secrets. iaWorkSpace pattern for avoiding hardcoded secrets, syncing env vars with Coolify/Hetzner, and validating types at runtime.
license: Internal
---

# Env Config & Secrets

## Principles

1. **Never secrets in code.** `git grep -E "(api[_-]?key|token|password)\s*[:=]\s*['\"][a-zA-Z0-9]" --include="*.ts"` should return 0.
2. **Real `.env` is gitignored.** `.env.example` with placeholders is committed.
3. **Frontend only `VITE_*`** — everything else is server-only.
4. **Type-safe at runtime** with varlock or zod schemas.
5. **Validate at startup** — fail fast if a required env var is missing.

## Standard structure

```
project/
├── .env                  # gitignored, real values
├── .env.example          # committed, placeholders + docs
├── .env.development      # gitignored, dev-specific (optional)
├── .env.production       # gitignored, prod-specific (optional)
├── .env.test             # gitignored, test fixtures
└── src/config/env.ts     # type-safe loader
```

## .env.example — the template

```bash
# .env.example — committed to repo

# ─── App ───
NODE_ENV=development
APP_PORT=3000
APP_URL=http://localhost:3000
LOG_LEVEL=info

# ─── Database ───
DATABASE_URL=postgresql://user:***@localhost:5432/dbname
DATABASE_POOL_SIZE=10

# ─── Redis ───
REDIS_URL=redis://localhost:6379

# ─── Auth ───
JWT_SECRET=replace-with-random-32-chars-min
SESSION_COOKIE_SECRET=replace-with-random-32-chars-min

# ─── External APIs ───
STRIPE_SECRET_KEY=sk_test_xxx
STRIPE_WEBHOOK_SECRET=whsec_xxx
SENDGRID_API_KEY=SG.xxx
OPENAI_API_KEY=sk-xxx

# ─── OAuth ───
GOOGLE_CLIENT_ID=
GOOGLE_CLIENT_SECRET=
GITHUB_CLIENT_ID=
GITHUB_CLIENT_SECRET=

# ─── Monitoring ───
SENTRY_DSN=https://***@sentry.io/123
OTEL_EXPORTER_OTLP_ENDPOINT=http://localhost:4317

# ─── Feature flags ───
FEATURE_NEW_DASHBOARD=false
FEATURE_BETA_ACCESS=false
```

## Type-safe loading

### Option 1: zod (simple, ubiquitous)

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

### Option 2: varlock (more secure, runtime injection)

```bash
# Install
pnpm add @varlock/secret-loader

# .env.schema (varlock format)
# @defaultServerSecret=false
DATABASE_URL=postgresql://user:***@localhost:5432/dbname
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

- Schema validation before code runs.
- Encrypts secrets at rest.
- Auto-injects at build time.
- Detects uncommitted `.env`.

## Syncing with Coolify

```bash
# Upload .env to Coolify dashboard
node scripts/coolify/sync-env.mjs --app my-app

# Or via API directly
curl -X POST https://coolify.example.com/api/v1/applications/<uuid>/envs \
  -H "Authorization: Bearer *** \
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
const apps = JSON.parse(execSync(`curl -fsS ${COOLIFY_API}/applications -H "Authorization: Bearer ${COOL...`));
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
// Access ONLY VITE_* vars in client code
const apiUrl = import.meta.env.VITE_API_URL;
const isDev = import.meta.env.DEV;
const mode = import.meta.env.MODE;  // 'development' | 'production'

// Type-safety for custom vars
/// <reference types="vite/client" />

interface ImportMetaEnv {
  readonly VITE_API_URL: string;
  readonly VITE_SENTRY_DSN?: string;
  readonly VITE_FEATURE_NEW_DASHBOARD: string;  // Vite always reads them as string
}

interface ImportMeta {
  readonly env: ImportMetaEnv;
}

// Helper for booleans
const isNewDashboardEnabled = import.meta.env.VITE_FEATURE_NEW_DASHBOARD === 'true';
```

`.env` for Vite:

```bash
VITE_API_URL=http://localhost:3000
VITE_SENTRY_DSN=
VITE_FEATURE_NEW_DASHBOARD=false
```

## Secrets generation

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

| Secret type | Frequency | How |
|---|---|---|
| `JWT_SECRET` | Every 90 days (force logout all) | Manual via Coolify |
| `DATABASE_PASSWORD` | Every 180 days | `ALTER USER ... WITH PASSWORD '...'` |
| API keys (Stripe, etc.) | Every 365 days or on breach | Provider dashboard |
| `SESSION_COOKIE_SECRET` | Every 180 days | Manual |
| SSH deploy keys | Every 365 days | `ssh-keygen` + update |

## Secret storage best practices

1. **Production secrets:** Coolify dashboard (encrypted at rest).
2. **CI/CD secrets:** GitHub Actions secrets (encrypted, scoped).
3. **Local dev:** `.env` gitignored.
4. **Never:** Slack/Discord/email/Slack-channel.
5. **Audit:** `git log -p | grep -iE "secret|api[_-]?key|password"` before each release.

## Secrets detection in code

```bash
# gitleaks (recommended)
brew install gitleaks
gitleaks detect --source . --verbose

# trufflehog
pip install trufflehog
trufflehog filesystem .

# Simple grep
grep -rE "(api[_-]?key|token|password|secret)\s*[:=]\s*['\"][a-zA-Z0-9_\-]{20,}" --include="*.ts" --include="*.js" --include="*.py" .

# Pre-commit hook
# .husky/pre-commit
! grep -rE "(api[_-]?key|token)\s*[:=]\s*['\"][a-zA-Z0-9_\-]{20,}" src/
```

## Common errors

1. ❌ Committing `.env` by mistake → rotate ALL secrets immediately.
2. ❌ Hardcoding fallback `'dev-secret-key'` → use `if (env.NODE_ENV === 'production') throw`.
3. ❌ `process.env.X!` (non-null assertion) → no validation, fails late at runtime.
4. ❌ Secrets in logs (`logger.info('Connecting with', { password })`) → redact.
5. ❌ Frontend exposing secret without `VITE_` prefix → Vite filters automatically, but be careful.
6. ❌ `.env.example` with real values → use placeholders (`replace-with-xxx`).
7. ❌ Manual env sync to prod → automate with `sync-env.mjs`.
8. ❌ Rotating a secret without invalidating active sessions → force logout on auth.

## Pre-deploy checklist

- [ ] `.env.example` updated with ALL new vars
- [ ] Real `.env` NOT in git (`git ls-files | grep -E "\.env$"` should be empty)
- [ ] Secrets scan passes (`gitleaks detect`)
- [ ] Type-safe loader works (`loadEnv()` exits 1 if a required var is missing)
- [ ] Prod vars synced with Coolify
- [ ] Frontend vars only `VITE_*`
- [ ] No secrets in logs (redact mode)
- [ ] Rotation policy documented

## AI-OS canonical local env (source of truth)

Inside the AI-OS workspace, the merged local environment lives at
**`$AI_OS_ROOT/dev-env/env-config/.env`** (default root `~/Projects/ai-os`). It
unifies the env vars of every project (App, Database, Auth, Admin, LLM cloud/local,
RAG, Agents, Hermes, Infra, GitHub, Monitoring, tokens).

- When a task needs a value (DB URL, API key, port, LLM base URL, service token),
  read this file first — do not invent, hardcode, or ask for a value already present.
- Committed placeholder template: `$AI_OS_ROOT/dev-env/env-config/.env.example`.
- The real `.env` is gitignored and holds live secrets: use values in place; never
  echo, print, log, or commit them. See `rules/never_do.md` and `rules/always_do.md`.

## Resources

- [Varlock](https://varlock.dev/)
- [zod](https://zod.dev/)
- [dotenv](https://github.com/motdotla/dotenv)
- [12-factor app config](https://12factor.net/config)