---
id: "3147"
slug: remap-bike-routing-that-builds-loops-from-the-best-road
title: "Remap – bike routing that builds loops from the best roads, on-device"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49448085"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
---
# Remap – bike routing that builds loops from the best roads, on-device

## Tech Stack

A mobile app carrying a preprocessed local road graph, because loop generation on-device rules out server routing and requires the graph and its quality attributes to ship or download as regional packs.

## Architecture

Open road data is preprocessed into regional graph packs with per-segment quality attributes, downloaded once, and searched locally for a closed circuit near the requested distance. The loop search is the hard part: it is a circuit-finding problem with a preference weighting, not a shortest-path query.

## Milestones

1. Regional road graph packs with quality attributes
2. On-device loop generation for a target distance
3. Quality-weighted preference in the search
4. Ship at remap.earth

## Risks

- Road-quality attributes depend on what the open data covers in each region
- Loop search on a phone has to stay fast enough to feel interactive
- Graph packs consume device storage, which limits regional coverage
