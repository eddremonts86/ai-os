---
id: "4171"
slug: repoflows-interactive-architecture-diagrams-for-github-
title: "RepoFlows – Interactive architecture diagrams for GitHub repos"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49511028"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---

# RepoFlows – Interactive architecture diagrams for GitHub repos

## Tech Stack

The web app uses React + TypeScript on TanStack Start with SQLite/Drizzle for the catalogue, gallery, and per-repo metadata. The analyzer is a backend service the app calls; the diagram renderer is a canvas-based client. Coolify hosts the app behind Docker.

## Architecture

A TanStack Start frontend accepts a URL and renders the diagram; a backend analyzer service clones (or reads) the repo, infers the runtime architecture, and stores the result in Drizzle-managed SQLite. The gallery lists recently-visualized repos. The diagram is rendered client-side from a JSON description so it can be cached and re-played without re-analysing. Coolify hosts the app behind Docker.

## Milestones

- M1 — Frontend accepts a GitHub URL and shows a placeholder while analysing.
- M2 — Analyzer infers runtime components for at least one stack (e.g. Node.js + a relational DB).
- M3 — Interactive diagram renderer with back/next / zoom / focus.
- M4 — Public gallery of recently-visualized repos.
- M5 — Multi-stack coverage so the analyzer does not assume a single language.

## Risks

- A general-purpose analyzer is hard; many repos use unusual stacks and the diagram will be wrong or empty.
- A diagram can mislead if it oversimplifies; the product has to disclose what the diagram does and does not show.
