---
name: coolify-deploy
description: Deploy apps to Coolify (self-hosted PaaS) — multi-service compose, env sync, post-deploy hooks, health checks, and the DEFAULT push-to-deploy setup (a GitHub Actions workflow that triggers Coolify via API). Applies to deploying any docker-compose app to a VPS managed by Coolify.
license: Internal
---

# Coolify Deploy

Coolify is a self-hosted PaaS (alternative to Vercel/Heroku) that runs on your VPS. Supports Docker compose, automatic HTTPS via Traefik, DBs (Postgres/Redis/MySQL), and deploys from Git.

## Architecture

```
Coolify Dashboard (web UI)
   ↓ provisions
Docker Compose stacks at /data/coolify/
   ↓ exposed via
Traefik (reverse proxy + Let's Encrypt)
   ↓ resolves to
<app>.<domain>.com
```

## Initial setup

```bash
# Install Coolify on Hetzner VPS
# (done once via SSH to the server)
curl -fsSL https://cdn.coollabs.io/coolify/install.sh | bash

# Access dashboard
# https://<server-ip>:8000  (change password on first login)
```

## Always verify in a real browser after deploying

**A 200 from `curl` on the homepage does NOT mean the app works.** Static
pages and health checks can pass while the app is completely unusable —
e.g. a stale build-time env var (see the `VITE_*`/build-arg gotcha below)
can leave login permanently broken while the landing page renders fine and
`/api/health` returns `{ok:true}`. After every deploy (new app, recreated
app, or an env/domain change that could affect a build), before reporting
success:

1. Open the live domain in a real browser (Claude Browser / Claude in
   Chrome), not just `curl` — confirm the landing page actually renders
   (no blank page, no console errors).
