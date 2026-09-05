---
id: "4901"
slug: litelink-local-first-embedded-stream-capture-into-iceb
title: "Litelink – local-first, embedded stream capture into Iceberg tables"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49549760"
category: show-hn
date: "2026-09-03"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Litelink – local-first, embedded stream capture into Iceberg tables

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hi HN! I just wanted to share litelink a local-first, embedded capture library I built in python (code is heavily AI generated but designed and reviewed by yours truly). I've been using this for point-and-shoot WebSocket capture but I imagine it could also be useful for observability/metrics ingestion as well. Litelink supports a single writer per stream.I've been doing a lot of development and deployments on tiny VMs (2 vCPU, 8GB, 50-100GB disk) and didn't want the complexity or cost of managing central brokers (Kafka), databases (Postgres), and CDC/connectors just to get queryable WebSocket stream capture running.With litelink, you configure a log in code, and end-to-end setup takes <5 minutes (see the example scripts in the repo). The log is itself an Iceberg table (actually two: a local and archive table), so there's no second copy of your data to keep in sync or connector to manage.I'm sure there are still bugs, but I recently migrated all the capture feeds for a personal research project to litelink, and the experience has been night and day. Before that, I'd hand-rolled a capture system and was dealing with all the issues you'd expect (e.g. small file problem). I'll post some before/after stats in a comment below.I tried to channel the same ethos as LanceDB/Iceberg/SQLite. Everything runs local first without a network connection required. I've tried to abstract the complexity of stream/data lifecycle maintenance away behind a few public library methods. Hopefully someone else finds this useful! Let me know what you think.repo: https://github.com/nhobin219/litelinkspec: https://github.com/nhobin219/litelink/blob/main/docs/SPEC.mdpypi: `pip install litelink`

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49549760) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
