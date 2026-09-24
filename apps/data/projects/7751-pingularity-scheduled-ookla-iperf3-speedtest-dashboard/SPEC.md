# SPEC.md — Pingularity – scheduled Ookla/iperf3 speedtest dashboard, outage alerts

## Problem

I was having intermittent issues with my ISP after switching and was looking for something that would let me easily trend downtimes, speed tests, and latency, but the existing projects out there (speedtest-tracker, myspeed, netcheck, etc.) lacked a few things I needed. I gradually put together my own, it&#x27;s simple to install and supports Linux, macOS, Windows, and Docker.<p>Interactive demo with sample data: <a href="https:&#x2F;&#x2F;demo.pingularity.dev&#x2F;" rel="nofollow">https:&#x2F;&#x2F;demo.pingularity.dev&#x2F;</a><p>Install from <a href="https:&#x2F;&#x2F;pingularity.dev" rel="nofollow">https:&#x2F;&#x2F;pingularity.dev</a> then open http:&#x2F;&#x2F;localhost:9000&#x2F;, local network accessible, password protectable.<p>- Single-binary, no dependencies, self-hosted, no telemetry.<p>- Scheduled Ookla and iperf speed tests with a wide array of settings.<p>- Charts for visualizing download, upload, ping, jitter, and bufferbloat over time. Outage heatmap, live latency and DNS sampling.<p>- Uptime tracking with alerts and notifications. Webhooks with native ntfy and heartbeat.<p>- Manage retention, backups, or delete individual runs.<p>- Prometheus&#x2F;Grafana with importable dashboard and alert rules.<p>- Customizable, change colours, disable stuff you don&#x27;t want, remove chart tiles you don&#x27;t care about.<p>MIT license, <a href="https:&#x2F;&#x2F;github.com&#x2F;pingular&#x2F;pingularity" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;pingular&#x2F;pingularity</a><p>I used Claude Code and Codex extensively throughout.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49741059)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-17T14:12:07Z

---

## Objective

Build a solution that addresses this problem clearly and at scale.

---

## Target Users

1. **[Primary user]** — the main user this serves
2. **[Secondary user]** — other relevant users

## MVP Scope

- Core functionality
- Leave out anything beyond the MVP

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Keep the MVP simple
- No unnecessary external dependencies
