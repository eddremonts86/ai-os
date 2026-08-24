---
id: "2196"
slug: pingularity-scheduled-ooklaiperf3-speedtest-dashboard-o
title: "Pingularity – scheduled Ookla/iperf3 speedtest dashboard, outage alerts"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49364186"
category: show-hn
date: "2026-08-19"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Pingularity – scheduled Ookla/iperf3 speedtest dashboard, outage alerts

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I wanted something to monitor my speed tests over time, but what's out there (speedtest-tracker, myspeed, netcheck, orb, etc.) doesn't quite have the feature set I was looking for. I needed something simple enough that my dad could get it going by himself in Windows but that I could also configure to use my own iperf server.Check the demo with dummy data first to see if it's worth installing:https://demo.pingularity.dev/- Single-binary, no dependencies, self-hosted, no telemetry.- Linux, Docker, Windows (winget), and macOS (brew).- Scheduled Ookla and iperf speed tests with a wide array of settings.- Charts for visualizing download, upload, ping, jigger, and bufferbloat over time. Outage heatmap, live latency, and DNS sampling.- Uptime tracking with alerts and notifications. You can do webhooks with native ntfy or a heartbeat.- Manage retention, backups, or delete whatever you want including individual runs.- Prometheus/Grafana with importable dashboard and alert rules.- Install then open http://localhost:9000/, local network accessible, password protectable.- Very customizable, change colours, turn off stuff you don't need, remove chart tiles you don't care about.AI Involvement: Extensive use of Claude Code and Codex.Repo: https://github.com/pingular/pingularity

**One-liner:** _[Define the single sentence that explains why this product exists.]_

## Target Users

_Not written yet — `ai-os plans enrich` fills this section._

## Jobs To Be Done

_Not written yet — `ai-os plans enrich` fills this section._

## Success Metrics

_Not written yet — `ai-os plans enrich` fills this section._

## Pricing & Monetization

_TODO:_ define model (freemium / subscription / one-time / marketplace fee).

## Competitive Landscape

_Not written yet — `ai-os plans enrich` fills this section._

## Risks & Open Questions

- [ ] Validate problem with 5 user interviews before MVP
- [ ] Confirm willingness to pay
- [ ] Define compliance scope (GDPR, payments, etc.)

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49364186) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
