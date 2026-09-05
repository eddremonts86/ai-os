---
id: "3879"
slug: cushion-pouchdb-on-deno-kv
title: Cushion – PouchDB on Deno KV
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49498995"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [Deno KV storage adapter, PouchDB sync API, FoundationDB storage, CouchDB replication model, Offline-first document sync]
---
# Cushion – PouchDB on Deno KV

## Phase 0: Scaffold

- [x] Read the Show HN post: PouchDB with Deno KV as storage adapter, FoundationDB backing, CouchDB 4.0 plans, built for the author's comfort
- [x] Write SPEC.md (this document)
- [x] Write PRODUCT.md: value proposition, stakeholder table, JTBD, metrics, pricing and risks
- [x] Write PLAN.md: tech stack, architecture, M0-M3 milestones and risks

## Phase 1: Core

- [ ] Implement document put, get and delete over Deno KV
- [ ] Map revisions and conflict detection onto Deno KV versionstamps
- [ ] Build replication between a PouchDB peer and the adapter
- [ ] Write a test suite covering sync under concurrent writes

## Phase 2: Deploy

- [ ] Dogfood the adapter in the author's own Deno projects
- [ ] Publish usage docs and a coverage table of the PouchDB API
- [ ] Watch CouchDB 4.0 and Deno KV developments for alignment opportunities

---

_Generated automatically by Lúa on 2026-08-30_
