---
id: "512"
slug: tocala-song-writers-companion-app
title: "toca.la - song writer's companion app"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SideProject/comments/1vnxwsj/tocala_song_writers_companion_app/"
category: sideproject
date: "2026-08-14"
tech: [Next.js, TypeScript, Web Audio API, PostgreSQL, Stripe, Resend, Vercel]
---
# toca.la - song writer's companion app

## Problem

Source: https://www.reddit.com/r/SideProject/comments/1vnxwsj/tocala_song_writers_companion_app/

Original post:

> I've been slowly pecking at this idea for the past year, but still haven't ironed out the sign up and payment gateway kinks. You can still check out the Studio Demo, though. https://toca.la "tocala" means "play it!" in spanish I'm curious to get feedback and if it's something worth pursuing. It's a pretty niche market - singers/songwriters/rappers - anyone who writes to music in some way. submitted by /u/Daisey_Daze [link] [comments]

---

What this plan addresses: toca.la: a song-writer's companion app for singers, songwriters, and rappers who write to music.

## Objective

toca.la: a song-writer's companion app for singers, songwriters, and rappers, with a lyric editor, per-section audio attachments, and a project library. When I am writing a song, I want a tool with a lyric editor and per-section audio attachments, so I can capture lyrics + demo + beat in one place.

## Target Users

- Songwriters who want a tool built for their workflow
- Rappers writing to beats
- Singers / musicians tracking lyrics + ideas + demos

## MVP Scope

- Lyric editor with verse / chorus / bridge sections
- Audio attachment per section (demo, beat)
- Project library with versioning
- No AI lyrics generation in MVP

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/SideProject/comments/1vnxwsj/tocala_song_writers_compan` follows the constraints in `512-.../SPEC.md` and the chosen stack (Next.js, TypeScript, Web Audio API). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Source body describes toca.la as "song writer's companion app" in a niche market
- Plan keeps the songwriter-specific framing
- Source did not name a price or feature set
