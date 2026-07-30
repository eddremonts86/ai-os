# Deploy: AI-OS landing → Coolify (conductor-01 / Hetzner)

The landing in [`site/`](../../site/) runs as a **Coolify application** on a
single Hetzner VPS, built from the repo-root
[`Dockerfile`](../../Dockerfile) (nginx serving `site/`) and routed by Traefik
at **https://ai-os.eduardoinerarte.dk** (a wildcard DNS entry already resolves
to the server, so no DNS changes are needed).

`push to main → GitHub Actions → Coolify /api/v1/deploy → Traefik + TLS`.

The [`deploy-site`](../../.github/workflows/deploy-site.yml) workflow triggers a
Coolify deployment on every push to `main` that touches `site/**` or the
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

**Resolved 2026-07-26.** The duplicate is gone: `dev-env/env-config/.env` now holds exactly one
`COOLIFY_API_TOKEN`, verified returning HTTP 200 against `/api/v1/applications`. Do not go
hunting for a second candidate — there isn't one.

The original hazard still applies if a duplicate ever reappears: a later definition shadows an
earlier one when the file is sourced, so a dead token appended below a working one silently
breaks every deploy. Check with `grep -c '^COOLIFY_API_TOKEN=' dev-env/env-config/.env` — the
answer must be `1`.

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
