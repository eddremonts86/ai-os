---
id: "3143"
slug: i-built-a-tool-showing-how-ai-providers-should-throttle
title: I built a tool showing how AI providers (should) throttle their models
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49448480"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
---
# I built a tool showing how AI providers (should) throttle their models

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/3143-i-built-a-tool-showing-how-ai-providers-should-throttle/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Pick one numerical example from the paper and pin its inputs as the visualization's default parameters.
- [ ] Build the Flask service that serves those parameters over a small JSON endpoint.
- [ ] Generate the JS frontend (LLM-assisted, grounded in the paper's figure for that example).
- [ ] Hand-check one parameter: confirm the rendered curve matches the figure in the paper for the chosen example.
- [ ] Host the paper writeup and link the visualization from the same page.
- [ ] Add a "toy, not production" disclaimer on the project page so the framing is honest.

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-26_
