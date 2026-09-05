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

## Problem

The capture is a URL-only Show HN post (open-sar-cop.github.io) whose product claim is the title: an AI-generated common operating picture for disasters. The linked site describes Open SAR-COP as an open search-and-rescue common operating platform: with open-source tooling plus AI, it turns fragmented public information into an interactive common operating picture within the golden 72 hours after a disaster strikes. It works in four steps — AI searches official bulletins, national media and wire reports for casualties, damage, response forces and key sites; the findings are assembled into an incident.json that follows a standard data contract where every figure carries a timestamp and attribution; a zero-dependency builder validates that file and renders a single-file HTML dashboard with a map, KPIs, trend and timeline; and the data and dashboard are archived as a standalone incident repository and registered in a global index for reuse and review. The site states zero PII, public information only, one repository per disaster, bilingual in English and Chinese, and minutes to a common operating picture. The seed case is the Nepal Rasuwa catastrophic landslide of 2026.

## Objective

Deliver Open SAR-COP as a repeatable, open pipeline that produces an interactive common operating picture from public reporting within the first 72 hours of a disaster. The MVP is the published workflow and seed incident: public-information search, the incident.json data contract, the zero-dependency single-file dashboard builder, and the incident-repo index.

## Target Users

- Emergency managers and search-and-rescue coordinators who need one picture of casualties, damage and response forces without waiting for consolidated reports.
- Volunteers and open-source developers who want a per-disaster, reproducible, reviewable pipeline.
- Journalists and researchers verifying disaster figures that carry timestamps and attribution.

## MVP Scope

- AI search over official bulletins, national media and wire reports for casualties, damage, response forces and key sites.
- Standard data contract: incident.json per incident.schema.json, every figure timestamped and attributed.
- Zero-dependency builder rendering a single-file HTML dashboard: map, KPIs, trend, timeline.
- One repository per disaster, registered in a global index; bilingual English and Chinese; public info only.

## Constraints

- Public information only, zero PII — a stated hard boundary on the data the pipeline may ingest.
- Everything must run on open-source tooling; the dashboard builder is zero-dependency by design.
- Every figure must carry a timestamp and attribution before it can enter the dashboard.
- The 72-hour window is the operational target the site names, not a measured guarantee.

## Design Direction

See `DESIGN.md` for this project's design tokens.
