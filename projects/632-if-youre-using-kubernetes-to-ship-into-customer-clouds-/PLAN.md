---
id: "632"
slug: if-youre-using-kubernetes-to-ship-into-customer-clouds-
title: "if you're using kubernetes to ship into customer clouds, you're doing it wrong"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1voyt7f/if_youre_using_kubernetes_to_ship_into_customer/"
category: saas
date: "2026-08-15"
tags: [byoc, kubernetes, deployment, devops]
tech: [Terraform, AWS/GCP/Azure VMs (not EKS/GKE/AKS), Bash + Ansible, Docker, Systemd]
---
# if you're using kubernetes to ship into customer clouds, you're doing it wrong

## Tech Stack

- **Terraform 1.6+** — declarative provisioning of VM + managed Postgres across AWS, GCP, and Azure; the lingua franca every customer's infra team already understands.
- **AWS / GCP / Azure IaaS primitives (EC2 / Compute Engine / Azure VMs, RDS / Cloud SQL / Azure Database)** — instead of EKS/GKE/AKS, exactly the post-Databricks shape the poster is advocating.
- **Single OCI container image per tenant** — the unit of upgrade; no orchestration inside the customer's account.
- **systemd service unit** — supervisor that pulls the new image, runs health checks, and rolls back on failure; simpler than a docker-compose restart loop and visible to the customer's ops team.
- **Bash + Ansible** — light configuration management for OS-level concerns (timezone, NTP, logrotate, firewall) that lives outside the container.
- **Go binary (`byoc-bootstrap`)** — the single customer-facing installer that glues Terraform, image push, and systemd registration; chosen because it produces a static binary that runs on any base image.
- **OpenTelemetry Collector sidecar in the same systemd unit** — the only "second process" allowed, limited to metrics and log shipping, no control plane.

## Architecture

Each BYOC tenant is a single VM inside the customer's cloud account, provisioned by Terraform and supervised by systemd. The vendor's installer authenticates to the customer's cloud with short-lived credentials, applies the Terraform module, pushes the new container image to a customer-side registry (or pulls from the vendor's public registry if the customer's policy allows), registers the systemd unit, and waits for the health check to pass. Upgrades are a re-run of the same installer with a new image tag; rollback is the previous image tag plus `systemctl restart`. The vendor never holds a long-lived session inside the customer account. A tiny OTel collector sidecar streams uptime and version telemetry back to the vendor over HTTPS, which is the only persistent outbound connection.

```
vendor CI            byoc-bootstrap              customer cloud
  |                       |                            |
  |--(image + tag)------->|                            |
  |                       |---(short-lived creds)----->|
  |                       |---terraform apply--------->|----> VM + Postgres
  |                       |---docker run + systemd--->|
  |                       |---health check ----------->|
  |                       |<-----telemetry (OTel)------|<----  container
```

The whole thing is intentionally boring: every component is one the customer's existing infra team can debug without learning something new.

## Milestones

- **M1 — Reference terraform module:** Provision VM + managed Postgres on AWS first, then GCP, then Azure. Reviewed by two outside infra engineers before moving on.
- **M2 — Installer binary:** `byoc-bootstrap install`, `upgrade`, `status`, `uninstall` commands. End-to-end run on a real test AWS account.
- **M3 — Telemetry and upgrade loop:** OTel sidecar + vendor-side sink that lights up a dashboard of tenant versions and health. Validate one simulated upgrade on five test tenants.
- **M4 — Security review pack:** a `byoc audit` command that emits a Terraform plan, SBOM, and one-page summary; usable in a real CISO review.
- **M5 — Reference app wired in:** the poster's own app deployed behind the template for two weeks running, with a documented upgrade run, before any external release.
- **M6 — Public v0.1:** tagged release, README, and a single blog post that walks the Databricks reversal and shows the procurement-friendly shape.

## Risks

- **Risk:** A customer demands HA inside their account and the single-VM shape becomes a deal-breaker. **Mitigation:** Document the HA-acceptable upgrade path (blue/green on two VMs in the same module) as v0.2, not v0.1.
- **Risk:** The customer's security team rejects the installer binary itself as opaque. **Mitigation:** Open-source the binary (Apache 2.0), publish reproducible builds, and provide a Terraform-only mode that skips the installer.
- **Risk:** Vendor's image registry is blocked by the customer's egress policy, breaking upgrades. **Mitigation:** Support an `--image-source` flag that accepts a customer's own registry and includes a documented air-gapped install path.
- **Risk:** Per-tenant upgrade fails silently and the vendor's dashboard lies. **Mitigation:** Treat any tenant silent for 24 hours as a PagerDuty alert and trip a `byoc status` run on the next vendor-side cron.
- **Risk:** Cloud-provider API drift (e.g., RDS deprecation) breaks the Terraform module for customers on long-lived installs. **Mitigation:** Pin Terraform and provider versions inside the module and ship a migration guide per major version.
