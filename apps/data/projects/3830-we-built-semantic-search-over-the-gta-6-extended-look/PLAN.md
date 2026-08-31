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

## Tech Stack

Chosen around the stated model combination for indexing one trailer.

- **SAM3 video segmentation:** segments frames to locate entities.
- **Gemini Embedding 2 ontology capture:** builds the limited ontology over the preview.
- **Semantic search index:** embeddings over entities enable search by meaning.
- **Gemini Flash shot descriptions:** per-shot and per-scene text.
- **Game entity ontology:** characters, vehicles, weapons and buildings as the searchable vocabulary.
- **Trailer search UI:** the live page on tracker.gg.

## Architecture

- **Frame pipeline:** trailer to frames to SAM3 segments.
- **Ontology builder:** entity extraction and embedding with Gemini.
- **Search index:** vector index over entities and shots.
- **Description writer:** Gemini Flash annotates shots and scenes.
- **Search surface:** the tracker.gg page querying the index.

## Milestones

1. **M0 — Frame processing.** The trailer is segmented with SAM3.
2. **M1 — Ontology.** Characters, vehicles, weapons and buildings captured with embeddings.
3. **M2 — Search.** Semantic queries return matching shots on tracker.gg.
4. **M3 — Descriptions.** Gemini Flash shot and scene text browsable alongside results.

## Risks

- **Limited ontology:** the team's own scope word caps what search can find.
- **Model accuracy:** segmentation and descriptions are unverified against ground truth.
- **One-video pipeline:** generality beyond the GTA 6 trailer is unproven.
- **Copyright:** re-serving trailer-derived content needs care.
- **Cost:** repeated Gemini inference over video frames scales with corpus size.
