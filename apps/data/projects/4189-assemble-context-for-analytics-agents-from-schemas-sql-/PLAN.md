---
id: "4189"
slug: assemble-context-for-analytics-agents-from-schemas-sql-
title: "Assemble context for analytics agents from schemas, SQL and docs"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49509733"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Assemble context for analytics agents from schemas, SQL and docs

## Tech Stack

- **Python 3** as the runtime, matching the source's `python3 -m pip install -r requirements-dev.txt` and the test suite's `python3 tests/test_kit.py` entry point.
- **dbt project readers** (the upstream `dbt-agent-readiness` library, vendored under `adapters/vendor/inventory.py` with its MIT license and provenance beside the file) to read the dbt project as a source.
- **Warehouse schema introspection** for the live schema the kit reads alongside the dbt project.
- **Dashboard definitions** as a third source (the dashboard tool's export format the source does not name).
- **Docs sources** as a fourth source (Markdown docs in the repo, wiki exports, anything the data team has already written).
- **A Claude Code agent skill registration** under `.claude-plugin/` so the kit can be loaded as a skill by Claude Code, Antigravity, and any other agent that reads the skill format.
- **Cassis CLI** as the upload path: `pip install cassis-cli`, then `cassis ontology upload --project project-id --no-publish` for review and `cassis ontology fmt` for the format pass that writes `AGENTS.md` into the checkout.
- **GitHub Actions** for CI (the source has `.github/workflows/Cassis context bootstrap`).
- **MIT license** for distribution, matching the source's LICENSE file.

## Architecture

The kit has four phases and three review checkpoints. The phases do the work; the checkpoints are the places a human reviews the assembly before it becomes the agent's context. The kit has no account, no key, and no network at runtime; the one check that does call out (validating the emitted tree against the Cassis import format) is a test of this repository, skipped in its own suite without a key, and never a step in the user's run.

Phase 1 (bootstrap) reads the dbt project, the warehouse schema, the dashboards, and the docs the warehouse already has, and produces a first-cut assembly. The assembly names the tables, columns, metrics, joins, and conventions; evidence attaches to every claim; unknowns file as questions. This is the phase that fails most often on a fresh clone with no data, and the source's bug-reporting contract ("stop at the phase banner, keep the run directory, and open an issue with the banner and the phase name") is built around this phase.

Phase 2 (dispatch prep) takes the first-cut assembly and prepares the inputs the kit's emit phase needs. The source calls this dispatch prep; the open question is what it specifically dispatches (likely per-source normalisers, the per-source evidence attacher, and the unknowns-as-questions formatter).

Phase 3 (docs search) walks the docs sources the data team already has and attaches evidence to the assembly's claims that the docs can confirm. This is the phase that runs the longest on a real warehouse; the phase banner is the bug-reporting anchor.

Phase 4 (emit) produces the Cassis ontology. The output is already a Cassis ontology, so the upload path is `cassis ontology upload --no-publish` and the format pass is `cassis ontology fmt` writing `AGENTS.md` into the checkout. The emit phase is the one place the kit produces an artefact the user ships.

The three review checkpoints are the seams between phases. Checkpoint 1 is between bootstrap and dispatch prep (review the first-cut assembly); Checkpoint 2 is between dispatch prep and docs search (review the prepared inputs); Checkpoint 3 is between docs search and emit (review the evidence-attached assembly). The four checkpoints the source names are likely Checkpoint 0 (the run contract — what the kit is reading) and the three checkpoints above; the source is explicit that "the four checkpoints and the reports are how you tell" whether the ontology is good, not the kit's own evaluation.

The kit's honesty clause is structural: no account, no key, no network at runtime, no evaluation harness, no migration. The kit produces an ontology Cassis can keep true; Cassis is the surrounding service the kit does not provide.

## Milestones

1. **M1 — Phase 1 (bootstrap)** — the dbt project reader, the schema introspector, the dashboards reader, the docs reader, the first-cut assembly, the per-claim evidence attacher, the unknowns-as-questions formatter, the phase banner.
2. **M2 — Phase 2 (dispatch prep)** — the per-source normalisers, the per-source evidence attacher, the unknowns formatter; the phase banner.
3. **M3 — Phase 3 (docs search)** — the docs-source walker, the per-claim evidence confirmation, the phase banner.
4. **M4 — Phase 4 (emit)** — the Cassis ontology emit, the upload path (`cassis ontology upload --no-publish`), the format pass (`cassis ontology fmt` writes `AGENTS.md`).
5. **M5 — Three review checkpoints** — the seams between phases, the review surfaces, the reports the checkpoints produce.
6. **M6 — Agent-skill registration** — the `.claude-plugin/` registration so the kit can be loaded as a skill by Claude Code and compatible agents.
7. **M7 — Vendored-code maintenance** — `adapters/vendor/inventory.py` from `dbt-agent-readiness` (MIT) with its license and provenance beside the file, the re-vendoring workflow.
8. **M8 — Fresh-clone test suite and bug-reporting contract** — `python3 -m pip install -r requirements-dev.txt` and `python3 tests/test_kit.py` on a fresh clone with no data and no environment variables; the issue template that asks for the phase banner and the phase name.

## Risks

- **Phase-banner failure on first run** — the first run on a real warehouse fails at Phase 1 and the user does not have the run directory or the banner. Mitigation: the kit keeps the run directory on every failure; the bug-reporting contract is documented in the README and the issue template.
- **Unknowns-as-questions rate too high** — the kit files too many questions and the data team has to answer them in Cassis before the agent ships. Mitigation: the kit is honest about coverage; a high rate is a signal the sources are missing, not a kit-quality failure.
- **Evidence attacher drift** — evidence links rot, snippets go stale, hashes no longer match. Mitigation: the evidence attacher records the source's last-updated timestamp and the kit re-runs detect drift and re-attach.
- **Vendored-code upstream divergence** — `dbt-agent-readiness` ships a fix the kit does not pick up because the vendored file is stale. Mitigation: the re-vendoring workflow is documented; the kit ships a version pin to the upstream's release tag.
- **Cassis format drift** — the kit produces an ontology that no longer passes `cassis ontology fmt` because the Cassis format changed. Mitigation: the Cassis format check is the test of this repository, skipped in its own suite without a key; a Cassis format release ships the import-format test the kit picks up.
- **Review-checkpoint bypass** — the data team skips a checkpoint and the kit ships an unreviewed ontology. Mitigation: the checkpoints are the seams between phases; the kit does not advance without the review surface, and the surface is documented.
- **Fresh-clone drift** — the test suite requires user data or environment variables that the contribution loop does not have. Mitigation: the suite skips rather than fails what it cannot run on a fresh clone; the README is explicit about the suite's scope.
