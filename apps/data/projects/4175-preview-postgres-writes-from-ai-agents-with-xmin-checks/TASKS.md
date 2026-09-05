---
id: "4175"
slug: preview-postgres-writes-from-ai-agents-with-xmin-checks
title: Preview Postgres writes from AI agents with xmin checks (pg-dry-run)
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49510746"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Preview Postgres writes from AI agents with xmin checks (pg-dry-run)

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/4175-preview-postgres-writes-from-ai-agents-with-xmin-checks/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Bind Postgres's parser (via `pg-query-emscripten` or the same node binding) so the library parses exactly what Postgres parses rather than a hand-rolled grammar.
- [ ] Implement the per-shape refusal table: DDL, data-modifying CTEs, `WITH`, `INSERT ... SELECT`, both forms of `ON CONFLICT`, `UPDATE ... FROM`, `DELETE ... USING`, writes to generated columns, writes against tables without a primary key, and updates/deletes without a `WHERE`.
- [ ] Implement the equivalent-read rewrite for `UPDATE` and `DELETE`: copy the predicate as an untouched syntax tree into a `SELECT` that exposes the row's primary key, `xmin`, the columns the statement will change, and the post-change values.
- [ ] Run the rewritten statement inside `BEGIN TRANSACTION READ ONLY` against the live database, read catalog metadata for primary keys, column types, generated columns, triggers, rewrite rules, unique columns, and foreign keys, and return a JSON `Proposal` carrying `rowCount`, `changes`, `cascades`, `warnings`, `derivedSql`, `columns`, creation/expiry times, and the apply plan.
- [ ] Implement the cascade walk up to `cascadeDepth` (default 5), the `cascade_depth_truncated` warning, and the `composite_foreign_key_skipped` warning for composite-key relations.
- [ ] Implement the apply step that runs only what was previewed and rejects the entire apply with `StateChangedError` if any row's `xmin` has shifted between preview and apply.
- [ ] Implement the `Receipt` shape with `rowsAffected`, `appliedAt`, and the primary keys touched, with database-generated keys reported at the apply step for inserts.
- [ ] Implement the error hierarchy: `PgDryRunError` and the four leaf classes (`UnsupportedStatementError`, `TooManyRowsError`, `ProposalExpiredError`, `StateChangedError`).
- [ ] Implement the `Driver` interface so users can bring their own pool, the default `url` and `readUrl` adapters, and the per-session exclusive-use guarantee.
- [ ] Implement the options (`url`, `readUrl`, `driver`, `readDriver`, `ttlMs` default 5 minutes, `statementTimeoutMs` default 10 seconds, `labelColumns`, `cascadeDepth` default 5, `maxRows` default 1,000) and surface the proposal's expiry so the caller can see when the clock starts.
- [ ] Build the test suite against PostgreSQL semantics in-process through PGlite, so the suite needs no server or container, and add the `pnpm verify` entry point and CI workflow.
- [ ] Run an end-to-end test: `UPDATE profiles SET status = $1 WHERE email LIKE $2` against the demo schema, expect `rowCount: 14`, expect 14 row-level changes with `xmin` captured, expect the `derivedSql` SELECT with `status.before` and `status.after`, then call `apply` with a shifted row and expect `StateChangedError` with no rows written.

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Publish `pg-dry-run` to npm under MIT with the README that links to Polycore's docs for the surrounding identity, policy, approval, environment routing, and audit trail
- [ ] Wire the changeset release flow so each shape-add and each option-add lands as its own SemVer note
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-31_
