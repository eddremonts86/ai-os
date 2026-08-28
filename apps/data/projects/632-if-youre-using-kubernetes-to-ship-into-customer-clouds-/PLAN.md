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

## Tech Stack

The source names one cloud (GCP, via the Databricks reference) and one platform that the author is moving away from (Kubernetes / GKE). The alternative stack for alien dev itself is not specified.

## Architecture

Inferred from the post:

```
        many customers, each with their own cloud account
        ─────────────────────────────────────────────────
        WITHOUT alien dev:     one k8s control plane per customer
        WITH    alien dev:     single app per customer, no per-customer control plane
```

The author's argument is structural: a per-customer k8s control plane for a single app multiplies the ops surface (patching, upgrades, version skew, control-plane outages) by the number of customers. The alternative shape — not detailed in the post — is whatever alien dev actually is, which the author is soliciting feedback on.

## Milestones

1. **Publish the architectural stance** — this post, framing the k8s-per-customer BYOC pattern as the wrong unit.
2. **Define and ship the alien dev alternative** — the actual deployment shape (not specified in the source).
3. **Validate the alternative against a BYOC customer** — implied by the "feedbacks?" ask, which targets infra operators who have lived through the k8s-per-customer problem.
4. **Build in public** — continue posting build-in-public updates; no timeline is given.

## Risks

- **Premature anti-k8s framing.** The author acknowledges k8s is "genuinely great for what it was built for" — the risk is alien dev reads as a generic k8s takedown instead of a specific shape critique, and operators dismiss it.
- **The Databricks precedent is the only one cited.** The post leans on a single public walk-back; if that turns out not to generalise, the central argument weakens.
- **No alternative is specified.** The post critiques the current shape but does not describe the alien dev alternative in detail, so a reader cannot evaluate it on its own merits yet.
