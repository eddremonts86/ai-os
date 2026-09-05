---
id: "4188"
slug: cool-concepts
title: "Cool Concepts"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49509756"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---

# Cool Concepts

## Tech Stack

The demo is a single-page browser app; the surrounding site uses React + TypeScript on TanStack Start with SQLite/Drizzle for the (anonymous) usage counters. Coolify hosts the site behind Docker.

## Architecture

A TanStack Start app serves the single-page demo; the word-brain is a small client-side model so no API call is required. A Drizzle-managed SQLite store holds (anonymous) usage counters; the demo does not collect personal data. Coolify hosts the site behind Docker.

## Milestones

- M1 — Word list and the drag-and-drop UI.
- M2 — Mix two words into a new one.
- M3 — Keyboard fallback (arrow keys, Space, E).
- M4 — In-browser word-brain describes the mash-up.
- M5 — Public release.

## Risks

- The "word-brain" is a tiny client-side model; if the descriptions are off, the toy loses its charm.
- The mash-ups need to read like real concepts; a bad starting vocabulary breaks the illusion.
