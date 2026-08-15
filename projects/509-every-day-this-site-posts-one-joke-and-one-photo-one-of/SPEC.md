---
id: "509"
slug: every-day-this-site-posts-one-joke-and-one-photo-one-of
title: Every day this site posts one joke and one photo. One of each is AI. You guess.
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SideProject/comments/1vny4od/every_day_this_site_posts_one_joke_and_one_photo/"
category: sideproject
date: "2026-08-14"
tech: [Next.js, TypeScript, PostgreSQL, Resend, Vercel]
---
# Every day this site posts one joke and one photo. One of each is AI. You guess.

## Problem

Source: [reddit.com/r/SideProject/comments/…]([reddit.com/r/SideProject/comments/…]([reddit.com/r/SideProject/comments/…]([reddit.com/r/SideProject/comments/…]([reddit.com/r/SideProject/comments/…]([reddit.com/r/SideProject/comments/…]([reddit.com/r/SideProject/comments/…](https://www.reddit.com/r/SideProject/comments/1vny4od/every_day_this_site_posts_one_joke_and_one_photo/)))))))

Original post:

> I built a daily human-vs-AI guessing game and I’m keeping a permanent record of every answer http://buildsomething.co submitted by /u/jonathanfin [link] [comments]

---

What this plan addresses: A daily human-vs-AI guessing game: one joke and one photo posted every day, one of each is AI, you guess.

## Objective

A daily human-vs-AI guessing game where one joke and one photo are posted every day, one of each is AI, and you guess, with a permanent answer log. When I want a quick daily ritual, I want a guessing game where one joke and one photo are AI and I have to guess which, so I can test my detection skills in 30 seconds.

## Target Users

- Casual visitors looking for a quick daily game
- AI-enthusiasts testing their detection skills
- Anyone who wants a low-stakes daily ritual

## MVP Scope

- Daily joke + photo pair, one AI-generated
- Public guess / reveal flow
- Permanent answer log
- No account required to play

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/SideProject/comments/1vny4od/every_day_this_site_posts_` follows the constraints in `509-.../SPEC.md` and the chosen stack (Next.js, TypeScript, PostgreSQL). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Source body describes a daily human-vs-AI guessing game with a permanent answer record
- Plan keeps the daily + no-account framing
- Source mentions buildsomething.co explicitly
