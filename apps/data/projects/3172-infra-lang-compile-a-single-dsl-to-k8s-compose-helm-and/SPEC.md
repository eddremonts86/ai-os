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

## Problem

Developers and small platform teams who want a single source of truth for their infrastructure end up writing the same intent four times: a `docker-compose.yml` for local dev, Kubernetes manifests for staging, Helm values for production, and Terraform HCL for cloud provisioning. Each target uses a different syntax, has its own tooling, and drifts independently the moment a copy-paste goes stale. The poster built Infra Lang — a Python DSL — so that a single `.infra` file can be compiled into all four outputs from one definition.

## Objective

Ship a stable open source Python tool that parses a single `.infra` DSL and emits valid Kubernetes YAML, Docker Compose YAML, Terraform HCL, and Helm chart inputs from the same source, with deterministic output and a documented subset of each target's features.

## Target Users

- Primary: solo developers and small platform teams who run the same workload locally with Compose and in production on Kubernetes (with or without Helm) and are tired of maintaining four configs.
- Secondary: DevOps consultants who onboard client infra and want a portable "starter" that compiles to whatever the client's target stack is; open source contributors who prefer writing infrastructure once.

## MVP Scope

- The `.infra` language grammar supporting resources (containers, services, volumes, networks, basic cloud resources), env vars, port mappings, and dependency ordering.
- Compiler backends for Kubernetes manifests, Docker Compose, Terraform HCL, and Helm chart `values.yaml` + templates.
- A CLI: `infra compile path/to/file.infra --target k8s|compose|terraform|helm --out out/`.
- Round-trip tests: for a fixed corpus of `.infra` files, each backend's output must parse cleanly with the target tool's own validator (kubectl apply --dry-run, `docker compose config`, `terraform validate`, `helm template`).
- Out of scope: state management, drift detection, in-place upgrades, cloud-specific provider features beyond a small documented subset.

## Design Direction

The CLI is a single Python binary installed via `pip install infra-lang` or `uv tool install`. Output is human-readable YAML/HCL with deterministic ordering so two runs on the same input produce byte-identical files. The docs site is a single MkDocs site with one page per backend showing the same example compiled to all four targets side by side. No SaaS, no GUI.

## Constraints

- Single-file DSL must stay readable in a code editor — no required preprocessor step.
- Output for each backend must pass the target tool's own validation, not just our own.
- The tool must run on a developer laptop with no cloud credentials — cloud-provider features that require auth are deferred.
- Open source licence chosen so it can be vendored into other IaC projects; no GPLv3-only requirement that would block adoption in proprietary platforms.
