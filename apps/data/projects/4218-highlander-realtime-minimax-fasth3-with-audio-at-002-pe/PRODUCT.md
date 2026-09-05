---
id: "4218"
slug: highlander-realtime-minimax-fasth3-with-audio-at-002-pe
title: "Highlander – realtime MiniMax FastH3 with audio at $0.02 per second"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49507642"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---

# Highlander – realtime MiniMax FastH3 with audio at $0.02 per second

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

Highlander gives a developer a hosted realtime video generation endpoint with native synchronised audio at $0.02 per second. The hardware story (eight H100s, the FastH3 VSA checkpoint of MiniMax H3) and the speed story (0.94x realtime at 1344×768, 24 fps) are the differentiators.


## Target Users

Developers and creative teams that need short generated video clips with audio and want a hosted endpoint instead of standing up their own GPU cluster. Assumes the reader can call an HTTP API and pay per second of output.

## Jobs To Be Done

- When I need a short generated video clip, I want a hosted endpoint so I do not have to stand up my own GPU cluster.
- When the clip needs audio, I want it synchronised natively so I do not have to post-process a separate audio track.
- When I am on a budget, I want a per-second price so I can predict the cost before I commit.


## Success Metrics

- Number of clips generated per day.
- Average latency from prompt to delivered clip.
- Cost per clip on the reference workload.


## Pricing & Monetization

Source post does not state pricing or monetisation beyond what is named in the live product page (which is referenced where relevant in the Value Proposition). Treat pricing as unstated until the author publishes a model.

## Competitive Landscape

Closely related work includes other hosted video-generation services (Runway, Pika, Luma) and open-source video-diffusion repos. The captured source post positions Highlander around realtime generation at $0.02/sec with native audio, but does not enumerate specific competitors by name.


## Risks & Open Questions

- Pricing has to match what the post says; a different rate breaks the headline claim and the metering has to be precise.
- The cluster is bounded by eight H100s; throughput cannot exceed the cluster, so queueing during spikes is a real risk.
