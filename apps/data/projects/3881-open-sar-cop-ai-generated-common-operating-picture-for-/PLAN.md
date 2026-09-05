---
id: "3881"
slug: open-sar-cop-ai-generated-common-operating-picture-for-
title: Open SAR-COP – AI-generated common operating picture for disasters
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49498819"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [JSON data contract, Zero-dependency HTML builder, Geospatial map rendering, AI search over public reporting, Bilingual interface, Incident repository index]
---
# Open SAR-COP – AI-generated common operating picture for disasters

## Tech Stack

- **JSON data contract:** incident.json per incident.schema.json defines the standard shape of every incident.
- **Zero-dependency HTML builder:** validates the contract file and renders the dashboard with no runtime dependencies.
- **Geospatial map rendering:** the dashboard's map layer for sites and affected areas.
- **AI search over public reporting:** bulletins, national media and wire reports mined for figures.
- **Bilingual interface:** English and Chinese throughout the workflow and dashboard.
- **Incident repository index:** a global registry of per-disaster repositories for reuse and review.

## Architecture

- **Search layer:** AI scans official bulletins, national media and wire reports for casualties, damage, response forces and key sites.
- **Contract layer:** findings are assembled into incident.json, every figure timestamped and attributed.
- **Render layer:** a zero-dependency builder validates and renders a single-file HTML dashboard: map, KPIs, trend, timeline.
- **Archive layer:** each incident becomes a standalone repository registered in the global index.

## Milestones

1. **M0 — Data contract.** incident.schema.json is defined and the incident.json shape is validated by the builder.

2. **M1 — Seed incident.** The Nepal Rasuwa landslide runs through the four-step pipeline end to end.

3. **M2 — Dashboard renderer.** The zero-dependency builder produces the single-file HTML dashboard with map, KPIs, trend and timeline.

4. **M3 — Community loop.** Contributors can run the pipeline for a new disaster and register it in the index.

## Risks

- **Source reliability:** media-reported casualty and damage figures shift rapidly; the contract forces timestamps and attribution but not correctness.
- **Manual verification load:** with zero PII and no paid staff, figure verification depends on volunteer review.
- **Single seed case:** one incident does not prove the pipeline generalizes across disaster types.
- **Zero-dependency tradeoff:** a dependency-free HTML builder limits dashboard interactivity versus framework-built tools.
