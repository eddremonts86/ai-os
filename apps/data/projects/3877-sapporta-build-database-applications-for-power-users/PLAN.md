---
id: "3877"
slug: "sapporta-build-database-applications-for-power-users"
title: "Sapporta – build database applications for power users"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49499123"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [Hono server, React data grid, SQLite, Custom grid engine, Agentic schema API, Single-process Node.js runtime]
---
# Sapporta – build database applications for power users

## Tech Stack

- **Hono server:** the web framework the project is built on top of.
- **React data grid:** the UI layer rendered when a table is defined.
- **SQLite:** the datastore for single-process deployments.
- **Custom grid engine:** built from scratch for nested grids and fluid keyboard interaction.
- **Agentic schema API:** the interface agents use to import, classify, insert and reconcile.
- **Single-process Node.js runtime:** deployment needs no static file server; a Dockerfile is provided.

## Architecture

- **Schema layer:** table definitions drive everything downstream — grid, forms and agent access derive from the same schema.
- **Grid layer:** a from-scratch datagrid renders foreign-key comboboxes, sorting and filtering per table.
- **Agent layer:** agents operate the database through the schema API, covering import, classification and reconciliation workflows.
- **Storage layer:** SQLite holds the data; the whole app runs as one Node.js process in deployment.

## Milestones

1. **M0 — Framework skeleton.** Hono plus React with the schema-driven grid working on a defined table.

2. **M1 — Agentic operations.** Agents import bank statements, classify and insert rows, and reconcile entries on the bookkeeping system.

3. **M2 — Deployment polish.** Single-process Node.js deployment and the Dockerfile validated on a real host.

4. **M3 — Community adoption.** MIT-licensed release gathers users beyond the author's own bookkeeping project.

## Risks

- **Grid maintenance:** a from-scratch datagrid with nested grids and keyboard interaction is a long-term engineering commitment.
- **Schema lock-in:** everything derives from table definitions; unusual data shapes may not fit.
- **SQLite ceiling:** the single-process design caps concurrency and multi-user scale.
- **One-project validation:** the framework is proven on one bookkeeping system; generalization is unproven.
