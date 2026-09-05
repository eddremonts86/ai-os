---
id: "4217"
slug: smooth-game-streaming-with-latency-on-slow-mobile-netwo
title: "Smooth Game streaming with latency on slow mobile networks ,sktstreamer"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49507761"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---

# Smooth Game streaming with latency on slow mobile networks ,sktstreamer

## Tech Stack

The chosen stack — React, TypeScript, TanStack Start, SQLite with Drizzle ORM, Coolify, Docker — applies to the docs site, the dashboard for monitoring a streaming session, and the host-side launcher. The streaming pipeline itself uses native media codecs (e.g. hardware encoders) and is not changed here.

## Architecture

Host-side captures the open-world scene with a smoothness-first encoder strategy; client-side smooths and presents frames even when network latency makes input-driven state hard. A TanStack Start + SQLite/Drizzle backend powers the host launcher and the docs site. Coolify hosts the backend behind Docker.

## Milestones

- M1 — Host-side capture with smoothness-first encoder settings.
- M2 — Client-side that smooths and presents frames over 4G/5G.
- M3 — Hybrid strategy that holds world state across network hiccups.
- M4 — Dashboard and docs site.
- M5 — Network-class auto-tuning on the client.

## Risks

- Encoder/decoder compatibility across mobile GPUs; mitigation is to ship a fallback chain.
- Network variance; mitigation is to expose a per-connection setting and auto-tune.
- Marketing clarity; mitigation is to be explicit about the trade-off vs. Moonlight-class streamers.
