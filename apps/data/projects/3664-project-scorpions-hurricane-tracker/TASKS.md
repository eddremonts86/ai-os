---
id: "3664"
slug: project-scorpions-hurricane-tracker
title: Project Scorpions – Hurricane Tracker
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49482460"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [Python, FastAPI, PostgreSQL with PostGIS, Pydantic, Leaflet (frontend), HTMX, NHC public bulletin feeds]
---
# Project Scorpions – Hurricane Tracker

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/3664-project-scorpions-hurricane-tracker/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Pick the MVP data sources with agencies, URLs, licenses and refresh cadences, and publish them in a documented data-source page
- [ ] Build the scheduled ingestion loop that reads the named feeds, parses each bulletin, and persists the normalized form in PostgreSQL with PostGIS
- [ ] Implement the public API endpoints for the list of active storms and the detail of a single storm, with staleness metadata surfaced
- [ ] Build the Leaflet-based map with current storm positions and forecast cones, and the storm detail page following one storm over its lifetime
- [ ] Attribute every cone and model output to the issuing agency; show multi-agency cones side by side rather than blending them
- [ ] Make staleness visible: most-recent-update time on every storm page, and a "feed is late" state surfaced to the operator and the user
- [ ] Build a phone-first layout as the primary interface, not a desktop view that happens to scale down
- [ ] Document the historical depth scope honestly: active storms and recent seasons in MVP, deeper history as a roadmap item
- [ ] Document the supported basins for MVP and the ones deliberately not supported, so the user does not assume coverage the tracker does not have
- [ ] Resist filling gaps with guesses: if a feed is silent, the tracker is silent, and the user is shown the silence rather than a fabricated position

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-28_
