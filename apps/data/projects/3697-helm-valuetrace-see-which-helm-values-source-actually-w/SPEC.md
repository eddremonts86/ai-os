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

## Problem

Helm's values-merging model is powerful — `chart/values.yaml` defaults, then every `-f` file left-to-right, then every `--set` override — but it is also invisible. When a deploy ships with the wrong image tag, the wrong replica count, or an unexpected feature flag, engineers must manually read each layer and reproduce Helm's merge order in their head to find the offending source. The author's tagline captures it: "Helm tells you what won. ValueTrace tells you where it came from." A debug values file accidentally applied last, a stale `--set` left over from an earlier debug session, a refactor that renamed a key from `image.repository` to `image.repostory` — all of these ship as production surprises because Helm has no built-in way to expose them. Abdulrehman Abulaban (x59lk) shipped a Show HN post on 2026-08-28 of a local, read-only Helm plugin (v0.1.0, MIT) that traces each final value back to the file and YAML line that supplied it, blocks unsafe CI paths, and compares configurations against a reference structure.

## Objective

Ship a Helm plugin (`helm valuetrace`) that, given a local unpacked chart and its values inputs, emits a report listing every final value alongside the file + line that won it, the full assignment history, and any policy violations. The MVP must (1) run locally without touching kubeconfig or any cluster, (2) exit non-zero (`2`) on policy violations so CI fails the build, (3) emit both human-readable tables and machine-readable JSON / YAML, and (4) detect misspelled / unknown keys against either the chart's `values.yaml` or a separately supplied `--reference-values` file.

## Target Users

- Primary: platform / DevOps engineers running Helm-based GitOps or CI pipelines who need to know, before `helm upgrade`, which file or `--set` produced each value in the rendered release.
- Secondary: SREs debugging a misbehaving release in production who need to reverse the merge and find the file that introduced a wrong value.
- Tertiary: security reviewers who want a `--deny-source` policy to keep debug values files, secret overlays, or experiment configs out of CI entirely.

## MVP Scope

- `helm valuetrace CHART [-f FILE]... [--set KEY=VAL]... [--only-overridden] [--reference-values FILE] [--strict-unknown] [--strict-reference] [--deny-source PATTERN]... [-o table|json|yaml]` command.
- Layered merge that mirrors Helm: `chart/values.yaml` → each `-f` left-to-right → each `--set`; nested maps merge, later scalars / lists replace.
- Helm 3 / Helm 4 awareness: detects the invoking Helm major version and applies the right YAML `null` behaviour (Helm 4 drops chart-default nulls, Helm 3 preserves them).
- Output: table with columns `KEY`, `FINAL VALUE`, `SOURCE`, `ASSIGNMENTS`; structured JSON / YAML with `values`, `unknown`, `missing`, `denied_sources` arrays.
- Strict modes: `--strict-unknown` and `--strict-reference` exit `2`; `--deny-source PATTERN` matches exact filenames and shell-style globs against supplied paths and exit `2` on hit.
- Unknown-key spelling suggestions (Levenshtein-style "did you mean …") without rewriting configuration.
- Local installer (`install-local.sh`) that copies the plugin into the Helm plugin directory, sets up an isolated Python venv, and verifies `helm plugin list` sees it.
- Tested with Helm 3.21.4 and Helm 4.2.4 via automated differential tests; Python 3.10–3.13 on Linux.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Strictly local and read-only: no Kubernetes API access, no `kubeconfig` requirement, no chart or values file mutation, no external upload of chart data.
- Local unpacked chart directories only in v0.1.0 — remote / OCI chart references, packaged `.tgz` charts, chart dependencies, full subchart coalescing, `values.schema.json`, template rendering, `--set-string` / `--set-file` / `--set-json` / `--set-literal`, and array-index expressions (`servers[0].port`) are all explicitly out of scope and listed under "Not supported".
- POSIX shell installer (Linux-first); CI matrix is Linux.
- Final values can contain secrets: the README explicitly warns "do not publish reports containing secrets or proprietary configuration", and the plugin does not write a report file unless the user redirects output.
- The plugin is shipped as the repository only — no demo charts, training labs, or deployment scenarios are bundled; screenshots reference an external `atlas-platform` chart and `scenarios/` folder that are not in the repo.
