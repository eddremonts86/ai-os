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

## Problem

The Elixir web ecosystem has Phoenix for full web apps but no first-class, Astro-style static site generator: a tool that ships pre-rendered HTML and CSS while letting interactive components hydrate as TypeScript islands. The poster's library, Astral (elixir-volt/astral), brings Astro-class features to Elixir — pages, Markdown, layouts, content collections, pagination, feeds, sitemaps, and component templates — while Volt handles TypeScript, CSS, assets, dev serving, and HMR. Install is `mix archive.install hex igniter_new && mix igniter.new my_site --install astral && cd my_site && mix astral.dev`. Build with `mix astral.build`, which writes static files to `dist/`. The README emphasises "no JavaScript site config, no separate bundler process, no Node.js requirement for the default toolchain." Nested islands can span frameworks (a React parent can render a Svelte child); the child is rendered into the parent's static slot HTML and hydrates after the parent mounts. The library is at version 0.2.4, MIT-licensed.

## Objective

Give Elixir developers an Astro-class static site generator that uses Volt for TypeScript, CSS, and islands, so they can build docs, blogs, marketing pages, and content sites with Elixir config and templates and ship static files to any host.

## Target Users

- Elixir developers who want a static site generator without leaving the BEAM
- Phoenix teams writing docs and marketing pages who do not want a Node.js bundler in the loop
- Indie hackers running small content sites on a self-hosted VPS
- Library authors who want HMR-driven docs with Elixir-side config

## MVP Scope

- Pages, Markdown, layouts, content collections
- TypeScript and CSS via Volt, with HMR in dev
- Component templates and pagination
- Atom / RSS feeds and sitemaps
- Cross-framework nested islands (e.g. React parent, Svelte child)
- Static build to `dist/` for any CDN

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- MIT-licensed; commercial use permitted
- No Node.js requirement for the default toolchain
- Static-first; islands hydrate after the parent mounts
- Builds emit to `dist/` only