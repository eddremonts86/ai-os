---
id: "4896"
slug: triplox-a-distributed-datalog-engine-with-incremental
title: "Triplox, a distributed Datalog engine with incremental queries"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49550003"
category: show-hn
date: "2026-09-03"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Triplox, a distributed Datalog engine with incremental queries

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I have been working on a distributed Datalog engine à la Datomic on top of object storage. The system is called Triplox. I am using https://github.com/slatedb/slatedb at the storage layer. The main ideas are roughly the following (in no particular order):- Object storage centric. In its final version Triplox should simply need a single (or likely two) S3 bucket(s) for deployment.- The Datomic data model and API as main inspiration.- A client/server architecture.- Incremental Datalog queries. You can dynamically subscribe and unsubscribe from live Datalog queries. This is the most experimental part of Triplox and will need more effort to scale. Standard connectives (`and`, `or`, `not`) are already supported. You can find an intro here: https://triplox.xyz/incremental-queries/overview/.The incremental query angle is likely the most interesting aspect for people considering such a solution. If you have an incremental Datalog problem or are working on sync engines, Triplox might be of interest.Website: https://triplox.xyz/

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49550003) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
