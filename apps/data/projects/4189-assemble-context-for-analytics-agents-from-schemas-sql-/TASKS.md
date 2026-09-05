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

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/4189-assemble-context-for-analytics-agents-from-schemas-sql-/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Implement Phase 1 (bootstrap): the dbt project reader, the warehouse schema introspector, the dashboards reader, the docs reader, the first-cut assembly, the per-claim evidence attacher, the unknowns-as-questions formatter, and the phase banner that names the stage and what it was reading.
- [ ] Implement Phase 2 (dispatch prep): the per-source normalisers, the per-source evidence attacher, the unknowns formatter, and the phase banner.
- [ ] Implement Phase 3 (docs search): the docs-source walker, the per-claim evidence confirmation, and the phase banner.
- [ ] Implement Phase 4 (emit): the Cassis ontology emit, the upload path (`cassis ontology upload --project project-id --no-publish`), the format pass (`cassis ontology fmt` writes `AGENTS.md` into the checkout).
- [ ] Wire the three review checkpoints as the seams between phases: bootstrap → dispatch prep (review the first-cut assembly); dispatch prep → docs search (review the prepared inputs); docs search → emit (review the evidence-attached assembly). Each checkpoint produces a review report.
- [ ] Register the kit as a Claude Code agent skill under `.claude-plugin/` so the kit loads as a skill by Claude Code, Antigravity, and any other agent that reads the skill format.
- [ ] Vendor `adapters/vendor/inventory.py` from `dbt-agent-readiness` (MIT) with its license and provenance beside the file, and document the re-vendoring workflow with a version pin to the upstream's release tag.
- [ ] Wire the run guarantee: no account, no key, no network at runtime; the one check that does call out (Cassis import-format validation) is a test of this repository, skipped in its own suite without a key, never a step in the user's run.
- [ ] Wire the bug-reporting contract: on failure, stop at the phase banner, keep the run directory, and surface the banner to the issue tracker. The issue template asks for the phase banner and the phase name.
- [ ] Build the fresh-clone test suite (`python3 -m pip install -r requirements-dev.txt` then `python3 tests/test_kit.py`) that runs on a fresh clone with no data and no environment variables, skipping rather than failing what it cannot run.
- [ ] Run an end-to-end test on a representative warehouse: bootstrap reads the dbt project + schema + dashboards + docs, dispatch prep prepares the inputs, docs search attaches evidence, emit produces a Cassis ontology, the three review checkpoints fire, `cassis ontology upload --no-publish` accepts the ontology, and `cassis ontology fmt` writes `AGENTS.md` without manual edits.

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Publish the Cassis-context-bootstrap GitHub Action workflow that runs the kit on a schedule and posts the assembly to the issue tracker with the phase banner
- [ ] Document the kit's honesty clause: no evaluation harness, no migration, the four checkpoints and the reports are how the user tells whether the ontology is good
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-31_
