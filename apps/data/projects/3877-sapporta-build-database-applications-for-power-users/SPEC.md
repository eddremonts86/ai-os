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

## Problem

Sapporta is an MIT-licensed framework built on Hono and React that the author describes as a reenactment of dBase, FoxPro and MS Access for the LLM era. Those older tools shipped application wizards that created tables, queries, forms and reports, and the author believes that is still a valid composition for database applications. In Sapporta, the moment you define a table you get a data grid with comboboxes for foreign-key fields, sorting and filtering — the affordances that Airtable and NocoDB provide. The grid is built from scratch because commercial options such as AgGrid and HandsOnTable did not offer the nested grids with fluid keyboard interaction the author wanted. The framework is fully agentic by design: the author started building it while making a double-entry bookkeeping system where his agents import bank statements, classify them and insert them into the database accurately. That system now runs on Sapporta, and the agents reconcile entries and find mistakes that were frustrating to fix by hand. The datastore is SQLite; in deployment the app can run as a single Node.js process without even a static file server, and a Dockerfile is included.

## Objective

Ship Sapporta as an MIT-licensed, Hono-and-React framework that gives database applications an instant grid UI and a fully agentic API — the dBase/FoxPro/Access composition rebuilt for LLM-driven workflows. The MVP is the working framework plus its proving ground: the author's double-entry bookkeeping system, where agents import bank statements, classify and insert them, and reconcile entries.

## Target Users

- Power users and developers who build small internal database applications and want a table-driven UI without assembling a grid stack.
- People maintaining bookkeeping or ledger-style tools who want agents to import, classify and reconcile financial records.
- LLM-tooling builders who want their agents to operate a database through a defined schema API rather than raw SQL.

## MVP Scope

- Define a table and immediately get a data grid with foreign-key comboboxes, sorting and filtering.
- Custom-built grid engine with nested grids and fluid keyboard interaction (AgGrid and HandsOnTable-class features without the commercial license).
- Agentic access to the database: agents import bank statements, classify entries and insert them accurately.
- SQLite datastore deployable as a single Node.js process, with a Dockerfile that works seamlessly.
- MIT license.

## Constraints

- The grid must stay from-scratch: the commercial grid libraries the author rejected did not have nested grids with fluid keyboard interaction.
- Deployment target is a single Node.js process, which constrains the datastore to SQLite in the current design.
- The bookkeeping use case is the only published proof of the agentic workflow.
- All claims come from the author's Show HN post; no third-party usage data exists.

## Design Direction

See `DESIGN.md` for this project's design tokens.
