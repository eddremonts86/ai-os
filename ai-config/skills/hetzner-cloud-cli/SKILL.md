---
name: hetzner-cloud-cli
description: Patrones para gestionar infraestructura Hetzner Cloud desde la CLI (hcloud). Aplica al trabajar con servidores VPS Hetzner (CX/CCX/CPX), volúmenes, redes privadas, firewalls y SSH keys para proyectos iaWorkSpace y self-hosted apps.
license: Internal
---

# Hetzner Cloud CLI

## Setup

```bash
brew install hcloud                      # macOS
# o Linux: https://github.com/hetznercloud/cli/releases
hcloud context create prod               # interactive: API token
hcloud context active                    # confirma
```

API token: Hetzner Cloud Console → Security → API Tokens. Scope: Read & Write.

## Conceptos

- **Server lifecycle states:** `CREATED` → `STARTING` → `RUNNING` → `OFF` → `DELETING`. En `OFF` se cobra storage pero no CPU.
- **Server types:** CX (shared), CCX (dedicated), CPX (shared AMD), CAX (Arm).
- **Server naming:** kebab-case, prefijo de proyecto (`edd-prod-01`, `wave-staging-01`).
- **Labels:** k=v para filtering. Convención iaWorkSpace: `project=`, `env=`, `role=`, `managed-by=`.

## Comandos esenciales

```bash
# Listar
hcloud server list -o columns=id,name,status,public_ipv4,datacenter,labels

# Crear
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
hcloud server shutdown <id>     # ACPI, más limpio que poweroff
hcloud server reset <id>         # hard reset

# SSH directo
hcloud ssh <id>                  # o hcloud ssh <name>
hcloud ssh --command "uptime" <id>

# Snapshots / backups
hcloud server enable-backup <id>           # backup automático 30% costo
hcloud server create-image --type snapshot <id>
hcloud image list

# Volúmenes
hcloud volume create --name edd-data --size 50 --location nbg1
hcloud volume attach edd-data <server-id>

# Redes privadas
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

# Limpieza
hcloud server delete <id>
```

## Configuración de contexto

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

# Con xargs
hcloud server list -o json | jq -r '.[] | .name' | xargs -I{} hcloud ssh {} --command "df -h"

# Parallel con gnu parallel (instalar: brew install parallel)
hcloud server list -o json | jq -r '.[] | .name' | parallel -j 5 'hcloud ssh {} --command "uptime"'
```

## Disaster recovery

```bash
# Reconstruir desde snapshot
SNAP_ID=$(hcloud image list -o json | jq -r '.[] | select(.name | startswith("edd-prod-01-snap")) | .id' | head -1)
hcloud server create \
  --name edd-prod-01-restored \
  --type cpx31 \
  --image $SNAP_ID \
  --location nbg1 \
  --ssh-key work-laptop

# O desde backup automático (se ve como imagen)
```

## Pricing watch

```bash
hcloud server-type list -o json | jq '.[] | {name, cores, memory, price_hourly: .prices[0].price_hourly.net}'
```

CX31 (4 vCPU, 8GB): ~€15/mo. CCX23 (8 dedicated vCPU): ~€45/mo. CPX41 (8 vCPU, 16GB AMD): ~€35/mo.

## Errores comunes

1. ❌ Crear server sin SSH key → no se puede entrar.
2. ❌ `poweroff` sin `shutdown` previo → data loss si DB corriendo.
3. ❌ Olvidar `--location` matching con subnet → network attach falla.
4. ❌ API token con scope Read en script que escribe → 403.
5. ❌ No cleanup de snapshots huérfanos → cost creep.
6. ❌ Firewall con `0.0.0.0/0` en port 22 sin fail2ban → brute force.
7. ❌ Floating IP asignada pero route en server no configurado → IP inaccesible.
8. ❌ Borrar server antes de detach volumes → volume huérfano.

## Patrones iaWorkSpace

- **Naming:** `<proyecto>-<env>-<num>`, ej `edd-prod-01`, `wave-staging-01`.
- **Location default:** `nbg1` (Nuremberg) para EU.
- **Image base:** `ubuntu-24.04` LTS.
- **Backups:** habilitado en prod, deshabilitado en staging/dev.
- **Networks:** una private network por proyecto (`10.0.0.0/16`).
- **SSH:** solo con keys pre-registradas, password auth deshabilitada.
- **Firewall:** default-deny, allow 22 solo desde IPs conocidas (o VPN).

## Setup con Ansible-style hcloud_context

```bash
# Script reusable: scripts/hetzner-bootstrap.sh
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

## Recursos

- [Hetzner Cloud CLI repo](https://github.com/hetznercloud/cli)
- [Hetzner Cloud API docs](https://docs.hetzner.cloud/)
- [Cloud Console](https://console.hetzner.cloud/)