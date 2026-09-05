---
id: "4213"
slug: ai-studio-with-500-models-for-headshots-video-and-image
title: "AI studio with 500 models for headshots, video and images"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49508159"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# AI studio with 500 models for headshots, video and images

## Problem

Each generative model lives behind its own subscription, its own dashboard, and its own quirks. Creators stack 3–6 paid plans and still hit dead ends when a specific model is the only one that nails a brief. MagicShot (magicshot.ai) puts 500+ top models behind a single subscription: images, video, audio, headshots, photoshoots, and editing tools. The page counts "500K+ creators" and "50M+ images". Categories include AI Image Generator (32 tools), AI Video Generator (19 tools), AI Photoshoot (11 tools, professional headshots, on-model fashion, dating photos, pet portraits), AI Photo Editor (18 tools, background removal, upscaling, restoration), and AI Audio Generator (4 tools, voiceovers, cloned narration, music). Models include Nano Banana 2 and GPT-family entries; the listing is updated as new models launch.

## Objective

Give a creator one subscription and one tab where they can pick any of 500+ models for the right tool — image, video, audio, headshot, photo edit — without stacking six vendor plans.

## Target Users

- Creators producing content across image, video, and audio formats
- Solo founders running product photo pipelines
- Social media managers who need headshots and ad creatives in one place
- Photographers and retouchers offering AI-powered services to clients

## MVP Scope

- 500+ top models across image, video, audio
- AI Image Generator (32 tools), AI Video Generator (19 tools), AI Photoshoot (11 tools), AI Photo Editor (18 tools), AI Audio Generator (4 tools)
- iPhone and iPad apps
- Watermark-free HD export
- One subscription, no stacked plans

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Watermark-free only on paid plans; the free path likely caps quality or count
- One subscription; no per-model metering that creates the same problem MagicShot replaces
- Mobile parity for iPhone and iPad
- Model coverage must keep up with new releases (e.g. Nano Banana 2, GPT family)