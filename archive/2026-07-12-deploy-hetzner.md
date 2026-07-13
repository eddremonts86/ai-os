# Deploy the demo to ai-chat.eduardoinerarte.dk via Hetzner static + GitHub Actions

**Date:** 2026-07-12
**Status:** draft
**Blocks:** 4
**Author:** Edd

## Objective

The ai-schadcn-chat package is now published to npm (v0.1.0).
The next step is to ship the `/demo` app to the public so anyone
can visit the live playground. The deploy target is a static file
hosting path on the Hetzner VPS `conductor-01`, served by nginx
behind the existing `*.eduardoinerarte.dk` wildcard DNS + Let's
Encrypt wildcard cert, at hostname `ai-chat.eduardoinerarte.dk`.

The deploy pipeline runs entirely in GitHub Actions: build the
demo on the runner, rsync the static output over SSH to the
server, no Node runtime needed in production.

## Why GitHub Actions + SSH (not Coolify)

- **No new service.** The Hetzner box already has nginx +
  wildcard TLS + the VPS serves multiple other static +
  Node apps. Coolify would add a container orchestration layer
  that we do not need for a static SPA demo.
- **Reproducible.** Every push to `main` triggers a redeploy.
  Re-running the same commit gives the same output. Auditable.
- **No secrets on the demo deployer.** SSH key lives in GitHub
  Secrets, not on Ed's laptop.
- **Standard pattern.** The bundle builds on the runner,
  download the artifact, rsync to the server. Five-minute
  workflow YAML.

## Acceptance criteria

- [ ] `.github/workflows/deploy-demo.yml` runs on `push` to
      `main`, manual `workflow_dispatch`, and installs `pnpm`,
      builds the demo, rsyncs `demo/dist/` to the server, and
      reloads nginx if needed.
- [ ] The demo at `https://ai-chat.eduardoinerarte.dk/`
      returns HTTP 200 and renders the playground.
- [ ] `git push` to `main` on this repo triggers a deploy that
      finishes in under 5 minutes.
- [ ] The server-side config: an nginx vhost at
      `/etc/nginx/sites-available/ai-chat.eduardoinerarte.dk.conf`
      enabled, with `root` pointing at the deployed path, the
      wildcard TLS cert reused, SPA fallback (`try_files` to
      `index.html`), and a `Cache-Control` policy on hashed assets.
- [ ] GitHub Secrets on the repo: `HETZNER_HOST`,
      `HETZNER_USER`, `HETZNER_SSH_KEY`, `HETZNER_DEPLOY_PATH`,
      `HETZNER_KNOWN_HOSTS`.
- [ ] README.md explains the deploy.

## Non-goals

- Coolify or container-based deploy — out.
- Dynamic SSR or Node runtime — the demo is a static SPA.
- New subdomain setup beyond `ai-chat.eduardoinerarte.dk`.
- Monitoring / uptime / Sentry — out of scope; the demo is a
  playground, not production traffic.

## Plan

### Block 1 — Server-side nginx config

- [ ] Generate a fresh SSH key on the VPS with comment
      `ai-chat-deploy-github-actions` and `no-pty,no-agent-forwarding`
      restrictions.
- [ ] Write the vhost template under
      `.github/nginx/ai-chat.eduardoinerarte.dk.conf.example` so
      the actual config lives in version control too.
- [ ] Confirm the wildcard cert path on the server so the
      vhost can `ssl_certificate` from the wildcard live dir.
- [ ] Confirm the wildcard DNS A record exists by resolving
      `ai-chat.eduardoinerarte.dk` from outside.

### Block 2 — GitHub Secrets + workflow

- [ ] Workflow: `.github/workflows/deploy-demo.yml` using
      `pnpm/action-setup`, `actions/checkout`, building the demo,
      using `appleboy/scp-action` (or `rsync` over `ssh`) to copy
      `demo/dist/` to the server, then `nginx -s reload` so the
      new files are picked up.
- [ ] Cache pnpm store via `pnpm/action-setup`.
- [ ] Concurrency: cancel any in-flight deploy when a new
      push lands on `main`, so we never double-deploy.

### Block 3 — First deploy + verification

- [ ] Manual `workflow_dispatch` run to deploy without waiting
      for a push.
- [ ] `curl -I https://ai-chat.eduardoinerarte.dk/` returns
      200 with TLS.
- [ ] Browser smoke: open in headless Chrome, confirm the
      playground renders, no console errors, the "Try a sample
      message" suggestion is clickable.

### Block 4 — README + commit + archive

- [ ] Update README.md with a "Live demo" link.
- [ ] One commit per block, plus archive the spec.

## Risks and mitigation

| Risk                                                       | Probability | Impact  | Mitigation                                                                                                                                                                             |
| ---------------------------------------------------------- | ----------- | ------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| The wildcard DNS A record does not point to conductor-01.  | low         | blocker | Verify with `dig ai-chat.eduardoinerarte.dk` from outside before drafting the workflow.                                                                                                |
| Wildcard TLS cert is missing or expired.                   | low         | blocker | `ls /etc/letsencrypt/live/*.eduardoinerarte.dk/` from the server. If absent, generate it now with certbot DNS-01 (Hetzner DNS plugin or cloudflare or whatever the registrar permits). |
| `pnpm` build fails on the runner due to missing libs.      | low         | low     | Use the official `pnpm/action-setup` with the same Node version as Ed's Mac (`.nvmrc` or whatever pins the runtime).                                                                   |
| The rsync over SSH fails silently because of strict perms. | medium      | low     | `StrictHostKeyChecking: yes` via `HETZNER_KNOWN_HOSTS`. Surface failures by running `rsync --dry-run` first, then real.                                                                |
| The deploy breaks an existing site on the server.          | low         | high    | Only changes `/var/www/ai-chat.eduardoinerarte.dk/` (new path). Does NOT touch the other vhosts in `/etc/nginx/sites-enabled/`.                                                        |
