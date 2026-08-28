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

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/3157-dblift-database-migration-management-for-python-teams/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] pip-installable Python package with a CLI mirroring the Flyway command surface
- [ ] History table schema matching Flyway's
- [ ] Out-of-order application by default
- [ ] `--strict` flag restoring Flyway monotonic versioning
- [ ] `import_flyway` command: read a Flyway history, write it under DBLift's schema
- [ ] SQLAlchemy integration (project-aware connection + migration discovery)
- [ ] Django integration (Django app discovery path)
- [ ] Flask integration (minimal example adapter)
- [ ] Supported-databases drivers: PostgreSQL, MySQL, SQLite
- [ ] Docs at docs.dblift.com, including migrations-versioning and a move-from-Flyway walkthrough

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-26_
