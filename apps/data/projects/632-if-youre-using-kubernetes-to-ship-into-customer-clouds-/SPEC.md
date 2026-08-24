---
id: "632"
slug: if-youre-using-kubernetes-to-ship-into-customer-clouds-
title: "if you’re using kubernetes to ship into customer clouds, you’re doing it wrong"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1voyt7f/if_youre_using_kubernetes_to_ship_into_customer/"
category: saas
date: "2026-08-15"
---
# if you’re using kubernetes to ship into customer clouds, you’re doing it wrong

## Problem
 k8s is genuinely great for what it was built for: large clusters, hundreds of nodes, multiple apps, a platform team owning it. BYOC is a completely different shape. you're pushing one app into each customer's environment, and if you lean on a full k8s cluster per customer for that, each customer ends up running its own kubernetes control plane just to host your one app. multiply that across a few hundred customers and you're keeping N control planes alive instead of one, and the ops load gets absurd. databricks publicly walked this back on GCP: GKE first, then back to VMs. im building alien dev around not repeating that. feedbacks? submitted by /u/alon-gubkin [link] [comments]

---

## Objective

The author is building "alien dev" around a thesis: when shipping a single application into a customer's cloud (BYOC), running a full Kubernetes control plane per customer is the wrong shape and explodes the ops load at scale. The post positions a build-in-public stance that explicitly contrasts with Databricks publicly walking back from GKE to VMs on GCP.

## Target Users

- Primary: engineering teams shipping software into customer-owned cloud accounts (BYOC / customer-hosted deployments) who are evaluating whether to put their app on a per-customer Kubernetes cluster.
- Secondary: platform / infra leads at companies already running k8s and looking at the multi-tenant BYOC pattern.
- Mentioned in the source: Databricks (used as a cautionary reference, not a customer — they walked GKE back to VMs on GCP).

## MVP Scope

Per the source:

- The product itself ("alien dev") is being built around NOT repeating Databricks' pattern.
- The author is asking for feedback on the build, not pitching an existing product.
- The implied deliverable is a single-app-per-customer deployment story that avoids N independent Kubernetes control planes.

No specific feature list, pricing, or release timeline is in the source.

## Design Direction

See `DESIGN.md` for this project's design tokens (Vercel-inspired: minimal, Inter / Geist Mono, black/white with a single accent).

## Constraints

- The author positions their build as explicitly *not* using k8s-per-customer — that is the design constraint, not a thing to be scoped.
- The Databricks reference is the only competitive signal in the source; no other named competitors.
- The post ends with "feedbacks?" — engagement is the explicit ask, not a signup CTA.
