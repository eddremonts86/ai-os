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

## Tech Stack

- **Language:** Python 3.10+ (stdlib plus a small `requirements.txt` pinned in the repo; YAML parsing, glob handling, JSON output).
- **Runtime target:** Helm 3.21.4 and Helm 4.2.4 on Linux; the plugin shells out to the locally installed `helm` binary only to read its version, never to render or connect.
- **Packaging:** Helm plugin layout — a top-level `plugin.yaml` plus a `valuetrace` executable, installed into the directory reported by `helm env HELM_PLUGINS` via `install-local.sh`.
- **Installer:** POSIX `install-local.sh` (creates an isolated venv, installs requirements, registers the plugin) and matching `uninstall-local.sh`.
- **Testing:** `unittest` / `pytest` for the merge engine; CI workflow `test.yaml` runs automated Helm 3 / Helm 4 differential tests, strict-mode exit-code checks, multi-environment inputs, unknown-key cases, precedence mistakes, null coalescing, scalar typing, and structured-output validation.
- **Output formats:** `table` (default), `json`, `yaml`. Warnings on stderr; report on stdout.

## Architecture

The plugin is a thin Python entry point invoked by Helm. It receives the chart path, each `-f` file path, each `--set` argument, and any flags. It walks the chart's `values.yaml`, layers the user-supplied files left-to-right (nested maps merge, later scalars / lists replace), then layers the `--set` overrides (typed by Helm rules: `true` / `false` / `null` / base-10 integers are typed; `yes` / `0123` / `1.0` stay strings). At each step it records the source (file + YAML line, or `--set[n]`) so the report can attribute the final winner and every prior assignment. The result is a `dict` of flattened paths (`image.repository`, `replicaCount`) mapped to `{value, source, assignments}`. A separate pass diffs the key set against the chart's default `values.yaml` (or a `--reference-values` file) to populate `unknown` and `missing`. A `--deny-source` pass matches each supplied `-f` against the user patterns.

```
+-----------------------------+
| helm valuetrace ./chart \   |
|   -f prod.yaml -f dbg.yaml \ |
|   --strict-unknown \        |
|   --deny-source '*dbg*'     |
+-----------------------------+
                |
                v
+-------------------------------------------+
| Load chart/values.yaml + user -f files    |
| Parse --set args (typed where Helm types) |
| Layer per Helm 3 / Helm 4 null rules      |
+-------------------------------------------+
                |
                v
+-------------------------------------------+
| For each flattened key:                   |
|   - record final value + winning source    |
|   - record full assignment history        |
|   - classify as known / unknown / missing |
|   - match each -f against --deny-source   |
+-------------------------------------------+
                |
                v
+-------------------------------------------+
| Emit table | json | yaml                   |
| Exit 0 clean / 1 usage / 2 policy hit     |
+-------------------------------------------+
```

## Milestones

1. **M0 — Spec + plugin layout freeze.** `plugin.yaml`, `valuetrace` executable stub, `install-local.sh` green. End of week 1.
2. **M1 — Layered merge.** `values.yaml` + `-f` files + `--set`; supports nested maps, scalar / list replacement, Helm-typed scalars. End of week 3.
3. **M2 — Source attribution + table output.** Per-key `SOURCE` (file + line or `--set[n]`) and full assignment history; default `table` output. End of week 5.
4. **M3 — Helm 3 / Helm 4 null behaviour.** Detect invoking Helm version and apply the right coalescing rule. End of week 6.
5. **M4 — JSON / YAML output + unknown-key suggestions.** Structured output collections (`values`, `unknown`, `missing`, `denied_sources`); Levenshtein-style "did you mean" suggestions. End of week 7.
6. **M5 — Strict modes + `--deny-source`.** `--strict-unknown`, `--strict-reference`, repeatable `--deny-source PATTERN`; exit code `2` policy. End of week 8.
7. **M6 — Differential tests + Show HN.** Helm 3.21.4 vs 4.2.4 differential test green; tag `v0.1.0`; post Show HN (already happened 2026-08-28). End of week 9.

## Risks

- **Helm version drift.** A new Helm minor release could change null coalescing or `--set` typing. Mitigation: pin tested versions (3.21.4, 4.2.4) in CI; read the Helm version at runtime; treat any unrecognised major as Helm 3.
- **YAML line tracking.** The merge engine must report the exact line in the source file. Mitigation: load YAML with a loader that retains line numbers (ruamel.yaml or a custom PyYAML hook); test against a known fixture.
- **Unknown-key false positives.** Empty mappings such as `podAnnotations: {}` are documented as "extensible" so free-form child keys do not warn. Mitigation: explicit `is_extensible_mapping` rule in the key-validator; test coverage for `podAnnotations`, `nodeSelector`, and `tolerations`.
- **Sensitive values in reports.** The plugin prints final values to stdout verbatim. Mitigation: README warning, no report file is written unless redirected, plugin never uploads externally.
- **Out-of-scope features (OCI, `.tgz`, `--set-string`, etc.).** Teams on OCI-only workflows will hit the limit. Mitigation: explicit "Not supported in v0.1.0" section in the README; track requests for v0.2 backlog.
- **Installer portability.** POSIX shell script targets Linux. Mitigation: documented requirement; macOS works in practice because the script uses only POSIX features, but no automated macOS test in v0.1.0.
