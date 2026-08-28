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

## Phase 0: Scaffold

- [x] Capture problem + write SPEC.md skeleton
- [ ] Decide licence (Apache 2.0 vs MIT — pick the one least likely to block adoption in vendor products)
- [ ] Set up repo: `src/infra_lang/` (parser, AST, backends), `examples/`, `tests/`, `docs/`
- [ ] Pin Python 3.11 in `pyproject.toml`, configure `uv` for dev install
- [ ] Wire GitHub Actions: ruff, mypy, pytest matrix on Linux + macOS
- [ ] First 5 example `.infra` files in `examples/` (web app, worker, db + cache, sidecar, cron)

## Phase 1: Core

- [ ] Lark grammar for the MVP resource set (container, service, volume, network, env, port, depends_on)
- [ ] Typed AST in `infra_lang/ast.py`
- [ ] Compose backend: emits `compose.yml`; tests run `docker compose config` on every example
- [ ] K8s backend: emits `Deployment` + `Service` + `ConfigMap`; tests run `kubectl --dry-run=client apply`
- [ ] Terraform backend: emits `*.tf` for the same resources; tests run `terraform validate`
- [ ] Helm backend: emits a chart with templates + `values.yaml`; tests run `helm template`
- [ ] `infra compile --target {k8s|compose|terraform|helm} --out {dir}` CLI
- [ ] Golden-file tests lock output for every example × every backend
- [ ] One docs page per backend showing the same example compiled side by side

## Phase 2: Deploy

- [ ] Publish to PyPI: `pip install infra-lang` works end to end
- [ ] GitHub release with annotated changelog
- [ ] MkDocs site published to GitHub Pages
- [ ] Show HN writeup with the four-output example as the lead image
- [ ] Add a "Known limitations" page so feature subset expectations are explicit
- [ ] Open 5 GitHub issues for the next backend (Pulumi, Nomad, AWS CDK) so contributors can pick up
