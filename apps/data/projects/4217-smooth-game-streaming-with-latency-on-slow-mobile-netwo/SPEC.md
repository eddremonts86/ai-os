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

## Problem

Traditional game streaming (Moonlight etc.) targets competitive, ultra-low-latency gameplay. The author targets a different goal: smooth streaming on slow or unstable 4G/5G mobile networks, especially for open-world games. The example: driving around a huge open-world game — you want the world to look smooth (scenery, roads, lighting, water, forests), but you also need to know where you actually are right now when the network introduces latency. The result is a 'hybrid streamer'.


---

## Objective

Stream open-world games to mobile clients over 4G/5G so the visual world stays smooth even when network latency makes real-time control hard.


## Target Users

Mobile gamers on 4G/5G who want to play open-world games from a host machine, prioritising visual smoothness over competitive reaction latency. Assumes the user accepts that input latency is higher than Moonlight-class streamers.


## MVP Scope

- A streaming client that targets 4G/5G and other slow mobile networks.
- Smoothness-first rendering pipeline for open-world scenes.
- A 'hybrid' strategy that keeps the world visually consistent even when network latency makes frame-perfect input hard.
- Cross-network tolerance for unstable connections.


## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Open-world games are large and visually rich; bandwidth and decode cost are real.
- 'Hybrid' framing implies a deliberate trade-off: visuals over input latency.
- Source does not state pricing, supported games, platforms, or distribution channels.
- Mobile networks vary widely; performance on the low end is the design target.

