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

## Problem

The team built semantic search over the GTA 6 Extended Look trailer. They used SAM3 and Gemini Embedding 2 to capture "a limited ontology" over the preview — characters, vehicles, weapons and buildings — combined with Gemini Embedding so users can search for those entities, and Gemini Flash to produce descriptions of each shot and each scene. The capture links the live page on tracker.gg, posted by a trackernetwork member.

## Objective

Let fans search inside a trailer the way they search a document: semantic search over the GTA 6 Extended Look that finds characters, vehicles, weapons and buildings by meaning, with per-shot and per-scene descriptions to browse.

## Target Users

- GTA 6 fans hunting for a specific character, vehicle or weapon in the preview.
- Trailer analysts who want per-shot and per-scene descriptions.
- Gaming communities that track details across trailer frames.

## MVP Scope

- Semantic search over the GTA 6 Extended Look trailer.
- An ontology limited to characters, vehicles, weapons and buildings — the team's own scope word.
- Shot and scene descriptions generated with Gemini Flash.
- A live page on tracker.gg where users try the search.

## Constraints

- The ontology is "limited" by the team's own description — coverage is partial by design.
- A single video corpus: the GTA 6 Extended Look, not a general video-search platform.
- The pipeline is Google-model-bound (SAM3, Gemini Embedding 2, Gemini Flash).
- Nothing is stated about non-GTA trailers or reuse of the index.

## Design Direction

See `DESIGN.md` for this project's design tokens.
