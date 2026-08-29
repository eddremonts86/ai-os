---
id: "3687"
slug: sqlite-diff-log-zero-dependency-sqlite-audit-logging-vi
title: SQLite-diff-log – zero-dependency SQLite audit logging via triggers
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49484994"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [Python, SQLite (native triggers), PyPI distribution]
---
# SQLite-diff-log – zero-dependency SQLite audit logging via triggers

## Problem

Teams that store business state in SQLite — embedded apps, small SaaS backends, dev tooling, Litestream-replicated deployments — routinely need an audit trail: who changed what row, when, and from what to what. The existing ecosystem makes this awkward. Tools like `sqlite-utils` require running CLI commands out of band or computing diffs manually inside application code, and most Python audit libraries only instrument the process that imports them, leaving blind spots the moment another writer (a Node.js worker, a Go binary, the `sqlite3` CLI) touches the same database. The result is fragmented logs, duplicated plumbing, or a "wrap every write" discipline that does not survive the next contributor. The author (MigMarGil) released a Show HN project on 2026-08-28 that solves this by delegating audit logging to SQLite itself: native `AFTER` triggers on each target table emit JSON diffs into an `_audit_log` table inside the same transaction as the write, so any process that writes to the file is automatically covered.

## Objective

Ship a `pip install`-able Python package, `sqlite-diff-log`, that exposes a small API (`attach_to_table`, `get_logs`) and installs three idempotent SQLite triggers per attached table. The MVP must (1) require zero non-stdlib runtime dependencies, (2) work cross-process and cross-language, (3) be safe against SQL injection in identifiers and literals, (4) keep audit rows inside the same SQLite file so Litestream / Turso replication carries them transparently.

## Target Users

- Primary: Python backend developers shipping single-file SQLite apps (CLI tools, embedded devices, desktop apps, Litestream-replicated SaaS) who need a tamper-resistant audit trail without bolting on an external service.
- Secondary: multi-language teams whose Python API, Node worker, and Go batch job all hit the same `.db` file and want one consistent log surface for every writer.
- Tertiary: data / compliance reviewers who need structured JSON diffs (old_data / new_data) they can ship into a downstream analytics or SIEM pipeline.

## MVP Scope

- `SQLiteDiffLog(conn)` constructor that ensures the `_audit_log` table exists.
- `attach_to_table(table_name, pk_col="id")` that installs `AFTER INSERT / UPDATE / DELETE` triggers per table, building `json_object(...)` snapshots from `OLD.*` and `NEW.*` and writing into `_audit_log` in the same transaction as the audited write.
- `get_logs(table_name=None)` returning parsed dicts (JSON-decoded `old_data` / `new_data`), filterable per table.
- Identifier quoting and validation against `sqlite_master`; literal escaping for any `json_object` value.
- Idempotent trigger creation (`CREATE TRIGGER IF NOT EXISTS`) so repeated `attach_to_table` calls are safe.
- Schema-change handling: documented procedure to drop and recreate triggers when a table gains or loses a column.
- MIT-licensed, published on PyPI, single Python module with `unittest` test suite in the repository.
- CI badge green on Python 3.8+ across the supported matrix.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Zero runtime dependencies beyond the Python standard library (`sqlite3`, `json`); the package must install cleanly into an empty virtualenv with no transitive closure beyond pip's setuptools.
- Single-column primary keys only in v1 (composite PK support is explicitly out of scope and documented as a limitation).
- Triggers fire inside the same transaction as the write, so the audit row never exists without the audited row and vice versa; the package must not introduce its own connection or transaction layer.
- SQLite triggers cannot see the connected user or session, so "who changed this" must be carried by the application via an `updated_by` column (or equivalent); this is documented, not papered over.
- Replication-friendliness is a hard constraint: the audit table must live inside the same SQLite file so Litestream, Turso, and standard file copy all carry the log with the data.
