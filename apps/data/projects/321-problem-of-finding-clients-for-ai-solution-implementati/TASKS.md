---
id: "321"
slug: problem-of-finding-clients-for-ai-solution-implementati
title: Problem of finding clients for AI solution implementation in Europe and Eastern
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/ai/05sf6nd821-problem-of-finding-clients-for-ai-solution-imp"
category: ai
date: "2025-10-29"
tags: [AI, Sales, Business]
country: UK
tech: [Next.js 14, TypeScript, Postgres + pgvector, LinkedIn Sales Navigator + Apollo.io adapters, OpenAI API for proposal drafting, Stripe Connect (EU), Hetzner (EU)]
---
# Problem of finding clients for AI solution implementation in Europe and Eastern

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/problem-of-finding-clients-for-ai-solution-implementati/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Prospect discovery via LinkedIn Sales Navigator + Apollo.io with AI-implementation intent signals.
- [ ] Qualification engine: company size, industry, tech stack, AI initiative signals.
- [ ] Outreach composer: per-prospect email + LinkedIn sequences with EU/GDPR-compliant consent flow.
- [ ] Proposal drafting via OpenAI on the consultancy's case studies.
- [ ] CRM sync with HubSpot and Pipedrive.
- [ ] Per-prospect outreach cap + warm-up sequence.
- [ ] Per-prospect right-to-erasure flow (GDPR).
- [ ] EU-wide prospect discovery: UK, Germany, Netherlands, Nordics.
- [ ] Eastern European coverage: Poland, Czech, Romania.
- [ ] Engagement dashboard: pipeline value, conversion rate, closed engagements.
- [ ] Pilot with 30 European AI consultancies; measure engagements closed at week 12.

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Next.js 14, TypeScript, Postgres + pgvector) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 321-problem-of-finding-clients-for-ai-s MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in UK completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Next.js 14, TypeScript, Postgres + pgvector errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
