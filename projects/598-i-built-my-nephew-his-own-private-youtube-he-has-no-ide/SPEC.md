---
tags: ["saas", "consumer", "parenting", "video"]
tech: ["Next.js", "TypeScript", "YouTube IFrame API", "Supabase", "Stripe"]
id: "598"
slug: i-built-my-nephew-his-own-private-youtube-he-has-no-ide
title: I Built My Nephew His Own Private YouTube (He Has No Idea)
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1voxk19/i_built_my_nephew_his_own_private_youtube_he_has/"
category: saas
date: "2026-08-15"
---
# I built my nephew his own private YouTube (he has no idea what YouTube is)

## Problem

The poster built a private YouTube application for their nephew, a three-year-old. The parent complained about YouTube consumption; the poster checked digital-wellbeing tools and found the average watch time for kids his age. The product lets the parent choose what the child should watch by sharing a link. The implicit product: a private, parent-curated YouTube-style player for small children, with parent-selected content only.

## Objective

Define the MVP scope for a private child-safe video player: parents curate a playlist, the child opens the app and sees only the curated content, no algorithm, no search, no autoplay beyond the parent's choice.

## Target Users

- **Primary:** parents of toddlers (2-5 years old) who want to limit their child's YouTube consumption.
- **Secondary:** preschool teachers and daycare staff who want a controlled video surface.
- **Tertiary:** grandparents and other relatives who want a simple "share a link, child watches it" experience.

## MVP Scope

- Web app (no native app in v1) optimised for tablets and phones.
- Parent onboarding: paste YouTube links, the app stores them as a per-child playlist.
- Child mode: a separate PIN-protected view that shows only the playlist; no search, no algorithm, no autoplay-suggested.
- Watch-time tracking per child.
- Free tier: 1 child, 50 videos. Pro at $4.99/month: 5 children, unlimited videos, watch-time alerts.
- Excluded in v1: native iOS / Android app, YouTube Kids integration, content moderation.

## Design Direction

See `DESIGN.md` for this project's design tokens. Default visual: a single parent / child toggle — the parent view shows the playlist manager, the child view is a tile of large play buttons. No marketing-site chrome; the product is the tiles.

## Constraints

- The child view must be PIN-protected so the child cannot reach the parent's playlist manager.
- No autoplay-suggested in the child view; only the parent's curated playlist.
- The product must work offline-ish: cached videos for the child's most-watched items.
