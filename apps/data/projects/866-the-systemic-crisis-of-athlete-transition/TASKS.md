---
id: "866"
slug: the-systemic-crisis-of-athlete-transition
title: The systemic crisis of athlete transition
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/fitness/jovbc4bek1-the-systemic-crisis-of-athlete-transitio"
category: fitness
date: "2025-10-29"
tags: [Fitness, Health, Career]
country: USA
tech: [Elixir, Phoenix LiveView, PostgreSQL, Oban, S3-compatible object storage, Fly.io]
---
# The systemic crisis of athlete transition

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/866-the-systemic-crisis-of-athlete-transition/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Model the athlete record with sport, level, years, role and responsibilities as sport-agnostic rows
- [ ] Mark injury and departure-reason fields restricted at the schema level and add a test that a match query cannot select them
- [ ] Implement the consent table and route every cross-athlete read through it
- [ ] Build the intake worksheet in LiveView with resumable partial state
- [ ] Implement claim-and-evidence translation, requiring at least one evidence row per claim
- [ ] Render a resume and a written narrative from the claim graph into object storage, versioned
- [ ] Add the athlete-entered exit date and compute reminder steps backward from it
- [ ] Schedule reminders through Oban with per-athlete timezones
- [ ] Implement mentor registration with an explicit request budget and cooldown
- [ ] Build the filtered mentor directory and the bounded request-to-talk flow
- [ ] Add the consent-scoped employer read view
- [ ] Instrument which exit type each user arrives with, for the population question

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-18_
