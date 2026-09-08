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

## Problem

Analytics agents that answer questions about a warehouse need a context document that names the tables, the columns, the metrics, the joins, and the conventions the data team has accumulated. Most teams do not have that document; the conventions live in dbt models, in dashboard definitions, in schema introspection, and in the heads of the people who have been there longest. The Cassis `ontology-bootstrap` kit turns the artefacts a warehouse already has — the dbt project, the schema, the dashboards, the docs — into a reviewable first version of that context document, with evidence attached and unknowns filed as questions rather than invented.

The source is the GitHub repository for `GetCassis/ontology-bootstrap`, an MIT-licensed Python kit. The README states the four phases and the three review checkpoints. Phases: bootstrap, dispatch prep, docs search, emit. Checkpoints: the four places a human reviews the assembly before it becomes the agent's context. The kit ships with `adapters/vendor/inventory.py` vendored from `dbt-agent-readiness` (MIT, with its license and provenance beside it) and runs on a fresh clone with no data of the user's own and no environment variables, skipping rather than failing what it cannot run.

The ontology produced by the kit is a snapshot of what the warehouse means today. The source is explicit that warehouses move: a column changes meaning, a metric gains an exception, a definition turns out to be wrong the first time somebody asks a question it cannot answer. Keeping that context true as the warehouse moves is what the Cassis product does; the kit's output is already a Cassis ontology, so `cassis ontology upload --project project-id --no-publish` lets the data team review the ontology in Cassis before it ships.

The source names the actor (a data team building an analytics agent), the pain (no first version of the context document the agent can read), and the missing thing (a reviewable assembly from the artefacts the warehouse already has, with unknowns filed as questions, not invented). It does not name a specific warehouse, a specific dbt project, or a specific dashboard tool.

## Objective

Build a kit that assembles a reviewable first version of an analytics agent's context from the dbt project, the schema, the dashboards, and the docs the warehouse already has — with evidence attached to every claim and unknowns filed as questions — and produces a Cassis ontology the data team can review in Cassis before it becomes the agent's truth.

## Target Users

- Data teams building an analytics agent who need a first version of the context document that names the tables, columns, metrics, joins, and conventions the agent can read.
- Analytics engineers who have dbt models, dashboard definitions, schema introspection, and scattered docs and want one reviewable assembly rather than four separate sources.
- Data leads who need to review what the agent is going to read before it becomes the agent's truth, with evidence attached and unknowns flagged.
- Open-source contributors who need a kit that runs on a fresh clone with no data of their own and no environment variables, so the contribution loop needs no setup.
- Cassis users who want a kit that produces an ontology they can upload with `cassis ontology upload --no-publish` and review before publishing.

## MVP Scope

- A Python kit, registered as a Claude Code agent skill, that assembles an analytics-agent context document from the dbt project, the warehouse schema, the dashboards, and the docs the warehouse already has.
- Four phases — bootstrap, dispatch prep, docs search, emit — each with a phase banner the source names explicitly ("stop at the phase banner, keep the run directory, and open an issue with the banner and the phase name" is the source's bug-reporting contract).
- Three review checkpoints — the places a human reviews the assembly before it becomes the agent's context — with the source describing them as "how you tell" whether the ontology is good.
- An `adapters/vendor/inventory.py` vendored from `dbt-agent-readiness` (MIT), with the license and provenance beside the file.
- A test suite that runs on a fresh clone with no data of the user's own and no environment variables, skipping rather than failing what it cannot run.
- A run guarantee: no account, no key, and no network at runtime. The one check that does call out (validating the emitted tree against the Cassis import format) is a test of this repository, skipped in its own suite without a key, and never a step in the user's run.
- An output that is already a Cassis ontology, with `cassis ontology upload --project project-id --no-publish` as the review path and `cassis ontology fmt` writing `AGENTS.md` into the checkout.
- A "no evaluation harness" honesty clause: the kit cannot tell the user whether the ontology is good; the four checkpoints and the reports are how the user tells.
- An issue-tracking policy the source states explicitly: issues are on, best-effort, no SLA; if a run fails, stop at the phase banner, keep the run directory, and open an issue with the banner and the phase name.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The kit has no account, no key, and no network at runtime. A run that calls out is a bug.
- The kit cannot tell the user whether the ontology is good. The kit is an assembly path, not an evaluation harness; the four checkpoints and the reports are how the user tells.
- The output is a Cassis ontology already. There is nothing to migrate; the upload path is `cassis ontology upload --no-publish` and the format pass is `cassis ontology fmt`.
- A run that fails stops at the phase banner, keeps the run directory, and opens an issue with the banner and the phase name. The banner names the stage and what it was reading, which is most of the diagnosis.
- Unknowns are filed as questions, not invented. The kit attaches evidence to every claim; the questions the kit cannot answer are the questions the data team answers in Cassis.
- Vendored code carries its license and provenance beside the file. `adapters/vendor/inventory.py` is vendored from `dbt-agent-readiness` (MIT) and the README names the upstream.
- The test suite skips rather than fails what it cannot run on a fresh clone. A test that requires the user's data is a setup failure, not a test failure.
- The kit is a snapshot. Keeping the ontology true as the warehouse moves is the Cassis product's job, not the kit's.
