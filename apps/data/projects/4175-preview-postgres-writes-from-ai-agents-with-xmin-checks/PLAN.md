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

## Tech Stack

- **TypeScript with Node.js** for the library itself, matching the source's npm package `pg-dry-run` and the public surface `createDryRunner` / `DryRunner.propose` / `DryRunner.apply` / `DryRunner.close`.
- **PGlite** for the test suite, so the suite runs against PostgreSQL semantics in-process without a server or container, matching the source's "fresh clone needs no environment" workflow.
- **PostgreSQL's own parser** for statement parsing (via the standard `pg-query-emscripten` or the same node binding the source uses), so the library parses exactly what Postgres parses rather than a hand-rolled grammar.
- **Vitest** for the test runner, matching the source's `vitest.config.ts` and `tsconfig.test.json`.
- **pnpm** for the package manager and lockfile, matching the source's `pnpm-lock.yaml`.
- **GitHub Actions** for CI, matching the source's `.github/workflows/ci.yml`.
- **Changesets** for release notes, matching the source's `.changeset/` directory.
- **MIT license** for distribution, matching the source's LICENSE file.

## Architecture

The library has two phases: a `propose` phase that runs an equivalent read inside `BEGIN TRANSACTION READ ONLY` and returns a portable JSON proposal, and an `apply` phase that runs only what was previewed and refuses the apply if the row state has shifted.

The `propose` phase starts by parsing one `INSERT`, `UPDATE`, or `DELETE` with Postgres's own parser. The library rejects statement shapes it cannot represent faithfully: anything other than one write, DDL, data-modifying CTEs, `WITH` clauses, `INSERT ... SELECT`, both forms of `ON CONFLICT`, `UPDATE ... FROM`, `DELETE ... USING`, writes to generated columns, writes against tables without a primary key, and updates or deletes without a `WHERE`. For an `UPDATE` or `DELETE`, the library copies the original predicate as an untouched syntax tree into an equivalent `SELECT` that exposes the row's primary key, the `xmin`, the columns the statement will change, and the post-change values. The preview runs inside a `BEGIN TRANSACTION READ ONLY` against the live database; the library also reads catalog metadata for primary keys, column types, generated columns, triggers, rewrite rules, unique columns, and foreign keys. The result is a portable JSON `Proposal` carrying `rowCount`, `changes`, `cascades`, `warnings`, `derivedSql`, `columns`, creation and expiry times, and the internal apply plan.

The `apply` phase takes the `Proposal` and runs only what was previewed. For each affected row, the apply checks the row's current `xmin` against the `xmin` the preview saw; if any row's `xmin` has changed, the entire apply is rejected with `StateChangedError` and no rows are written. The `Proposal` expires after `ttlMs` (default 5 minutes); an expired apply throws `ProposalExpiredError`. A proposal above `maxRows` (default 1,000) throws `TooManyRowsError` at the propose step rather than reducing to an unreviewable count.

The `Driver` interface lets users bring their own pool. The driver only needs to provide exclusive use of one session so every statement in a transaction shares the same connection — the library does not assume a server Postgres, so users running PGlite in the test suite and a server in production can share the same call shape. The `Receipt` records `rowsAffected`, `appliedAt`, and the primary keys touched; for inserts, database-generated keys are reported at the apply step because `nextval()` is itself a write.

The error hierarchy extends `PgDryRunError` so callers can catch all library errors at one level. The library does not run an AI model and does not prescribe an approval UI; Polycore is the surrounding identity, policy, approval, environment routing, and audit trail the library does not provide.

## Milestones

1. **M1 — Parser and statement-shape gate** — the Postgres-parser binding, the `UnsupportedStatementError` table, the per-shape refusal messages.
2. **M2 — `BEGIN TRANSACTION READ ONLY` preview** — the equivalent-read rewrite, the catalog-metadata read, the `Proposal` shape.
3. **M3 — Cascade traversal and warnings** — the cascade walk, the `cascadeDepth` cap, the `composite_foreign_key_skipped` and `cascade_depth_truncated` warnings, the row-level diff with `xmin` capture.
4. **M4 — `xmin`-checked apply** — the apply step, the `StateChangedError` rejection, the `Receipt` shape, the `nextval()` reporting for inserts.
5. **M5 — `Driver` interface and bring-your-own pool** — the `Driver` contract, the default `url` and `readUrl` adapters, the exclusive-session guarantee.
6. **M6 — Errors and TTL** — `PgDryRunError`, `UnsupportedStatementError`, `TooManyRowsError`, `ProposalExpiredError`, `StateChangedError`, the `ttlMs` (default 5 minutes) and `statementTimeoutMs` (default 10 seconds) options.
7. **M7 — PGlite test suite** — the test matrix, the `pnpm verify` entry point, the CI workflow.
8. **M8 — npm publish and changeset release** — the `npm install pg-dry-run` quick start, the `createDryRunner({ url })` example, the per-step error examples, the security disclosure policy.

## Risks

- **Unsupported-statement subset too narrow** — AI agents frequently need a shape the library refuses, so the library becomes a constant friction point. Mitigation: keep the refusal table small and explicit, document each shape, publish a roadmap for the next shape to add.
- **`VACUUM FREEZE` rejection noise** — `xmin` shifts under `VACUUM FREEZE` reject valid applies, masking the genuine stale-state cases. Mitigation: surface `StateChangedError` with the row's `xmin` before and after, so the caller can tell freeze-induced shifts from real concurrent writes.
- **Cascade depth too shallow** — a five-level cascade walk truncates and reports `cascade_depth_truncated`, leaving the operator blind to deeper effects. Mitigation: surface the truncation in the proposal, document the `cascadeDepth` knob, never silently raise the default.
- **Composite-key undercount** — composite keys are reported as `composite_foreign_key_skipped`, and the operator may miss the undercount in a row-level diff. Mitigation: the warning is named and surfaced in the `Proposal`; the library does not invent a count it cannot verify.
- **TTL too short for slow approvals** — a 5-minute TTL rejects applies whose approval flow took longer than the TTL. Mitigation: the `ttlMs` option is configurable; the library surfaces the expiry on the proposal so the caller can see when the clock starts.
- **Pooler session affinity** — a connection pooler (PgBouncer, RDS Proxy) reuses a session across transactions and the library's exclusive-session guarantee breaks. Mitigation: the `Driver` interface is the integration point; document the per-session requirement and recommend transaction-mode poolers or direct connections.
- **Driver contract too loose** — a user-provided `Driver` silently violates the exclusive-session guarantee and the apply races the preview. Mitigation: the contract is the only public surface; the test suite asserts it, and the documentation calls out the per-session requirement explicitly.
