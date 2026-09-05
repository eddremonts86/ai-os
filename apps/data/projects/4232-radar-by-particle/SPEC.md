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

## Problem

Podcasts have become a sprawling corpus — millions of shows, thousands of new episodes per day — and the user has no single way to find what they want to listen to beyond platform-specific search and a feed of recommendations from a single provider. The Particle launch post names the alternative: a podcast search engine. The post is short — a tagline and a discussion link — but the engine claim is explicit: the user is searching a corpus, not browsing a feed. The source names the actor (a podcast listener who wants a single search surface across the corpus), the pain (platform-specific search does not let the user search what they want to listen to across the corpus), and the missing thing (a search engine for podcasts that returns results across the corpus). It does not name a specific corpus size, a specific search modality (keyword, semantic, hybrid), or a specific listening integration.

## Objective

Ship a podcast search engine that returns results across the corpus of podcasts and episodes, so the user can search what they want to listen to in a single surface and is not limited to platform-specific search or a single provider's feed.

## Target Users

- Podcast listeners who want a single search surface across the corpus of podcasts and episodes.
- Researchers and journalists who need to find specific moments in specific episodes across many shows.
- Niche-topic listeners who want to find the small shows that cover their topic, not the top-of-feed recommendations.
- Power users who want to search transcripts, topics, or guests across the corpus.
- Producers and hosts who want to know what other shows cover their topic and where their guests have appeared.

## MVP Scope

- A search surface where the user enters a query and receives podcast and episode results across the corpus.
- A corpus index of podcasts and episodes, with metadata the engine can search (title, description, transcript, tags, guests).
- A search modality that returns relevant results (the source names no specific modality; the modality is the engine's claim).
- A per-result deep link to the episode on its platform of origin (so the user can listen where they already listen).
- A listen queue the engine can build across shows (so the user can curate a session from search results).
- A history of recent searches the user can revisit.
- A corpus refresh cadence that picks up new episodes (the source names no specific cadence; the cadence is the engine's claim).

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The search is across the corpus. A result set that is limited to one provider's catalogue is a coverage gap.
- The search surface returns podcast and episode results. A result set that hides either is a UX gap.
- The per-result deep link goes to the episode on its platform of origin. A link that requires the user to switch to a new platform is a deep-link failure.
- The listen queue is built from search results, not from a single show. A queue limited to one show is a queue failure.
- The search history is per-user. A history that is not per-user is a privacy regression.
- The corpus refresh picks up new episodes on a documented schedule. A stale corpus is a coverage gap, not a feature.