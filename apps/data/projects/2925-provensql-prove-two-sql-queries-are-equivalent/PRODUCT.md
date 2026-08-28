---
id: "2925"
slug: provensql-prove-two-sql-queries-are-equivalent
title: Provensql – prove two SQL queries are equivalent
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49436490"
category: show-hn
date: "2026-08-25"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Provensql – prove two SQL queries are equivalent

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I'm a data/infra engineer and kept hitting the "is this SQL refactor actually safe?" question in review. Provensql decides equivalence of two queries and returns one of four honest verdicts: EQUIVALENT (proven), DIFFERENT (with a concrete counterexample row), SCHEMA_CHANGE, or UNKNOWN — it refuses rather than guess.It's sound by construction: it never returns a false EQUIVALENT. Across 511 equivalence-breaking mutations it produced zero. There's an SMT proof engine for the conjunctive fragment and a counterexample search for the rest. As a baseline I ran a gpt-5 judge over the same 213 labeled pairs — it claimed EQUIVALENT on 2 pairs that actually differ; provensql structurally can't make that error.The part I'm most interested in feedback on: it also catches rewrites valid over the reals but that diverge under IEEE-754 (reassociation) or change runtime-error behavior (a/b → SAFE_DIVIDE) — cases every other checker treats as exact-real and silently accepts.Try it: pip install provensql, a GitHub Action that gates PRs (github.com/nac7/provensql-action), and an interactive demo in the repo. Apache-2.0, github.com/nac7/provensql. Feedback on fragment coverage and which dialects to add next is very welcome.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49436490) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
