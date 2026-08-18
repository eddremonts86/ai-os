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

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/443-the-gap-between-quotthe-ai-built-itquot-and-quotit-surv/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Submission flow + worker pool
- [ ] Synthetic load + edge-case fuzz
- [ ] Scorecard output
- [ ] Pricing for source-upload mode

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (TypeScript, Node.js (Fastify), PostgreSQL) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 443-the-gap-between-the-ai-built-it-and MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in the country stated in the source completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for TypeScript, Node.js (Fastify), PostgreSQL errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
