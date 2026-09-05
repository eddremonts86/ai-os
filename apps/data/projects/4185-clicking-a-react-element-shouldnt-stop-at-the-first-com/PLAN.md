---
id: "4185"
slug: clicking-a-react-element-shouldnt-stop-at-the-fir
title: "Clicking a React element shouldn't stop at the first component"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49509914"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---

# Clicking a React element shouldn't stop at the first component

## Tech Stack

The affordance is a browser / DevTools extension; the surrounding docs site uses React + TypeScript on TanStack Start with SQLite/Drizzle for the heuristic-rule catalogue. Coolify hosts the docs behind Docker.

## Architecture

A small extension / script reads the React DevTools tree and applies the drill-past-the-boundary heuristic to surface the responsible component. A jump-to-source action uses the source map to open the file at the right line. The docs site is a TanStack Start app Coolify hosts behind Docker.

## Milestones

- M1 — Heuristic identifies the responsible component in a textbook example.
- M2 — Heuristic handles `.map()`, conditionals, HOCs.
- M3 — Jump-to-source action opens the file at the right line.
- M4 — Walkthrough of the heuristic on a non-trivial React tree.
- M5 — Public release.

## Risks

- The heuristic has to handle real React code without false positives; a wrong "responsible component" is worse than the current behaviour.
- Source map availability is a hard requirement; the affordance has to degrade gracefully when there is no source map.
