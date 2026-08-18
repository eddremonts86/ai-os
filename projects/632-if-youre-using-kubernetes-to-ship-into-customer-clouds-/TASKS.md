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

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialize the git repository and adopt a license
- [ ] Copy `edd-app-template` into `apps/632-if-youre-using-kubernetes-to-ship-into-customer-clouds-/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Configure `tailwind.config.ts` with the tokens from DESIGN.md
- [ ] Set up the local development environment

## Phase 1: Core

- [ ] Author the `terraform/byoc` module: VM + managed Postgres + IAM + networking for AWS, parameterised by a single config file
- [ ] Implement the `byoc-bootstrap` Go binary with `install`, `upgrade`, `status`, and `uninstall` subcommands
- [ ] Wire the installer to authenticate via short-lived STS / OIDC federation so the vendor never holds a long-lived customer credential
- [ ] Add the systemd unit file that supervises the container, performs health checks, and rolls back on failure
- [ ] Wire the OpenTelemetry collector sidecar: metrics for uptime, version, and health, streamed over HTTPS to a vendor sink
- [ ] Generate a `byoc audit` command that emits a Terraform plan, an SBOM for the deployed image, and a one-page security summary
- [ ] Document a single end-to-end run (install → upgrade → uninstall) on a real AWS sandbox account, with timings captured for the success metric baseline

## Phase 2: Deploy

- [ ] Create the public GitHub repository
- [ ] Deploy to Coolify
- [ ] Verify in production
