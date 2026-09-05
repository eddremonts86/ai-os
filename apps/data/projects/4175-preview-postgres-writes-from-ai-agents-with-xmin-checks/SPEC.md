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

## Problem

AI agents increasingly inspect schemas, generate SQL, and operate real applications. Read access can be contained with a read-only role, but writes need a way to inspect the effect before production data changes. An agent can generate a perfectly valid `UPDATE profiles SET status = $1 WHERE email LIKE $2` statement that looks reasonable but updates fourteen accounts instead of the one the team thought it would. Inserts can pick up defaults that never appear in the statement. Deletes can reach other tables through foreign keys. Static checks and human review both see the query text, not its effect on the current database.

The source is the GitHub repository for `polycore/pg-dry-run`, an MIT-licensed TypeScript library published to npm as `pg-dry-run`. The library parses one `INSERT`, `UPDATE`, or `DELETE` with PostgreSQL's own parser, runs it inside `BEGIN TRANSACTION READ ONLY` against the live database to return a row-level proposal with the affected rows and changes, and later applies only what was previewed — if an existing row changed in the meantime, the entire apply is rejected. The default row limit is 1,000; larger writes are refused rather than reduced to a count that nobody can meaningfully review.

The source names the actor (engineers letting AI agents generate SQL against a Postgres database), the pain (a valid statement can update one row or fourteen with no warning), and the missing thing (a way to preview the effect of a write on production data before it runs, and a way to reject the apply if the row state has shifted). It does not name a specific database, a specific agent framework, or a specific approval UI; the library explicitly does not run an AI model and does not prescribe an approval UI, it provides the database mechanism an agent, CLI, admin tool, or approval system can build on.

## Objective

Build the `pg-dry-run` effect engine: a Node and TypeScript library that turns an `INSERT`, `UPDATE`, or `DELETE` against a Postgres database into a portable JSON proposal with the affected rows, the changes, the cascade reach, the warnings, and the derived SQL — and applies only what was previewed, refusing the apply when the row state has shifted.

## Target Users

- Engineers who let AI agents generate SQL against a Postgres database and need to inspect the effect of a write on real rows before it runs.
- Backend teams operating internal admin tools that issue writes against production data and want a preview surface the human reviewer can read.
- AI agent frameworks whose default write path is silent and whose users need a guarded apply the framework can build on.
- Database administrators who want a guardrail for one-off data migrations: parse the statement, see the affected rows, then apply with a row-version check.
- Security teams reviewing an AI agent's write path, who need a JSON proposal they can audit instead of a SQL string that may not match the effect.

## MVP Scope

- A TypeScript library `pg-dry-run` published to npm under MIT, with the public surface `createDryRunner`, `DryRunner.propose`, `DryRunner.apply`, and `DryRunner.close`.
- A parser that accepts one `INSERT`, `UPDATE`, or `DELETE` against Postgres's own parser and rejects statement shapes it cannot represent faithfully (DDL, data-modifying CTEs, `UPDATE ... FROM`, `DELETE ... USING`, `WITH` clauses, `INSERT ... SELECT`, both forms of `ON CONFLICT`, writes to generated columns, writes against tables without a primary key, and updates/deletes without a `WHERE`).
- A preview step that runs the rewritten statement inside `BEGIN TRANSACTION READ ONLY` against the live database, reads catalog metadata for primary keys, column types, generated columns, triggers, rewrite rules, unique columns, and foreign keys, and returns a JSON `Proposal` carrying rowCount, changes, cascades, warnings, derivedSql, columns, creation/expiry times, and the apply plan.
- An apply step that executes only what was previewed and rejects the entire apply if a row's `xmin` has changed between preview and apply.
- A `Proposal` shape that is portable across processes (no methods, JSON-serializable) so the preview and apply can happen in different processes.
- A `Receipt` shape that records rowsAffected, appliedAt, and the primary keys touched, with database-generated keys reported on the apply for inserts.
- Errors `UnsupportedStatementError`, `TooManyRowsError`, `ProposalExpiredError`, `StateChangedError`, all extending `PgDryRunError`.
- A `Driver` interface so users can bring their own pool or a non-server Postgres; the driver only needs to provide exclusive use of one session so every statement in a transaction shares the same connection.
- Options `url`, `readUrl`, `driver`, `readDriver`, `ttlMs` (default 5 minutes), `statementTimeoutMs` (default 10 seconds), `labelColumns`, `cascadeDepth` (default 5).
- A test suite that runs against PostgreSQL semantics in-process through PGlite, so the development loop needs no server or container.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The library parses one `INSERT`, `UPDATE`, or `DELETE` only. Anything else is refused with `UnsupportedStatementError` rather than silently degraded.
- Updates and deletes must include a `WHERE` clause. A statement without one is refused, not run.
- `INSERT ... SELECT`, both forms of `ON CONFLICT`, `UPDATE ... FROM`, `DELETE ... USING`, and `WITH` clauses are refused. The library refuses when it cannot derive an equivalent read.
- Composite keys are reported as `composite_foreign_key_skipped` rather than presented as a complete count. The library does not claim a count it cannot verify.
- Cascade traversal stops at `cascadeDepth`, which defaults to five. A truncated walk is reported as `cascade_depth_truncated`.
- `xmin` can change without a row data change under `VACUUM FREEZE`. That can reject a valid apply, but it cannot allow a stale one. The library does not work around `VACUUM FREEZE`.
- The default `maxRows` is 1,000. A proposal above it throws `TooManyRowsError` rather than reducing to a count that nobody can meaningfully review.
- Postgres only. Row-version pinning currently depends on Postgres, and the rewrite is not claimed to work against other transactional databases.
- The library does not run an AI model and does not prescribe an approval UI. It provides the database mechanism an agent, CLI, admin tool, or approval system can build on.
- A `Proposal` expires after `ttlMs` (default 5 minutes). The apply is refused on `ProposalExpiredError` rather than silently re-previewed.
