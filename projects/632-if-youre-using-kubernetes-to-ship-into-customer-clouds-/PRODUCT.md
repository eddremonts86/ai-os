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

> Auto-generated product brief. Reviewed and refined for the BYOC deployment-template MVP.

## Value Proposition

The poster argues, with the Databricks GKE-to-VM reversal as exhibit A, that a Kubernetes control plane is the wrong primitive for BYOC SaaS where the vendor's entire footprint inside a customer's cloud is one app. This product turns that argument into a repeatable paved path: a Terraform module plus a single-binary installer that provisions a single VM, a managed Postgres, and a container behind systemd, with a vetted upgrade path, security-review pack, and a bring-your-own-cloud bill that is a fraction of a tenant-sized cluster. The vendor gets to ship a new release across hundreds of customer accounts in one operation; the customer's security team gets to review one VM, one container, and one Terraform plan instead of an entire control plane.

## Target Users

- **B2B SaaS founder / platform engineer running 50-500 BYOC tenants** — cares because every avoided control plane is a full-time engineer they do not have to hire.
- **Customer-side security and infrastructure reviewer** at a regulated bank, hospital, or government buyer — cares because a single VM is auditable in a sitting and a k8s cluster is not.
- **Solo DevOps engineer at a 5-person SaaS company** — cares because they are on call for every customer's cluster and want a deployment shape they can debug from their laptop.
- **Sales engineer pitching a regulated enterprise deal** — cares because "one VM, one container, audited by your team" is the line that closes the procurement gate.
- **OSS maintainer offering a self-hosted edition** — cares because the install story is the difference between five stars and a thousand issues.

## Jobs To Be Done

- **Functional:** When a new customer signs an enterprise contract, I want to deliver a working, isolated instance of my SaaS inside their cloud account in under a day, so I can convert the deal without an SRE team.
- **Emotional:** I want to stop lying awake at night wondering which of my N control planes is wedged, so I can sleep and trust my deployment shape is something I can reason about.
- **Social:** I want to be able to honestly tell a customer's CISO that we do not run a control plane inside their perimeter, so procurement moves instead of stalls on a six-month security review.

## Success Metrics

- Time from "customer provides cloud credentials" to "healthy tenant answering health checks" — target under 60 minutes for one operator.
- Number of operational full-time equivalents required to keep 100 BYOC tenants upgraded and healthy — target under 0.5 FTE.
- Fraction of customers who reject the deployment on first security review — target under 10%.
- Mean time to roll a new release across all BYOC tenants — target under one business day.
- Customer-cloud monthly cost the deployment imposes — target under $50/tenant/month for a small workload.

## Competitive Landscape

- **Databricks on GCP** walked back from GKE to a VM-based deployment; their case study is the canonical reference for this shape, but Databricks does not productise the template for general SaaS vendors.
- **Porter** (runporter.com) and **Railway** offer BYO-cloud abstractions but they still expose a Kubernetes-shaped interface; the procurement teams quote a cluster, not a VM.
- **Self-hosted SaaS installers** like Coolify, CapRover, and Dokku deliver one app per host but assume the vendor controls the host, not the customer's account.
- **HashiCorp Terraform + Ansible** is the building block — the gap this product fills is the opinionated templating and the upgrade path, not the underlying primitives.

## Risks & Open Questions

- Will the single-VM shape scale well enough for the poster's median customer, or will larger tenants push for HA inside their account and reintroduce the cluster problem?
- How does the installer handle customer-side networking restrictions (no public IPs, private-only subnets, customer-managed KMS) without becoming a bespoke consulting engagement?
- What is the recovery story if a customer's cloud credentials are rotated or the federated OIDC trust is revoked mid-upgrade?
- Is long-term vendor lock-in avoided by keeping the template open and auditable, or does the single-binary installer itself become a trust hurdle the customer's security team will not accept?
- The Databricks reversal is a single data point; the claim "k8s is wrong for BYOC" needs more corroborating examples before it is a market, not a manifesto.
