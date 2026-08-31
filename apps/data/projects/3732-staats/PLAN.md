---
id: "3732"
slug: staats
title: Staats
status: enriched
source:
  name: ProductHunt
  url: "https://www.producthunt.com/products/staats-3"
category: product-launch
date: "2026-08-28"
tags: [ProductHunt, Product Launch]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Staats

## Tech Stack

Chosen so the consumer is an agent, not a dashboard reader, and the measurement is cookieless by construction.

- **Cookieless collector:** a script that records pageviews and events without cookies or per-user identifiers, EU-safe by construction.
- **Deploy-marker API:** CI or manual calls attach deploy id, commit, version, and release notes to the analytics stream.
- **Change-detection layer:** compares post-deploy windows against baselines and produces "deploy X moved metric Y by Z".
- **Agent-native surface:** a CLI / MCP / HTTP endpoint returning structured evidence rather than charts.
- **Evidence-card store:** deploy id, time window, segments, baseline, observed delta, and a one-line interpretation.

## Architecture

- **Ingestion:** a cookieless pageview and event stream with no per-user identifiers — no per-user funnels, by design.
- **Deploy markers:** every deploy attaches to the stream at the moment it ships.
- **Baseline comparison:** the post-deploy window is compared against a prior baseline; evidence is generated with time windows and segments.
- **Agent interface:** structured queries ("what shipped, what changed, what next") answered with evidence cards.
- **Safety boundary:** analytics input is observational only and structurally insulated from user-controlled content, so partner-site prompt injection cannot steer suggestions.

## Milestones

1. **M0 — Collector and deploy markers.** A site is instrumented cookieless and its deploys attach to the stream.
2. **M1 — Change detection.** Deploy-to-metric evidence cards with baselines and segments land.
3. **M2 — Agent surface.** The CLI / MCP endpoint answers "what shipped, what changed, what's next" with evidence.
4. **M3 — Public launch.** An external scan confirms zero PII and zero per-user identifiers, and no cookie banner requirement.

## Risks

- **Agent adoption:** the agent-native surface only matters if coding agents actually call it; measured on calls per workspace, not signups.
- **False-positive evidence:** a noisy small "movement" erodes trust each time; precision and recall targets must be set on labelled deploys.
- **Cookieless ceiling:** no per-user funnels by design; users who later want attribution need another product and must be told honestly.
- **Prompt-injection surface:** any path from partner-page content into agent suggestions must be blocked structurally.
- **No-dashboard identity:** a dashboard may come later as a secondary surface, but it must never become the primary way to read results.
