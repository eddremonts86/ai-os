---
id: "426"
slug: anyone-here-in-a-meteorology-startup-i-will-not-promote
title: Anyone here in a meteorology startup? I will not promote
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/startups/comments/1vmg8w4/anyone_here_in_a_meteorology_startup_i_will_not/"
category: startups
date: "2026-08-12"
tech: [Next.js (App Router), TypeScript, Python (FastAPI), PostgreSQL, Meilisearch, Vercel]
---
# Anyone here in a meteorology startup? I will not promote

## Problem

Source: https://www.reddit.com/r/startups/comments/1vmg8w4/anyone_here_in_a_meteorology_startup_i_will_not/

Original post:

> Hi all, Currently holding an offer for a meteorology masters degree from a top programme (physics undergrad) and am looking to enter a startup focused on forecasting/meteorology/adjacent after graduation. For people with knowledge on the subject: - where are people in these types of startups generally educated? - what skills are most useful here? Applied/ theoretical? Data analysis? Etc Thanks in advance submitted by /u/DiscombobulatedElk58 [link] [comments]

---

What this plan addresses: Public, searchable directory of meteorology / climate-tech startups and the skills they hire for.

## Objective

Replaces "ask a forum and hope someone in the niche replies" with a structured, searchable directory of meteorology-adjacent employers and the skills they hire for. When I am deciding whether a meteorology startup is a real career path, I want to see who hires, what skills they want, and whether anyone has already made the jump, so I can pick a masters specialism with employment in mind.

## Target Users

- Physics undergraduates with an offer for a meteorology masters who want to know what jobs exist
- Meteorology MSc students exploring non-academic paths
- Small-climate-startup founders who want one place to mention an open role

## MVP Scope

- Indexed list of ~40 known meteorology / climate / atmospheric-science startups with country and sub-niche
- Skill taxonomy (Applied NWP, Theoretical NWP, Data analysis, Remote sensing, ML for weather, Embedded / sensor)
- Skill-first search weighted toward what the founder actually does, not the company name
- Moderated "post a hiring signal" form with email-only submit
- Public roadmap that lists what the directory still does not know

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/startups/comments/1vmg8w4/anyone_here_in_a_meteorology_` follows the constraints in `426-.../SPEC.md` and the chosen stack (Next.js (App Router), TypeScript, Python (FastAPI)). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Source did not name a country, currency, role, or price
- Poster asks the community for guidance rather than asking for a product; plan reframes that need into a public place for guidance to land
- No claim of market size, salary band, or hiring volume is made
