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

## Value Proposition

Astro-class static site generation for Elixir — pages, Markdown, layouts, content collections, feeds, sitemaps — with Volt-powered TypeScript islands, HMR, and a static build to `dist/`. No Node.js bundler in the loop.

## Target Users

- Elixir developers who want a static site generator on the BEAM
- Phoenix teams writing docs and marketing pages
- Indie hackers running small content sites
- Library authors who want HMR-driven docs with Elixir-side config

## Jobs To Be Done

- When I write a content site, I want Elixir config and templates so I do not have to learn a Node bundler
- When I add an interactive island, I want HMR and cross-framework nesting so I can mix React and Svelte in the same page
- When I deploy, I want a `dist/` directory I can drop on any CDN so hosting is a one-line decision

## Success Metrics

- 1,000+ downloads from Hex.pm in the first quarter
- 5+ example sites shipping on the platform
- Sub-second HMR for typical content edits

## Pricing & Monetization

MIT; free. Support contracts or hosted Astral are possible but not on the source page.

## Competitive Landscape

- Astro — original; Node.js + Vite
- Hugo — single binary, no islands
- Jekyll, Eleventy — Ruby / Node, no first-class islands
- Phoenix — full web framework, not static-first

## Risks & Open Questions

- Volt ecosystem maturity — early adopters take on dependency risk
- Island hydration model may have edge cases for SSR-heavy sites
- Maintenance depends on a small core team (Danila Poyarkov)
- HexDocs adoption as the canonical docs surface ties the project to Hex.pm