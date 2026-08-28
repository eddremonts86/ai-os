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

## Problem

I wanted something to monitor my speed tests over time, but what's out there (speedtest-tracker, myspeed, netcheck, orb, etc.) doesn't quite have the feature set I was looking for. I needed something simple enough that my dad could get it going by himself in Windows but that I could also configure to use my own iperf server.Check the demo with dummy data first to see if it's worth installing:https://demo.pingularity.dev/- Single-binary, no dependencies, self-hosted, no telemetry.- Linux, Docker, Windows (winget), and macOS (brew).- Scheduled Ookla and iperf speed tests with a wide array of settings.- Charts for visualizing download, upload, ping, jigger, and bufferbloat over time. Outage heatmap, live latency, and DNS sampling.- Uptime tracking with alerts and notifications. You can do webhooks with native ntfy or a heartbeat.- Manage retention, backups, or delete whatever you want including individual runs.- Prometheus/Grafana with importable dashboard and alert rules.- Install then open http://localhost:9000/, local network accessible, password protectable.- Very customizable, change colours, turn off stuff you don't need, remove chart tiles you don't care about.AI Involvement: Extensive use of Claude Code and Codex.Repo: https://github.com/pingular/pingularity

---

## Objective

_Not written yet — `ai-os plans enrich` fills this section._

## Target Users

_Not written yet — `ai-os plans enrich` fills this section._

## MVP Scope

_Not written yet — `ai-os plans enrich` fills this section._

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

_Not written yet — `ai-os plans enrich` fills this section._
