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

## Problem

Regional media outlets in Russia — local newspapers, city portals, regional TV station websites — struggle to fill their daily news hole with stories that have not yet been covered by larger outlets. The reporters are stretched thin, the local beat (city council, school board, local business, sport club, cultural event) generates raw material continuously, but no service is gathering that material and surfacing it as "this is what is happening in your region today that no one else has covered."

The poster frames the missing piece as an automatic discovery service: the outlet names its region and its competitor list, and the service returns the day's un-covered stories. The pain is at the daily-deadline end of journalism, not the long-form end.

The post is short. It does not name a specific region, outlet, beat, or competitor set. The framing is structural.

## Objective

Build a discovery service that ingests local sources (city council minutes, court dockets, school board agendas, local business press releases, social media from verified local accounts, event listings) and produces a daily shortlist of stories that have not yet been covered by the outlet's named competitors. Each story entry carries a one-line summary, the source link, and the "first seen by" timestamp.

The MVP focuses on a single pilot region and a small set of source types. ML is intentionally not in the MVP path; the discovery is rule-based and curator-confirmed.

## Target Users

- Editors at Russian regional media outlets who own the daily news hole and need a shortlist of un-covered local stories each morning.
- Regional reporters who want a starting point for the day's beat rather than a blank page.
- Local-news startups and independent regional outlets that have small teams and need to compete with bigger outlets on local coverage.
- Local government and NGO press officers who would benefit from a service that surfaces their announcements to local outlets.

The source frames the user as the regional outlet. The press officer is named as a downstream beneficiary, not as a buyer of the service.

## MVP Scope

- A source-ingestion layer for a small set of source types: city council agendas and minutes, court dockets (where publicly accessible), local-business press releases, verified local-government social accounts, and event listings.
- A competitor-coverage check: for each candidate story, the service queries the named competitors' sites for matching coverage; stories not yet covered are surfaced.
- A daily shortlist delivered to the editor by email at 7am local time: the day's un-covered stories, with a one-line summary, the source link, and the "first seen by" timestamp.
- An editor console: the editor marks stories as covered / not relevant / under investigation, and the feedback refines the next day's shortlist.
- A "first-mover" badge on the outlet's story once it is published, recording that the outlet was first in the region to cover it.

The MVP does not include auto-drafting, auto-publishing, or scraping of paywalled outlets. The service is discovery; the outlet is the writer.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/media/hap6bnpjo1-regional-media-outlets-lack-news-the` follows the constraints in `263-.../SPEC.md` and the chosen stack (the chosen stack). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Russia.

For Russia, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Discovery must be honest. The MVP's "un-covered by competitors" claim is only as good as the competitor list the editor maintains. A story missed because the competitor list is incomplete is a discovery failure, not a source failure.
- Source provenance must be preserved. Every story entry shows where the service first saw it and when; the editor can verify before assigning a reporter.
- Rule-based, not ML-based, in v1. A rule-based system with curator feedback is auditable and predictable; an ML-based shortlist is opaque and harder to debug when it misses something.
- Source licensing: scraping some Russian local-government sites may be restricted. The MVP must use only publicly-accessible sources and document the source list.
- Single-region pilot: the MVP is one region, one beat set. Multi-region expansion is a deliberate step after the pilot proves the model.
