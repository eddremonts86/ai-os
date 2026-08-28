---
id: "253"
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
---
# Parents lack precise warnings about violent scenes in movies to safely watch films with their children

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/253-parents-lack-precise-warnings-about-violent-scenes-in-m/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Build the data model (films, languages, scenes, severity tags, curators, reviews) in PostgreSQL with Prisma; keep "source" (human / automatic) on each scene record so future ML detection does not require a schema rewrite.
- [ ] Build the curator console: curator reviews a film, records timestamped scenes, sets severity, submits the review, signs with name and date.
- [ ] Build the server-rendered public film pages with timestamped warnings, severity tags, and curator attribution.
- [ ] Add search (by title) and filters (language, year, severity, category).
- [ ] Build the scene-skip view optimised for during-the-watch use: large timestamp list, minimal chrome.
- [ ] Onboard 3–5 curators and seed 50 films popular with Indian families (Hindi, Tamil, Telugu, Malayalam, English-with-dub).
- [ ] Enforce the "no plot, no outcome, no character name" rule on curator submissions before they go public.

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (the chosen stack) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 253-parents-lack-precise-warnings-about MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in India completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for the chosen stack errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
