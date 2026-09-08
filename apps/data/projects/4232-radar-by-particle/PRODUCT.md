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

## Value Proposition

A podcast search engine that returns podcast and episode results across the corpus, so the user searches what they want to listen to in a single surface and is not limited to platform-specific search or a single provider's feed. The engine indexes podcasts and episodes with the metadata that matters for search (title, description, transcript, tags, guests), returns a result set that mixes shows and episodes, and links each result to its platform of origin so the user listens where they already listen.

The search surface is the corpus, not a feed. The user enters a query, sees podcast and episode results, builds a listen queue across shows, and revisits recent searches. The corpus refresh picks up new episodes on a documented cadence; the engine is honest about what it indexes and what it does not.

**One-liner:** A search engine for podcasts and episodes across the corpus, with deep links to each episode's platform of origin and a listen queue you can build from results.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Podcast listeners | Want a single search surface across the corpus, not a feed from one provider. |
| Researchers and journalists | Need to find specific moments in specific episodes across many shows. |
| Niche-topic listeners | Want the small shows that cover their topic, not top-of-feed recommendations. |
| Power users | Want to search transcripts, topics, or guests across the corpus. |
| Producers and hosts | Want to know what other shows cover their topic and where their guests have appeared. |

## Jobs To Be Done

1. **Functional job** — Enter a query and receive podcast and episode results across the corpus.
2. **Functional job** — Click a result and land on the episode on its platform of origin.
3. **Functional job** — Build a listen queue from search results across shows.
4. **Functional job** — Revisit a recent search and pick up where the last session left off.
5. **Functional job** — Search transcripts, topics, or guests and have the engine surface the matches.
6. **Emotional job** — Stop the feeling that the corpus is too large to search and the user is stuck with whatever one provider surfaces.
7. **Social job** — Be the listener who finds the small shows and the specific moments, not the listener who only knows the top of the feed.

## Success Metrics

- **Corpus coverage** — share of podcasts and episodes the engine indexes relative to the corpus it claims to cover. A coverage gap is a corpus gap, not a search failure.
- **Result-set coverage** — share of queries that return both podcast and episode results. A result set that hides either is a UX gap.
- **Search relevance** — share of queries where the top result is judged relevant by the user. An irrelevant top result is a ranking failure.
- **Deep-link fidelity** — share of results that land on the episode on its platform of origin. A link that requires a platform switch is a deep-link failure.
- **Listen queue coverage** — share of sessions where the user builds a queue from search results across shows. A queue limited to one show is a queue failure.
- **Corpus freshness** — the lag between an episode's publication and its appearance in the engine. A stale corpus is a coverage gap.
- **Search history coverage** — share of recent searches the user can revisit. A history gap is a UX failure.

## Pricing & Monetization

The source names no fee, no tier, and no commercial plan. The launch post is a tagline and a discussion link. Any future monetization has to be measured against the corpus coverage and the search relevance, because those are the metrics the source ties to the engine's value proposition.

## Competitive Landscape

- **Platform-specific podcast search (the names the source does not provide)** — searches one provider's catalogue, not the corpus.
- **Podcast directories (the names the source does not provide)** — list shows by category and rank, but do not return search results across the corpus.
- **Transcription search services (the names the source does not provide)** — search transcripts of a single show or a small set, not the corpus.
- **Recommendation feeds (the names the source does not provide)** — surface what one provider's algorithm recommends, not what the user searches.

The post names no specific incumbent, so no further comparison is claimed here.

## Risks & Open Questions

- [ ] Confirm the corpus scope. The source names no specific corpus size; the open question is whether the engine claims the full corpus or a curated subset.
- [ ] Define the search modality. The source names no specific modality; the open question is whether the engine is keyword, semantic, hybrid, or per-field.
- [ ] Validate the deep-link coverage. The link lands on the platform of origin; the open question is what fraction of episodes have a stable deep link to the platform where the user already listens.
- [ ] Decide how the engine handles a podcast the user has already heard. The search returns it again; the open question is whether the engine surfaces a "you've listened" marker.
- [ ] Establish the corpus refresh cadence. The source is silent; the open question is the maximum lag between publication and indexing.
- [ ] Confirm the listen queue is per-user. A queue shared across users is a privacy regression; the open question is whether the queue syncs across devices.
- [ ] Define the policy on transcripts the show owner has not published. The engine searches transcripts; the open question is whether the engine transcribes episodes itself or skips episodes without a transcript.