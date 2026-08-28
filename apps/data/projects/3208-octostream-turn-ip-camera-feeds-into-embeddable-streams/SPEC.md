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

## Problem

OctoStream lets you turn RTSP cameras, DVRs, NVRs, and RTMP encoders like OBS into a browser-ready HLS player you can embed on your website. You can also restream the same feed to YouTube, Twitch, Facebook, Instagram, and custom RTMP destinations. The platform adds recording and playback, timelapse, scheduling, domain-locked embeds, and password protection, all managed from a single dashboard so viewers can watch on any device without apps or plugins. View startup

## Objective

Build a platform that takes RTSP cameras, DVRs, NVRs, and RTMP encoders like OBS, converts them into browser-ready HLS that can be embedded on a website, restreams the same feed to YouTube / Twitch / Facebook / Instagram / custom RTMP, and adds recording + playback, timelapse, scheduling, domain-locked embeds, and password protection from a single dashboard so viewers can watch on any device without apps or plugins.

## Target Users

1. Camera owners and small broadcasters who have RTSP / DVR / NVR / OBS sources and want them on their own website without making visitors install an app or plugin.
2. Multi-channel restreamers who push the same camera feed to YouTube, Twitch, Facebook, Instagram, and custom RTMP destinations from one dashboard.

## MVP Scope

- An ingest service that accepts RTSP cameras, DVRs, NVRs, and RTMP encoders (e.g. OBS) and produces a browser-ready HLS stream.
- An embeddable HLS player that can be dropped onto the user's own website.
- Restream support for YouTube, Twitch, Facebook, Instagram, and custom RTMP destinations from a single dashboard.
- Recording and playback of the live feed.
- Timelapse generation from the recorded feed.
- Scheduling so the stream runs only when the user wants.
- Domain-locked embeds (the HLS player only works on a list of approved domains).
- Password protection per embed so private feeds are gated.
- A single dashboard to manage all of the above.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The five named restream destinations (YouTube, Twitch, Facebook, Instagram, custom RTMP) are the supported set for the MVP; do not invent additional platforms without a user request.
- Domain-locked embeds and password protection are explicit requirements, not optional add-ons — private feeds must remain private.
- "Without apps or plugins" is a product promise; the player must work in modern mobile and desktop browsers out of the box.
- The dashboard is the operating surface; configuring OBS, RTSP credentials, etc. should not require touching the server directly.
