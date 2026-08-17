---
name: hetzner-cloud-cli
description: Patterns for managing Hetzner Cloud infrastructure from the CLI (hcloud). Applies when working with Hetzner VPS servers (CX/CCX/CPX), volumes, private networks, firewalls, and SSH keys for iaWorkSpace projects and self-hosted apps.
license: Internal
---

# Hetzner Cloud CLI

## Setup

```bash
brew install hcloud                      # macOS
# or Linux: https://github.com/hetznercloud/cli/releases
hcloud context create prod               # interactive: API token
hcloud context active                    # confirms
```

API token: Hetzner Cloud Console → Security → API Tokens. Scope: Read & Write.

## Concepts

- **Server lifecycle states:** `CREATED` → `STARTING` → `RUNNING` → `OFF` → `DELETING`. In `OFF` you are charged for storage but not CPU.
- **Server types:** CX (shared), CCX (dedicated), CPX (shared AMD), CAX (Arm).
- **Server naming:** kebab-case, project prefix (`edd-prod-01`, `wave-staging-01`).
- **Labels:** k=v for filtering. iaWorkSpace convention: `project=`, `env=`, `role=`, `managed-by=`.

## Essential commands

```bash
# List
hcloud server list -o columns=id,name,status,public_ipv4,datacenter,labels

# Create
hcloud server create \
  --name edd-prod-01 \
  --type cpx31 \
  --image ubuntu-24.04 \
  --location nbg1 \
  --ssh-key work-laptop \
  --label project=edd,env=prod,managed-by=hetzner-skill

# Lifecycle
hcloud server poweron <id>
hcloud server poweroff <id>
hcloud server reboot <id>
hcloud server shutdown <id>     # ACPI, cleaner than poweroff
hcloud server reset <id>         # hard reset

# Direct SSH
hcloud ssh <id>                  # or hcloud ssh <name>
hcloud ssh --command "uptime" <id>

# Snapshots / backups
hcloud server enable-backup <id>           # automatic backup at 30% cost
hcloud server create-image --type snapshot <id>
hcloud image list

# Volumes
hcloud volume create --name edd-data --size 50 --location nbg1
hcloud volume attach edd-data <server-id>

# Private networks
hcloud network create --name edd-net --ip-range 10.0.0.0/16
hcloud network add-subnet edd-net --type server --network-zone eu-central --ip-range 10.0.1.0/24
hcloud server attach-to-network <server-id> --network edd-net

# Firewalls
hcloud firewall create --name edd-fw
hcloud firewall add-rule edd-fw --direction in --port 22 --protocol tcp --source-ips 0.0.0.0/0
hcloud firewall apply-to-resource edd-fw --type server --resource <server-id>

# Floating IPs
hcloud floating-ip create --type ipv4 --home-location nbg1
hcloud floating-ip assign <fip-id> <server-id>

# Cleanup
hcloud server delete <id>
```

## Context configuration

```bash
# ~/.config/hcloud/cli.toml
active_context = "prod"

[contexts.prod]
token = "hcloud_xxx..."

[contexts.staging]
token = "hcloud_yyy..."
```

Multi-context: `hcloud context list`, `hcloud context use <name>`.

## SSH keys

```bash
hcloud ssh-key list
hcloud ssh-key create --name work-laptop --public-key-from-file ~/.ssh/id_ed25519.pub
hcloud ssh-key delete <id>
```

**`hcloud ssh-key list` does not tell you who can log in.** Project keys are injected into a server
**at creation time only**. A key registered afterwards is in the project and not in the box, and
nothing in the CLI output distinguishes the two — a key whose fingerprint matches a registered one
can still be refused, which reads like a broken key rather than a key that was never installed.

The authoritative list is on the server:

```bash
ssh-keygen -lf /root/.ssh/authorized_keys      # requires access you may not have yet — see below
hcloud server describe <id> -o json | jq '.created'   # anything registered after this was not injected
```

Hetzner also prints MD5 fingerprints while `ssh-keygen` defaults to SHA256, so comparing them needs
`ssh-keygen -lf key.pub -E md5`. Comparing the two formats directly finds no matches and proves
nothing.

## Output formats

```bash
hcloud server list -o json | jq '.[] | {id, name, ipv4: .public_net.ipv4.ip}'
hcloud server list -o yaml
hcloud server list -o text   # tab-separated
hcloud server list -o columns=id,name,status  # custom columns
```

## Ansible-like ops

```bash
# Loop
for s in $(hcloud server list -o json | jq -r '.[].name'); do
  hcloud ssh "$s" --command "uptime"
done

# With xargs
hcloud server list -o json | jq -r '.[] | .name' | xargs -I{} hcloud ssh {} --command "df -h"

# Parallel with gnu parallel (install: brew install parallel)
hcloud server list -o json | jq -r '.[] | .name' | parallel -j 5 'hcloud ssh {} --command "uptime"'
```

## Disaster recovery

```bash
# Rebuild from snapshot
SNAP_ID=$(hcloud image list -o json | jq -r '.[] | select(.name | startswith("edd-prod-01-snap")) | .id' | head -1)
hcloud server create \
  --name edd-prod-01-restored \
  --type cpx31 \
  --image $SNAP_ID \
  --location nbg1 \
  --ssh-key work-laptop

# Or from automatic backup (appears as an image)
```

