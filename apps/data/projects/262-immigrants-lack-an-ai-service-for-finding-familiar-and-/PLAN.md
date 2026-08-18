---
id: "262"
slug: immigrants-lack-an-ai-service-for-finding-familiar-and-
title: "Immigrants lack an AI service for finding familiar and verified places (pharmacies, doctors, banks) in a new country, causing daily stress and time loss"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/zlt9tnxv31-immigrants-lack-an-ai-service-for-findin"
category: other
date: "2026-01-03"
tags: [Immigration, AI, Other]
country: Serbia
---
# Immigrants lack an AI service for finding familiar and verified places (pharmacies, doctors, banks) in a new country, causing daily stress and time loss

## Tech Stack

- Next.js + TypeScript for the public search surface, the place profile pages, and the community Q&A threads; chosen because SEO matters for newcomers Googling for a pharmacy that speaks their language, and Next.js's i18n story is mature.
- PostgreSQL with Prisma for places, categories, languages, evidence tags, confirmations, and Q&A threads.
- A small Node.js API (Express) for the "I was helped here" confirmation flow and the multilingual search query handling.
- Mapbox (or MapLibre + OpenStreetMap) for the place map; multilingual place-name rendering uses OpenStreetMap's name:lang tags.
- Meilisearch (or OpenSearch) for the multilingual search index over place names, languages spoken, and confirmation patterns.
- A small operator console for seeding the initial 30–50 places per category with verified starter tags.
- Self-hosted on Coolify; the workload is per-search, low-throughput, and predictable.

## Architecture

Three pieces:

1. **Public surface** — multilingual search (origin country, languages, category), place profile pages with evidence tags, community Q&A threads per place.
2. **Confirmation flow** — when an immigrant reports being helped at a place, the service updates the place's evidence tag with the origin country and the date; the immigrant's confirmation is the tag's source.
3. **Operator console** — used by the service operator to seed the initial place directory (30–50 per category) with starter tags the operator has verified offline (via phone call to the place).

The MVP does not run booking, e-payment, or prescription handling.

## Milestones

- **M1 — Place data model + operator console.** Operator seeds 30–50 places per category in Belgrade with starter evidence tags.
- **M2 — Multilingual search.** Public search by origin country, languages, category; results ranked by evidence.
- **M3 — Place profile + community Q&A.** Profile page with evidence tags; one thread per place; replies in the immigrant's language.
- **M4 — Confirmation flow.** "I was helped here" action; evidence tag updates with the origin country and date.
- **M5 — Second-city expansion.** Add the second pilot city with the same operator-seed workflow.

## Risks

- Evidence honesty: a "served immigrants from [origin country]" tag the platform invents is a marketing surface, not evidence. The MVP must source the tag from a confirmation flow the immigrant triggers.
- Multilingual support is a real cost. The MVP must pick pilot languages (Russian, Arabic, Chinese, English) and accept that other languages are out of scope at launch.
- Category and geographic coverage is finite. The MVP must be honest about what it covers (three categories, two cities).
- Cold-start: a directory with no evidence tags is just a directory. The MVP needs the operator-seeded starter tags to break in before immigrant confirmations accumulate.
- Local-business trust: a place listed on the platform must not be misled about what the listing says. The MVP publishes the listing's contents (evidence tag, languages, documentation accepted) and what it does not (a star rating the platform invents).
