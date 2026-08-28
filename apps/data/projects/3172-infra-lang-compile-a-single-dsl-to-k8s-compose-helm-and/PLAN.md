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

## Tech Stack

- **Language + parser:** Python 3.11 with `lark` (PEG parser) for the `.infra` grammar.
- **AST → backend:** typed Python AST; each backend is a small visitor that walks the AST and emits the target format.
- **YAML emission:** `ruamel.yaml` for round-trip stable output (preserves comments, key order).
- **HCL emission:** hand-written emitter; no HCL library worth trusting yet.
- **Helm emission:** Jinja2 templates for the chart, values produced via the YAML emitter.
- **CLI:** `click` for subcommand parsing, packaged with `pyproject.toml` and `uv` for distribution.
- **CI:** GitHub Actions matrix running `kubectl`, `docker compose`, `terraform`, `helm` validators on every example in the corpus.

## Architecture

```
.infra file ──▶ lark parser ──▶ typed AST ──▶ ┌─▶ K8s backend ──▶ ruamel.yaml ──▶ manifests
                                              ├─▶ Compose backend ──▶ ruamel.yaml ──▶ compose.yml
                                              ├─▶ Terraform backend ──▶ HCL emitter ─▶ *.tf
                                              └─▶ Helm backend ──▶ Jinja2 + ruamel.yaml ──▶ chart/
```

Each backend is a separate Python module under `infra_lang/backends/`. The AST is the contract: the parser only feeds it, only the backends consume it. Validation runs as a separate `infra validate` step that calls the target tool's own binary, not a re-implementation.

## Milestones

1. **M0 — Grammar freeze.** Lark grammar parses the MVP resource set (container, service, volume, network, env, port, depends_on) and a 20-example corpus. End of week 2.
2. **M1 — Compose backend.** Emit valid `compose.yml` that passes `docker compose config`. End of week 4.
3. **M2 — K8s backend.** Emit manifests that pass `kubectl apply --dry-run=client`. End of week 6.
4. **M3 — Terraform + Helm backends.** HCL passes `terraform validate`; Helm charts render with `helm template`. End of week 9.
5. **M4 — Public release.** README, examples repo, PyPI publish, Show HN writeup with the four-output side-by-side. End of week 12.

## Risks

- **Target feature parity creep.** Each backend has its own opinion of what a "service" is; choosing the intersection keeps the MVP small but means advanced features fall off. Document the supported subset per backend.
- **HCL emitter correctness.** Hand-writing an HCL emitter is fragile; regression tests must lock the output of every example against golden files.
- **Deterministic output.** YAML and HCL are both whitespace-sensitive; key ordering and quote style must be stable across runs to make diffs useful.
- **Grammar evolution.** Adding fields without breaking existing `.infra` files requires a versioning story before the first non-trivial user adopts it.
