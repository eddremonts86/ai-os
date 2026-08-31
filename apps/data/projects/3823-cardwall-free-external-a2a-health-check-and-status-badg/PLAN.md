---
id: "3823"
slug: cardwall-free-external-a2a-health-check-and-status-badg
title: Cardwall – free external A2A health check and status badge for agents
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49494495"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [A2A protocol health checks, periodic ping worker, SVG status badges, self-hosted card metadata, agent card wall UI, lightweight read-only probes]
---
# Cardwall – free external A2A health check and status badge for agents

## Tech Stack

Chosen for a monitoring wall whose stated design is external checks without central data custody.

- **A2A protocol health checks:** probes speak the A2A protocol to verify each agent answers correctly.
- **Periodic ping worker:** a scheduler re-checks agents on a cadence and records outcomes.
- **SVG status badges:** badge images generated server-side so owners can hotlink them anywhere.
- **Self-hosted card metadata:** card content is fetched from or published by the owner's machine rather than a central database.
- **Agent card wall UI:** a single page that lays out the cards with live status.
- **Lightweight read-only probes:** checks are non-mutating calls, keeping the free service cheap and safe.

## Architecture

- **Wall renderer:** serves the page of agent cards.
- **Check worker:** periodic, read-only probes against each registered A2A endpoint.
- **Status store:** last-check results needed to paint badges, kept minimal to honor the data-stays-home design.
- **Badge endpoint:** renders the SVG badge for a given agent.

## Milestones

1. **M0 — Card and check.** One A2A agent gets a card on the wall and a scheduled external probe records its status.
2. **M1 — Wall.** Multiple agents render as a wall with per-card status.
3. **M2 — Badges.** Owners can embed an SVG status badge that reflects the latest check.
4. **M3 — Owner-hosted cards.** Card data served from each owner's machine, matching the capture's privacy claim.

## Risks

- **Reachability:** an agent on a private machine is not externally checkable without tunnels or public endpoints the post does not mention.
- **Protocol surface:** the A2A spec's health-check story may not cover every agent implementation.
- **Free-tier abuse:** open probes can be pointed at third-party endpoints.
- **Freshness lies:** badges show last-check state, which can diverge from live state between probes.
- **Unstated sustainability:** no pricing, sponsorship or cost story appears anywhere in the capture.
