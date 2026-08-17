---
id: "2646"
slug: geolint-an-eslint-style-linter-for-geojson
title: "GeoLint, an ESLint-style linter for GeoJSON"
status: draft
source:
  name: manual
  url: "https://news.ycombinator.com/item?id=49311145"
category: show-hn
date: "2026-08-15"
tags: [Show HN, Product, Problem]
---
# GeoLint, an ESLint-style linter for GeoJSON

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hello all! I make map-based web apps in my downtime to try to get some use out of my degree (which I’ve mostly shelved since becoming a SWE) and frequently work with GeoJSON to do so. I tried my hand at building a linter for GeoJSON data that can help determine when data is bloated, has inconsistent properties, or has missing or duplicated data. It can be configured to your definition of bloated as needed, and it also supports setting a baseline to help flag unexpected results.It’s aptly called GeoLint and I hope it might be useful to folks working with GeoJSON, especially people who have workflows/pipelines setup to generate it automatically and want more rigorous checks on the output beyond formatting. You can define budgets for things like file size, feature count, and vertex count, add consistency checks, and keep a baseline so CI can flag unexpected regressions in generated output. Based on my benchmarking, it’s pretty quick!Would love feedback from folks who work with GeoJSON on a regular basis on if this is useful to them, and if not, what kind of features they’d like to see in a tool like this. Thanks!

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

_Source:_ [ProblemHunt](https://news.ycombinator.com/item?id=49311145) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
