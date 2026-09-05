---
id: "4635"
slug: blazerules-yaml-rule-engine-for-streaming-data-3m-recor
title: "BlazeRules – YAML rule engine for streaming data, 3M records/SEC"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49534550"
category: show-hn
date: "2026-09-02"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# BlazeRules – YAML rule engine for streaming data, 3M records/SEC

## Problem

https://blazerules.dev I initially wanted to make a sub-millisecond log parser in C++ but that blew into a embeddable decision engine, that can run YAML defined rules on incoming data.
The rules are executed in a vectorized format on incoming data by reprojecting into a columnar format first, if it's not already. Depending on the payload size and rules complexity, the performance goes from 200K records/s to more than million records/sec, in terms of througput this would be around 200 MiB/s to 3 GiB/s on average.Rules can be sql expressions too, or onnx models (numeric), window ops and quite a few more operations are supported.It's comparable to DuckDB but for streaming data and on the fly decisions.

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
