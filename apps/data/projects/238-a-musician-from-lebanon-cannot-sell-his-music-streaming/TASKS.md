---
id: "238"
slug: a-musician-from-lebanon-cannot-sell-his-music-streaming
title: "A musician from Lebanon cannot sell his music: streaming pays pennies, and Bandcamp doesn't accept payments in his country. Needs a fair radio-platform with direct sales"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/media/0vvg4xzv91-a-musician-from-lebanon-cannot-sell-his"
category: media
date: "2026-01-21"
tags: [Other]
country: Lebanon
tech: [Next.js 14, TypeScript, PostgreSQL, Stripe Connect (Stripe Atlas), S3-compatible storage, Icecast streaming server, Telegram Bot API]
---
# A musician from Lebanon cannot sell his music: streaming pays pennies, and Bandcamp doesn't accept payments in his country. Needs a fair radio-platform with direct sales

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/238-a-musician-from-lebanon-cannot-sell-his-music-streaming/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Lebanese payout partner research and integration (Whish / OMT / crypto off-ramp)
- [ ] Postgres schema: artists, tracks, channels, sales, payouts
- [ ] Audio upload + ffmpeg HLS transcoding pipeline
- [ ] Icecast origin server with three channels
- [ ] Next.js web player with HLS playback
- [ ] Artist dashboard: upload, sales, payout history
- [ ] Stripe Connect for non-Lebanese artists as fallback
- [ ] Telegram bot for artist sale and payout notifications

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Next.js 14, TypeScript, PostgreSQL) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 238-a-musician-from-lebanon-cannot-sell MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in Lebanon completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Next.js 14, TypeScript, PostgreSQL errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
