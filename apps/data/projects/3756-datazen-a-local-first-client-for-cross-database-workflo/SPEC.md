---
id: "3756"
slug: datazen-a-local-first-client-for-cross-database-workflo
title: DataZen – a local-first client for cross-database workflows
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49490148"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
tech: [TypeScript, Node.js API, SQLite (local metadata) + connection drivers for Postgres / MySQL / SQLite, Coolify + Docker (self-hosted distribution)]
---
# DataZen – a local-first client for cross-database workflows

## Problem

An engineer reports that their company stopped allowing Navicat because of compliance policy, and DBeaver works but the engineer does not like it. Production investigations often require several queries across different databases — query one table, copy an ID into another query, wait for the result, repeat. The engineer wants a way to handle this without writing a separate script for every case: a simple form where known parameters can be entered, then a sequence of SQL statements can run. Superset was considered but is too heavy for the developer-centric use case.

## Objective

Build a local-first client that lets an engineer define a multi-step SQL workflow, bind parameters between steps, and run the whole sequence against one or more connected databases without leaving the app.

## Target Users

1. **Backend / platform engineer** — the primary user; runs cross-database investigations during incidents and development.
2. **Data analyst at a regulated company** — needs a Navicat replacement that survives compliance review.
3. **SRE on call** — needs to assemble a quick investigation script when a Sev hits, without checking scripts into a repo.

## MVP Scope

- Connect to multiple SQL databases from one client (Postgres, MySQL, SQLite first).
- Author a workflow as a list of named steps; each step is one SQL statement.
- Bind a step's output into the parameters of the next step by column.
- Run the workflow end-to-end and surface each step's result row count + duration + sample rows.
- Save workflows as plain JSON files on disk; the local-first posture means no workflow is locked to a server.
- Stop short of: a visual node editor, multi-user collaboration, hosted SaaS.

## Design Direction

See DESIGN.md for design tokens.

## Constraints

- Local-first means workflows and connection secrets never leave the user's machine.
- Connection credentials are stored in the OS keychain; never plain text on disk.
- The MVP does not invent a new query language; it is plain SQL with parameter binding.
