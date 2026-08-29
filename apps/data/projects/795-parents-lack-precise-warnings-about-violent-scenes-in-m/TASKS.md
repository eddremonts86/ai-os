---
id: "795"
slug: parents-lack-precise-warnings-about-violent-scenes-in-m
title: Parents lack precise warnings about violent scenes in movies to safely watch films with their children
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/media/ar3ebnm6c1-parents-lack-precise-warnings-about-viol"
category: media
date: "2026-01-10"
tags: [Media, Other]
country: India
tech: [Python, FastAPI, PostgreSQL, Elasticsearch, Redis, React (TypeScript), TMDB API, Common Sense Media API (or equivalent), Crowdsourced annotation pipeline, Vercel-style CDN, Coolify]
---
# Parents lack precise warnings about violent scenes in movies to safely watch films with their children

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/795-parents-lack-precise-warnings-about-violent-scenes-in-m/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Integrate TMDB as the film metadata source; build the per-film record and the queue model.
- [ ] Author the published violence rubric: category taxonomy, intensity scale, duration field, with examples per category.
- [ ] Build the annotator console: timeline editor, scene entry with timestamp, category, intensity, duration, and the annotator-identifier stamp.
- [ ] Implement the consensus pipeline: Redis stream aggregation, the consensus threshold (stated number of annotators, tolerance bounds), and the published-record model.
- [ ] Implement the Elasticsearch index for film lookup and scene search, with filters by title, year, language, category, intensity, duration.
- [ ] Build the parent-facing surface: search, three breakdown shapes (chronological list, timeline strip, scenes-to-skip), the "not yet annotated" state.
- [ ] Add Hindi and English copy on the parent-facing surface and the annotator console.
- [ ] Build the admin console: inter-annotator agreement metrics, dispute resolution, rubric versioning.
- [ ] Add the disputed-annotation escalation path documented for parents who contest a published warning.
- [ ] Add the published-annotation provenance: every published scene warning carries the consensus count and the annotator identifiers.
- [ ] Add the explicit disclaimer that the MVP is an annotation overlay, not a content-rating system, on every parent-facing page.
- [ ] Add the Common Sense Media (or equivalent open-review) reference as a starting point where the data is available, so annotators build on prior work.
- [ ] Run an end-to-end test: five films onboarded, twenty scenes annotated across the five, consensus reached on ten, a parent searches and opens one annotated film and sees the breakdown in all three shapes.

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-18_
