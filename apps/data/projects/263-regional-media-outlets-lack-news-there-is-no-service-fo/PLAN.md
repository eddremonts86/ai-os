---
id: "263"
slug: regional-media-outlets-lack-news-there-is-no-service-fo
title: "Regional media outlets lack news: there is no service for automatically finding local events and topics not yet covered by competitors"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/media/hap6bnpjo1-regional-media-outlets-lack-news-there-i"
category: media
date: "2026-01-03"
tags: [Media, AI, Other]
country: Russia
---
# Regional media outlets lack news: there is no service for automatically finding local events and topics not yet covered by competitors

## Tech Stack

- Python 3.11 + FastAPI for the API; the work is source ingestion, competitor-coverage checks, and shortlist assembly; Python's HTML parsing and RSS-handling ecosystem is the strongest fit.
- PostgreSQL for sources, candidate stories, competitor coverage records, editor feedback, and the first-mover badge ledger.
- A scheduled worker (Celery beat) for hourly source ingestion and the morning 7am shortlist assembly.
- Resend (or Postmark) for the morning shortlist email.
- A small Node.js console for the editor to maintain the source list and the competitor list.
- Self-hosted on Coolify; the workload is per-region, low-throughput, and predictable.

## Architecture

Three pieces:

1. **Source-ingestion workers** — one worker per source type (city council agendas, court dockets, press releases, social accounts, event listings); each writes candidate stories with a source link and a "first seen by" timestamp.
2. **Competitor-coverage checker** — for each candidate story, the service queries the named competitors' RSS / sitemap for matching coverage; stories not yet covered are surfaced.
3. **Editor console + morning shortlist** — the editor sees the day's un-covered stories in a console and by email at 7am; the editor marks each as covered / not relevant / under investigation; the feedback tunes future shortlists.

The MVP does not include auto-drafting, auto-publishing, or scraping of paywalled outlets.

## Milestones

- **M1 — Source ingestion.** Workers for city council agendas, court dockets, press releases, social accounts, event listings in the pilot region.
- **M2 — Competitor-coverage checker.** A configurable competitor list per outlet; matching coverage is detected via RSS / sitemap.
- **M3 — Morning shortlist.** Email at 7am local time with the day's un-covered stories; one-line summary, source link, "first seen by" timestamp.
- **M4 — Editor console.** Mark covered / not relevant / under investigation; feedback tunes the next day's shortlist.
- **M5 — First-mover badge ledger.** When an outlet publishes a covered story, the badge records that the outlet was first in the region to cover it.

## Risks

- Competitor-list maintenance is the binding constraint. The MVP's "un-covered" claim is only as good as the competitor list the editor maintains; the MVP must surface the list and make it editable.
- Source provenance must be preserved. Every story entry shows where the service first saw it and when; the editor verifies before assigning.
- Rule-based, not ML-based, in v1. The MVP's system is auditable and predictable; an ML-based shortlist is opaque and harder to debug when it misses.
- Source licensing: scraping some Russian local-government sites may be restricted. The MVP uses only publicly-accessible sources and documents the source list.
- Single-region pilot: the MVP is one region, one beat set. Multi-region expansion is a deliberate step after the pilot proves the model.
