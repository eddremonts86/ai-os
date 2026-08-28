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

## Problem

The poster has been building DBLift, an open-source database migration toolkit for Python teams. The motivation: many Python teams adopt Flyway because it works, but Flyway is a JVM tool — every Python developer who runs `flyway migrate` is paying for a JVM dependency they otherwise don't need. The poster asks, honestly, what they are missing — because Flyway on a Python project does work fine for the people already using it.

DBLift follows the Flyway model closely: same main commands, same history table structure, and an `import_flyway` command that lets a team move from Flyway without rewriting their migration history. One deliberate difference: DBLift is out-of-order by default — any unapplied migration is eligible to run, whereas Flyway refuses to apply a migration with a lower version until you force it. A `--strict` flag restores the original Flyway ordering.

The differentiator the poster emphasises: no JVM. DBLift integrates with the Python stack — pip, SQLAlchemy, Django, Flask — and runs as part of the same toolchain a Python team already has. The repo and docs are linked: GitHub at dblift/dblift, docs at docs.dblift.com, a move-from-Flyway page, a supported-databases page, and a migrations-versioning page.

## Objective

Let a Python team run the same database-migration workflow they would with Flyway — same commands, same history table, `import_flyway` for one-step adoption — without a JVM, with optional strict ordering, and integrated with pip / SQLAlchemy / Django / Flask.

## Target Users

Python teams currently running Flyway on a JVM, and Python teams adopting a migration tool for the first time. The poster specifically addresses the first group with `import_flyway`, and explicitly invites Flyway-on-Python users to share feedback.

## MVP Scope

CLI with the Flyway-equivalent commands. Same history table schema as Flyway. `import_flyway` for migrating an existing Flyway history. Out-of-order application by default with a `--strict` flag. pip distribution. Adapters for SQLAlchemy, Django, and Flask projects. A supported-databases matrix. Documentation at docs.dblift.com, including the move-from-Flyway walkthrough.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

DBLift is out-of-order by default; teams that depend on Flyway's strict version monotonicity must opt in with `--strict`. Adopted Flyway histories require `import_flyway`, which the team takes on as a migration step. Adoption is gated by Python-team familiarity with Flyway — the poster notes that Flyway on a Python project does work fine and is asking what DBLift actually adds beyond removing the JVM.
