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

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A Python library that turns any SQLite database into a self-auditing system in two lines: call `attach_to_table("users", pk_col="id")` once, and every subsequent `INSERT`/`UPDATE`/`DELETE` — from the importing process, a Node worker, a Go binary, or the `sqlite3` CLI — is captured as a structured JSON diff inside an `_audit_log` table that ships with the database file. Because the logic lives in SQLite's C core as native triggers, there is nothing for other writers to forget to call.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Python backend developer (embedded / CLI / desktop) | Wants an audit trail without bolting on a separate service or wrapping every write site. |
| Multi-language team sharing one `.db` file | One Node service and one Python API both write to the same DB; only one audit library can cover both. |
| DevOps running Litestream or Turso | Needs the audit log to replicate with the data, not lag behind it. |
| Compliance / data reviewer | Wants structured JSON diffs they can ship to a SIEM or analytics warehouse without re-parsing ad-hoc logs. |

## Jobs To Be Done

1. **Functional job** — Produce a per-row, per-write audit log inside the SQLite database itself, automatically, without per-call instrumentation in application code.
2. **Emotional job** — Stop worrying that the audit trail is missing the writes that came from "the other process" or "the one place we forgot to instrument".
3. **Social job** — Be able to tell a reviewer or customer "every change is captured" without pointing at a custom ORM hook buried in `models.py`.

## Success Metrics

- **Activation:** ≥ 80% of `pip install` users complete the first `attach_to_table` call within the same session (measured by PyPI download-to-GitHub-issue ratio and the absence of "how do I use this" issues).
- **Compatibility:** ≥ 99% of CI matrix runs green across Python 3.8, 3.9, 3.10, 3.11, 3.12, 3.13.
- **Coverage:** every writer that touches an attached table — Python or otherwise — produces an audit row in the same transaction as the write; verified by the multi-process test in `test_sqlite_diff_log.py`.
- **Adoption signal:** Show HN post (2026-08-28, 2 points at capture time) plus PyPI download velocity of ≥ 500 installs in the first 30 days as a soft proxy for reach.

## Pricing & Monetization

Open-source MIT license, free on PyPI. The author (MigMarGil) has not published a commercial plan; monetisation in the v1 horizon comes from consulting, custom integrations, or a hosted Litestream/Turso companion service — none of which are part of this package.

## Competitive Landscape

- **sqlite-utils** — general-purpose SQLite CLI / library from Simon Willison; can compute diffs but requires running commands out of band or computing them in application code, and does not auto-attach triggers.
- **Application-layer audit libraries** (e.g. SQLAlchemy event hooks, Django `django-audit-log`) — only instrument the process that imports them; a Node writer or raw `sqlite3` CLI bypass is silent.
- **PostgreSQL `pgaudit` / MySQL audit plugins** — equivalent functionality for hosted databases, but SQLite has no plugin surface, so a trigger-based approach is the only native option.
- **Litestream + WAL shipping** — covers disaster recovery and replication, not audit; complementary rather than competitive.

## Risks & Open Questions

- [ ] Composite primary key support — currently rejected at the API; need a clear upgrade story (column-list trigger signature) before any v1.x feature request is closed.
- [ ] "Who changed this" — triggers cannot see session context; whether to ship a thin wrapper that injects a session id into `updated_by` (application cooperation required) or leave it strictly out of scope.
- [ ] Long-term retention — `_audit_log` grows forever; no built-in prune / archive job. Risk of disk pressure on long-lived embedded deployments.
- [ ] SQLite version drift — relies on `json_object()` and `AFTER` triggers that are stable since SQLite 3.38, but worth pinning a minimum version in setup.py.

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49484994) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
