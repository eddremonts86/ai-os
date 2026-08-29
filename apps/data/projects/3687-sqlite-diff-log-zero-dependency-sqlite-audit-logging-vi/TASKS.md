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

## Phase 0: Scaffold

- [x] Capture problem from HackerNews (Show HN link + GitHub README) and write SPEC.md skeleton
- [ ] Decide design tokens in DESIGN.md (if a UI surface is added later; v0.1 has no UI)
- [ ] Create `pyproject.toml` with stdlib-only `install_requires=[]`
- [ ] Add `LICENSE` (MIT) and `README.md` mirroring the GitHub README
- [ ] Wire GitHub Actions matrix: Python 3.8 / 3.9 / 3.10 / 3.11 / 3.12 / 3.13
- [ ] Set up local virtualenv + `python -m unittest` smoke test

## Phase 1: Core

- [ ] `SQLiteDiffLog(conn)` constructor: ensure `_audit_log` table exists (id autoincrement, table_name, action, row_id, old_data JSON, new_data JSON, created_at timestamp)
- [ ] `attach_to_table(table_name, pk_col="id")`: read columns via `PRAGMA table_info`, validate against `sqlite_master`, build three `AFTER INSERT/UPDATE/DELETE` triggers with `json_object(...)` snapshots
- [ ] Idempotent trigger creation via `CREATE TRIGGER IF NOT EXISTS`; safe to call twice on the same table
- [ ] Identifier quoting (`"`) and literal escaping via parameter binding; reject unknown identifiers with `ValueError`
- [ ] `get_logs(table_name=None)`: list of dicts, `old_data`/`new_data` JSON-decoded, ordered by `id`
- [ ] Schema-change path documented: drop triggers, then re-attach after `ALTER TABLE`
- [ ] Composite-PK rejection with explicit `ValueError` and a tracked v0.2 issue
- [ ] Cross-process test: open the same `.db` from a second `sqlite3` CLI process, perform `UPDATE`, confirm an audit row appears via `get_logs` in the Python process
- [ ] Unittest suite: insert / update / delete coverage, idempotency, identifier validation, JSON round-trip

## Phase 2: Deploy

- [ ] Tag `v0.1.0` and publish to PyPI via `python -m build` + `twine upload`
- [ ] Post Show HN (already happened 2026-08-28)
- [ ] Monitor GitHub issues for composite-PK and retention requests; triage into v0.2 backlog
- [ ] Add Litestream / Turso "replication-friendly" note to README once confirmed by an external user
