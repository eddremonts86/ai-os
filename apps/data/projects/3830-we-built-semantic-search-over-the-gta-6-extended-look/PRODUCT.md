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

## Value Proposition

Search a trailer like you search the web. Over the GTA 6 Extended Look, tracker.gg's semantic search lets users find characters, vehicles, weapons and buildings that appear in the preview — built with SAM3 and Gemini Embedding 2 to capture a limited ontology, Gemini Embedding for the search itself, and Gemini Flash to describe each shot and scene. The value is skipping the scrubbing: ask for a vehicle and land on the shots where it appears.

**One-liner:** Semantic search over the GTA 6 Extended Look — find characters, vehicles, weapons and buildings by meaning.

## Target Users

| Stakeholder | Why they care |
|---|---|
| GTA fans and communities | Find a specific character, vehicle or weapon in the preview without scrubbing. |
| Trailer analysts | Per-shot and per-scene descriptions for close reading. |
| The tracker.gg team | A first video-search surface on their own data. |

The post invites anyone to try the live page; the audience is the GTA community around tracker.gg.

## Jobs To Be Done

1. **Functional job** — Search the trailer for characters, vehicles, weapons and buildings by meaning.
2. **Functional job** — Land on the exact shots where an entity appears.
3. **Functional job** — Read generated descriptions of each shot and scene.
4. **Functional job** — Browse the captured ontology of the preview.

## Success Metrics

- **Search precision:** queries for entities return the correct shots.
- **Ontology coverage:** the share of trailer entities in characters, vehicles, weapons and buildings captured (the team admits it is limited).
- **Shot description quality:** generated descriptions are accurate per shot and scene.
- **Usage:** searches run on the live tracker.gg page — unstated numerically, so directional.

## Pricing & Monetization

None stated. The post is a feature announcement on tracker.gg; no pricing or monetization is mentioned.

## Competitive Landscape

The post does not name competitors. The product sits in video semantic search and game-trailer analysis tooling — frame-level search and entity tagging over video — where the differentiator is the model combination (SAM3 plus Gemini Embedding 2 plus Gemini Flash) applied to a specific trailer ontology.

## Risks & Open Questions

- [ ] The ontology is "limited" by the team's own words; searches outside characters, vehicles, weapons and buildings may miss.
- [ ] All extraction is model-generated; hallucinated entities or shot descriptions would mislead fans.
- [ ] A single-trailer corpus proves the pipeline but not the product's generality.
- [ ] Trailer content is copyrighted; indexing and re-describing it sits in a gray area.
- [ ] The Gemini/SAM3 dependency means pipeline costs and behavior are outside the team's control.
