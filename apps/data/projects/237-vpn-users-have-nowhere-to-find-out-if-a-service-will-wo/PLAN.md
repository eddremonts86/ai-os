---
id: "237"
slug: vpn-users-have-nowhere-to-find-out-if-a-service-will-wo
title: VPN users have nowhere to find out if a service will work reliably on their network \u2014 there is no up-to-date rating based on real-time quality monitoring
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/productivity/a20h8f74z1-vpn-users-have-nowhere-to-find-out-if-a"
category: productivity
date: "2026-01-21"
tags: [Other]
country: Russia
tech: [Go, ClickHouse, Next.js 14, WebSocket, Telegram Bot API, Prometheus + Grafana]
---
# VPN users have nowhere to find out if a service will work reliably on their network — there is no up-to-date rating based on real-time quality monitoring

## Tech Stack

Go for the probe daemon (chosen for low memory and fast concurrent probe scheduling). ClickHouse for the time-series probe-result store. Next.js 14 for the public dashboard. Prometheus + Grafana for internal observability. Telegram Bot API for user alerts.

## Architecture

Three layers: a fleet of Go probe daemons running on Russian residential-IP vantage points (target: 20 sites, 5 VPN configs each = 100 active probes), a ClickHouse cluster that ingests probe results in 1-minute batches, and a Next.js dashboard that queries ClickHouse with cached aggregations. Telegram bot polls ClickHouse for state changes and pushes alerts.

## Milestones

M1: Probe daemon and 5 vantage points. M2: ClickHouse ingestion and per-service aggregation. M3: Public dashboard with per-service and per-VPN rankings. M4: Telegram bot with subscriber alerts. M5: Expansion to 20 vantage points and 50 services.

## Risks

Residential IP vantage points are expensive and may themselves get flagged as probes. ClickHouse ingestion at 100Hz probes/minute needs careful schema design. Legal status of the platform under Russian internet law is genuinely unclear.
