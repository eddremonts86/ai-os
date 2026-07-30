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

Check your local `.env` for two `COOLIFY_API_TOKEN` candidates — only one of
them returns HTTP 200 from the Coolify API; the other returns 401. If it ever
reappears as a later duplicate it will shadow the working one when the file
is sourced, so keep only the working token.

## Notes / decisions

- The `COOLIFY_APP_UUID` used elsewhere in `.env` for other apps (e.g. an
  app-template project) is NOT the ai-os app — never deploy to it. The ai-os
  app is a **separate** application; check the value before using it.
- Creating the ai-os app is additive; it never modifies the other apps.