2. Go through the actual login flow with real credentials (the seeded admin,
   or whatever the app's default account is) and confirm it lands on an
   authenticated page — don't stop at "the form submitted without a visible
   error," check the network request actually completed and the resulting
   page is the real post-login state.
3. If login fails, check `read_console_messages` and
   `read_network_requests` in the browser tooling before diving into server
   logs — client-side failures (wrong `baseURL` baked into a bundle, CORS
   from a stale domain) often never reach the server at all, so server logs
   will look clean while the browser side is broken.

Treat this as non-optional for any Coolify deploy — API/curl checks alone
have repeatedly missed real breakage that a two-minute browser pass catches
immediately.

### Gotcha: build-time (`VITE_*`) env vars need a rebuild, not just an env update

Vite bakes `import.meta.env.VITE_*` values into the static JS bundle at
**build time**. Updating the var in Coolify's env panel changes what's
available to a *future* build — it does nothing to containers already
running from an older image. Two consequences:

1. After fixing a `VITE_*` var, you must trigger a new deploy (which
   rebuilds the image) — restarting the existing container is not enough.
2. When recreating an app (see "Deploying from a private repository" below)
   and copying env vars from the old app via a script or a saved API
   response, **re-fetch current values right before copying** — a cached
   snapshot taken before a fix was applied will silently carry the stale
   value into the new app, and it'll only surface once you actually test
   the feature that depends on it (e.g. login), not from the deploy log or
   a health check.

To confirm a specific value actually made it into a running build, fetch the
built JS directly instead of trusting the Coolify env panel:
```bash
curl -sk https://your-domain/assets/client-<hash>.js | grep -o "baseURL:[^,}]*"
```

## Deploying a new app

### 1. Expected repo structure

```
my-app/
├── docker-compose.yml          # services to deploy
├── Dockerfile                  # if you need custom build
├── .env.example                # placeholders
├── .env                        # gitignored, real values
└── coolify/                    # optional, app-specific config
    └── post-deploy.sh
```

### 2. Coolify-compatible `docker-compose.yml`

```yaml
# Images can come from a registry or local build
services:
  app:
    build:
      context: .
      dockerfile: Dockerfile
    image: my-app:latest
    restart: unless-stopped
    environment:
      - NODE_ENV=production
      - DATABASE_URL=${POSTGRES_URL}     # refs to secrets
      - REDIS_URL=${REDIS_URL}
    depends_on:
      - postgres
    labels:
      - "traefik.enable=true"
      - "traefik.http.routers.app.rule=Host(`my-app.example.com`)"
      - "traefik.http.routers.app.entrypoints=websecure"
      - "traefik.http.routers.app.tls.certresolver=letsencrypt"
      - "traefik.http.services.app.loadbalancer.server.port=3000"

  postgres:
    image: postgres:16-alpine
    restart: unless-stopped
    environment:
      - POSTGRES_DB=${POSTGRES_DB}
      - POSTGRES_USER=${POSTGRES_USER}
      - POSTGRES_PASSWORD=${POSTGRES_PASSWORD}
    volumes:
      - postgres_data:/var/lib/postgresql/data
    labels:
      - "traefik.enable=false"           # NOT exposed publicly

volumes:
  postgres_data:
```

**Rules:**

- `restart: unless-stopped` always.
- Traefik labels required for public routing.
- Internal DBs with `traefik.enable=false`.
- Secrets only via referenced env vars.

### 3. Create app in Coolify dashboard

1. Dashboard → "+ New" → "Resource" → "Application" or "Docker Compose".
2. **Source:** Git repo (GitHub/GitLab/self-hosted) + branch.
3. **Build Pack:** Dockerfile or `docker-compose`.
4. **Port:** the internal container port (e.g. `3000`).
5. **Domain:** configure domain + DNS A record pointing to the server.

### 4. Sync env vars

**Manually via dashboard:** Application → Environment Variables → paste from `.env.example` with real values.

**Automatic script (iaWorkSpace pattern):**

```bash
# scripts/coolify/sync-env.mjs
# Reads local .env and uploads to Coolify via API
node scripts/coolify/sync-env.mjs --app my-app
```

API endpoint: `POST /api/v1/applications/<uuid>/envs` with bearer token.

### 5. Deploy

**DEFAULT: set up push-to-deploy via GitHub Actions.** Whenever asked to deploy
(or to set up deploys) for a Coolify app, the default is to wire a GitHub
Actions workflow that triggers a Coolify deployment on every push to the
deploy branch — do this unless the user explicitly says not to auto-deploy.
Prefer this over Coolify's dashboard "Automatic Deployment" toggle: the toggle
needs the GitHub-App webhook wired and can't be reliably enabled via the public
API, whereas the workflow below is fully reproducible and lives in the repo.

`.github/workflows/deploy.yml`:

```yaml
name: Deploy to Coolify
on:
  push:
    branches: [main]
  workflow_dispatch:
permissions:
  contents: read
concurrency:
  group: coolify-deploy
  cancel-in-progress: false
jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Trigger deployment
        id: trigger
        run: |
          resp=$(curl -fsS -X POST \
            -H "Authorization: Bearer ${{ secrets.COOLIFY_API_TOKEN }}" \
            -H "Accept: application/json" \
            "${{ secrets.COOLIFY_API_URL }}/api/v1/applications/${{ secrets.COOLIFY_APP_UUID }}/start")
          echo "$resp"
          uuid=$(printf '%s' "$resp" | node -e 'let d="";process.stdin.on("data",c=>d+=c).on("end",()=>{try{process.stdout.write(JSON.parse(d).deployment_uuid||"")}catch{process.stdout.write("")}})')
          echo "deployment_uuid=$uuid" >> "$GITHUB_OUTPUT"
      - name: Wait for deployment to finish
        if: steps.trigger.outputs.deployment_uuid != ''
        run: |
          uuid="${{ steps.trigger.outputs.deployment_uuid }}"
          for i in $(seq 1 40); do
            sleep 10
            status=$(curl -fsS -H "Authorization: Bearer ${{ secrets.COOLIFY_API_TOKEN }}" \
              "${{ secrets.COOLIFY_API_URL }}/api/v1/deployments/$uuid" \
              | node -e 'let d="";process.stdin.on("data",c=>d+=c).on("end",()=>{try{process.stdout.write(JSON.parse(d).status||"?")}catch{process.stdout.write("?")}})')
            echo "poll $i: $status"
            case "$status" in
              finished|success) exit 0 ;;
              failed|error|cancelled) echo "::error::Deployment $status"; exit 1 ;;
            esac
          done
          echo "::error::timeout"; exit 1
```

Set the three repo secrets from the project's `.env` (do not print values):

```bash
set -a; . ./.env; set +a
REPO=<owner>/<repo>
printf '%s' "$COOLIFY_API_URL"   | gh secret set COOLIFY_API_URL   --repo "$REPO"
printf '%s' "$COOLIFY_API_TOKEN" | gh secret set COOLIFY_API_TOKEN --repo "$REPO"
printf '%s' "$COOLIFY_APP_UUID"  | gh secret set COOLIFY_APP_UUID  --repo "$REPO"
```

Endpoints (verified against the live Coolify v4 API): trigger is
`POST /api/v1/applications/<uuid>/start` (NOT `/deploy`); poll with
`GET /api/v1/deployments/<deployment_uuid>` until status is `finished`.

**Security caveat:** if the Coolify instance is HTTP-only (raw IP, no TLS), the
bearer token travels unencrypted from the runners. Flag this; once Coolify has
an HTTPS domain, just update the `COOLIFY_API_URL` secret. Confirm placing the
token in GitHub secrets before doing it.

Manual fallbacks (one-off, not the default):

```bash
# Dashboard: click "Deploy"
# API one-shot:
curl -X POST "$COOLIFY_API_URL/api/v1/applications/<uuid>/start" -H "Authorization: Bearer $COOLIFY_API_TOKEN"
```

## Deploying from a private repository

**The problem:** Coolify apps created through the normal dashboard flow (or the
`POST /api/v1/applications/dockerfile` / `.../dockercompose` API endpoints
without a `private_key_uuid`) default to source type "Public Repository" —
an anonymous, unauthenticated `git ls-remote`/clone. This works fine for
public repos. Against a **private** repo it fails every time with:

```
fatal: could not read Username for 'https://github.com': No such device or address
```

...and Coolify treats that pre-deploy git check as fatal, so the app never
builds — it just crash-loops or sits `exited:unhealthy` depending on whether
an old container is still around. There is no dashboard toggle or API field
that fixes this on an *existing* app — see the two cases below.

### Case 1 — brand new app, repo is (or will be) private

Create it directly with the deploy-key flow instead of the generic
public/dockerfile endpoints:

```bash
curl -X POST -H "Authorization: Bearer $COOLIFY_API_TOKEN" -H "Content-Type: application/json" \
  "$COOLIFY_API_URL/api/v1/applications/private-deploy-key" \
  -d '{
    "project_uuid": "<project_uuid>",
    "server_uuid": "<server_uuid>",
    "environment_name": "production",
    "private_key_uuid": "<key_uuid_from_security/keys>",
    "git_repository": "git@github.com:owner/repo.git",
    "git_branch": "main",
    "build_pack": "dockerfile",
    "ports_exposes": "3000",
    "name": "my-app",
    "instant_deploy": false
  }'
```

Notes:
- `git_repository` **must** be a full URL (`git@github.com:owner/repo.git`,
  or `https://...`) — a bare `owner/repo` short form is rejected with
  `"must start with https://, http://, git://, or git@"`.
- `project_uuid`/`server_uuid`: look up via `GET /api/v1/projects` and the
  project's `environments[].uuid` for `environment_name`, or reuse the
  `server_uuid` from any existing app (`GET /api/v1/applications` →
  `destination.server.uuid`).
- After creation, the response only has `uuid` + the auto-generated
  `sslip.io` domain — set the real domain, env vars, and post-deploy command
  same as any app (see below). Domain vars (`APP_URL`, etc.) must be set
  to the **final** intended domain from the start, not the sslip.io default
  — see the crash-loop gotcha further down.

### Case 2 — existing app needs a key attached (repo went private, or was
### misconfigured as public from the start)

**There is no way to do this via API or dashboard on the existing app.**
Confirmed dead ends:
- `PATCH /api/v1/applications/{uuid}` rejects `private_key_id`,
  `private_key_uuid`, `git_full_url`, and `source_type` outright:
  `"This field is not allowed."`
- The dashboard's own Configuration → **Git Source** page for an app created
  as "Public Repository" only offers "Change Git Source" to switch between
  configured GitHub App integrations (`Sources`) — there's no field there to
  attach a raw SSH key either. If "No other sources found" shows there, this
  route is a dead end too.

**The fix is to recreate the application** with the Case 1 flow above, then
migrate its configuration across, then delete the old one:

```bash
NEW=<uuid from the private-deploy-key create call>

# 1. Domain (force override since the old app still holds it)
curl -X PATCH ... "$COOLIFY_API_URL/api/v1/applications/$NEW" \
  -d '{"domains":"https://my-app.example.com","force_domain_override":true,
       "dockerfile_location":"/Dockerfile",
       "post_deployment_command":"<same as old app>",
       "post_deployment_command_container":"app"}'

# 2. Env vars — a fresh app has NONE yet, so use POST (not PATCH — PATCH 404s
#    with "Environment variable not found" until a key exists to update)
curl -X POST ... "$COOLIFY_API_URL/api/v1/applications/$NEW/envs" \
  -d '{"key":"APP_URL","value":"https://my-app.example.com","is_preview":false}'
# ...repeat per key, pulling real_value from GET .../applications/<old_uuid>/envs

# 3. Deploy and verify (see "Verifying a deploy" below) before touching the old app

# 4. Only once confirmed healthy:
curl -X DELETE ... "$COOLIFY_API_URL/api/v1/applications/<old_uuid>"
```

Update the `COOLIFY_APP_UUID` GitHub secret (and any saved reference) to the
new UUID once this is done — it changes.

### The real trap: verifying a deploy key actually has access to *this* repo

The most time-expensive failure mode isn't the API limitation above — it's
**assuming an existing Coolify private-key resource is usable just because it
looks like an "account key."** GitHub deploy keys are scoped to exactly one
repo. `ssh -T git@github.com` printing `Hi <username>!` (no repo name) looks
like an account-wide personal key — but that can be a **false positive** if
the machine you're testing from has a `~/.ssh/config` block like:

```
Host github.com
    IdentityFile ~/.ssh/some_personal_key
    IdentitiesOnly yes
```

Config-level `IdentityFile` entries are tried *in addition to* whatever you
pass with `-i` on the command line — `-o IdentitiesOnly=yes` on the CLI does
**not** suppress them, only ssh-agent/default-file fallbacks. So a test that
"succeeds" may actually be authenticating with your own personal key, not the
key you're trying to validate.

**Get a trustworthy answer with both of these, and trust the API result over
the SSH greeting:**

```bash
# Bypass all config, agent, and default files — only the exact key is tried
ssh -F /dev/null -i /path/to/key -o IdentitiesOnly=yes -o StrictHostKeyChecking=no \
  -o UserKnownHostsFile=/dev/null -T git@github.com
# "Hi user!"        → genuinely an account-level key, all owned repos OK
# "Hi user/repo!"   → a deploy key scoped ONLY to that one repo

# Definitive, no ambiguity — ask GitHub directly which repo(s) this exact
# public key is authorized for:
gh api repos/<owner>/<repo>/keys
# lists every deploy key registered on that repo; compare fingerprints
# (ssh-keygen -lf <pubkey>) against what Coolify has associated.
```

If the key doesn't check out for the target repo, generate a fresh one and
register it in both places:

```bash
ssh-keygen -t ed25519 -f ./new_deploy_key -N "" -C "coolify-<app>-deploy"

# Add it read-only to the repo:
gh api repos/<owner>/<repo>/keys -f title="Coolify - <app> deploy" \
  -f key="$(cat ./new_deploy_key.pub)" -F read_only=true

# Register it in Coolify:
curl -X POST ... "$COOLIFY_API_URL/api/v1/security/keys" -d "{
  \"name\": \"<app> GitHub deploy key\",
  \"description\": \"Read-only, scoped to <owner>/<repo>\",
  \"private_key\": $(python3 -c 'import json,sys;print(json.dumps(open(sys.argv[1]).read()))' ./new_deploy_key)
}"
# → returns a uuid; use it as private_key_uuid in Case 1/2 above.
```

### Related runtime crash: protocol-less domain env vars

Separately from git auth, apps that read their own domain from an
env var (e.g. `APP_URL` for building an absolute base URL, common with
better-auth/next-auth-style libraries) can crash-loop if that var is ever
set to a bare host or protocol-relative value (`//host` or `host` instead of
`https://host`) — some frameworks throw on `new URL()` with no scheme
instead of defaulting to one. This has bitten us via a Coolify magic-variable
substitution that resolved to the host only. Two defenses, do both:
1. Always set domain-derived env vars in Coolify with the full scheme
   (`https://...`), never rely on a bare auto-fill.
2. In app code, normalize with a one-line guard before use — e.g.
   `const url = /^https?:\/\//.test(v) ? v : \`https://${v.replace(/^\/+/, '')}\`;`
   — so a future misconfiguration degrades instead of crash-looping the
   whole process.

## Useful commands

```bash
# Logs (via SSH to the server)
docker logs -f <container-name>
docker logs --tail 100 <container-name>

# Exec
docker exec -it <container-name> sh
docker exec -it postgres psql -U myuser mydb

# Restart individual
docker restart <container-name>

# Stats
docker stats

# Coolify CLI (if installed on the server)
coolify app list
coolify app logs <name>
coolify app restart <name>
```

## Post-deploy hooks

Configure a command that runs post-deploy (e.g. DB migrations, cache clear):

```yaml
# coolify config or docker-compose healthcheck
services:
  app:
    # ...
    healthcheck:
      test: ["CMD", "curl", "-f", "http://localhost:3000/health"]
      interval: 30s
      timeout: 10s
      retries: 3
      start_period: 40s
```

```bash
# Manual post-deploy (via iaWorkSpace script)
node scripts/coolify/set-post-deploy.mjs --app my-app --command "pnpm db:migrate"
```

## Automatic HTTPS

Coolify configures Let's Encrypt automatically via Traefik. You only need:

1. DNS A record pointing to the server.
2. Domain configured on the app.
3. Port 80 open on the VPS firewall.

For wildcard certs (multiple subdomains): `*.example.com` with DNS challenge.

## Multi-service / compose fleet

To orchestrate multiple apps (iaWorkSpace pattern: `prod/docker-compose.fleet.yml`):

```yaml
# docker-compose.fleet.yml in /prod/
services:
  traefik:
    image: traefik:v3.0
    # ... global reverse proxy

  app1:
    # ... exposed at app1.example.com

  app2:
    # ... exposed at app2.example.com

  postgres:
    # ... internal

  redis:
    # ... internal
```

Deploy with `docker compose -f docker-compose.fleet.yml up -d`.

## Backup and restore

```bash
# Backup DB
docker exec postgres pg_dump -U myuser mydb | gzip > backup-$(date +%Y%m%d).sql.gz

# Restore
gunzip -c backup-20260627.sql.gz | docker exec -i postgres psql -U myuser mydb

# Backup volume
docker run --rm -v postgres_data:/data -v $(pwd):/backup alpine \
  tar czf /backup/postgres_data.tar.gz /data
```

## Common errors

1. ❌ Forgetting `traefik.enable=false` on DB → exposed publicly.
2. ❌ Hardcoding secrets in compose → use `${VAR}`.
3. ❌ Not configuring healthcheck → Coolify marks as "healthy" without verifying.
4. ❌ Port mismatch between container and Traefik label → 404.
5. ❌ DNS not propagated → Let's Encrypt cert fails.
6. ❌ Coolify token leaked in commit → revoke and reissue.
7. ❌ No cleanup of dangling images → disk full.
8. ❌ Compose with `version: '3'` (deprecated) → use compose spec v2 without version.
9. ❌ Creating an app for a private repo via the generic public/dockerfile create endpoint → unauthenticated git clone always fails. Use `private-deploy-key` at creation time (see "Deploying from a private repository" above).
10. ❌ Trying to attach a private key to an *existing* app via `PATCH /applications/{uuid}` or the dashboard's Git Source page → both reject it. Must recreate the app.
11. ❌ Trusting an `ssh -T git@github.com` test run on a machine with a `~/.ssh/config` `Host github.com` block → silently authenticates with the wrong key, giving a false "this key works" result. Use `ssh -F /dev/null ... -o IdentitiesOnly=yes` and `gh api repos/<owner>/<repo>/keys` instead.
12. ❌ Domain-derived env var (`APP_URL` etc.) set without a `https://`/`http://` scheme → app crash-loops on every boot if it feeds straight into `new URL()`.
13. ❌ Trusting that "migrations applied successfully" in the post-deployment command log means the schema is actually correct → Coolify does not treat a failing post-deployment command as a fatal deploy error, and `drizzle-kit migrate` silently no-ops on migrations missing from its journal (see the database-migrations skill's Drizzle section). Always spot-check the actual live schema (`\dt`, or query a table the new feature depends on) after a deploy that includes migrations, don't just read the deploy log.
14. ❌ Copying env vars from an old app to a recreated one using a cached/stale API response → re-fetch current values immediately before copying, especially right after fixing one of them (see the `VITE_*` gotcha above).
15. ❌ Calling it done after `curl` returns 200 → always finish with a real browser pass on the landing page and login (see "Always verify in a real browser after deploying" above).

## iaWorkSpace patterns

- **Central stack config:** `prod/stack.config.mjs` defines ALL fleet services.
- **Individual apps:** `prod/compose.d/<app>.yml` — one per app, included by stack.
- **Traefik routes:** `prod/traefik/dynamic/routes.yml` — declarative routing.
- **Register new app:** `node scripts/prod/register-app.mjs --name my-app --domain my-app.example.com`
- **Generate compose:** `node scripts/prod/generate-compose.mjs` compiles fleet + compose.d into `docker-compose.fleet.yml`.
- **Status check:** `pnpm containers:status` + `node scripts/prod/status.sh`.

## Typical environment variables

```bash
# .env
POSTGRES_DB=myapp_prod
POSTGRES_USER=myapp
POSTGRES_PASSWORD=***
COOLIFY_TOKEN=***
COOLIFY_API_URL=https://coolify.example.com/api/v1
DOMAIN=example.com
LETSENCRYPT_EMAIL=admin@example.com
```

## Resources

- [Coolify docs](https://coolify.io/docs)
- [Coolify API reference](https://coolify.io/docs/api)
- [Traefik docs](https://doc.traefik.io/traefik/)
- [Docker compose spec](https://docs.docker.com/compose/compose-file/)