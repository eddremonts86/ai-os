---
id: "4026"
slug: sapporta-build-database-applications-for-power-users
title: Sapporta – build database applications for power users
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49499123"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Sapporta – build database applications for power users

## Problem

Sapporta is an MIT licensed framework built on top of Hono and React.To me it is a reenactment of dBase, FoxPro, and MS Access, but for the LLM era. All of these tools had application wizards that would create tables, queries, forms, and reports, and I think that is still a valid composition for database applications.So in Sapporta, the moment you define a table, you immediately get a data-grid that gives you comboboxes for foreign key fields, has sorting, filtering, and the various affordances that tools like AirTable and NocoDB provide.(The datagrid is built from scratch, as AgGrid, HandsOnTable etc. were commercial and didn't have nested grids with fluid keyboard interaction)It is also fully agentic - that was what got me started building this in the first place. I was building a double-entry book-keeping system and I wanted my agents to be able to import bank statements, classify them, and insert them into the database accurately. The project, built on Sapporta, does all that now, and agents have been able to reconcile entries and find mistakes that used to be very frustrating when done manually. Being able to operate your database system fully agentically is magical and applying that on our own personal tools is a thing of joy.The datastore is currently SQLite, and in deployment it can run as a single Node.js process (not even a static file server necessary) and there is a Dockerfile that works seamlessly.I'm looking forward to your thoughts. Thanks!

---

## Objective

_Not written yet — `ai-os plans enrich` fills this section._

## Target Users

_Not written yet — `ai-os plans enrich` fills this section._

## MVP Scope

_Not written yet — `ai-os plans enrich` fills this section._

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

_Not written yet — `ai-os plans enrich` fills this section._
