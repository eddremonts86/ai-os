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

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

For software vendors that ship into customer-owned clouds, alien dev proposes a deployment shape that does not multiply the ops surface by the number of customers — by not running a full Kubernetes control plane per customer the way many current BYOC setups do.

**One-liner:** A BYOC deployment shape that avoids N independent Kubernetes control planes.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Engineering team at a BYOC SaaS | Currently scaling a k8s-per-customer pattern; ops load grows linearly with customers. |
| Platform / infra lead | Evaluating whether k8s-per-customer is the right primitive for a single app per environment. |
| Investors / observers of alien dev | Watching the build-in-public for whether the alternative shape is viable. |

## Jobs To Be Done

1. **Architectural reframe** — Convince the reader that "one k8s cluster per customer for a single app" is the wrong unit, not just the wrong technology.
2. **Pattern seeding** — Provide a non-k8s alternative that is a credible drop-in for BYOC.
3. **Build-in-public feedback** — Surface the design early enough that operators and infra engineers can push back ("feedbacks?").

## Success Metrics

- The post does not name metrics. The implicit success criteria are (a) feedback signal from infra operators in the comments and (b) continued forward progress on the alien dev build.
- The single quantitative claim in the source is the operational argument: each customer is currently running its own k8s control plane, and at "a few hundred customers" the ops load becomes "absurd".

## Pricing & Monetization

Not stated. The post is a build-in-public statement, not a launch.

## Competitive Landscape

- **Databricks on GCP** — cited as a public precedent that walked GKE back to VMs. This is the explicit comparison the author is positioning against.
- **k8s-per-customer BYOC (general pattern)** — named as the wrong shape, but no specific vendor or tool is called out.

---

_Source:_ [Reddit r/SaaS](https://www.reddit.com/r/SaaS/comments/1voyt7f/if_youre_using_kubernetes_to_ship_into_customer/) · **Posted:** 2026-08-15T09:56:29+00:00
