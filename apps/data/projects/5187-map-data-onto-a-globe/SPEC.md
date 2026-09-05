# SPEC.md — map data onto a globe

## Problem

i love globes and maps<p>often looking at a map gives you a better feeling for things<p>this is a globe that can display data<p>example data sets include active volcanos, UNESCO world heritage sites, IKEAs worldwide, …<p>but what makes this interesting is that it also implements WebMCP which lets an agent (e.g. ChatGPT desktop app) directly drive the globe<p>it exposes a handful of tools to add&#x2F;load a dataset, do SQL queries and visualize the results using the globe<p>querying are powered by DuckDB (via webassembly)<p>globe is globe.gl (<a href="https:&#x2F;&#x2F;globe.gl" rel="nofollow">https:&#x2F;&#x2F;globe.gl</a>)<p>more on WebMCP (OpenAI calls it &#x27;site tools&#x27;): <a href="https:&#x2F;&#x2F;learn.chatgpt.com&#x2F;docs&#x2F;webmcp" rel="nofollow">https:&#x2F;&#x2F;learn.chatgpt.com&#x2F;docs&#x2F;webmcp</a><p>source: <a href="https:&#x2F;&#x2F;github.com&#x2F;atlaslib&#x2F;globe" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;atlaslib&#x2F;globe</a><p>demo video: <a href="https:&#x2F;&#x2F;x.com&#x2F;__tosh&#x2F;status&#x2F;2096109149654339795" rel="nofollow">https:&#x2F;&#x2F;x.com&#x2F;__tosh&#x2F;status&#x2F;2096109149654339795</a><p>a hosted demo: <a href="https:&#x2F;&#x2F;atlas.paperclips.workers.dev" rel="nofollow">https:&#x2F;&#x2F;atlas.paperclips.workers.dev</a><p>you can tell ChatGPT desktop app to open the url using the in-app browser, ask it about the available datasets and which queries it would propose to do, also you can tell it to research something you are interested in and to use the tools to put that onto the globe

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49573615)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-05T06:22:05Z

---

## Objective

Build a solution that addresses this problem clearly and at scale.

---

## Target Users

1. **[Primary user]** — the main user this serves
2. **[Secondary user]** — other relevant users

## MVP Scope

- Core functionality
- Leave out anything beyond the MVP

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Keep the MVP simple
- No unnecessary external dependencies
