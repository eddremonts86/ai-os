# Deploy: AI-OS landing → Coolify (conductor-01 / Hetzner)

The landing in [`apps/site/`](../../apps/site/) runs as a **Coolify application** on a
single Hetzner VPS, built from the repo-root
[`Dockerfile`](../../Dockerfile) (nginx serving `apps/site/`) and routed by Traefik
at **https://ai-os.eduardoinerarte.dk** (a wildcard DNS entry already resolves
to the server, so no DNS changes are needed).

`push to main → GitHub Actions → Coolify /api/v1/deploy → Traefik + TLS`.

The [`deploy-site`](../../.github/workflows/deploy-site.yml) workflow triggers a
Coolify deployment on every push to `main` that touches `apps/site/**` or the
`Dockerfile`. It is **safe-by-default**: until the repo secrets below exist it
runs a green no-op.

## Why Coolify (not rsync/nginx)

The VPS is Coolify-managed; Traefik owns ports 80/443 and terminates TLS
for several other apps already hosted on the same box. A hand-rolled nginx
vhost would fight Traefik. The correct integration is a Coolify app so Traefik
routes and certs it like every other app on the box.

## Infra facts (from dev-env/env-config/.env — never committed, local-only)

- Server + Coolify admin port are private; see your local `.env`.
- Coolify project/server/app identifiers (UUIDs) are private; see your local `.env`.
- Repo cloned via a Coolify-managed GitHub deploy key (see the Coolify app's
  Git settings — the key itself is not stored in this repo).
- The app is built dockerfile-style: `dockerfile_location=/Dockerfile`,
  `base_directory=/`, `ports_exposes=80`.

## Activation (GitHub repo secrets)

Values come straight from `dev-env/env-config/.env` — never echo or commit them:

```bash
gh secret set COOLIFY_API_URL    # e.g. http://<your-coolify-host>:8000
gh secret set COOLIFY_API_TOKEN  # the WORKING token (see caveat below)
gh secret set COOLIFY_APP_UUID   # the ai-os-landing app uuid (created via API)
gh secret set SITE_URL           # https://ai-os.eduardoinerarte.dk  (optional check)
```

Then:

```bash
gh workflow run deploy-site.yml      # manual trigger
curl -I https://ai-os.eduardoinerarte.dk/
```

## ⚠️ .env caveat: COOLIFY_API_TOKEN

**The duplicate is gone** (resolved 2026-07-26): `dev-env/env-config/.env` holds exactly one
`COOLIFY_API_TOKEN`. Do not go hunting for a second candidate — there isn't one. The original
hazard still applies if a duplicate ever reappears: a later definition shadows an earlier one
when the file is sourced, so a dead token appended below a working one silently breaks every
deploy. Check with `grep -c '^COOLIFY_API_TOKEN=' dev-env/env-config/.env` — the answer must be `1`.

**That single token is dead as of 2026-08-14.** It is well-formed (`4|` + 48 chars) but returns
`401 {"message":"Unauthenticated."}` on `/api/v1/teams`, `/projects`, `/servers` and
`/applications`. The GitHub secret of the same name is a *different, still-valid* token — the
`deploy-site` run on 2026-08-13 succeeded with it. So a green deploy proves nothing about the
local `.env`; test the local token before trusting it:

```bash
curl -sS -o /dev/null -w '%{http_code}\n' -H "Authorization: Bearer $TOKEN" \
  -H 'Accept: application/json' "$COOLIFY_API_URL/api/v1/teams"   # must be 200, not 401
```

Refresh it in Coolify → Keys & Tokens → API tokens, with **read + write** permissions (read
alone cannot create an application).

### Do not `source` this file to get the token

The value contains a `|`. Unquoted, `set -a; . dev-env/env-config/.env` makes the shell parse it
as a pipeline, and `$COOLIFY_API_TOKEN` ends up **empty** — not wrong, *empty*, with no error.
That empty value then produces the same `401` as a revoked token, which is how a live token and
a dead one become indistinguishable. Either quote the value in `.env`:

```
COOLIFY_API_TOKEN="4|xxxxxxxx…"
```

…or read it without a shell, which is what the snippets in this file assume:

```bash
TOKEN=$(grep -m1 '^COOLIFY_API_TOKEN=' dev-env/env-config/.env | cut -d= -f2- | tr -d '"'"'"')
```

## plans-explorer (second app — live since 2026-08-14)

The explorer in [`apps/plans-explorer/`](../../apps/plans-explorer/) is a separate Coolify application
built from [`Dockerfile.plans-explorer`](../../Dockerfile.plans-explorer), serving
**https://plans.eduardoinerarte.dk**. Created via the API and deployed; both repo secrets are
set, so pushes to `main` touching `apps/plans-explorer/**` or `apps/data/projects/**` now deploy it
automatically.

Its settings — mirrored from `ai-os-landing`, same repo and deploy key, in project
`edd-app-template` / environment `production`:

| Setting | Value | Why |
|---|---|---|
| `build_pack` | `dockerfile` | |
| `dockerfile_location` | `/Dockerfile.plans-explorer` | |
| `base_directory` | `/` | The indexer reads `../projects/`; scoping the context to `apps/plans-explorer/` yields a green build serving **zero** plans |
| `ports_exposes` | `80` | |
| domain | `https://plans.eduardoinerarte.dk` | Wildcard DNS already resolved to the box; no DNS change was needed |

Verified in production by content, not by status code: `/` serves the SPA shell (678 B, distinct
from the landing's 96 kB), `/data/plans.json` returns 10 plans all at `status: enriched`, the SPA
fallback answers unknown paths, and the container's own healthcheck — which probes
`/data/plans.json`, not just the shell — reports `healthy`.

> Both deploy workflows are safe-by-default: they run a **green no-op** when their secrets are
> absent. A successful run is therefore not evidence of a deploy. Check the run's annotation for
> `Deploy skipped`, and confirm the live site by content. `/plans/` on the landing returns
> HTTP 200 serving the landing itself via nginx's SPA fallback — a 404 wearing a 200.

## Notes / decisions

- The `COOLIFY_APP_UUID` in `.env` is NOT the ai-os app — verified 2026-07-26, it points at
  `edd-app-template`. The server hosts ~12 applications and that one variable can only name one
  of them. **Never deploy or write env vars using it without checking.** Resolve by name instead:
  ```bash
  curl -fsS -H "Authorization: Bearer $COOLIFY_API_TOKEN" -H "Accept: application/json" \
    "$COOLIFY_API_URL/api/v1/applications" \
  | python3 -c "import json,sys; [print(a['uuid'], a['name'], a.get('fqdn')) for a in json.load(sys.stdin)]"
  ```
  Confirm `fqdn` matches the host you expect before using the uuid. Coolify returns 200 when you
  write to the wrong app, so there is no error to catch afterwards.
- Creating the ai-os app is additive; it never modifies the other apps.
