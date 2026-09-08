---
id: "4204"
slug: astral-astrojs-but-in-elixir
title: "Astral – Astro.js, but in Elixir"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49508900"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Astral – Astro.js, but in Elixir

## Tech Stack

- Elixir as the host language (Mix project, MIT)
- Volt for TypeScript, CSS, assets, dev serving, and HMR
- Markdown + EEx for content
- Atom / RSS feeds and sitemap generation
- Hex.pm for package distribution
- HexDocs for documentation hosting
- Coolify + Docker if a self-hosted docs site is needed (the canonical docs live on HexDocs)
- `dist/` as the static build output

## Architecture

The Astral Mix project compiles pages, layouts, and content collections from Elixir templates. Volt handles the TypeScript and CSS pipeline plus the dev server with HMR. Islands are components that render into static HTML at build time and hydrate in the browser after the parent mounts. Nested islands can cross framework boundaries (a React parent can render a Svelte child). The build step writes static files to `dist/`, which can be served by any static host or CDN.

## Milestones

1. Mix project skeleton with Astral as a dependency
2. Markdown page rendering and content collections
3. Layouts and component templates with Volt HMR
4. Pagination, atom / RSS feeds, and sitemap generation
5. Cross-framework nested islands
6. Static build to `dist/` with sourcemaps
7. HexDocs publish of the canonical guides

## Risks

- Volt dependency risk — small ecosystem, single-vendor risk
- Island hydration edge cases on complex SSR-heavy pages
- Cross-framework island nesting must keep hydration order stable
- Maintenance load on a single maintainer