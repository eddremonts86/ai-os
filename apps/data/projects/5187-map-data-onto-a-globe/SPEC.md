---
id: "5187"
slug: map-data-onto-a-globe
title: map data onto a globe
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49573615"
category: show-hn
date: "2026-09-05"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# map data onto a globe

## Problem

i love globes and mapsoften looking at a map gives you a better feeling for thingsthis is a globe that can display dataexample data sets include active volcanos, UNESCO world heritage sites, IKEAs worldwide, …but what makes this interesting is that it also implements WebMCP which lets an agent (e.g. ChatGPT desktop app) directly drive the globeit exposes a handful of tools to add/load a dataset, do SQL queries and visualize the results using the globequerying are powered by DuckDB (via webassembly)globe is globe.gl (https://globe.gl)more on WebMCP (OpenAI calls it 'site tools'): https://learn.chatgpt.com/docs/webmcpsource: https://github.com/atlaslib/globedemo video: https://x.com/__tosh/status/2096109149654339795a hosted demo: https://atlas.paperclips.workers.devyou can tell ChatGPT desktop app to open the url using the in-app browser, ask it about the available datasets and which queries it would propose to do, also you can tell it to research something you are interested in and to use the tools to put that onto the globe

---

## Objective

_Not written yet — `ai-os plans enrich` fills this section._

## Target Users

_Not written yet — `ai-os plans enrich` fills this section._

## MVP Scope

_Not written yet — `ai-os plans enrich` fills this section._

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

_Not written yet — `ai-os plans enrich` fills this section._
