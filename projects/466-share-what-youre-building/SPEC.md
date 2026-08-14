---
id: "466"
slug: share-what-youre-building
title: "Share what you're building"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/indiehackers/comments/1vn7o6e/share_what_youre_building/"
category: indiehackers
date: "2026-08-13"
tech: [Next.js, TypeScript, PostgreSQL, Resend, Vercel]
---
# Share what you're building

## Problem

Source: https://www.reddit.com/r/indiehackers/comments/1vn7o6e/share_what_youre_building/

Original post:

> Pitch your product in 1-2 lines - and drop a link here. I'm building a community where makers can share what they’re building and get fair visibility. Here's the link: https://vibecodedit.com/ submitted by /u/amacg [link] [comments]

---

What this plan addresses: A community + fair-visibility feed where makers post 1-2 line product pitches and upvote each other.

## Objective

A community feed where makers post 1-2 line product pitches and upvote each other, replacing spammy "build in public" threads with a fair-visibility surface. When I have just shipped something and want low-friction visibility, I want a community feed where I post 1-2 lines and a link, so I do not have to write a launch post or pay for distribution.

## Target Users

- Makers (founders, indie hackers) looking for low-friction visibility
- Early-stage founders who cannot afford paid launch channels
- Bootcamp / accelerator participants who want a shared launchpad

## MVP Scope

- Single-line pitch + link submission
- Upvote / downvote with anti-spam heuristics
- Daily digest of top pitches
- No DMs in MVP

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/indiehackers/comments/1vn7o6e/share_what_youre_building` follows the constraints in `466-.../SPEC.md` and the chosen stack (Next.js, TypeScript, PostgreSQL). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Source body says "pitch your product in 1-2 lines and drop a link" with link vibecodedit.com
- Plan keeps the 1-2 line pitch format
- Source did not name a community size or moderation model
