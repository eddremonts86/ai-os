---
id: "2056"
slug: wavehouse-supabase-for-clickhouse
title: WaveHouse – Supabase for ClickHouse
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49377989"
category: show-hn
date: "2026-08-20"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# WaveHouse – Supabase for ClickHouse

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ While building an IoT telemetry solution, we ran into hurdles with Clickhouse. For one, you can't insert quickly AND durably into Clickhouse without setting up something like Kafka, which gets complicated for quick projects wanting to make use of Clickhouse's powerful features. Then, trying to actually query Clickhouse and show data in a UI required a whole backend API to handle auth and permissions.We figured that all these parts together – fast, durable ingest, row-level and column-level security and roles, and realtime streaming – were a lot of scaffolding to have to rebuild for every project we wanted to use Clickhouse in. So, we built them all into a single Go binary to be deployed alongside Clickhouse, to help lower Clickhouse's barrier to entry. We call it WaveHouse.Would love any feedback as we work on improving and adding more features to this OSS project!

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49377989) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
