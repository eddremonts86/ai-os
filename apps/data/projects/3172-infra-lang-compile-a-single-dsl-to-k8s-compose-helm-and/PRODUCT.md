---
id: "3172"
slug: infra-lang-compile-a-single-dsl-to-k8s-compose-helm-and
title: "Infra Lang – Compile a Single DSL to K8s, Compose, Helm and Terraform"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49455100"
category: show-hn
date: "2026-08-26"
tags: [Show HN, DevOps, IaC, DSL, Open Source]
tech: [Python 3.11, Lark (PEG parser), Jinja2, ruamel.yaml, click, GitHub Actions]
---
# Infra Lang – Compile a Single DSL to K8s, Compose, Helm and Terraform

## Value Proposition

Write your containers, services, volumes, and dependencies once in a Pythonic DSL and compile to Kubernetes YAML, Docker Compose, Terraform HCL, or Helm chart inputs with a single CLI invocation, so the four configs that always drift apart stay locked to one source.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Solo / small-team developers | Maintain the same app locally and in prod without writing Compose + K8s + Helm + Terraform by hand. |
| Platform / DevOps consultants | One starter repo that compiles to whichever target the client uses. |
| Open source project maintainers | Ship a `docker-compose.yml` and a K8s manifest from a single source so users pick their poison. |

## Jobs To Be Done

1. **Functional job** — Describe a workload once and get valid manifests for every deployment target without copy-pasting.
2. **Emotional job** — Stop the dread of "which config did I forget to update" when a port or env var changes.
3. **Social job** — Make the project's infra reviewable as a single file rather than a maze of overlapping YAMLs.

## Success Metrics

- **Round-trip validity:** every emitted K8s manifest passes `kubectl --dry-run=client apply`, every Compose file passes `docker compose config`, every Terraform file passes `terraform validate`, every Helm chart renders with `helm template`.
- **Drift proof:** changing one field in a `.infra` source produces a one-line diff in each backend's output.
- **Adoption signal:** at least 5 external `.infra` files in the wild with reports of compiling cleanly to all four targets.

## Competitive Landscape

- **Dagger** — closer to a CI/CD SDK than an infra DSL; targets the "build/test/deploy" pipeline, not a config compiler.
- **Pulumi / CDK** — require writing in a general-purpose language; emit one target at a time.
- **Kustomize + Compose** — each side still hand-written; no shared source.
- **Helm alone** — single-target; no Compose / Terraform output.

## Risks & Open Questions

- [ ] Feature subset drift — every backend has thousands of fields; choosing what to support is a permanent negotiation.
- [ ] DSL evolution risk — adding features without breaking existing `.infra` files requires a versioning story.
- [ ] Cloud provider breadth — Terraform covers AWS, GCP, Azure; staying neutral across all three is a sustained effort.
- [ ] No drift detection in v1 — out of scope, but community will ask.

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49455100) · **Category:** show-hn · **Tags:** Show HN,DevOps,IaC,DSL,Open Source
