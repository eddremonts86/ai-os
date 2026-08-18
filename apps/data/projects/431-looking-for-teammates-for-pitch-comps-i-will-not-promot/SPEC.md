---
id: "431"
slug: looking-for-teammates-for-pitch-comps-i-will-not-promot
title: Looking for teammates for pitch comps (I will not promote)
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/startups/comments/1vmbw29/looking_for_teammates_for_pitch_comps_i_will_not/"
category: startups
date: "2026-08-12"
tech: [Next.js, TypeScript, PostgreSQL, Supabase Auth, Resend, Vercel]
---
# Looking for teammates for pitch comps (I will not promote)

## Problem

Source: https://www.reddit.com/r/startups/comments/1vmbw29/looking_for_teammates_for_pitch_comps_i_will_not/

Original post:

> Hey Reddit! I'm an aspiring entrepreneur, and I'd like to participate in pitch competitions (like Blue Ocean/Diamond Challenge) to improve my public speaking skills. I live in an area where there isn't much interest in business, so I'm posting this in search of potential teammates (prefer HS). submitted by /u/Top-Butterscotch9538 [link] [comments]

---

What this plan addresses: Persistent teammate roster for serial pitch-competition participants who run multiple competitions a year.

## Objective

A persistent teammate roster, not a per-event search. When I am running another pitch competition, I want a known list of available teammates, so I do not have to repost.

## Target Users

- Founders entering 2+ pitch competitions per year
- Entrepreneurship-club organisers managing a roster of repeat competitors

## MVP Scope

- Persistent teammate profile (portfolio of past competitions entered, role history, references)
- Opt-in pool of "always available" founders
- Lightweight team-formation templates per competition format

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/startups/comments/1vmbw29/looking_for_teammates_for_pit` follows the constraints in `431-.../SPEC.md` and the chosen stack (Next.js, TypeScript, PostgreSQL). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Source title identical to 430; body differs only in formatting
- Plan is the "serial participant" sibling of 430
