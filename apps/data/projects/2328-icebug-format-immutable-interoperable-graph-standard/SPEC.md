---
id: "2328"
slug: icebug-format-immutable-interoperable-graph-standard
title: "Icebug-format: immutable, interoperable graph standard"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49381909"
category: show-hn
date: "2026-08-20"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Icebug-format: immutable, interoperable graph standard

## Problem

Most graph analytics packages have a mutable graph implementation that uses a heap allocated vector to store the graph. It works for toy graphs. But if you're loading a billion edge graph using G.add_edge() it's going to take a while.We don't need to invent new standards. Such interoperable, immutable memory standards already exist: Apache Arrow and Compressed Sparse Rows (CSR). CSR is widely used in scipy, cugraph and columnar graph databases among others. Both on CPUs and GPUs.icebug-format combines both into a on-disk standard based on Apache Parquet and an in-memory format based on Apache Arrow.Bindings available in many popular languages including python, typescript and rust.The package ships with convenience scripts to convert flat tables such as vertex.parquet and edges.parquet to this format in RAM/disk constrained environments.Sample graphs:
https://huggingface.co/datasets/ladybugdb/ldbc-csr/tree/mainConverted from:
https://ldbcouncil.org/benchmarks/graphalytics/datasets/Largest converted graph has 3B edges.
License: MITQuick Start: uv tool install icebug-format
 icebug-format --source-dir wiki-Talk
 lbug -i wiki-Talk-csr/schema.cypher

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
