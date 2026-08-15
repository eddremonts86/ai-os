---
id: "632"
slug: if-youre-using-kubernetes-to-ship-into-customer-clouds-
title: "if you’re using kubernetes to ship into customer clouds, you’re doing it wrong"
status: draft
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

_Not written yet — `ai-os plans enrich` fills this section._

## Target Users

_Not written yet — `ai-os plans enrich` fills this section._

## MVP Scope

_Not written yet — `ai-os plans enrich` fills this section._

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

_Not written yet — `ai-os plans enrich` fills this section._
