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

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hey HN!I'm interested in chaos engineering, automatically detecting flaky tests, and, more generally, building tools that can find/trigger invalid states in software systems.My latest experiment is pg_disorder, a PostgreSQL extension that automatically shuffles (or reverses) the results of `SELECT` queries without an `ORDER BY` clause. While the order of rows isn't specified, applications (sometimes) implicitly assume that rows will be returned in insertion order. The project was initially aimed at finding flaky tests, but it also helped uncover bugs in projects like Gitea and Rails (see references in the repo).Some DBMSs have this feature built-in, e.g. SQLite's `reverse_unordered_selects` pragma, but PostgreSQL doesn't.I'd love to hear your thoughts and feedback!

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49348032) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
