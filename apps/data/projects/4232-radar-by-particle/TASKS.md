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

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/4232-radar-by-particle/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Build the corpus index: the podcast and episode schema, the metadata fields the engine searches (title, description, transcript, tags, guests), the initial corpus load with a documented scope.
- [ ] Implement the corpus refresh pipeline with a documented cadence: the new-episode pickup, the metadata attachment, the index update, the freshness measurement.
- [ ] Implement the search runtime: the query parser, the index query against the corpus, the result-set ranking, the result-set mix that includes both podcasts and episodes.
- [ ] Build the search surface: the query input, the result list with both podcasts and episodes, the per-result deep link that lands on the episode's platform of origin.
- [ ] Add the per-user listen queue store: the user adds results from search to a queue that spans shows, the queue persists across sessions, the queue exposes a prune action.
- [ ] Add the per-user search history store: the recent searches the user can revisit, the resume flow that picks up where the last session left off.
- [ ] Build the transcript pipeline that prefers provider-published transcripts and falls back to self-transcription with a documented cost ceiling, feeding transcript text into the corpus index for the search runtime.
- [ ] Enforce the per-user scoping: the listen queue and the search history are keyed to the user, never shared across users; the store rejects cross-user reads.
- [ ] Write the README that documents the corpus scope, the search modality, the deep-link layer, the queue, the history, and the corpus refresh cadence.
- [ ] Run an end-to-end test on a representative set of queries: the engine returns a result set that mixes podcasts and episodes, the top result is relevant, the deep link lands on the platform of origin, the listen queue spans shows, the search history is per-user, and a new episode appears in the index within the documented refresh cadence.

## Phase 2: Deploy

- [ ] Ship the search surface as a hosted service
- [ ] Document the corpus scope, the search modality, and the deep-link coverage in the launch material so users understand the engine's scope
- [ ] Verify in production