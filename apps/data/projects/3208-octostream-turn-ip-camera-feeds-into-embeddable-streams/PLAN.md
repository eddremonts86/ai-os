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

## Tech Stack

- **Ingest pipeline:** FFmpeg / GStreamer workers that pull RTSP, DVR, NVR, and RTMP sources and transcode to HLS with adaptive bitrate.
- **Restream layer:** one worker per active destination (YouTube, Twitch, Facebook, Instagram, custom RTMP) that pushes the same HLS feed out to that platform's ingest endpoint.
- **HLS player:** a small, embeddable web player (hls.js or a thin wrapper) that the user drops on their own website.
- **Backend API:** Node.js on TanStack Start that owns source credentials, destination credentials, schedules, embed ACLs, and recording metadata.
- **DB:** SQLite with Drizzle ORM for sources, destinations, schedules, embeds, recordings, and timelapse jobs.
- **Storage:** an object store (S3-compatible) for HLS segments, recordings, and timelapse renders.
- **Dashboard:** React + TanStack Start, the only operating surface.
- **Deployment:** Coolify + Docker.

## Architecture

```
RTSP / DVR / NVR / OBS source
              │
              ▼
       Ingest worker (FFmpeg)
              │
              ├─▶ HLS segment store (object store)
              │           │
              │           ├─▶ HLS player (embeddable)
              │           │
              │           ├─▶ Restream worker ──▶ YouTube
              │           │                  ──▶ Twitch
              │           │                  ──▶ Facebook
              │           │                  ──▶ Instagram
              │           │                  ──▶ Custom RTMP
              │           │
              │           └─▶ Recorder ──▶ Recording store ──▶ Timelapse worker
              │
              ▼
       API + dashboard (TanStack Start, SQLite)
```

- The dashboard is the only control plane; FFmpeg flags, schedules, and embed ACLs all live behind the API.
- Embed ACLs are enforced at the HLS segment URL: signed, short-lived tokens scoped to a domain allowlist, with password challenge for protected feeds.

## Milestones

1. **M0 — Spec + design tokens + data model.** Existing SPEC.md and DESIGN.md approved; sources, destinations, embeds, schedules, and recordings tables are stable.
2. **M1 — Ingest to HLS.** An RTSP source becomes a working HLS embed on a test page; the player works in modern desktop and mobile browsers.
3. **M2 — Embed ACLs.** Domain-locked embeds and password protection are enforced at the segment URL; off-domain requests fail.
4. **M3 — Restream.** The same HLS feed is pushed to YouTube, Twitch, Facebook, Instagram, and a custom RTMP destination from the dashboard.
5. **M4 — Recording + playback.** The feed is recorded; playback is available in the dashboard and via a signed playback URL.
6. **M5 — Timelapse + scheduling.** Timelapse renders from recordings; per-source schedules gate when the ingest and restream run.

## Risks

- Restream-destination drift: each platform's ingest API changes; the restream worker per destination has to track those changes or channels silently fall off.
- Domain-lock bypass via permissive CORS or missing referer check: the MVP needs explicit, tested allowlist enforcement at the segment URL.
- Password protection UX: an embed-iframe password prompt is a worse UX than a full-page gate. The MVP must pick one path and test it end-to-end.
- Recording + timelapse storage growth: a single 24/7 camera generates gigabytes per day; without a retention policy the disk fills silently.
- Ingest worker scaling: more sources means more FFmpeg processes; the MVP needs a cap and a queue, not unbounded concurrency.
