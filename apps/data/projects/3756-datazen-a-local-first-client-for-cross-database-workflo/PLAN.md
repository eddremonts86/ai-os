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

## Tech Stack

TypeScript, Node.js API, SQLite (local metadata) + connection drivers for Postgres / MySQL / SQLite, Coolify + Docker (self-hosted distribution).

## Architecture

Single-process desktop app (Tauri or Electron) plus a local Node.js sidecar that holds the database drivers. Workflows are plain JSON files; the UI is a list of steps with a parameter-binding sidebar.

## Milestones

- **M0:** SPEC + DESIGN approved.
- **M1:** Connection management + one-step SQL run.
- **M2:** Workflow editor + parameter binding.
- **M3:** Local persistence + JSON export; package as desktop binary.

## Risks

- Different SQL dialects (Postgres vs MySQL) need careful handling of parameter placeholders.
- Connection-pool isolation: a workflow with parallel steps must not starve one database.
- Desktop distribution (codesign, auto-update) is heavier than a web deploy.