## Pricing watch

```bash
hcloud server-type list -o json | jq '.[] | {name, cores, memory, price_hourly: .prices[0].price_hourly.net}'
```

CX31 (4 vCPU, 8GB): ~€15/mo. CCX23 (8 dedicated vCPU): ~€45/mo. CPX41 (8 vCPU, 16GB AMD): ~€35/mo.

## Locked out / no working SSH key on hand

Two ways to regain root access to a server without asking anyone for their
account password:

1. **If the server runs Coolify, reuse Coolify's own "localhost's key".**
   Coolify always keeps a private-key resource (visible in
   `GET /api/v1/security/keys`, typically named "localhost's key") that it
   uses to SSH into the box it's running on to manage Docker — so it's
   already in `authorized_keys` by definition.
   ```bash
   curl -H "Authorization: Bearer $COOLIFY_API_TOKEN" \
     "$COOLIFY_API_URL/api/v1/security/keys/<uuid-of-localhost's-key>" \
     | python3 -c "import json,sys; print(json.load(sys.stdin)['private_key'])" > /tmp/k
   chmod 600 /tmp/k
   ssh -i /tmp/k root@<server-ip>
   ```
   Zero friction, doesn't touch account credentials at all — try this first.

   Check `sshd -T | grep permitrootlogin` once you are in. On these Ubuntu images provisioned with a
   key it is `without-password`, which means **option 2 below cannot work for root** no matter what
   password you obtain. Establish that before spending time on a password route.

   Bootstrapping with this key is the beginning, not the end — it is Coolify's key, shared with
   whatever else holds a Coolify token. Install a key of your own before doing anything else:

   ```bash
   ssh -i /tmp/k root@<ip> "cp /root/.ssh/authorized_keys /root/.ssh/authorized_keys.bak-\$(date +%F-%H%M%S)"
   PUB=$(cat ~/.ssh/id_ed25519_<host>.pub)
   ssh -i /tmp/k root@<ip> "grep -qF '$PUB' /root/.ssh/authorized_keys || echo '$PUB' >> /root/.ssh/authorized_keys"
   shred -u /tmp/k          # the borrowed key does not stay on disk
   ```

   Append, never overwrite, and back the file up first: the entries already there are how the owner
   and the platform get in, and replacing them is how a tidy-up becomes an outage. Then verify the new
   key **on its own** with `-o IdentitiesOnly=yes` before trusting it.

   Give it a `Host` block, and set `IdentitiesOnly yes` in it. Without that, ssh offers every key the
   agent holds, and a server configured with a low `MaxAuthTries` closes the connection before
   reaching the right one — which presents as "my new key does not work".

2. **Hetzner Cloud API password reset**, if #1 isn't available:
   ```bash
   curl -X POST -H "Authorization: Bearer $HETZNER_API_TOKEN" \
     "https://api.hetzner.cloud/v1/servers/<server-id>/actions/reset_password"
   # → { "root_password": "...", "action": {...} }
   ```
   Returns a fresh one-time root password immediately usable via any console
   (e.g. the Hetzner Cloud web terminal) — no reboot needed in practice.
   Relay the password to the human so *they* type it into the console
   themselves; don't type account passwords into login forms directly.
   `hcloud` doesn't expose this as a subcommand — it's a raw API call.

## Common errors

1. ❌ Creating a server without an SSH key → cannot log in.
2. ❌ `poweroff` without prior `shutdown` → data loss if DB is running.
3. ❌ Forgetting `--location` matching with subnet → network attach fails.
4. ❌ API token with Read scope in a script that writes → 403.
5. ❌ No cleanup of orphaned snapshots → cost creep.
6. ❌ Firewall with `0.0.0.0/0` on port 22 without fail2ban → brute force.
7. ❌ Floating IP assigned but route on server not configured → IP unreachable.
8. ❌ Deleting a server before detaching volumes → orphan volume.

## iaWorkSpace patterns

- **Naming:** `<project>-<env>-<num>`, e.g. `edd-prod-01`, `wave-staging-01`.
- **Default location:** `nbg1` (Nuremberg) for EU.
- **Base image:** `ubuntu-24.04` LTS.
- **Backups:** enabled in prod, disabled in staging/dev.
- **Networks:** one private network per project (`10.0.0.0/16`).
- **SSH:** only with pre-registered keys, password auth disabled.
- **Firewall:** default-deny, allow 22 only from known IPs (or VPN).

## Setup with Ansible-style hcloud_context

```bash
# Reusable script: scripts/hetzner-bootstrap.sh
#!/bin/bash
set -euo pipefail
hcloud server create \
  --name "$1" \
  --type "${2:-cpx31}" \
  --image ubuntu-24.04 \
  --location nbg1 \
  --ssh-key work-laptop \
  --start-after-creation \
  --label "project=${3},env=${4},managed-by=iaworkspace"

echo "Server $1 created: $(hcloud server list -o columns=id,public_ipv4 | grep $1)"
```

## Resources

- [Hetzner Cloud CLI repo](https://github.com/hetznercloud/cli)
- [Hetzner Cloud API docs](https://docs.hetzner.cloud/)
- [Cloud Console](https://console.hetzner.cloud/)