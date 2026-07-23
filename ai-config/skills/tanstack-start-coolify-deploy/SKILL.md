---
name: tanstack-start-coolify-deploy
description: Deploy TanStack Start apps (Vite plugin with SSR) to Coolify. Covers server.prod.mjs wrapper, multi-stage Dockerfile with target=prod, fqdn bug fix, isSsrBuild server-only imports. Applies to any TanStack Start app deployed to Coolify or any Docker host.
license: Internal
---

# TanStack Start → Coolify Deploy

## The problem

TanStack Start with the Vite plugin generates `dist/server/server.js` which is **ESM with a Web Fetch API handler**, NOT a traditional HTTP server:

```js
// dist/server/server.js (generated, do NOT edit)
export default {
  fetch(request: Request): Promise<Response> {
    return start.handler(request);
  },
};
```

Coolify (and most PaaS) expect a container that **binds a TCP port**. server.js exits with code 0 immediately if you run it directly → "container started but port not listening" → healthcheck fails → deploy fails.

## The solution: HTTP wrapper

Create `server.prod.mjs` that wraps the handler with an HTTP server:

```javascript
// server.prod.mjs (in repo root, committed)
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

## Multi-stage Dockerfile

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

RUN touch .env  # stub for tsx --env-file

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

## Server-only imports (CRITICAL)

**Problem:** The TanStack Start Vite plugin does NOT set `isSsrBuild` for imports from `@/shared/lib/db` when you do `import { db } from '@/shared/lib/db'`.

If `db.ts` (top-level) imports `pg` or `drizzle-orm/pg-core`, it ends up in the **client bundle** → `process is not defined` or `Cannot find module 'pg'` in the browser.

**Solution: explicit subpath**

```typescript
// ❌ BAD — ends up in client bundle
import { db } from '@/shared/lib/db';

// ✅ GOOD — server-only, bypasses the alias regex
import { db } from '@/shared/lib/db/index';

// ✅ BETTER — barrel with re-export
// @/shared/lib/db/index.ts
export { db, schema } from './server/db';
export type { Db } from './server/db';
```

Rule: any import that uses Node.js APIs (fs, pg, redis, child_process) **must** use an explicit subpath or barrel.

## Coolify setup

### 1. Create app via API

```bash
# Get project + server UUIDs
curl -fsS http://<server-ip>:8000/api/v1/projects \
  -H "Authorization: Bearer ${COOLIFY_TOKEN}" \
  | jq '.[] | {uuid, name}'

curl -fsS http://<server-ip>:8000/api/v1/servers \
  -H "Authorization: Bearer ${COOLIFY_TOKEN}" \
  | jq '.[] | {uuid, name}'

# Create Postgres DB
curl -X POST http://<server-ip>:8000/api/v1/databases/postgresql \
  -H "Authorization: Bearer ${COOLIFY_TOKEN}" \
  -H "Content-Type: application/json" \
  -d '{
    "server_uuid": "<server-uuid>",
    "project_uuid": "<project-uuid>",
    "environment_name": "production",
    "name": "my-app-db",
    "postgres_user": "my_app",
    "postgres_password": "<openssl rand -hex 16>",
    "postgres_db": "my_app"
  }'

# Create application
curl -X POST http://<server-ip>:8000/api/v1/applications/public \
  -H "Authorization: Bearer ${COOLIFY_TOKEN}" \
  -H "Content-Type: application/json" \
  -d '{
    "server_uuid": "<server-uuid>",
    "project_uuid": "<project-uuid>",
    "environment_name": "production",
    "git_repository": "https://github.com/user/my-app",
    "git_branch": "main",
    "build_pack": "dockerfile",
    "dockerfile_target_build": "prod",
    "fqdn": "https://my-app.example.com"
  }'
```

### 2. Sync env vars

```bash
node scripts/coolify/sync-env.mjs --app my-app
```

Critical env vars:

```bash
DATABASE_URL=postgresql://my_app:<password>@my-app-db:5432/my_app
BETTER_AUTH_URL=https://my-app.example.com
NODE_ENV=production
PORT=3000
```

### 3. Set post-deploy command

```bash
node scripts/coolify/set-post-deploy.mjs --app my-app \
  --command "pnpm db:migrate && (pnpm db:seed:admin || true)"
```

### 4. Trigger deploy

```bash
APP_UUID=<from-step-1>
curl -X POST "http://<server-ip>:8000/api/v1/deploy?uuid=${APP_UUID}" \
  -H "Authorization: Bearer ${COOLIFY_TOKEN}"
