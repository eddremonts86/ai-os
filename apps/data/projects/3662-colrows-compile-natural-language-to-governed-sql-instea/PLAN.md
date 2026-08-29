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

## Tech Stack

- **Python with FastAPI** for the compiler service and the operator API, because the semantic model and the rule layer are most naturally expressed in Python and the FastAPI/Pydantic combo gives a typed boundary.
- **Pydantic** for the semantic model schemas and the request/response shapes, so the model is validated on load and a malformed rule fails before a compile runs.
- **SQLAlchemy** as the SQL builder target, so the compiled SQL goes through a well-known Python SQL toolkit rather than string concatenation, and the warehouse adapters are pluggable.
- **PostgreSQL** as the default warehouse for development and one of the supported adapters, so the system has a real warehouse to compile against in CI.
- **OpenAI Python SDK** (or a swappable LLM client) as the language-model component that turns the natural-language question into a structured intent the compiler resolves against the model.
- **DuckDB** for fast local compilation tests so the test harness does not need a live warehouse for every golden question.
- **A version-controllable semantic model file format** (YAML or JSON) that names tables, columns, joins, and rules, and is the single source of truth the compiler enforces.

## Architecture

The compiler is the heart of the system and it is structured as a pipeline with a deterministic middle. The natural-language question enters; a language-model component extracts a structured intent (which tables, which columns, which filters, which time range, which aggregations); the structured intent is resolved against the semantic model by a deterministic resolver; the resolver emits SQLAlchemy expressions that compile to dialect-specific SQL; the SQL is run against the warehouse adapter.

The structured-intent step is the only non-deterministic part. Everything after it is deterministic against the model, which is the architectural commitment of "compile". Two identical questions against the same model produce byte-identical SQL; two different questions can produce different SQL only if the structured intent is different; the structured intent is recorded so an operator can audit what the compiler did.

The semantic model is the authority. It declares the tables and columns the warehouse exposes, the legal joins, the sensitive columns, the row-level filters that are mandatory, and the business rules. The resolver refuses to emit SQL that references anything not declared in the model, refuses joins not declared as legal, and applies the mandatory row-level filters by construction. Questions that cannot be resolved against the model are refused with an explanation, not answered with a guess; this is the explicit thesis of "instead of guessing".

The operator surface is where the governance lives. The semantic model is a file in version control, edited by the data team, diffed in PRs, and loaded by the compiler at startup (or on a reload signal). The operator can test a natural-language question against the model and see the compiled SQL before it runs against the warehouse; this is the audit trail. The warehouse adapter is per-backend: SQLAlchemy gives a unified Python SQL surface, but each adapter knows the dialect quirks (quoting, type coercion, supported aggregations) so the compiled SQL runs without surprises.

The system is read-only by default. The compiler emits SELECTs; any write path is a separate, explicit feature gated behind configuration the operator has to opt into, because governance is about what the system is allowed to do, and "allowed to mutate the warehouse" is a different answer from "allowed to read the warehouse". The golden question test harness ships with the project so correctness is auditable, not asserted.

## Milestones

1. **M1 — Semantic model format** — a version-controllable schema for tables, columns, joins, rules, and sensitive columns; Pydantic-validated on load.
2. **M2 — Intent extractor** — the language-model step that turns a natural-language question into a structured intent, with the structured intent schema published.
3. **M3 — Deterministic resolver** — the middle of the pipeline that resolves the intent against the model and emits SQLAlchemy expressions; byte-identical output for identical inputs.
4. **M4 — Refusal path** — questions that cannot be resolved are refused with an explanation of which model element is missing or which rule blocks them.
5. **M5 — Warehouse adapters** — at least one adapter beyond the default, with dialect-specific quirks handled, and a documented unsupported list.
6. **M6 — Operator surface** — CLI and/or web UI for editing the model, testing questions, and reviewing compiled SQL before execution.
7. **M7 — Golden question harness** — a test suite of natural-language questions with expected SQL, runnable in CI, that backs the determinism and refusal claims.
8. **M8 — Read-only enforcement** — the compiler emits SELECTs by default; any write path is a separate opt-in feature.

## Risks

- **Non-deterministic compilation** — if the same question against the same model can produce different SQL on different runs, the governance story is undermined; the resolver has to be byte-deterministic and the test harness has to assert it.
- **Model incompleteness** — a semantic model that does not cover the warehouse exposes the system to the same failure modes it claims to fix; coverage has to be measured and published.
- **Intent extraction drift** — the language-model step can be inconsistent; the structured-intent schema has to be tight enough that drift is visible.
- **Refusal-as-failure perception** — a high refusal rate can read as the system being unhelpful, even when the refusals are correct; the explanation surface has to make the refusal legible.
- **Write-path creep** — a "just add UPDATE" feature is an attractive scope creep; read-only by default has to be defended as a governance property, not a missing feature.
- **Warehouse dialect drift** — every warehouse has quirks the adapter has to absorb; the adapter has to handle them or the compiled SQL fails at runtime.
- **Semantic model review fatigue** — a model that is too verbose or too noisy will stop being reviewed; the format has to be readable in a PR.
