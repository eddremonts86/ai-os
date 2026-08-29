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

## Tech Stack

- **Python with FastAPI** for the API and the data ingestion service, because Python's data-handling ecosystem fits public-bulletin parsing and FastAPI gives a typed boundary.
- **Pydantic** for the data schemas, so the public-bulletin shape is validated on load and a malformed feed entry fails before it reaches the user.
- **PostgreSQL with PostGIS** for the storm positions, tracks and cones, so spatial queries (storms near a point, cones overlapping a region) are first-class.
- **Leaflet** as the map library on the frontend, because it is the de facto open-source map library and the project does not need to reinvent map rendering.
- **HTMX** for the frontend interactivity, so the page can be server-rendered and the map stays the primary surface rather than a single-page-app shell.
- **A scheduler-driven ingestion loop** for refreshing the public feeds at their documented cadence, with staleness visible to the user when a feed is late.
- **Public NHC bulletin feeds** (named as the canonical public source the project will support; other agencies may be added with the same documented-source discipline).

## Architecture

The tracker is a public website backed by an API and an ingestion loop. The ingestion loop reads the named public feeds at their documented cadence, parses each bulletin into a normalized form (storm identifier, position, forecast cone vertices, model output points, public warnings), and persists them in PostgreSQL with PostGIS so spatial queries are first-class. The API serves the current state for a storm or a list of storms, and the frontend renders the map, the storm detail page, and the list of active storms.

The data-source page is a load-bearing surface. Every feed the tracker uses is named with its agency, URL, license and refresh cadence, and the feeds the tracker deliberately does not use are listed for honesty. The capture does not name the agencies, so the plan picks the public NHC feeds as the canonical MVP source and treats additional agencies as additive with the same documented-source discipline.

Forecast cones and model output are attributed to the issuing agency on every page where they appear. The tracker does not reinterpret them and does not blend them into a single line; if multiple agencies issue cones for the same storm, they are shown side by side with their attribution rather than averaged. This is the trust property of the tracker: the cones are not the tracker's opinion.

Data freshness is safety-adjacent, so the architecture makes staleness visible. Every storm page shows the most recent update time, and the ingestion loop surfaces a "feed is late" state to the operator when a scheduled refresh misses its window. The frontend renders the staleness explicitly so the user knows how fresh the data is, rather than presenting a position that may be hours old as if it were current.

The frontend is server-rendered with HTMX for interactivity and Leaflet for the map. The mobile interface is a first-class surface, not a desktop view that happens to scale down, because the buyer is often checking a storm from a phone. The historical view is scoped to active storms and recent seasons in MVP; deeper history is a documented roadmap item rather than a hidden MVP item, because historical depth is a real cost in storage and ingestion.

## Milestones

1. **M1 — Data-source page** — every feed the tracker uses is named with agency, URL, license and refresh cadence, and the feeds deliberately not used are listed.
2. **M2 — Ingestion loop** — a scheduled loop that reads the named feeds, parses each bulletin into the normalized form, and persists them in PostgreSQL with PostGIS.
3. **M3 — Public API** — endpoints for the list of active storms and the detail of a single storm, with the staleness metadata surfaced.
4. **M4 — Map and storm page** — Leaflet-based map with current positions, forecast cones, and the storm detail page following one storm over its lifetime.
5. **M5 — Attribution surface** — every cone and model output names the issuing agency; multi-agency cones are shown side by side, not blended.
6. **M6 — Staleness visibility** — most-recent-update time on every storm page, with a "feed is late" state surfaced to the operator and visible to the user.
7. **M7 — Mobile interface** — a phone-first layout, not a desktop view that happens to scale down.
8. **M8 — Historical view (scope-bounded)** — active storms and recent seasons in MVP; deeper history as a documented roadmap item.

## Risks

- **Stale data presented as fresh** — a safety-adjacent failure; staleness has to be visible on every page and visible to the operator when ingestion is late.
- **Unattributed cones** — presenting a forecast cone as the tracker's opinion is a trust failure; attribution is mandatory on every page.
- **Feed drift** — public feeds change format; the ingestion loop has to fail loudly on a format change rather than silently drop bulletins.
- **Mobile usability** — a desktop view that happens to scale down is a failure mode for storm tracking; phone-first layout is the architectural commitment.
- **Historical depth cost** — deep history is real storage and ingestion cost; the plan scopes MVP to active storms and recent seasons.
- **Gap-filling temptation** — when a feed is silent, the temptation to fill the gap with a guess is the headline failure mode; the tracker stays silent when the feed is silent.
- **Unsupported basin surprise** — the supported-basin list has to be documented honestly so a user does not assume coverage the tracker does not have.
