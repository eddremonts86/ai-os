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

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/480-i-built-a-youtube-transcript-api-for-developers-looking/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] REST endpoint + auth
- [ ] Metadata + language endpoints
- [ ] Rate limiting + caching
- [ ] OpenAPI docs

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Node.js (Fastify), TypeScript, PostgreSQL) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 480-i-built-a-youtube-transcript-api-fo MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in the country stated in the source completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Node.js (Fastify), TypeScript, PostgreSQL errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
