# Deploy: AI-OS landing → Coolify (conductor-01 / Hetzner)

The landing in [`site/`](../../site/) runs as a **Coolify application** on the
single Hetzner VPS `conductor-01` (`178.105.106.79`), built from the repo-root
[`Dockerfile`](../../Dockerfile) (nginx serving `site/`) and routed by Traefik
at **https://ai-os.eduardoinerarte.dk** (the `*.eduardoinerarte.dk` wildcard DNS
already resolves to the server, so no DNS changes are needed).

`push to main → GitHub Actions → Coolify /api/v1/deploy → Traefik + TLS`.

The [`deploy-site`](../../.github/workflows/deploy-site.yml) workflow triggers a
Coolify deployment on every push to `main` that touches `site/**` or the
`Dockerfile`. It is **safe-by-default**: until the repo secrets below exist it
runs a green no-op.

## Why Coolify (not rsync/nginx)

`conductor-01` is Coolify-managed; Traefik owns ports 80/443 and terminates TLS
for ~9 apps (budget, countdown, profile, geo, voice, …). A hand-rolled nginx
vhost would fight Traefik. The correct integration is a Coolify app so Traefik
routes and certs it like every other app on the box.

## Infra facts (from dev-env/env-config/.env)

- Server: `conductor-01`, `178.105.106.79`, Coolify at `:8000`.
- Coolify project `azrrxo4r5i0b45sfpcc9dayq`, server `y711krrsfpdsjs72iyqi2xjc`.
- Private repo cloned via Coolify deploy key `aic98e4k8s0hl4zjqatgga77`
  ("GitHub deploy key (eddremonts86)").
- The app is built dockerfile-style: `dockerfile_location=/Dockerfile`,
  `base_directory=/`, `ports_exposes=80`.

## Activation (GitHub repo secrets)

Values come straight from `dev-env/env-config/.env` — never echo or commit them:

```bash
gh secret set COOLIFY_API_URL    # http://178.105.106.79:8000
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

Use the token at `.env` line ~237 (`3|conductor-api-token-2026`) — verified
working (HTTP 200). A second, longer `COOLIFY_API_TOKEN` value (no `id|` prefix)
returns HTTP 401; if it ever reappears as a later duplicate it will shadow the
working one when the file is sourced, so keep only the working token.

## Notes / decisions

- `COOLIFY_APP_UUID` in `.env` (`bblj47…`) is the **`edd-app-template`** app, NOT
  ai-os — never deploy to it. The ai-os app is a **separate** application.
- Creating the ai-os app is additive; it never modifies the other apps.
