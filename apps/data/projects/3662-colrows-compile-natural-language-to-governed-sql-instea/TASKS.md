---
id: "3662"
slug: colrows-compile-natural-language-to-governed-sql-instea
title: Colrows – Compile natural language to governed SQL instead of guessing
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49482471"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [Python, FastAPI, Pydantic, SQLAlchemy, PostgreSQL, OpenAI Python SDK, DuckDB]
---
# Colrows – Compile natural language to governed SQL instead of guessing

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/3662-colrows-compile-natural-language-to-governed-sql-instea/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Define and publish the version-controllable semantic model format (tables, columns, joins, rules, sensitive columns) with Pydantic validation on load
- [ ] Build the structured-intent schema and the language-model extractor that turns a natural-language question into a structured intent
- [ ] Implement the deterministic resolver that emits SQLAlchemy expressions, with byte-identical output for identical inputs
- [ ] Enforce refusal: questions that cannot be resolved against the model are refused with an explanation of which element is missing or which rule blocks them
- [ ] Implement the warehouse adapter layer using SQLAlchemy, with at least one adapter beyond the default and a documented unsupported list
- [ ] Build the operator surface (CLI and/or web) for editing the semantic model, testing questions, and reviewing compiled SQL before execution
- [ ] Ship the golden question test harness runnable in CI so determinism and refusal claims are auditable, not asserted
- [ ] Enforce read-only by default: the compiler emits SELECTs; any write path is a separate opt-in feature
- [ ] Measure and publish compile determinism and refusal rate so the headline claims are anchored to numbers
- [ ] Document the semantic model review process so the format is something a data team can read in a PR

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-28_
