---
id: "3877"
slug: sapporta-build-database-applications-for-power-users
title: Sapporta – build database applications for power users
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

## Value Proposition

A database application framework that resurrects the dBase/FoxPro/Access workflow for the LLM era. Define a table and Sapporta immediately gives you a data grid with foreign-key comboboxes, sorting and filtering; point your agents at the schema and they can import, classify, insert and reconcile rows. The author's own double-entry bookkeeping system runs on it, with agents finding mistakes that were frustrating to catch by hand. MIT-licensed, SQLite-backed, and deployable as a single Node.js process.

**One-liner:** An MIT-licensed Hono and React framework where defining a table gives you a data grid plus a fully agentic database API.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Power users building internal tools | Get tables, queries, forms and reports the way dBase and Access composed them, without modern frontend plumbing. |
| Bookkeeping and finance tooling maintainers | Agents import bank statements, classify and insert them, then reconcile entries and find mistakes. |
| LLM workflow developers | A defined schema API their agents can operate instead of raw SQL. |

The post does not segment a commercial market; it addresses builders of database applications.

## Jobs To Be Done

1. **Functional job** — Turn a table definition into a usable data grid with foreign-key comboboxes, sorting and filtering immediately.

2. **Functional job** — Let agents import bank statements, classify transactions and insert them accurately into a bookkeeping system.

3. **Functional job** — Reconcile double-entry ledgers agentically, surfacing mistakes that manual review kept missing.

4. **Emotional job** — Recover the joy of the old application wizards: define data, and the tooling composes the rest for you.

## Success Metrics

- **Time-to-grid:** a defined table yields a working data grid with zero additional frontend work.
- **Agentic accuracy:** bank statements are imported, classified and inserted accurately — the author's stated acceptance bar.
- **Reconciliation wins:** agents find mistakes that used to be very frustrating when done manually.
- **Deployment weight:** the app runs as a single Node.js process with a Dockerfile, no static file server needed.

## Pricing & Monetization

None stated. Sapporta is MIT-licensed open source; the post mentions no paid tier or support offering.

## Competitive Landscape

The post names Airtable and NocoDB as the source of the grid affordances it rebuilds, and AgGrid and HandsOnTable as commercial grid libraries it rejected (no nested grids with fluid keyboard interaction). The classic lineage — dBase, FoxPro, MS Access — is the author's stated inspiration. The differentiator is the agentic core: the same schema your agents can operate, with a from-scratch grid on top.

## Risks & Open Questions

- [ ] Single-use-case evidence: the bookkeeping system is the only published example; nothing shows other database application shapes.
- [ ] The from-scratch grid is a permanent maintenance burden the author chose to avoid commercial licenses.
- [ ] SQLite as the only datastore limits deployments that need a shared server database.
- [ ] Agentic accuracy claims rest on one author's experience; no independent evaluation exists.
- [ ] MIT-licensed with no stated business model — sustainability depends on the author's own projects.
