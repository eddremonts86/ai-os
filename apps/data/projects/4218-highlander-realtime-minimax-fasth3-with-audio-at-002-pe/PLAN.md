---
id: "4218"
slug: highlander-realtime-minimax-fasth3-with-audio-at-002-pe
title: "Highlander – realtime MiniMax FastH3 with audio at $0.02 per second"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49507642"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---

# Highlander – realtime MiniMax FastH3 with audio at $0.02 per second

## Tech Stack

The product is the hosted endpoint; the surrounding docs site uses React + TypeScript on TanStack Start with SQLite/Drizzle for the prompt library and the per-developer usage log. Coolify hosts the docs behind Docker.

## Architecture

A TanStack Start app serves the docs and the per-developer usage dashboard; the video-generation cluster runs the FastH3 VSA checkpoint on eight H100s and exposes the endpoint. A Drizzle-managed SQLite store holds the prompt library and the per-second usage log; the metering reads from that log. Coolify hosts the docs behind Docker.

## Milestones

- M1 — Hosted endpoint accepts a prompt and returns a clip with audio.
- M2 — $0.02/sec metering matches the public rate.
- M3 — Prompt library with the demo clips.
- M4 — Per-developer usage dashboard.
- M5 — Public release.

## Risks

- Pricing has to match what the post says; a different rate breaks the headline claim and the metering has to be precise.
- The cluster is bounded by eight H100s; throughput cannot exceed the cluster, so queueing during spikes is a real risk.
