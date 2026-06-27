---
name: tanstack-start-coolify-deploy
description: Deploy de apps TanStack Start (Vite plugin con SSR) a Coolify. Cubre wrapper server.prod.mjs, Dockerfile multi-stage con target=prod, fqdn bug fix, isSsrBuild server-only imports. Aplica a cualquier app TanStack Start que se deploye a Coolify o cualquier Docker host.
license: Internal
---

# TanStack Start → Coolify Deploy

## El problema

TanStack Start con Vite plugin genera `dist/server/server.js` que es **ESM con Web Fetch API handler**, NO un server HTTP tradicional:

```js
// dist/server/server.js (generado, NO editar)
export default {
  fetch(request: Request): Promise<Response> {
    return start.handler(request);
  },
};
```

Coolify (y la mayoría de PaaS) esperan un container que **binde un puerto TCP**. El server.js sale con exit 0 inmediato si lo corrés directo → "container started but port not listening" → healthcheck fails → deploy fails.

## La solución: wrapper HTTP

Crear `server.prod.mjs` que envuelve el handler con un HTTP server:

```javascript
// server.prod.mjs (en repo root, commited)
import { createServer } from 'node:http';
import { createReadStream, statSync } from 'node:fs';
import { extname, join, normalize } from 'node:path';
import handler from './dist/server/server.js';

const PORT = process.env.PORT || 3000;
const HOST = process.env.HOST || '0.0.0.0';
const STATIC_DIR = './dist/client';

// MIME map
const MIME = {
  '.html': 'text/html; charset=utf-8',
  '.js':   'application/javascript; charset=utf-8',
  '.mjs':  'application/javascript; charset=utf-8',
  '.css':  'text/css; charset=utf-8',
  '.json': 'application/json; charset=utf-8',
  '.svg':  'image/svg+xml',
  '.png':  'image/png',
  '.jpg':  'image/jpeg',
  '.jpeg': 'image/jpeg',
  '.gif':  'image/gif',
  '.webp': 'image/webp',
  '.ico':  'image/x-icon',
  '.woff': 'font/woff',
  '.woff2':'font/woff2',
  '.ttf':  'font/ttf',
  '.txt':  'text/plain; charset=utf-8',
};

function serveStatic(req, res) {
  const url = new URL(req.url, `http://${req.headers.host}`);
  let pathname = decodeURIComponent(url.pathname);
  
  // Prevent path traversal
  const safePath = normalize(pathname).replace(/^(\.\.[\/\\])+/, '');
  const filePath = join(STATIC_DIR, safePath);
  
  try {
    const stat = statSync(filePath);
    if (stat.isFile()) {
      const mime = MIME[extname(filePath)] || 'application/octet-stream';
      const isHashed = /\.[a-f0-9]{8,}\./.test(filePath);
      res.setHeader('Content-Type', mime);
      res.setHeader('Cache-Control', isHashed 
        ? 'public, max-age=31536000, immutable' 
        : 'public, max-age=3600');
      createReadStream(filePath).pipe(res);
      return true;
    }
  } catch {}
  return false;
}

const server = createServer(async (req, res) => {
  try {
    // Try static first
    if (req.method === 'GET' && serveStatic(req, res)) return;
    
    // Fall through to TanStack Start handler
    const protocol = req.headers['x-forwarded-proto'] || 'http';
    const host = req.headers['x-forwarded-host'] || req.headers.host;
    const url = `${protocol}://${host}${req.url}`;
    
    // Convert Node req to Web Fetch Request
    const chunks = [];
    for await (const chunk of req) chunks.push(chunk);
    const body = chunks.length ? Buffer.concat(chunks) : undefined;
    
    const headers = new Headers();
    for (const [k, v] of Object.entries(req.headers)) {
      if (Array.isArray(v)) v.forEach(x => headers.append(k, x));
      else if (v) headers.set(k, v);
    }
    
    const request = new Request(url, {
      method: req.method,
      headers,
      body: body && req.method !== 'GET' && req.method !== 'HEAD' ? body : undefined,
      duplex: 'half',
    });
    
    const response = await handler.fetch(request);
    
    res.statusCode = response.status;
    response.headers.forEach((v, k) => res.setHeader(k, v));
    
    if (response.body) {
      const reader = response.body.getReader();
      while (true) {
        const { done, value } = await reader.read();
        if (done) break;
        res.write(value);
      }
    }
    res.end();
  } catch (err) {
    console.error(err);
    res.statusCode = 500;
    res.end('Internal Server Error');
  }
});

server.listen(PORT, HOST, () => {
  console.log(`✓ Server listening on http://${HOST}:${PORT}`);
});

