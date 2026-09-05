---
id: "4184"
slug: a-file-based-router-for-cloudflare-workers
title: "A file-based router for Cloudflare Workers"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49509922"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---

# A file-based router for Cloudflare Workers

## Tech Stack

The plugin is the deliverable; the surrounding docs site uses React + TypeScript on TanStack Start with SQLite/Drizzle for the example catalogue. Coolify hosts the docs behind Docker.

## Architecture

The Vite plugin reads the routes folder at build time, emits a router handler, and wires it into the Workers entry point. The docs site is a TanStack Start app with the file-shape documentation and the example catalogue; Coolify hosts it behind Docker.

## Milestones

- M1 — Plugin reads the routes folder and emits a handler.
- M2 — File conventions supported (index, dynamic, catch-all).
- M3 — Typed route table export.
- M4 — README with the deploy story.
- M5 — Public release.

## Risks

- File conventions differ subtly across frameworks; copying Next.js too literally will confuse Workers developers.
- Cloudflare Workers' runtime evolves; the plugin has to track the runtime, not just the file shape.
