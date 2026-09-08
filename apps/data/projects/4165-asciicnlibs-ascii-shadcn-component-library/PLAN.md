---
id: "4165"
slug: asciicnlibs-ascii-shadcn-component-library
title: "ASCII/cnlibs – ASCII Shadcn component library"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49511358"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---

# ASCII/cnlibs – ASCII Shadcn component library

## Tech Stack

The web layer (catalogue, docs, install command, copy-paste source files) uses React + TypeScript on TanStack Start with SQLite/Drizzle for the catalogue metadata. Coolify hosts the docs site behind Docker. The components themselves rely on Base UI for behavior; the ASCII styling is a CSS layer over Base UI primitives.

## Architecture

A TanStack Start app serves the catalogue and the per-component docs pages, with a Drizzle-managed SQLite store for component metadata (name, category, install snippet, dependencies). The component source files live in the repo and are served as raw text when the user clicks "copy". Base UI is the runtime behavior layer; the ASCII treatment is a stylesheet that re-skins Base UI primitives. Coolify hosts the docs site behind Docker.

## Milestones

- M1 — Catalogue page lists every shadcn component with its ASCII rendering.
- M2 — A `cnlib add {component}` CLI (or shadcn-compatible installer) writes the source into the user's project.
- M3 — Keyboard / ARIA behavior validated against Base UI for the full set.
- M4 — Per-component docs page with a copy-paste example and the keyboard cheat sheet.
- M5 — Public release with a versioned install command.

## Risks

- shadcn/ui keeps growing; staying in lock-step with new components is a maintenance burden.
- Some shadcn components lean on SVG icons; the ASCII constraint means those need a redesign or a replacement glyph.
- If Base UI changes behavior, the library has to follow; otherwise accessibility regressions creep in.
