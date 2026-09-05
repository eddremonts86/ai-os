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

## Tech Stack

- React + TypeScript single-page app for the web studio
- TanStack Start as the Node.js API for billing, account, and tool routing
- SQLite with Drizzle ORM for user settings, history, and tool configurations
- Coolify + Docker to self-host
- Mobile wrappers (Capacitor / React Native) for iPhone and iPad
- Per-model integration layer that normalises prompt, aspect, and output
- CDN-backed asset pipeline for watermark-free HD export

## Architecture

The web studio presents a unified prompt surface; behind it, a per-model router normalises inputs to the schema each upstream model expects. Caching and re-use reduce cost on repeated prompts. Mobile apps reuse the same router through a thin native shell. Billing is a single subscription covering all tools and all models; per-tool metering is avoided to keep the promise.

## Milestones

1. Web studio with tool categories (image, video, audio, photoshoot, photo edit)
2. Per-model router covering the 500+ listed models
3. Account, billing, and history
4. iPhone and iPad apps via Capacitor / React Native
5. Watermark-free HD export pipeline
6. Model coverage updates as new releases land

## Risks

- Upstream model pricing volatility
- Mobile parity at model parity is operationally expensive
- Curation vs breadth — 500+ models must remain useful, not just listed
- Free path must not undercut the paid promise