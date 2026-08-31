---
id: "3830"
slug: we-built-semantic-search-over-the-gta-6-extended-look
title: We built semantic search over the GTA 6 Extended Look
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49493435"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
tech: [SAM3 video segmentation, Gemini Embedding 2 ontology capture, semantic search index, Gemini Flash shot descriptions, game entity ontology, trailer search UI]
---
# We built semantic search over the GTA 6 Extended Look

## Phase 0: Scaffold

- [x] Read the Show HN post to capture the model stack (SAM3, Gemini Embedding 2, Gemini Flash) and the ontology scope
- [x] Write SPEC.md (this document)
- [x] Ingest the GTA 6 Extended Look trailer and extract frames
- [x] Run SAM3 segmentation over the frame set

## Phase 1: Core

- [ ] Build the entity ontology: characters, vehicles, weapons and buildings
- [ ] Embed entities and shots for semantic search
- [ ] Generate per-shot and per-scene descriptions with Gemini Flash
- [ ] Ship the search UI on tracker.gg
- [ ] Validate search results against manual frame checks

## Phase 2: Deploy

- [ ] Measure precision on entity queries and fix the worst misses
- [ ] Decide whether to extend the ontology beyond the four named classes
- [ ] Evaluate reuse of the pipeline on other trailers or games

---

_Generated automatically by Lúa on 2026-08-30_
