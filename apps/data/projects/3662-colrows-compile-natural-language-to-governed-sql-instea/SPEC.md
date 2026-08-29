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

## Problem

The capture for this plan is a link (https://colrows.com/) and a title; there is no prose body, so the implementation details are unstated and have to be scoped honestly from the title alone.

The title is the whole thesis and is more precise than it first reads: compile natural language to governed SQL instead of guessing. The verb matters. "Compile" implies a deterministic translation against a known semantic model — the kind of work a type checker or a query planner does — rather than a free-form generation that hopes for the best. "Governed" implies there is an authority above the prompt: a semantic model that names which tables exist, what columns mean, which joins are legal, and which business rules apply. "Instead of guessing" is the explicit rejection of the alternative: a text-to-SQL model that produces plausible SQL with no underlying model of the warehouse, and therefore can (and does) invent columns that do not exist, join on relationships that are not in the schema, or quietly violate business rules because no rule was checked.

The capture does not name the supported warehouses, the semantic model format, the governance rules the system enforces, the prompt shape, or the operator surface. The plan scopes the shape from the title and treats the unsaid as design choices rather than facts.

## Objective

Ship a natural-language-to-SQL system that compiles a user question against a governed semantic model rather than generating free-form SQL, so the result is constrained by what the warehouse actually exposes and by the business rules the operator has declared.

## Target Users

- Analytics engineers and data teams who want non-technical users to ask questions of the warehouse without the free-form text-to-SQL failure modes (invented columns, illegal joins, rule violations).
- Business analysts who would rather ask in natural language than write SQL, and who need to trust that the answer respects the warehouse's actual schema.
- Data platform owners who need a governance layer above the warehouse — a place where the semantic model and the business rules are declared once and enforced everywhere.
- Operators responsible for correctness who would rather constrain generation up front than debug bad SQL after the fact.
- Auditors and reviewers who need to see what the system is allowed to do, and what it is not, in a form they can read.

## MVP Scope

- A governed semantic model format that names the tables, columns, joins, and business rules the warehouse exposes, with a human-readable schema a reviewer can audit.
- A compiler that takes a natural-language question plus the semantic model and emits SQL, with the SQL constrained to what the model declares rather than generated freely.
- A rule layer that enforces business rules: which tables can be joined, which columns are sensitive, which aggregations are allowed, which row-level filters are mandatory.
- A confidence or traceability surface so the operator can see which parts of the semantic model the compiler used to produce the SQL, and why.
- An operator surface (CLI or web) for editing the semantic model, testing questions, and reviewing compiled SQL before it runs against the warehouse.
- A warehouse adapter per supported warehouse so the same semantic model can target more than one backend.
- A documented reject path: questions that cannot be compiled against the model are refused with an explanation, rather than answered with a best-effort guess.
- A test harness with golden questions and expected SQL so the compiler's correctness is auditable, not asserted.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The capture is URL-only, so warehouse adapters, semantic-model format, and operator surface are scoped as plausible defaults rather than asserted as facts.
- "Compile" is a deterministic claim: the system must produce the same SQL for the same question against the same model, or the governance story is undermined.
- "Governed" means the semantic model is the authority, not the prompt; the compiler must refuse to emit SQL that references tables, columns, or joins the model does not declare.
- Business rules must be enforced by the compiler, not by convention; a reviewer should be able to read the model and see exactly what is and is not allowed.
- The system must reject questions it cannot answer, rather than producing a best-effort guess, because "instead of guessing" is the explicit thesis.
- The warehouse is read-only by default; the compiler emits SELECTs, and any write path is a separate, explicit feature.
- The semantic model has to be diffable and reviewable in version control, because governance that cannot be reviewed is not governance.
