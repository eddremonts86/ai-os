---
id: "3756"
slug: datazen-a-local-first-client-for-cross-database-workflo
title: "DataZen – a local-first client for cross-database workflows"
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

## Phase 0: Scaffold

- Scaffold the desktop shell with a local Node.js sidecar.
- Implement connection management with credential storage in the OS keychain.
- Add a one-step SQL runner with a results grid.
- Define the JSON workflow schema (steps + parameter bindings).
- Build the workflow editor: list of steps, binding sidebar, save to JSON.
- Run a workflow end-to-end; surface per-step metrics + sample rows.
- Hand-test with three databases (Postgres + MySQL + SQLite).

## Phase 1: Core

- All MVP Scope items shipped end-to-end.
- Engineer can author a three-step workflow with parameter binding in under five minutes.
- Workflows save and reload cleanly; no data loss on close.
- Connection secrets stay in the keychain; no plain-text credentials on disk.
- Test coverage on the workflow runner and the parameter binder.

## Phase 2: Deploy

- Package the desktop binary (Tauri or Electron).
- Document the local-first claim: workflows on disk, secrets in keychain, no analytics.
- Publish to a self-hostable distribution channel.
- Capture three real workflows as case studies (one incident investigation, one onboarding query, one audit pull).
