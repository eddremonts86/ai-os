---
id: "4226"
slug: live-step-through-diagram-embeds-for-confluence
title: "Live, step-through diagram embeds for Confluence"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49506940"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---

# Live, step-through diagram embeds for Confluence

## Tech Stack

The product is the canvas + the Confluence embed; the surrounding site uses React + TypeScript on TanStack Start with SQLite/Drizzle for the flow catalogue and the per-flow usage log. Coolify hosts the site behind Docker.

## Architecture

A TanStack Start app hosts the step-through canvas and the embed renderer; the flow definitions live in a Drizzle-managed SQLite store, and the Confluence embed reads the live definition from a per-flow URL. Coolify hosts the site behind Docker.

## Milestones

- M1 — Step-through canvas with steps, decisions, and handoffs.
- M2 — Back / Next controls walk a viewer through the flow.
- M3 — Confluence embed reads the live flow from the URL.
- M4 — Update story: a flow change refreshes the embed without a re-upload.
- M5 — Public release.

## Risks

- "Updates without re-export" is a load-bearing claim; if the embed is cached or stale, the product loses its reason to exist.
- Confluence's embed model has quirks; the integration has to handle permission changes, page moves, and embed removal.