// Graceful shutdown
process.on('SIGTERM', () => server.close(() => process.exit(0)));
process.on('SIGINT', () => server.close(() => process.exit(0)));
```

## Dockerfile multi-stage

```dockerfile
# ─── BASE: install deps ───
FROM node:22-bookworm-slim AS base
WORKDIR /app
RUN corepack enable
COPY package.json pnpm-lock.yaml pnpm-workspace.yaml .npmrc ./
RUN pnpm install --frozen-lockfile

# ─── BUILDER: build app ───
FROM base AS builder
WORKDIR /app
COPY tsconfig.json ./
COPY app ./app
COPY src ./src
COPY public ./public
COPY server.prod.mjs ./
COPY drizzle ./drizzle
COPY drizzle.config.ts ./
COPY scripts ./scripts

ENV NODE_ENV=production
RUN pnpm build

# ─── PROD: runtime + server.prod.mjs ───
FROM node:22-bookworm-slim AS prod
WORKDIR /app

RUN corepack enable
COPY package.json pnpm-lock.yaml ./
COPY --from=base /app/node_modules ./node_modules
RUN pnpm prune --prod

COPY --from=builder /app/dist ./dist
COPY --from=builder /app/server.prod.mjs ./server.prod.mjs
COPY --from=builder /app/drizzle ./drizzle
COPY --from=builder /app/drizzle.config.ts ./drizzle.config.ts
COPY --from=builder /app/scripts ./scripts

RUN touch .env  # stub para tsx --env-file

ENV NODE_ENV=production
ENV PORT=3000
ENV HOST=0.0.0.0

EXPOSE 3000
HEALTHCHECK --interval=30s --timeout=10s --retries=3 \
  CMD node -e "fetch('http://localhost:3000/api/health').then(r=>process.exit(r.ok?0:1))"

CMD ["node", "server.prod.mjs"]
```

## package.json scripts

```json
{
  "scripts": {
    "dev": "vinxi dev",
    "build": "vinxi build",
    "start": "vinxi start",
    "serve:prod": "node server.prod.mjs",
    "docker:build": "docker build --target prod -t <name> .",
    "docker:run": "docker run --rm -p 3000:3000 --env-file .env <name>",
    "coolify:deploy": "node scripts/coolify/sync-env.mjs && curl -X POST ..."
  }
}
```

## Server-only imports (CRÍTICO)

**Problema:** TanStack Start Vite plugin NO setea `isSsrBuild` para imports de `@/shared/lib/db` cuando se hace `import { db } from '@/shared/lib/db'`.

Si `db.ts` (top-level) importa `pg` o `drizzle-orm/pg-core`, se mete en el **client bundle** → `process is not defined` o `Cannot find module 'pg'` en el browser.

**Solución: subpath explícito**

```typescript
// ❌ MAL — se mete en client bundle
import { db } from '@/shared/lib/db';

// ✅ BIEN — server-only, bypassea el alias regex
import { db } from '@/shared/lib/db/index';

// ✅ MEJOR — barrel con re-export
// @/shared/lib/db/index.ts
export { db, schema } from './server/db';
export type { Db } from './server/db';
```

Regla: cualquier import que use Node.js APIs (fs, pg, redis, child_process) **debe** usar subpath explícito o barrel.

## Coolify setup

### 1. Crear app via API

```bash
# Get project + server UUIDs
curl -fsS http://<server-ip>:8000/api/v1/projects \
  -H "Authorization: Bearer ${COOLIFY_API_TOKEN}" \
  | jq '.[] | {uuid, name}'

curl -fsS http://<server-ip>:8000/api/v1/servers \
  -H "Authorization: Bearer ${COOLIFY_API_TOKEN}" \
  | jq '.[] | {uuid, name}'

# Create Postgres DB
curl -X POST http://<server-ip>:8000/api/v1/databases/postgresql \
  -H "Authorization: Bearer ${COOLIFY_API_TOKEN}" \
  -H "Content-Type: application/json" \
  -d '{
    "server_uuid": "<server-uuid>",
    "project_uuid": "<project-uuid>",
    "environment_name": "production",
    "name": "mi-app-db",
    "postgres_user": "mi_app",
    "postgres_password": "<openssl rand -hex 16>",
    "postgres_db": "mi_app"
  }'

# Create application
curl -X POST http://<server-ip>:8000/api/v1/applications/public \
  -H "Authorization: Bearer ${COOLIFY_API_TOKEN}" \
  -H "Content-Type: application/json" \
  -d '{
    "server_uuid": "<server-uuid>",
    "project_uuid": "<project-uuid>",
    "environment_name": "production",
    "git_repository": "https://github.com/user/mi-app",
    "git_branch": "main",
    "build_pack": "dockerfile",
    "dockerfile_target_build": "prod",
    "fqdn": "https://mi-app.example.com"
  }'
```

### 2. Sync env vars

```bash
node scripts/coolify/sync-env.mjs --app mi-app
```

Env vars críticas:
```bash
DATABASE_URL=postgresql://mi_app:***@mi-app-db:5432/mi_app
BETTER_AUTH_URL=https://mi-app.example.com
NODE_ENV=production
PORT=3000
```

### 3. Set post-deploy command

```bash
node scripts/coolify/set-post-deploy.mjs --app mi-app \
  --command "pnpm db:migrate && (pnpm db:seed:admin || true)"
