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

## Problem

While building an IoT telemetry solution, we ran into hurdles with Clickhouse. For one, you can't insert quickly AND durably into Clickhouse without setting up something like Kafka, which gets complicated for quick projects wanting to make use of Clickhouse's powerful features. Then, trying to actually query Clickhouse and show data in a UI required a whole backend API to handle auth and permissions.We figured that all these parts together – fast, durable ingest, row-level and column-level security and roles, and realtime streaming – were a lot of scaffolding to have to rebuild for every project we wanted to use Clickhouse in. So, we built them all into a single Go binary to be deployed alongside Clickhouse, to help lower Clickhouse's barrier to entry. We call it WaveHouse.Would love any feedback as we work on improving and adding more features to this OSS project!

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
