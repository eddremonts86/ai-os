---
id: "4181"
slug: actionful-strongly-typed-workflows-via-native-http-endp
title: "Actionful – strongly typed workflows via native HTTP endpoints"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49510162"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---

# Actionful – strongly typed workflows via native HTTP endpoints

## Tech Stack

The product is the workflow runtime + HTTP layer; the surrounding docs site uses React + TypeScript on TanStack Start with SQLite/Drizzle for the workflow catalogue. Coolify hosts the docs behind Docker.

## Architecture

The runtime owns each workflow definition; the HTTP layer exposes them as endpoints with typed request/response shapes; the client is generated from the workflow definition. The docs site is a TanStack Start app serving the workflow catalogue and per-workflow documentation; Coolify hosts it behind Docker.

## Milestones

- M1 — Workflow authoring surface with typed inputs and outputs.
- M2 — HTTP endpoint per workflow with typed request/response.
- M3 — Typed client generator.
- M4 — Documentation page per workflow.
- M5 — Public release.

## Risks

- Strong typing has to survive the HTTP boundary; an untyped server breaks the promise.
- The capture did not return live content, so concrete primitives (auth, retries) are not extractable and have to be inferred from the title alone.
