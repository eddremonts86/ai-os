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

## Value Proposition

A kit that assembles a reviewable first version of an analytics agent's context from the dbt project, the warehouse schema, the dashboards, and the docs the warehouse already has. Every claim carries evidence; every unknown is filed as a question rather than invented. The kit produces a Cassis ontology the data team can review in Cassis with `cassis ontology upload --no-publish` before it becomes the agent's truth.

The kit's honesty clause is part of the value: it has no account, no key, and no network at runtime; it is not an evaluation harness; the four checkpoints and the reports are how the user tells whether the ontology is good. Vendored code (`adapters/vendor/inventory.py` from `dbt-agent-readiness`, MIT) carries its license and provenance beside the file. The output is already a Cassis ontology, so there is nothing to migrate.

**One-liner:** A kit that assembles a reviewable first version of an analytics agent's context from the dbt project, schema, dashboards, and docs the warehouse already has, with evidence attached and unknowns filed as questions.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Data teams building an analytics agent | Need a first version of the context document the agent can read, rather than four separate sources the agent has to reconcile. |
| Analytics engineers | Have dbt models, dashboard definitions, schema introspection, and scattered docs and want one reviewable assembly. |
| Data leads | Need to review what the agent will read before it becomes the agent's truth, with evidence attached and unknowns flagged. |
| Open-source contributors | Need a kit that runs on a fresh clone with no data of their own and no environment variables, so the contribution loop needs no setup. |
| Cassis users | Want a kit that produces an ontology they can upload with `--no-publish` and review before publishing. |

## Jobs To Be Done

1. **Functional job** — Assemble a reviewable first version of the analytics agent's context from the artefacts the warehouse already has, with evidence attached to every claim and unknowns filed as questions.
2. **Functional job** — Upload the resulting ontology to Cassis with `--no-publish` and review it in the Cassis UI before it becomes the agent's truth.
3. **Functional job** — Run the kit on a fresh clone with no data of the user's own and no environment variables, so the contribution loop and the bootstrap loop both need no setup.
4. **Emotional job** — Stop the feeling that the agent is going to ship an answer that is wrong because the conventions live in the heads of the people who have been there longest.
5. **Social job** — Be the data team whose agent's context was reviewed by the team that owns the warehouse, not invented by the team that built the agent.

## Success Metrics

- **Review-checkpoint coverage** — share of assemblies that passed through all four review checkpoints before becoming the agent's context. A checkpoint skipped is a signal the assembly bypassed the review.
- **Evidence-attached rate** — share of claims in the assembled ontology that carry evidence the reviewer can read. A claim without evidence is a question the reviewer answers in Cassis.
- **Unknown-as-question rate** — share of unknowns the kit cannot resolve that the kit files as questions rather than invents. A made-up answer is a bug; a filed question is a feature.
- **Phase-banner coverage on failure** — share of failed runs where the kit stopped at the phase banner, kept the run directory, and surfaced the banner to the issue tracker. A failure without a banner is a setup failure, not a kit failure.
- **Fresh-clone run rate** — share of runs that complete on a fresh clone with no data and no environment variables. A run that requires setup is a contribution-loop failure.
- **Cassis upload path coverage** — share of assemblies that upload to Cassis with `--no-publish` and pass the format pass (`cassis ontology fmt`) without manual edits. An assembly that needs hand-edits to upload is a Cassis-format drift.
- **Vendored-license-provenance coverage** — share of vendored files that carry their license and provenance beside the file. A vendored file without provenance is a license drift.

## Pricing & Monetization

The source names no fee, no tier, and no commercial plan. The kit is MIT on GitHub. The Cassis product is the surrounding service that keeps the ontology true as the warehouse moves; the source does not name a Cassis price. The kit's pricing is the open-source license; the Cassis product's pricing is named nowhere in the source and is not invented here. Any future monetization has to be measured against the review-checkpoint coverage and the Cassis upload path coverage, because those are the metrics the source ties to the kit's value proposition.

## Competitive Landscape

- **Hand-written context documents** — capture the conventions, but drift as the warehouse moves; nobody reviews them in a loop with the dbt project, the schema, the dashboards, and the docs at once.
- **Auto-generated documentation tools (the names the source does not provide)** — produce schema docs and dbt docs, but do not assemble the four sources into one reviewable ontology and do not file unknowns as questions.
- **Vector-store RAG over the warehouse** — answers questions the agent is asked, but the conventions are not in the retrieval index and the agent invents them on the fly.
- **Cassis itself** — keeps the ontology true as the warehouse moves; the kit is the bootstrap path that produces an ontology Cassis can keep true.

The post names no specific incumbent, so no further comparison is claimed here.

## Risks & Open Questions

- [ ] Confirm the four review checkpoints are the right cut for a "first version". The source names the checkpoints but does not name the four; the open question is which four the data team needs to review.
- [ ] Define the evidence-attached contract. The source says "evidence attached"; the open question is whether evidence is a link, a snippet, a hash, or a Cassis reference, and whether the reviewer can follow the evidence without re-running the kit.
- [ ] Validate the unknowns-as-questions rate is the right metric. The kit is explicit about filing unknowns as questions; the open question is whether a high rate is a kit-quality signal (the kit refuses to invent) or a kit-coverage signal (the kit is missing sources).
- [ ] Decide how the kit handles a dbt project that is itself broken (a model that does not compile, a metric that does not resolve). The kit reads the dbt project as a source; the open question is whether a broken dbt project is a phase-banner failure or an evidence-attached question.
- [ ] Establish a documented escalation path when a vendor upgrade breaks the vendored code. `adapters/vendor/inventory.py` is vendored from `dbt-agent-readiness` (MIT); the open question is how the kit picks up the upstream's fixes without manual re-vendoring.
- [ ] Confirm the Cassis ontology format stays stable across kit versions. The output is already a Cassis ontology; the open question is whether a Cassis format change is a kit release or a Cassis release that ships an import-format test the kit picks up.
- [ ] Define the policy on a run that completes on a fresh clone but the user has a real warehouse. The kit runs on a fresh clone with no data; the open question is whether the first run on a real warehouse is the kit's first test of the user's data and what the failure mode is.
