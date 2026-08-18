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

## Tech Stack

- Next.js + TypeScript with a server-rendered public surface (per-film pages, search, filters); the SEO value of public film pages depends on server-rendered HTML, not client-rendered React.
- PostgreSQL with Prisma for films, languages, scenes, severity tags, curators, and reviews; the data model is relational and Prisma's typing keeps curators and severity consistent.
- A small Node.js worker (BullMQ + Redis) for curator-assignment notifications and "unreviewed film" alerts to the operations team.
- A static React component for the severity tag UI; chosen because the component is shared across hundreds of film pages and benefits from a small, dedicated bundle.
- Self-hosted on Coolify; traffic is steady and predictable.

## Architecture

Three pieces:

1. **Public surface** — server-rendered film pages, search, language filter, severity filter, scene-skip view. SEO-sensitive.
2. **Curator console** — a logged-in area where a curator reviews a film, records timestamped scenes, sets severity, and submits the review. Each review is signed with the curator's name and the review date.
3. **Admin back-office** — the operations team assigns unreviewed films to curators, monitors review progress, and resolves curator disagreements by hosting both reviews side by side on the film page.

There is no ML in v1. Scene detection is curator-driven. The architecture must support adding automated detection later without rewriting the data model; the schema keeps "source" (human / automatic) on each scene record.

## Milestones

- **M1 — Data model and curator console.** Film + scene + curator + review schema; curator can review a film, record timestamped scenes, set severity, and submit.
- **M2 — Public film pages.** Server-rendered per-film page with timestamped warnings, severity tags, and the curator attribution.
- **M3 — Search and filters.** Search by title, filter by language, year, severity, and category.
- **M4 — Scene-skip view.** A view optimised for use *during* the watch: large timestamp list, minimal chrome.
- **M5 — Coverage ramp.** Seed 50 films popular with Indian families (Hindi, Tamil, Telugu, Malayalam, English-with-dub); onboard 3–5 curators.

## Risks

- Spoiler discipline: a curator's review that gives away the plot destroys the product. The MVP must enforce a "no plot, no outcome, no character name" rule in the warning text and review submissions before they go public.
- Curator disagreement: two curators may disagree on severity. The MVP must host both reviews side by side on the film page, not pretend severity is mechanical.
- Coverage growth: 50 films is a demo; the product is coverage. The MVP must size the curator workforce against the coverage target before promising scope.
- Cultural fit: the warning rubric must reflect what Indian parents gate on, not just translate a Western one. The MVP needs at least one curator who can speak to the local context per language.
- Streaming-platform integration (a future revenue path) is out of scope for the MVP but the data model must not preclude it.
