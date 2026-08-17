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

## Phase 0: Scaffold

- [ ] Create `apps/598-i-built-my-nephew-his-own-private-youtube-he-has-no-ide/` (Next.js + TypeScript)
- [ ] Initialize git with `.gitignore` excluding per-child watch-time data
- [ ] Write SPEC.md (this document) and the matching DESIGN.md tokens
- [ ] Provision Supabase: auth, per-child playlists, watch-time tracking
- [ ] Wire the YouTube IFrame Player API for the child view
- [ ] Set up the PIN gate on the child view route

## Phase 1: Core

- [ ] Parent onboarding: paste YouTube links, per-child playlist
- [ ] Child mode: PIN-protected, only the parent's playlist visible
- [ ] No search, no algorithm, no autoplay-suggested in the child view
- [ ] Watch-time tracking per child
- [ ] Free tier: 1 child, 50 videos

## Phase 2: Deploy

- [ ] Coolify deployment
- [ ] First 100 paying parents via r/Parenting and r/Mommit
- [ ] 90-day watch-time reduction vs YouTube baseline
- [ ] Post-mortem at week 7
