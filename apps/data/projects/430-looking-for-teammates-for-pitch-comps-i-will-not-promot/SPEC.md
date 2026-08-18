---
id: "430"
slug: looking-for-teammates-for-pitch-comps-i-will-not-promot
title: Looking for teammates for pitch comps (I will not promote)
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/startups/comments/1vmbxiz/looking_for_teammates_for_pitch_comps_i_will_not/"
category: startups
date: "2026-08-12"
tech: [Next.js, TypeScript, PostgreSQL, Supabase Auth, Resend, Vercel]
---
# Looking for teammates for pitch comps (I will not promote)

## Problem

Source: https://www.reddit.com/r/startups/comments/1vmbxiz/looking_for_teammates_for_pitch_comps_i_will_not/

Original post:

> Hey Reddit! I'm an aspiring entrepreneur, and I'd like to participate in pitch competitions (like Blue Ocean/Diamond Challenge) to improve my public speaking skills. I live in an NY area where there isn't much interest in business, so I'm posting this in search of potential teammates (prefer HS). I have an idea, but would be open to others. submitted by /u/Top-Butterscotch9538 [link] [comments]

---

What this plan addresses: Pitch-competition teammate-finder for aspiring solo founders seeking a co-founder with complementary skills before a deadline.

## Objective

Replaces "post on Reddit looking for a teammate and hope" with a structured, deadline-aware co-founder search. When I have a pitch-competition deadline and no co-founder, I want to find someone with the missing skill in the next 7 days, so I can submit a credible team.

## Target Users

- Student founders entering pitch competitions without a co-founder
- First-time founders relying on competition deadlines to ship a team

## MVP Scope

- Profile + skill-tag system (technical, sales, design, ops)
- Search by skill + availability window + competition target
- Mutual-interest handshake that unlocks a private chat
- Verified-student email gate (no LinkedIn OAuth in MVP)

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/startups/comments/1vmbxiz/looking_for_teammates_for_pit` follows the constraints in `430-.../SPEC.md` and the chosen stack (Next.js, TypeScript, PostgreSQL). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Source did not specify competition name, country, or founder stage
- Plan assumes a global pool of student-level founders
- Verification kept minimal (email-domain check)
