---
id: "3127"
slug: tabu-nsfw-image-and-video-api-for-explicit-content-mode
title: "Tabu, NSFW image and video API for explicit content moderation"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49450127"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
tech: [Node.js, TypeScript, NSFWJS, In-memory request buffer, ffmpeg, REST API, PostgreSQL]
---
# Tabu, NSFW image and video API for explicit content moderation

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/3127-tabu-nsfw-image-and-video-api-for-explicit-content-mode/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Node.js + TypeScript HTTP service with NSFWJS loaded in memory
- [ ] Single-image REST endpoint returning per-category confidence (porn, hentai, sexy, drawing, neutral)
- [ ] Privacy-first default: in-memory buffer destroyed after classification
- [ ] Opt-out flag that persists the buffer when the caller asks for it
- [ ] ffmpeg-based video frame extraction and per-frame scoring
- [ ] Dashboard for per-image and per-video sensitivity thresholds (read/write)
- [ ] Free-tier counter at 5,000 requests/month with hard cap
- [ ] Per-image latency budget check at ~200 ms in the test suite

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-26_
