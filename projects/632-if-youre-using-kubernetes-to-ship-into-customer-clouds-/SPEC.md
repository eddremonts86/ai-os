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

## Problem
 k8s is genuinely great for what it was built for: large clusters, hundreds of nodes, multiple apps, a platform team owning it. BYOC is a completely different shape. you're pushing one app into each customer's environment, and if you lean on a full k8s cluster per customer for that, each customer ends up running its own kubernetes control plane just to host your one app. multiply that across a few hundred customers and you're keeping N control planes alive instead of one, and the ops load gets absurd. databricks publicly walked this back on GCP: GKE first, then back to VMs. im building alien dev around not repeating that. feedbacks? submitted by /u/alon-gubkin [link] [comments]

## Objective

Deliver a paved-path, script-driven template for shipping one SaaS tenant into a customer's own cloud account without spinning up a Kubernetes control plane per customer. The template provisions a single VM (or a small VM + managed Postgres pair), deploys the application as a plain container behind systemd or a single-node orchestrator, and exposes a uniform upgrade path so the vendor can roll releases across hundreds of BYOC tenants without operating N control planes. The artifact is opinionated about avoiding EKS/GKE/AKS for this shape, modelled on the Databricks GKE-to-VM reversal the poster cites, and packaged so a customer's infra team can review and approve it in a sitting. The MVP is a working Terraform module plus a single-binary installer that takes a customer's cloud credentials and reaches a running healthy tenant.

## Target Users

- **Founders / platform engineers of B2B SaaS vendors** shipping a per-tenant app into a customer's own AWS, GCP, or Azure account who are about to default to Kubernetes and want a cheaper, smaller alternative.
- **Customer-side platform and security reviewers** at regulated enterprises who must approve what runs inside their cloud account and benefit from a single VM they can audit instead of a full k8s stack.
- **Solo DevOps engineers** at small SaaS companies (1-10 staff) running dozens to hundreds of BYOC deployments who cannot fund a full platform team to babysit per-tenant control planes.
- **Solutions architects pitching BYOC** to enterprise customers who need a defensible story for why the deployment does not duplicate cluster-level cost.
- **OSS maintainers of single-binary or single-container apps** who want a turnkey "deploy into your own cloud" recipe without writing Helm charts.

## MVP Scope

- A Terraform module that provisions one VM (t3.medium / e2-standard-2 / B2s class) and a managed Postgres (RDS / Cloud SQL / Azure Database) in the customer's account, with IAM and networking done correctly.
- A single-binary installer (`byoc-bootstrap`) that authenticates against the customer's cloud, applies the Terraform, pushes the container image, registers it with systemd, and runs a health check.
- An upgrade command (`byoc upgrade --version=vX.Y.Z`) that performs a rolling container swap with a short downtime window and automatic rollback on failed health check.
- A telemetries hook that streams anonymized version + uptime data back to the vendor so they know which tenants are alive without needing to keep a control plane per customer.
- A security-review pack: a generated Terraform plan, an SBOM for the deployed image, and a one-page audit summary the customer's security team can sign.
- A reference deployment script for AWS, GCP, and Azure, each parameterised by a single config file.
- Example app wired to the template (the poster's own use case) so the tool is exercised end-to-end before release.

## Constraints

- No Kubernetes, no managed k8s, no k3s — the entire value proposition is that the customer never runs a control plane for this app.
- No multi-tenant code path inside the customer VPC; each BYOC deployment is a single-tenant install, period.
- The vendor does not hold long-lived customer cloud credentials; authentication is short-lived (OIDC federation or expiring STS tokens) and scoped to the resources the module manages.
- Out of scope for the MVP: multi-region failover, per-tenant customisation beyond config-file values, BYOC into on-prem or air-gapped environments, and a customer-facing admin UI.
- The MVP supports a single container image per tenant; sidecars (logs shipper, metrics agent) are allowed but bundled as part of the same systemd unit, not a separate workload.
