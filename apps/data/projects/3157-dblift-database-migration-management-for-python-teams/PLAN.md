---
id: "3157"
slug: dblift-database-migration-management-for-python-teams
title: "DBLift: database migration management for Python teams"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49447202"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
tech: [Python, pip, SQLAlchemy, Django, Flask, PostgreSQL, MySQL, SQLite]
---
# DBLift: database migration management for Python teams

## Tech Stack

Python as the implementation language, distributed via pip. SQLAlchemy as the connection layer for SQLAlchemy-based projects. Django integration through the existing Django migration discovery path. Flask as an adapter example for non-Django web stacks. Database drivers for the supported engines (PostgreSQL, MySQL, SQLite in the canonical examples). A CLI that mirrors the Flyway command surface — `migrate`, `info`, `validate`, `repair`, plus `import_flyway` and `--strict`.

## Architecture

A pip-installable Python package exposing a CLI and a library entrypoint. On `migrate`, the tool reads the versioned migrations directory, writes its own history table (same schema as Flyway), and applies any unapplied migration. In default mode, any unapplied migration is eligible regardless of version ordering; `--strict` restores the monotonic Flyway ordering. `import_flyway` reads an existing Flyway history table and rewrites entries under the DBLift history schema so a team can switch without re-running migrations. Database-specific behaviour is contained in adapters per engine.

## Milestones

M0 — pip package skeleton and CLI with the Flyway command vocabulary. M1 — history table implementation matching the Flyway schema. M2 — `import_flyway` against a real Flyway history. M3 — SQLAlchemy, Django, Flask integration points. M4 — `--strict` flag and the documentation page on migrations-versioning. M5 — supported-databases page (PostgreSQL, MySQL, SQLite) and the move-from-Flyway walkthrough.

## Risks

The poster's own open question: for teams where Flyway on Python already works fine, the value DBLift adds beyond removing the JVM has not been articulated yet. Out-of-order default is a Flyway behavioural delta; teams that depend on monotonic versioning must consciously opt in. Coverage of every Flyway history-schema edge case beyond what `import_flyway` covers is not yet established by the source. The supported-databases matrix is referenced but its actual contents are linked, not enumerated, in the post.
