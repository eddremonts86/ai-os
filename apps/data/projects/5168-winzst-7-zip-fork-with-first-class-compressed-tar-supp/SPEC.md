---
id: "5168"
slug: winzst-7-zip-fork-with-first-class-compressed-tar-supp
title: "WinZST > 7-Zip fork with first-class compressed tar support on Windows"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49572950"
category: show-hn
date: "2026-09-05"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# WinZST > 7-Zip fork with first-class compressed tar support on Windows

## Problem

WinZST is a 7-Zip fork that extracts compressed tar archives directly to their final directory instead of materializing an intermediate `.tar`.In one 11.8 GiB `.tar.gz` test containing mostly video, WinZST took 51.87s from archive → `foo/`; 7-Zip took 103.53s across `.tar.gz` → `.tar` → `foo/`.

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
