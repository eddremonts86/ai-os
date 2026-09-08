---
id: "4342"
slug: sqlflow-duckdb-for-streaming-data-go-rewrite-10x-throug
title: SQLFlow (DuckDB for streaming data) Go Rewrite 10x Throughput
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49521329"
category: show-hn
date: "2026-09-01"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# SQLFlow (DuckDB for streaming data) Go Rewrite 10x Throughput

## Problem

Hello Everyone! I just released sqlflow v1, which includes a go core rewrite.https://github.com/turbolytics/sql-flowThis allows for ~10x higher throughput, over the python core, and more predictable memory usage! This also makes it easier for our users to run in resource constrained environments (such as IoT).The go rewrite also brings a bit more sanity to handling background sqlflow control loops, such as window compaction and timeouts.I'd really love and appreciate your feedback, any examples using sqlflow in production, or your concerns on what makes sqlflow UNUSABLE for you!Thank youDanny
danny@turbolytics.io

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
