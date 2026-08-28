---
id: "2637"
slug: zroar-serialized-roaring-bitmaps-in-zig
title: Zroar – Serialized Roaring Bitmaps in Zig
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49393285"
category: show-hn
date: "2026-08-21"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Zroar – Serialized Roaring Bitmaps in Zig

## Problem

zroar is a ground-up implementation of Roaring Bitmaps data structure in Zig. zroar stores both the keys and (array, bitmap) containers in a single flat byte buffer, making the in-memory representation equal to the on-disk or over-the-network representation, eliminating the serialization/deserialization step entirely.The design was originally aimed at systems which keep their posting lists on disk, but zroar performs faster than CRoaring even for purely in-memory ops, due to CPU cache locality.Against CRoaring 5.0's benchmarking suite (ported to Zig), zroar is faster in 339 out of 360 tests, being 2x-9x faster (geometric mean), and up to 600x faster on serialize/deserialize.zroar avoids complex mechanism (like adaptive radix trees), uses Zig native SIMD ops and is simpler. The main logic is written in ~2000 lines of code, while CRoaring's 64-bit bitmap codebase is over 17000 LOC.Not yet: By choice, zroar doesn't support run containers, and is 64-bit only.There are more details in the GitHub README. Try it out! I'd love feedback on the API and design. zroar is a Zig-based successor to my other project, sroar in Go, which showed a similar boost. So, I think this design should show performance gains in any language.

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