```

## Gotcha: `h-screen + overflow-y-auto` on the layout silently breaks the whole app

A common TanStack Start layout (especially for map pages) looks like:

```tsx
<div className="flex h-screen flex-col">
  <Header />
  <main className="flex-1 overflow-y-auto">  {/* ← the trap */}
    <Outlet />
  </main>
</div>
```

This works for the page that needs it (a split-view / map page where the
left list scrolls inside a fixed-height container). **It silently breaks
every other route** that uses the same layout:

- `h-screen` on the outer div = body height is capped at viewport height,
  so the document is never taller than the screen. The browser shows no
  scrollbar, but there's also no place for the page to overflow into.
- `overflow-y-auto` on `<main>` = scrolling is trapped inside an
  invisible pane. Users on desktop can sometimes still scroll with a
  trackpad or middle-click, but mobile users see the page as
  "completely frozen after the first viewport."
- `framer-motion`'s `whileInView` uses `IntersectionObserver`, which is
  tied to the scroll container. With the trap in place, the observer
  never sees the elements enter the viewport → animations don't fire,
  sections render but stay invisible, the home page looks blank below
  the fold.

**The fix**: only apply the split-view shell to routes that actually need
it. In a `_public` layout, detect the path and switch the wrapper:

```tsx
import { useRouterState } from '@tanstack/react-router'

const SPLIT_VIEW_ROUTES = ['/explore', '/admin/map']

export const Route = createFileRoute('/_public')({
  component: PublicLayoutWrapper,
})

function PublicLayoutWrapper() {
  const pathname = useRouterState({ select: (s) => s.location.pathname })
  const isSplitView = SPLIT_VIEW_ROUTES.some((p) => pathname.startsWith(p))

  if (isSplitView) {
    return (
      <div className="flex h-screen flex-col">
        <Header />
        <main className="flex-1 overflow-y-auto">
          <Outlet />
        </main>
      </div>
    )
  }

  return (
    <div className="flex min-h-screen flex-col">
      <Header />
      <main className="flex-1">
        <Outlet />
      </main>
    </div>
  )
}
```

The non-split-view branch uses `min-h-screen` (lets the page grow taller
than the viewport) and no `overflow-y-auto` on `<main>` (the browser's
window handles scrolling). `framer-motion`'s `whileInView` and any
sticky-header tricks work as expected.

Rule: `h-screen` is a code smell in app layout code. Use it only when
the page is genuinely a viewport-sized tool (a fullscreen editor, a
KYC flow, an embedded terminal). For everything else, `min-h-screen`.

## Gotcha: TanStack Start server-fn responses are NOT plain JSON

Server functions (`createServerFn`, `createServerOnlyFn`, `useServerFn`)
serialize their return values with **devalue** (a cycle-preserving
serializer), not plain JSON. The wire format you see in `network` is:

```json
{ "t": 9, "p": { "k": ["id", "title", "lat"], "v": [123, "Foo", 55.6] } }
```

The shape is `{"t": <type>, "p": <payload>}` where:
- `t: 0` → number
- `t: 1` → string
- `t: 9` → array (with `k` = keys/headers and `v` = values, by index)
- `t: 10` → object
- `t: 5` → null
- (full list: https://github.com/Rich-Harris/devalue)

If you `JSON.parse` the raw response and try to read `.id` you get
`undefined`. The framework un-serializes it transparently when you
call the server function from a React component via `useServerFn`, but
**anything that hits the API directly** (debugging with `curl`,
test fixtures, third-party tooling) needs a recursive `unwrap`:

```ts
// lib/unwrap-devalue.ts
import { parse } from 'devalue'

export function unwrap<T = unknown>(raw: unknown): T {
  // dev's parse() expects the {t,p} shape; if it's already a plain value,
  // just return it
  if (raw && typeof raw === 'object' && 't' in (raw as any) && 'p' in (raw as any)) {
    return parse(JSON.stringify(raw)) as T
  }
  return raw as T
}
```

Three things to do when debugging a TanStack Start API:
1. **Don't trust the raw `Response.json()` body** — it's devalue, not JSON.
2. **Use `useServerFn` from `@tanstack/react-start`** in your client code;
   it handles the unwrap.
3. **For tests**, prefer `@tanstack/react-start/server-testing`'s
   `createServerFn` mock over hitting the actual HTTP endpoint.

## Gotcha: route loaders (createFileRoute loader) can return server-only data

If a route has a `loader` defined on the server, you can return DB rows
directly and TanStack Start will devalue-serialize them to the client.
This is fine for "data needed before first render" (SEO + initial
paint), but be careful with two things:

1. **Never return secrets, raw passwords, or tokens** — they end up in
   the HTML payload on first render. Strip sensitive fields server-side
   before returning.
2. **Large arrays** (> 100 items) are fine but each one gets devalue'd
   by reference. If you have 25k listings, paginate — return the first
   50 in the loader and load more via a server function as the user
   scrolls.

## fqdn bug fix (Coolify caching Traefik labels)

**Symptom:** you change `fqdn` in the app dashboard but Traefik still routes to the old container.

**Cause:** Coolify caches Traefik labels in `custom_labels` (JSON in the DB). Changing fqdn in the UI does not update `custom_labels`.

**Solution:**

```bash
# SSH into Coolify server
ssh root@<server-ip>

