---
id: "443"
slug: the-gap-between-quotthe-ai-built-itquot-and-quotit-surv
title: "the gap between \"the AI built it\" and \"it survived real users\" is where all our bugs live"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vnzx5n/the_gap_between_the_ai_built_it_and_it_survived/"
category: saas
date: "2026-08-14"
tech: [TypeScript, Node.js (Fastify), PostgreSQL, Redis, BullMQ, Docker, Hetzner]
---
# the gap between "the AI built it" and "it survived real users" is where all our bugs live

## Tech Stack

Chosen for this problem:

- TypeScript
- Node.js (Fastify)
- PostgreSQL
- Redis
- BullMQ
- Docker
- Hetzner

## Architecture

TypeScript orchestrator; Fastify control API; Postgres for runs + scorecards; Redis + BullMQ for job queue; Docker for ephemeral workers; Hetzner for compute.

## Milestones

- Public-URL submission + brief
- Synthetic load + edge-case fuzz
- Scorecard output with concrete failures
- Optional: source-upload mode for deeper fuzzing

## Risks

- Worker compute cost
- Scorecard accuracy vs. real user behaviour
