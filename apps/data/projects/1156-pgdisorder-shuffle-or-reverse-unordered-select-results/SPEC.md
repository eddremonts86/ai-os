---
id: "1156"
slug: pgdisorder-shuffle-or-reverse-unordered-select-results
title: Pg_disorder – shuffle or reverse unordered SELECT results
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49348032"
category: show-hn
date: "2026-08-18"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Pg_disorder – shuffle or reverse unordered SELECT results

## Problem

Hey HN!I'm interested in chaos engineering, automatically detecting flaky tests, and, more generally, building tools that can find/trigger invalid states in software systems.My latest experiment is pg_disorder, a PostgreSQL extension that automatically shuffles (or reverses) the results of `SELECT` queries without an `ORDER BY` clause. While the order of rows isn't specified, applications (sometimes) implicitly assume that rows will be returned in insertion order. The project was initially aimed at finding flaky tests, but it also helped uncover bugs in projects like Gitea and Rails (see references in the repo).Some DBMSs have this feature built-in, e.g. SQLite's `reverse_unordered_selects` pragma, but PostgreSQL doesn't.I'd love to hear your thoughts and feedback!

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