# List apps with custom_labels
docker exec coolify php artisan tinker --execute='foreach (App\Models\Application::all() as $a) { echo $a->name . ": " . json_encode($a->custom_labels) . "\n"; }'

# Clear custom_labels for a specific app
docker exec coolify php artisan tinker --execute='
$a = App\Models\Application::where("name", "my-app")->first();
$a->custom_labels = null;
$a->save();
echo "Cleared\n";
'

# Redeploy (this regenerates Traefik labels correctly)
curl -X POST "http://<server-ip>:8000/api/v1/deploy?uuid=${APP_UUID}" \
  -H "Authorization: Bearer ${COOLIFY_TOKEN}"
```

Alternative: delete the app and recreate it with the correct fqdn.

## Token generation (if createToken fails)

**Symptom:** `POST /api/v1/tokens` returns 500 with "team_id cannot be null".

**Solution:** insert directly via tinker:

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

Format: `<user_id>|<plain_token>` (not just `<plain_token>`).

## DNS + port setup

```bash
# Wildcard DNS
*.example.com  A  <server-ip>
@              A  <server-ip>     # apex domain

# Port 8000 (Coolify UI/API) open in firewall
sudo ufw allow 8000/tcp
```

Coolify uses:

- `:80` (HTTP → redirect)
- `:443` (HTTPS)
- `:8000` (dashboard + API)

## Post-deploy verification

```bash
# 1. Health
curl -fsS https://my-app.example.com/api/health
# → {"status":"ok"}

# 2. Logs
ssh root@<server-ip> "docker logs --tail 100 my-app-app-1"

# 3. Container status
ssh root@<server-ip> "docker ps | grep my-app"

# 4. Traefik labels correct
ssh root@<server-ip> "docker inspect my-app-app-1 | jq '.[0].Config.Labels' | grep traefik"

# 5. DB migrations applied
docker exec my-app-app-1 pnpm db:migrate:status
```

## Common errors

1. ❌ Running `dist/server/server.js` directly → exits immediately, port not listening → use the `server.prod.mjs` wrapper.
2. ❌ Server-only imports without subpath → `process is not defined` in browser.
3. ❌ `isSsrBuild` flag not set by Vite plugin → client bundle includes server code.
4. ❌ `dockerfile_target_build` not specified in Coolify → build uses the last stage (= may not be the right one).
5. ❌ `fqdn` with `http://` instead of `https://` → Let's Encrypt cert fails.
6. ❌ DNS not propagated → cert issuance timeout.
7. ❌ Stale `custom_labels` in Coolify → Traefik doesn't update.
8. ❌ Non-idempotent post-deploy command → second deploy breaks DB.
9. ❌ `BETTER_AUTH_URL` pointing to localhost → cookies not set on prod domain.
10. ❌ Port 8000 closed in firewall → dashboard/API inaccessible.
11. ❌ Layout uses `h-screen` + `overflow-y-auto` on `<main>` for ALL routes → non-split-view pages (home, about, sign-in) silently lose their scroll, `framer-motion` `whileInView` never fires, animations broken, mobile users see a frozen page. Only apply the split-view shell to routes that need it (e.g. `/explore`).
12. ❌ Trying to read a server-fn response as plain JSON (`response.json()`) → it's devalue-encoded (`{t:9, p:{k,v}}`), you get back garbage. Use `useServerFn` in React or `parse()` from `devalue` in tests / debugging.
13. ❌ Returning 25k rows from a route loader "for SEO" → ships them all in the initial HTML payload. Paginate the loader, stream the rest.
14. ❌ Returning a `user.passwordHash` (or any secret) from a route loader → it ends up in the rendered HTML on first paint. Strip sensitive fields server-side before returning.

## Resources

- [TanStack Start docs](https://tanstack.com/start)
- [Coolify API](https://coolify.io/docs/api)
- [Coolify fqdn bug discussion](https://github.com/coollabsio/coolify/issues)
- Related skill: `coolify-deploy` (overview)
- Related skill: `pnpm-docker-deploy` (lockfile + build scripts)
- Related skill: `prod-deploy-verification` (pre-flight checks)