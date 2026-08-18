---
id: "247"
slug: search-for-a-controlled-and-stable-channel-for-attracti
title: "Search for a controlled and stable channel for attracting clients to a banquet hall, as an alternative to unpredictable social media advertising"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/marketing/g9lxp72ug1-search-for-a-controlled-and-stable-chann"
category: marketing
date: "2026-01-18"
tags: [Marketing, Business, AI, Other]
country: Algeria
---
# Search for a controlled and stable channel for attracting clients to a banquet hall, as an alternative to unpredictable social media advertising

## Tech Stack

- A static-first Next.js site for the venue profile and the city-level directory of halls; chosen because the primary surface is a public listing page that needs to rank in local search and load fast on mid-range phones in Algeria.
- Sanity (or a comparable headless CMS) for the operator to update photos, menus, capacity, and availability without engineering help. A CMS matters because the operator — not the developer — is the one keeping the listing accurate.
- Google Business Profile as the canonical local-search surface, with the website linking back to it.
- A simple Node.js API (Express) for the contact form, with each submission tagged by referrer and stored in PostgreSQL so the operator can attribute inquiries to specific partner channels.
- Self-hosted on a single VPS via Coolify; the workload is small and predictable.

## Architecture

Three pieces:

1. **Venue profile** — a structured listing page per venue with location, capacity, photos, menu samples, pricing bands, and an availability calendar. Operator-editable via a headless CMS.
2. **Partner network** — the venue profile is linked from a small set of partner surfaces: Google Business Profile, a city-level directory of halls, and a list of partner wedding planners. Each partner surface uses a distinct UTM tag so the inquiry source is recoverable.
3. **Inquiry capture and reporting** — a contact form on the venue page records the referrer tag and writes the lead to PostgreSQL. A monthly report view groups inquiries by source, conversion status, and date.

There is no public marketplace in the MVP. The deliverable is one venue's pipeline, not a directory product for many venues.

## Milestones

- **M1 — Profile.** Operator-editable venue profile page with capacity, photos, menu samples, pricing bands, and availability calendar.
- **M2 — Local-search presence.** Google Business Profile wired up; site linked from GBP; basic on-page SEO (city, capacity, Arabic + French copy).
- **M3 — Partner channels.** Three to five wedding planners and one wedding fair onboarded; each linked from the venue page with a distinct UTM tag.
- **M4 — Inquiry capture.** Contact form tagged by referrer; lead stored in PostgreSQL.
- **M5 — Monthly reporting.** A simple report page that shows inquiries and bookings per source for the trailing 90 days.

## Risks

- Channel concentration: relying on a small partner network means losing one planner can drop inquiries by a meaningful share. The MVP must show at least three active partners to keep variance bounded.
- Measurement discipline: source tagging fails when inquiries arrive by phone or in person without a tag. The MVP needs a manual "source" field the operator fills when a lead walks in.
- Listing freshness: banquet-hall menus and pricing change. A stale listing erodes trust quickly. The CMS workflow must make the operator's update path obvious.
- Cultural and language fit: Algerian weddings are Arabic- and French-speaking, multi-day, and gender-aware. A profile template that assumes a Western single-evening format will look wrong and won't be filled out.
- Demand seasonality: wedding demand in Algeria is seasonal (summer is heavy, winter is slower). The MVP must avoid averaging across seasons in a way that hides real signal.
