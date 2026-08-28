---
id: "3208"
slug: octostream-turn-ip-camera-feeds-into-embeddable-streams
title: OctoStream – Turn IP camera feeds into embeddable streams and restream everywhere
status: enriched
source:
  name: BetaList
  url: "https://betalist.com/startups/octostream?utm_campaign=startup-184468&utm_medium=atom&utm_source=newsfeed"
category: beta
date: "2026-08-26"
tags: [BetaList, Beta, Product]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# OctoStream – Turn IP camera feeds into embeddable streams and restream everywhere

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/3208-octostream-turn-ip-camera-feeds-into-embeddable-streams/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment
- [ ] Stand up the TanStack Start skeleton with a Drizzle + SQLite connection and an object store for HLS segments

## Phase 1: Core

- [ ] Build the FFmpeg-based ingest worker that pulls RTSP / DVR / NVR / RTMP sources and writes HLS segments
- [ ] Build the embeddable HLS player (hls.js wrapper) that works in modern desktop and mobile browsers without plugins
- [ ] Implement domain-locked embeds: signed, short-lived segment URLs scoped to an allowlist of domains; off-domain requests fail
- [ ] Implement password protection per embed; pick one UX (embed-iframe prompt vs full-page gate) and stick to it
- [ ] Implement the restream workers: one per destination (YouTube, Twitch, Facebook, Instagram, custom RTMP) that push the same HLS feed out
- [ ] Build the dashboard (React + TanStack Start) for source / destination / schedule / embed management
- [ ] Add the recording pipeline that captures the HLS feed into the object store
- [ ] Build the recording playback UI in the dashboard with signed playback URLs
- [ ] Implement the timelapse worker that renders recordings into timelapse videos on demand
- [ ] Add per-source scheduling so ingest and restream run only when the user wants
- [ ] Add a retention policy that prevents the recording store from filling the disk silently
- [ ] Write tests for the ingest worker (mocked RTSP), the embed ACL enforcement, the restream per-destination worker, and the timelapse pipeline

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production
- [ ] Smoke-test: connect a real RTSP camera, embed the HLS player on a test domain, lock it to that domain, push the feed to YouTube + Twitch, record 10 minutes, render a timelapse, and confirm every ACL holds

---

_Generated automatically by Lúa on 2026-08-26_
