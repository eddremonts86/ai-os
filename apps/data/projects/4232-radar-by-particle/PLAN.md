---
id: "4232"
slug: radar-by-particle
title: Radar by Particle
status: enriched
source:
  name: ProductHunt
  url: "https://www.producthunt.com/products/particle-5"
category: product-launch
date: "2026-08-28"
tags: [ProductHunt, Product Launch]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Radar by Particle

## Tech Stack

- **A search surface** where the user enters a query and receives podcast and episode results.
- **A corpus index** of podcasts and episodes with the metadata that matters for search (title, description, transcript, tags, guests).
- **A search modality** (the source names no specific modality; the modality is the engine's claim).
- **A per-result deep-link layer** that points to each episode on its platform of origin.
- **A listen queue store** that builds a queue from search results across shows.
- **A search history store** the user can revisit.
- **A corpus refresh pipeline** that picks up new episodes on a documented cadence.
- **A transcript pipeline** (the source is silent on transcription; the pipeline is the engine's claim).

## Architecture

The engine is a single search service backed by three components: a corpus index, a search runtime, and a per-user store for queues and history. The corpus index holds the podcast and episode metadata the engine can search; the search runtime answers queries against the index; the per-user store holds the listen queue and the search history.

The corpus index is refreshed on a documented cadence. The refresh pipeline picks up new podcasts and episodes, attaches the metadata the engine can search, and updates the index. The corpus scope is the engine's claim; the source names no specific size.

The search runtime queries the corpus index and returns a result set that mixes podcasts and episodes. The modality is the engine's claim; the source names no specific modality. The result set is ranked by the modality's relevance signal; the top result is what the user sees first.

The deep-link layer attaches a per-result link to the episode on its platform of origin. A link that requires the user to switch platforms is a deep-link failure; the engine's claim is the user lands on the platform where they already listen.

The listen queue store is per-user. The user adds results from search to a queue that spans shows. A queue limited to one show is a queue failure; the queue is the user's curation surface across the corpus.

The search history store is per-user. The user can revisit recent searches and pick up where the last session left off. A history that is not per-user is a privacy regression; the store is keyed to the user.

The transcript pipeline is the engine's claim. The source is silent on transcription; the open question is whether the engine transcribes episodes itself or skips episodes without a transcript. The pipeline feeds the corpus index with transcript text the search runtime can query.

## Milestones

1. **M1 — Corpus index** — the podcast and episode schema, the metadata fields the engine searches, the initial corpus load.
2. **M2 — Corpus refresh pipeline** — the documented cadence, the new-episode pickup, the metadata attachment.
3. **M3 — Search runtime** — the query parser, the index query, the result-set ranking, the podcast-and-episode mix.
4. **M4 — Search surface** — the query input, the result list, the per-result deep link.
5. **M5 — Listen queue store** — the per-user queue, the across-shows curation, the queue persistence.
6. **M6 — Search history store** — the per-user history, the recent-searches view, the resume flow.
7. **M7 — Transcript pipeline** — the transcription or ingestion path, the transcript search integration.

## Risks

- **Corpus gap** — the engine does not index a podcast or an episode the user expects. Mitigation: the corpus scope is documented; a coverage gap is a corpus gap, not a search failure; the user can submit a missing podcast for indexing.
- **Search modality misses the user's intent** — the user enters a query and the top result is not what they wanted. Mitigation: the modality is documented; the result set exposes a relevance signal the user can scan; a relevance failure is a milestone, not a silent ranking.
- **Deep-link drift** — the link lands on the platform of origin but the platform has changed the URL. Mitigation: the deep-link layer is updated on a cadence; a drift is a coverage gap; the user can report a broken link.
- **Listen queue grows unbounded** — the user adds results and never prunes. Mitigation: the queue store has a documented retention policy; the user can prune; a storage hit is a coverage gap, not a silent failure.
- **Search history reveals sensitive queries** — a per-user history leak. Mitigation: the history is per-user, scoped to the user's session; a privacy regression is a security incident.
- **Corpus refresh lag** — a new episode takes too long to appear. Mitigation: the refresh cadence is documented; the lag is measured; a lag over the documented cadence is a test failure.
- **Transcript pipeline cost** — the engine transcribes episodes itself and the cost is too high. Mitigation: the pipeline prefers provider-published transcripts; self-transcription is a fallback with a documented cost ceiling.