```

### 4. Trigger deploy

```bash
APP_UUID=<from-step-1>
curl -X POST "http://<server-ip>:8000/api/v1/deploy?uuid=${APP_UUID}" \
  -H "Authorization: Bearer ${COOLIFY_API_TOKEN}"
```

## fqdn bug fix (Coolify caching Traefik labels)

**Síntoma:** cambias `fqdn` en el dashboard de la app pero Traefik sigue resolviendo al container viejo.

**Causa:** Coolify cachea los Traefik labels en `custom_labels` (JSON en la DB). Cambiar fqdn en UI no actualiza custom_labels.

**Solución:**

```bash
# SSH al server Coolify
ssh root@<server-ip>

# Listar apps con custom_labels
docker exec coolify php artisan tinker --execute='foreach (App\Models\Application::all() as $a) { echo $a->name . ": " . json_encode($a->custom_labels) . "\n"; }'

# Limpiar custom_labels de una app específica
docker exec coolify php artisan tinker --execute='
$a = App\Models\Application::where("name", "mi-app")->first();
$a->custom_labels = null;
$a->save();
echo "Cleared\n";
'

# Redeploy (esto regenera Traefik labels correctamente)
curl -X POST "http://<server-ip>:8000/api/v1/deploy?uuid=${APP_UUID}" \
  -H "Authorization: Bearer ${COOLIFY_API_TOKEN}"
```

Alternativa: borrar la app y crearla de nuevo con el fqdn correcto.

## Token generation (si createToken falla)

**Síntoma:** `POST /api/v1/tokens` devuelve 500 con "team_id cannot be null".

**Solución:** insertar directo via tinker:

```bash
docker exec coolify php artisan tinker --execute='
$user = App\Models\User::first();
$token = Str::random(40);
$hashedToken = hash("sha256", $token);
DB::table("personal_access_tokens")->insert([
  "tokenable_type" => "App\\Models\\User",
  "tokenable_id" => $user->id,
  "name" => "deploy-bot",
  "token" => $hashedToken,
  "abilities" => json_encode(["*"]),
  "created_at" => now(),
  "updated_at" => now(),
]);
echo "Token: <user_id>|<token>\n";
'
```

Formato: `<user_id>|<plain_token>` (no solo `<plain_token>`).

## DNS + port setup

```bash
# DNS wildcard
*.example.com  A  <server-ip>
@              A  <server-ip>     # apex domain

# Port 8000 (Coolify UI/API) abierto en firewall
sudo ufw allow 8000/tcp
```

Coolify ocupa:
- `:80` (HTTP → redirect)
- `:443` (HTTPS)
- `:8000` (dashboard + API)

## Verificación post-deploy

```bash
# 1. Health
curl -fsS https://mi-app.example.com/api/health
# → {"status":"ok"}

# 2. Logs
ssh root@<server-ip> "docker logs --tail 100 mi-app-app-1"

# 3. Container status
ssh root@<server-ip> "docker ps | grep mi-app"

# 4. Traefik labels correctos
ssh root@<server-ip> "docker inspect mi-app-app-1 | jq '.[0].Config.Labels' | grep traefik"

# 5. DB migrations aplicadas
docker exec mi-app-app-1 pnpm db:migrate:status
```

## Errores comunes

1. ❌ `dist/server/server.js` se ejecuta directo → exit 0 inmediato, port no listening → usar `server.prod.mjs` wrapper.
2. ❌ Server-only imports sin subpath → `process is not defined` en browser.
3. ❌ `isSsrBuild` flag no seteado por Vite plugin → bundle client incluye server code.
4. ❌ `dockerfile_target_build` no especificado en Coolify → build usa último stage (= puede no ser el correcto).
5. ❌ `fqdn` con http:// en vez de https:// → cert Let's Encrypt falla.
6. ❌ DNS no propagado → cert issuance timeout.
7. ❌ Custom_labels stale en Coolify → Traefik no actualiza.
8. ❌ Post-deploy command no idempotente → segundo deploy rompe DB.
9. ❌ `BETTER_AUTH_URL` apunta a localhost → cookies no se setean en prod domain.
10. ❌ Port 8000 cerrado en firewall → dashboard/API inaccesible.

## Recursos

- [TanStack Start docs](https://tanstack.com/start)
- [Coolify API](https://coolify.io/docs/api)
- [Coolify fqdn bug discussion](https://github.com/coollabsio/coolify/issues)
- Skill relacionada: `coolify-deploy` (overview)
- Skill relacionada: `pnpm-docker-deploy` (lockfile + builds scripts)
- Skill relacionada: `prod-deploy-verification` (pre-flight checks)