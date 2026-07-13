# Deploy: AI-OS landing → Hetzner

The landing in [`site/`](../../site/) is published to a Hetzner VPS by the
[`deploy-site`](../../.github/workflows/deploy-site.yml) GitHub Actions workflow
on every push to `main` that touches `site/**`.

The pipeline is **wired but safe-by-default**: until the six secrets below are
set on the GitHub repo, the workflow runs a green no-op (it never breaks CI and
never emails failures). Setting the secrets activates the real deploy.

## Mechanism

```
push to main (site/**) ──> GitHub Actions ──> rsync over SSH ──> nginx (static) ──> curl 200 check
```

No container runtime, no Node in production. Reproducible: re-running the same
commit produces the same result. Only the dedicated deploy directory is
touched (`rsync --delete`), so other vhosts on the box are never affected.

## One-time activation

### 1. On the Hetzner server

```bash
# Dedicated web root (MUST match HETZNER_DEPLOY_PATH below)
sudo mkdir -p /var/www/ai-os
sudo chown "$USER":"$USER" /var/www/ai-os

# A restricted deploy key for CI (run on the server or locally)
ssh-keygen -t ed25519 -f ~/.ssh/ai-os-deploy -C "ai-os-deploy-github-actions" -N ""
# Append the PUBLIC key to the deploy user's authorized_keys, ideally restricted:
#   command="rsync ...",no-pty,no-agent-forwarding,no-X11-forwarding <pubkey>
cat ~/.ssh/ai-os-deploy.pub >> ~/.ssh/authorized_keys

# nginx vhost (see ../nginx/ai-os.conf.example)
```

### 2. GitHub secrets

```bash
gh secret set HETZNER_HOST         # server IP or hostname
gh secret set HETZNER_USER         # ssh user that owns /var/www/ai-os
gh secret set HETZNER_SSH_KEY      < ~/.ssh/ai-os-deploy          # PRIVATE key
gh secret set HETZNER_KNOWN_HOSTS  # paste output of: ssh-keyscan <host>
gh secret set HETZNER_DEPLOY_PATH  # e.g. /var/www/ai-os
gh secret set SITE_URL             # e.g. https://ai-os.example.com
```

### 3. DNS

Point an `A`/`AAAA` record (or a wildcard already covering the host) at the
server's public IP, then confirm from outside:

```bash
dig +short ai-os.example.com
```

### 4. First deploy

```bash
gh workflow run deploy-site.yml     # manual trigger, no push needed
# then verify:
curl -I https://ai-os.example.com/
```

## Notes / decisions

- **Why SSH/rsync and not Coolify:** ai-os only ships a static page. rsync to
  nginx is the lightest reproducible pattern and avoids reusing another
  project's Coolify app UUID. The `.env` Coolify creds belong to the
  conductor/ai-chat project — do not repurpose them here.
- **Never** commit the private deploy key or any secret value; they live only
  in GitHub Secrets. The `.env` under `dev-env/env-config/` stays gitignored.
