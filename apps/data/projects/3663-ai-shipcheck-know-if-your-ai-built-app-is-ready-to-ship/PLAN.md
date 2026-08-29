---
id: "3663"
slug: ai-shipcheck-know-if-your-ai-built-app-is-ready-to-ship
title: AI Shipcheck – know if your AI-built app is ready to ship
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49482469"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [Python, Typer CLI, Playwright (Python), tree-sitter, Semgrep, Docker, GitHub Actions]
---
# AI Shipcheck – know if your AI-built app is ready to ship

## Tech Stack

- **Python with a Typer CLI** for the entry point and the report output, because Python's library ecosystem covers the check categories (parsing, static analysis, security scanning) and Typer gives a clean CLI surface.
- **Playwright (Python)** for any runtime checks that need to drive a real browser against a built app, because some AI-introduced gaps only show up in a running app.
- **tree-sitter** for source parsing across the supported languages, so the checker can do structural checks without re-implementing per-language parsers.
- **Semgrep** (or a comparable static analysis engine) for the security and error-handling check categories, because the rule ecosystem is broader than what the project can author in-house.
- **Docker** for the runtime environment of the checker, so a CI integration is reproducible and the user does not have to manage Python versions per repo.
- **GitHub Actions** as the canonical CI integration, with the exit code and output format designed to work in other CI systems as well.
- **A structured report format (JSON or SARIF)** for the findings, so the output is consumable by other tools and not just a wall of text.

## Architecture

The checker is a CLI that takes a repository (or a directory) and runs a battery of checks against it, then emits a structured report and a CI-friendly exit code. The checks are organized into categories that map to the AI-introduced failure modes the buyer cares about: test coverage, security, error handling, deployment readiness, dependencies. Each category is a separate check module so the project can grow one category at a time and the user can run a subset.

Each finding carries three things: the severity (high/medium/low), the path to fix (a concrete suggestion or a doc link), and a stable identifier so the same finding is reported the same way across runs. The report ranks findings by severity and surfaces the top items first, so the user does not drown in noise; the wall of text is a failure mode, not a default.

Static checks use tree-sitter for source parsing and Semgrep for the rule-driven checks (security, error handling). Runtime checks (where a built app is available) use Playwright to drive a browser and surface runtime-visible gaps: missing health endpoints, broken navigation, console errors that did not surface during dev. The runtime checks are opt-in because not every repo has a buildable app at audit time, and forcing the user to build first would defeat the "quick pre-ship audit" use case.

The CLI is local-execution by default. The code does not leave the user's machine; the report is emitted to stdout and to a file. A CI integration is a documented GitHub Actions workflow plus the exit-code contract; the same contract works in other CI systems because the exit code is the contract, not the workflow file. The architecture treats false positives as a first-class metric: every check has a documented precision target, and noisy checks are tuned or removed rather than left to drown the report.

The report is honest about scope. Every check has a "what this looks for / what this does not" page, and the top-level report names the categories that were run and the categories that were skipped. Overpromising coverage is the headline failure mode of any audit tool, so the project publishes its scope rather than implying universality.

## Milestones

1. **M1 — CLI scaffold and report format** — the Typer CLI, the JSON/SARIF output, and the CI exit-code contract.
2. **M2 — Test-coverage check** — structural coverage analysis with tree-sitter, surfacing untested paths.
3. **M3 — Security check** — Semgrep-backed rules for the AI-introduced security gaps (hard-coded secrets, missing input validation, unsafe dependencies).
4. **M4 — Error-handling check** — Semgrep-backed rules for uncaught exceptions, swallowed errors, missing error paths.
5. **M5 — Deployment-readiness check** — Dockerfile, env vars, health checks, database migrations.
6. **M6 — Dependency check** — vulnerable and unmaintained packages in the dependency tree.
7. **M7 — Runtime checks (opt-in)** — Playwright-driven checks against a built app for gaps that only show at runtime.
8. **M8 — Severity ranking and report ranking** — documented severity criteria and a report that surfaces the top items first.
9. **M9 — Documented scope** — a per-check "what this looks for / what this does not" page, and a top-level scope statement.

## Risks

- **Noisy reports** — a wall of findings defeats the audit; severity ranking and per-check precision targets are first-class concerns.
- **Overpromising coverage** — implying the checker covers everything when it covers some things; documented scope per check is the defense.
- **False positives** — every check has a precision target; noisy checks are tuned or removed rather than left in.
- **AI-specific drift** — AI tools change; the failure modes the checker targets have to be kept current with what AI assistants actually introduce.
- **Runtime check fragility** — Playwright-driven runtime checks can be flaky; opt-in by default and tunable per environment.
- **CI integration drift** — CI platforms change; the exit-code contract is the contract, not the workflow file, so other CI systems can adopt it.
- **Local-execution assumption** — some users will want a hosted version; local is the architectural commitment, not a feature gap.
