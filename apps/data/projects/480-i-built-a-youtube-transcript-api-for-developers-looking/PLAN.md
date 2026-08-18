---
id: "480"
slug: i-built-a-youtube-transcript-api-for-developers-looking
title: I built a YouTube Transcript API for developers — looking for feedback
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/indiehackers/comments/1vgc5aa/i_built_a_youtube_transcript_api_for_developers/"
category: indiehackers
date: "2026-08-05"
tech: [Node.js (Fastify), TypeScript, PostgreSQL, Redis, Railway, RapidAPI marketplace]
---
# I built a YouTube Transcript API for developers — looking for feedback

## Tech Stack

Chosen for this problem:

- Node.js (Fastify)
- TypeScript
- PostgreSQL
- Redis
- Railway
- RapidAPI marketplace

## Architecture

Node.js (Fastify) API; PostgreSQL for transcript cache; Redis for rate limiting + ephemeral cache; Railway for hosting; RapidAPI marketplace listing.

## Milestones

- REST endpoint + auth
- Metadata + language endpoints
- Rate limiting + caching
- OpenAPI documentation

## Risks

- YouTube ToS changes
- Caption availability variance
