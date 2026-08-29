---
id: "3697"
slug: helm-valuetrace-see-which-helm-values-source-actually-w
title: Helm ValueTrace – see which Helm values source actually won
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49483714"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [Python 3.10+, Helm 3 / Helm 4 plugin, POSIX shell installer, YAML parser]
---
# Helm ValueTrace – see which Helm values source actually won

## Phase 0: Scaffold

- [x] Capture problem from HackerNews (Show HN link + GitHub README) and write SPEC.md skeleton
- [ ] Define DESIGN.md tokens (CLI report colour palette, table column widths)
- [ ] Create Helm plugin layout: `plugin.yaml` + `valuetrace` Python entry point + `install-local.sh` / `uninstall-local.sh`
- [ ] Add `requirements.txt` (pinned) and a Python 3.10+ virtualenv hook in the installer
- [ ] Wire GitHub Actions `test.yaml`: Python 3.10 / 3.11 / 3.12 / 3.13 on Linux; Helm 3.21.4 and 4.2.4
- [ ] LICENSE (MIT), README mirroring the GitHub README, CHANGELOG starting at `v0.1.0`

## Phase 1: Core

- [ ] Argparse layer: positional `CHART`, repeated `-f/--values FILE`, repeated `--set KEY=VALUE`, `--only-overridden`, `--reference-values FILE`, `--strict-unknown`, `--strict-reference`, repeatable `--deny-source PATTERN`, `-o/--output table|json|yaml`, `--version`, `--help`
- [ ] YAML loader that retains line numbers for every node (ruamel.yaml or PyYAML hook)
- [ ] Layered merge engine: `chart/values.yaml` → each `-f` left-to-right (nested maps merge, later scalars / lists replace) → each `--set` (typed by Helm rules: `true`/`false`/`null`/base-10 integers typed; `yes`/`0123`/`1.0` strings)
- [ ] Helm 3 vs Helm 4 detection: `helm version --short`; apply Helm 4's "drop chart-default nulls" rule under Helm 4, Helm 3's "preserve them" under Helm 3
- [ ] Per-key `SOURCE` attribution: file path + YAML line, or `--set[n]`, plus full ordered `assignments` history
- [ ] `--only-overridden`: filter table to keys assigned ≥ 2 times
- [ ] Table output: columns `KEY`, `FINAL VALUE`, `SOURCE`, `ASSIGNMENTS`
- [ ] Unknown-key detection: union of chart-default and `--reference-values` keys; treat `podAnnotations: {}` and similar empty mappings as extensible
- [ ] Spelling suggestion: Levenshtein over known keys for unknown keys; hint only, never rewrite
- [ ] `--strict-unknown` and `--strict-reference`: exit `2` on hit
- [ ] `--deny-source PATTERN`: shell-glob match against path, resolved path, and basename; repeatable; exit `2` on hit
- [ ] JSON / YAML output: four top-level arrays — `values`, `unknown`, `missing`, `denied_sources`; warnings on stderr, report on stdout
- [ ] Exit codes: `0` clean, `1` usage error (missing chart, bad YAML, bad `--set`), `2` policy hit
- [ ] Helm 3 vs Helm 4 differential test: same chart + values files produce identical precedence table on both versions; null behaviour follows the invoking Helm version
- [ ] End-to-end test: a debug values file silently winning in `helm upgrade` is now visible in `helm valuetrace` and blocked by `--deny-source '*debug*'`

## Phase 2: Deploy

- [ ] Tag `v0.1.0` and publish release notes on GitHub
- [ ] Post Show HN (already happened 2026-08-28)
- [ ] Monitor GitHub issues for OCI / `.tgz` / `--set-string` requests; triage into v0.2 backlog
- [ ] Add a "Used in CI" recipe to README once the first external team publishes a workflow file using it
